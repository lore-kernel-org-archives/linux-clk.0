Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/6] clk: rockchip: check grf when waiting pll lock
Date: Mon, 15 Feb 2016 11:33:25 +0800
Message-Id: <1455507205-12996-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

rockchip_clk_get_grf pass on return value from
syscon_regmap_lookup_by_phandle, so we check grf to
make sure whether to do the following things or not.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-pll.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index b7e66c9..dddbc29 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -90,10 +90,16 @@ static long rockchip_pll_round_rate(struct clk_hw *hw,
  */
 static int rockchip_pll_wait_lock(struct rockchip_clk_pll *pll)
 {
-	struct regmap *grf = rockchip_clk_get_grf();
+	struct regmap *grf;
 	unsigned int val;
 	int delay = 24000000, ret;
 
+	grf = rockchip_clk_get_grf();
+	if (IS_ERR(grf)) {
+		pr_err("%s: grf regmap not available\n", __func__);
+		return -ENODEV;
+	}
+
 	while (delay > 0) {
 		ret = regmap_read(grf, pll->lock_offset, &val);
 		if (ret) {
-- 
2.3.7
