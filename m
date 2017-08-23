Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] clk: rockchip: Mark rockchip_fractional_approximation static
Date: Wed, 23 Aug 2017 15:39:32 -0700
Message-Id: <20170823223932.27881-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Silence the sparse warning

clk/rockchip/clk.c:172:6: warning: symbol 'rockchip_fractional_approximation' was not declared. Should it be static?

Cc: Elaine Zhang <zhangqing@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/rockchip/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index b6db79a00602..35dbd63c2f49 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -169,7 +169,7 @@ static int rockchip_clk_frac_notifier_cb(struct notifier_block *nb,
  * fractional divider must set that denominator is 20 times larger than
  * numerator to generate precise clock frequency.
  */
-void rockchip_fractional_approximation(struct clk_hw *hw,
+static void rockchip_fractional_approximation(struct clk_hw *hw,
 		unsigned long rate, unsigned long *parent_rate,
 		unsigned long *m, unsigned long *n)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
