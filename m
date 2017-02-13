Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from www.osadl.org ([62.245.132.105]:47107 "EHLO www.osadl.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752165AbdBMQwU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Feb 2017 11:52:20 -0500
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        linux-clk@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nicholas Mc Guire <der.herr@hofr.at>
Subject: [PATCH RFC] iopoll: allow for poll_timeout to back-off
Date: Mon, 13 Feb 2017 17:52:04 +0100
Message-Id: <1487004724-2806-1-git-send-email-der.herr@hofr.at>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Provide an exponential back-off after initial busy-loop
to prvent extremly long busy-looping respectively arming
of many highresolution timers.

Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---

During a review of hieghrestimer users I have been looking at the users
of read*_poll_timemout that have a tight loop declared (i.e. passing in 
sleep_us as 0) most of them have quite large timeouts defined. At least
in some cases it is documented to be a tight loop intentionally as the 
expectation is that it will normally succeed e.g.  commit ae02ab00aa3c 
("mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs")

<snip drivers/mtd/nand/jz4780_bch.c>
        /*
         * While we could use interrupts here and sleep until the operation
         * completes, the controller works fairly quickly (usually a few
         * microseconds) and so the overhead of sleeping until we get an
         * interrupt quite noticeably decreases performance.
         */
        ret = readl_poll_timeout(bch->base + BCH_BHINT, reg,
                                 (reg & irq) == irq, 0, BCH_TIMEOUT_US);
<snip>

While this seems justified here to have a tight loop the problem is that 
BCH_TIMEOUT_US is 100000 - so in the case of failure this would busyloop
for 100ms and in some cases tightloops of 5 seconds can be found (e.g.
drivers/mtd/spi-nor/intel-spi.c:intel_spi_wait_hw_busy())

There currently are (if my coccinelle script is correct) 7 files with 
read*_poll_timeout where sleep_us is set to 0 (busy-loop)
  timeout_us                value    file
  INTEL_SPI_TIMEOUT * 1000  5000000  intel-spi.c
  FMC_WAIT_TIMEOUT          1000000  hisi-sfc.c
  BCH_TIMEOUT_US             100000  z4780_bch.c
  numeric const.              10000  clkgen-pll.c
  numeric const.              10000  clk-stm32f4.c
  numeric const.               1000  tango_nand.c
  numeric const.               1000  mxsfb_crtc.c
  numeric const.                100  clk.c

One case in /drivers/mmc/host/sdhci-cadence.c has a timeout_us of 1 and
sleep_us of 0 which might actually be a bug as it means that the poll loop
would do a single read OP in many cases (this is non-atomic context) so it
would have to be robust for a single read, thus the poll_timeout might not
be suitable - not sure though - but thats a different problem.

If we now look at those cases where sleep_us is using a min < the recommended
10 us: that can be found in 68 cases (as of 4.10-rc6) and that is probably
also not that sensible given that the timeout_us are in the same ranges as
the cases above (minimum is 20 max is 5000000). So in the error case again
that would result in thousands of high-resolution timers being initialized
- presumably that is not that reasonable.

The problem thus is not the success case but the failure case. A possible 
mitigation of this would be to have something like an exponential back-off
built into the non-atomic poll_timeout function:

#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us)   \
({ \
        ktime_t timeout = ktime_add_us(ktime_get(), timeout_us); \
        might_sleep(); \
	unsigned long min = 0; \
	unsigned long max = sleep_us | 1; \
        for (;;) { \
                (val) = op(addr); \
                if (cond) \
                        break; \
                if (timeout_us && ktime_compare(ktime_get(), timeout) > 0) { \
                        (val) = op(addr); \
                        break; \
                } \
                if (min >= 10) \
                        usleep_range(min, max); \
                max <<= 1; \
		min = max >> 2; \
        } \
        (cond) ? 0 : -ETIMEDOUT; \
})

 which results in min,max values for the initial iterations of:
      min  max
      0    1
      0    2
      1    4
      2    8
      4    16
      8    32
      16   64
      32   128
      ...

 for sleep_us being passed in as 0 and would thus effectively be a 
busy-loop for the first 6 iterations and then switch to sleeping.
The above code proposal would busy-loop at most 6 times and the
busy-wait would reduce if sleep_us > 0 is passed in:

      sleep_us  busy-loops
      0-1       6
      2-3       4
      4-9       3
      10-19     2
      20-39     1
      40+       0

which should be a resonable behavior for the current use cases and eliminate
side effects of very long busy-wait-loops in the failure cases as well.

Pleas let me know if this sounds reasonable or what might have been 
overlooked here. The only downside located is that some of the constant
folding that would be possible now would no longer be doable (e.g. 
(sleep_us >> 2) + 1 in case of passing in a compile-time constant.
Also I guess readx_poll_timeout() could (should?) be converted to an
inline function.

I did compile test this but actually the key issue is to get feedback on the
concept rather than if the patch is usable in the below form.

Patch was compile tested with: x86_64_defconfig

Patch is against 4.10-rc7 (localversion-next is next-20170213)

 include/linux/iopoll.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
index d29e1e2..788c6b1 100644
--- a/include/linux/iopoll.h
+++ b/include/linux/iopoll.h
@@ -40,10 +40,12 @@
  * When available, you'll probably want to use one of the specialized
  * macros defined below rather than this macro directly.
  */
-#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us)	\
+#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us)   \
 ({ \
 	ktime_t timeout = ktime_add_us(ktime_get(), timeout_us); \
-	might_sleep_if(sleep_us); \
+	might_sleep(); \
+	unsigned long min = 0; \
+	unsigned long max = sleep_us | 1; \
 	for (;;) { \
 		(val) = op(addr); \
 		if (cond) \
@@ -52,8 +54,10 @@
 			(val) = op(addr); \
 			break; \
 		} \
-		if (sleep_us) \
-			usleep_range((sleep_us >> 2) + 1, sleep_us); \
+		if (min >= 10) \
+			usleep_range(min, max); \
+		max <<= 1; \
+		min = max >> 2; \
 	} \
 	(cond) ? 0 : -ETIMEDOUT; \
 })
-- 
2.1.4

