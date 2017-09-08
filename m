Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: Implement reset control status readback
Date: Fri,  8 Sep 2017 12:39:54 +0800
Message-Id: <20170908043954.13019-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Until now we were not providing a way to read back the status of our
reset controls. Consumers had no real way to be certain whether a
peripheral was held in reset or not.

Implement the status callback to complete the API support.

Fixes: 1d80c14248d6 ("clk: sunxi-ng: Add common infrastructure")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_reset.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_reset.c b/drivers/clk/sunxi-ng/ccu_reset.c
index 1dc4e98ea802..b67149143554 100644
--- a/drivers/clk/sunxi-ng/ccu_reset.c
+++ b/drivers/clk/sunxi-ng/ccu_reset.c
@@ -60,8 +60,22 @@ static int ccu_reset_reset(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static int ccu_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	struct ccu_reset *ccu = rcdev_to_ccu_reset(rcdev);
+	const struct ccu_reset_map *map = &ccu->reset_map[id];
+
+	/*
+	 * The reset control API expects 0 if reset is not asserted,
+	 * which is the opposite of what our hardware uses.
+	 */
+	return !(map->bit & readl(ccu->base + map->reg));
+}
+
 const struct reset_control_ops ccu_reset_ops = {
 	.assert		= ccu_reset_assert,
 	.deassert	= ccu_reset_deassert,
 	.reset		= ccu_reset_reset,
+	.status		= ccu_reset_status,
 };
-- 
2.14.1
