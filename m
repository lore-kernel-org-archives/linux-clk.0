Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42810 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755605AbcBXKGp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 24 Feb 2016 05:06:45 -0500
From: Jiri Slaby <jslaby@suse.cz>
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-clk@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 3.12 121/142] ARM: 8517/1: ICST: avoid arithmetic overflow in icst_hz()
Date: Wed, 24 Feb 2016 11:05:16 +0100
Message-Id: <8c6bd58155c1718aa12d7ffa3e318ed3962e5f07.1456308281.git.jslaby@suse.cz>
In-Reply-To: <173a4661a78d49aee0f4e28e4075f01af8976c19.1456308281.git.jslaby@suse.cz>
References: <173a4661a78d49aee0f4e28e4075f01af8976c19.1456308281.git.jslaby@suse.cz>
In-Reply-To: <cover.1456308281.git.jslaby@suse.cz>
References: <cover.1456308281.git.jslaby@suse.cz>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Linus Walleij <linus.walleij@linaro.org>

3.12-stable review patch.  If anyone has any objections, please let me know.

===============

commit 5070fb14a0154f075c8b418e5bc58a620ae85a45 upstream.

When trying to set the ICST 307 clock to 25174000 Hz I ran into
this arithmetic error: the icst_hz_to_vco() correctly figure out
DIVIDE=2, RDW=100 and VDW=99 yielding a frequency of
25174000 Hz out of the VCO. (I replicated the icst_hz() function
in a spreadsheet to verify this.)

However, when I called icst_hz() on these VCO settings it would
instead return 4122709 Hz. This causes an error in the common
clock driver for ICST as the common clock framework will call
.round_rate() on the clock which will utilize icst_hz_to_vco()
followed by icst_hz() suggesting the erroneous frequency, and
then the clock gets set to this.

The error did not manifest in the old clock framework since
this high frequency was only used by the CLCD, which calls
clk_set_rate() without first calling clk_round_rate() and since
the old clock framework would not call clk_round_rate() before
setting the frequency, the correct values propagated into
the VCO.

After some experimenting I figured out that it was due to a simple
arithmetic overflow: the divisor for 24Mhz reference frequency
as reference becomes 24000000*2*(99+8)=0x132212400 and the "1"
in bit 32 overflows and is lost.

But introducing an explicit 64-by-32 bit do_div() and casting
the divisor into (u64) we get the right frequency back, and the
right frequency gets set.

Tested on the ARM Versatile.

Cc: linux-clk@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
---
 arch/arm/common/icst.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/icst.c b/arch/arm/common/icst.c
index 3b3e58b7ba74..d7ed252708c5 100644
--- a/arch/arm/common/icst.c
+++ b/arch/arm/common/icst.c
@@ -16,7 +16,7 @@
  */
 #include <linux/module.h>
 #include <linux/kernel.h>
-
+#include <asm/div64.h>
 #include <asm/hardware/icst.h>
 
 /*
@@ -29,7 +29,11 @@ EXPORT_SYMBOL(icst525_s2div);
 
 unsigned long icst_hz(const struct icst_params *p, struct icst_vco vco)
 {
-	return p->ref * 2 * (vco.v + 8) / ((vco.r + 2) * p->s2div[vco.s]);
+	u64 dividend = p->ref * 2 * (u64)(vco.v + 8);
+	u32 divisor = (vco.r + 2) * p->s2div[vco.s];
+
+	do_div(dividend, divisor);
+	return (unsigned long)dividend;
 }
 
 EXPORT_SYMBOL(icst_hz);
-- 
2.7.1

