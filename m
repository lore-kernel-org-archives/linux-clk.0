Return-Path: <bhumirks@gmail.com>
Return-Path: <bhumirks@gmail.com>
From: Bhumika Goyal <bhumirks@gmail.com>
To: julia.lawall@lip6.fr,
	liviu.dudau@arm.com,
	sudeep.holla@arm.com,
	lorenzo.pieralisi@arm.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] clk: versatile: make clk_ops const
Date: Tue, 22 Aug 2017 19:36:26 +0530
Message-Id: <1503410786-25519-1-git-send-email-bhumirks@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Make this const as it is only stored in the const field of a
clk_init_data structure.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/clk/versatile/clk-vexpress-osc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
index 7e5add7..e7a868b 100644
--- a/drivers/clk/versatile/clk-vexpress-osc.c
+++ b/drivers/clk/versatile/clk-vexpress-osc.c
@@ -61,7 +61,7 @@ static int vexpress_osc_set_rate(struct clk_hw *hw, unsigned long rate,
 	return regmap_write(osc->reg, 0, rate);
 }
 
-static struct clk_ops vexpress_osc_ops = {
+static const struct clk_ops vexpress_osc_ops = {
 	.recalc_rate = vexpress_osc_recalc_rate,
 	.round_rate = vexpress_osc_round_rate,
 	.set_rate = vexpress_osc_set_rate,
-- 
1.9.1
