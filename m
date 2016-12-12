Return-Path: <hofrat@osadl.org>
From: Nicholas Mc Guire <hofrat@osadl.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, patches@opensource.wolfsonmicro.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH RFC] clk: wm831x: fix usleep_range with bad range
Date: Mon, 12 Dec 2016 08:40:09 +0100
Message-Id: <1481528409-5182-1-git-send-email-hofrat@osadl.org>
List-ID: <linux-clk.vger.kernel.org>

The delay here is not in atomic context and does not seem critical with
respect to precision, but usleep_range(min,max) with min==max results in 
giving the timer subsystem no room to optimize uncritical delays. Fix 
this by setting the range to 2000,3000 us.

Fixes: commit f05259a6ffa4 ("clk: wm831x: Add initial WM831x clock driver")
Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

problem was located by coccinelle spatch

The problem is that usleep_range is calculating the delay by
     exp = ktime_add_us(ktime_get(), min)
     delta = (u64)(max - min) * NSEC_PER_USEC
so delta is set to 0
and then calls 
  schedule_hrtimeout_range(exp, 0,...)
effectively this means that the clock subsystem has no room to
optimize and the behavior is no better than using usleep().
As this is not a critical delay it is set to a range of 2 to 3 
milliseconds - this change needs a review by someone that knows
the details of the device though.

Q:It might actually be possible to just use msleep(2) here rather
  than using a hrtimer, at least I do not see what a hrtimer would be
  needed here for - a longer delay e.g. on a HZ100 box should not hurt ?

Patch was only compile tested with: i386_defconfig + CONFIG_X86_INTEL_QUARK=y
CONFIG_MFD_WM831X_I2C=y, COMMON_CLK=y, CONFIG_COMMON_CLK_WM831X=m

Patch is against: 4.9.0-rc8 (localversion-next is -next-20161209)

 drivers/clk/clk-wm831x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-wm831x.c b/drivers/clk/clk-wm831x.c
index f4fdac5..fe42d46 100644
--- a/drivers/clk/clk-wm831x.c
+++ b/drivers/clk/clk-wm831x.c
@@ -97,7 +97,8 @@ static int wm831x_fll_prepare(struct clk_hw *hw)
 	if (ret != 0)
 		dev_crit(wm831x->dev, "Failed to enable FLL: %d\n", ret);
 
-	usleep_range(2000, 2000);
+	/* wait 2-3 ms for new frequency taking effect */
+	usleep_range(2000, 3000);
 
 	return ret;
 }
-- 
2.1.4
