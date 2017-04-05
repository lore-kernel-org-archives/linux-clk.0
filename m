Return-Path: <wens@mirror2.csie.ntu.edu.tw>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 1/3] clk: sunxi-ng: mult: Support PLL lock detection
Date: Wed,  5 Apr 2017 14:37:42 +0800
Message-Id: <20170405063744.14389-2-wens@csie.org>
In-Reply-To: <20170405063744.14389-1-wens@csie.org>
References: <20170405063744.14389-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Some PLL clocks are N (multiplier) type clocks, or can be simplified
as such. An example of the former is the DDR1 PLL clock on the A33.
An example of the latter is the CPU PLL clock on the A80, in which
the P divider is only used for low frequencies that are of little
use. Both clocks support PLL lock detection.

The mult clock macro implies support for this, but that is not true.
The field is simply discarded. This patch adds proper support for it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_mult.c | 2 ++
 drivers/clk/sunxi-ng/ccu_mult.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_mult.c b/drivers/clk/sunxi-ng/ccu_mult.c
index 8724c01171b1..671141359895 100644
--- a/drivers/clk/sunxi-ng/ccu_mult.c
+++ b/drivers/clk/sunxi-ng/ccu_mult.c
@@ -137,6 +137,8 @@ static int ccu_mult_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	spin_unlock_irqrestore(cm->common.lock, flags);
 
+	ccu_helper_wait_for_lock(&cm->common, cm->lock);
+
 	return 0;
 }
 
diff --git a/drivers/clk/sunxi-ng/ccu_mult.h b/drivers/clk/sunxi-ng/ccu_mult.h
index 524acddfcb2e..f9c37b987d72 100644
--- a/drivers/clk/sunxi-ng/ccu_mult.h
+++ b/drivers/clk/sunxi-ng/ccu_mult.h
@@ -33,6 +33,7 @@ struct ccu_mult_internal {
 
 struct ccu_mult {
 	u32			enable;
+	u32			lock;
 
 	struct ccu_frac_internal	frac;
 	struct ccu_mult_internal	mult;
@@ -45,6 +46,7 @@ struct ccu_mult {
 				   _flags)				\
 	struct ccu_mult _struct = {					\
 		.enable	= _gate,					\
+		.lock	= _lock,					\
 		.mult	= _SUNXI_CCU_MULT(_mshift, _mwidth),		\
 		.common	= {						\
 			.reg		= _reg,				\
-- 
2.11.0
