Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 3/7] clk: rockchip: drop old_rate calculation on pll rate changes
Date: Thu, 28 Apr 2016 15:11:11 +0200
Message-Id: <1461849075-8310-4-git-send-email-heiko@sntech.de>
In-Reply-To: <1461849075-8310-1-git-send-email-heiko@sntech.de>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Previously when everything happened in the set_rate callbacks itself we
needed the old_rate value for the possible rate rollback, so that made
it easy to also use it in the debug output.

Now with the param-handling being done in separate functions, reading and
recalculating the current pll rate only to use it in a debug message that
won't get displayed in regular cases anyway is quite a waste.

Therefore drop that value from the debug output. In the worst case that
previous rate will have been displayed on the rate change before.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-pll.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 5c0b919..e56637d 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -247,10 +247,9 @@ static int rockchip_rk3036_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate;
-	unsigned long old_rate = rockchip_rk3036_pll_recalc_rate(hw, prate);
 
-	pr_debug("%s: changing %s from %lu to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), old_rate, drate, prate);
+	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
+		 __func__, __clk_get_name(hw->clk), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
@@ -479,10 +478,9 @@ static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate;
-	unsigned long old_rate = rockchip_rk3066_pll_recalc_rate(hw, prate);
 
-	pr_debug("%s: changing %s from %lu to %lu with a parent rate of %lu\n",
-		 __func__, clk_hw_get_name(hw), old_rate, drate, prate);
+	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
@@ -725,10 +723,9 @@ static int rockchip_rk3399_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate;
-	unsigned long old_rate = rockchip_rk3399_pll_recalc_rate(hw, prate);
 
-	pr_debug("%s: changing %s from %lu to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), old_rate, drate, prate);
+	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
+		 __func__, __clk_get_name(hw->clk), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
-- 
2.6.4
