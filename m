Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: rockchip: Free the memory on the error path
Date: Wed, 28 Feb 2018 14:56:48 +0800
Message-Id: <1519801008-124310-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

rockchip_clk_register_branch() and rockchip_clk_register_branch()
should free the memory internally when seeing any failure.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 35dbd63..3cd8ad5 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -57,6 +57,7 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 	struct clk_divider *div = NULL;
 	const struct clk_ops *mux_ops = NULL, *div_ops = NULL,
 			     *gate_ops = NULL;
+	int ret;
 
 	if (num_parents > 1) {
 		mux = kzalloc(sizeof(*mux), GFP_KERNEL);
@@ -74,8 +75,10 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 
 	if (gate_offset >= 0) {
 		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
-		if (!gate)
+		if (!gate) {
+			ret = -ENOMEM;
 			goto err_gate;
+		}
 
 		gate->flags = gate_flags;
 		gate->reg = base + gate_offset;
@@ -86,8 +89,10 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 
 	if (div_width > 0) {
 		div = kzalloc(sizeof(*div), GFP_KERNEL);
-		if (!div)
+		if (!div) {
+			ret = -ENOMEM;
 			goto err_div;
+		}
 
 		div->flags = div_flags;
 		div->reg = base + muxdiv_offset;
@@ -106,12 +111,19 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 				     gate ? &gate->hw : NULL, gate_ops,
 				     flags);
 
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
+		goto err_composite;
+	}
+
 	return clk;
+err_composite:
+	kfree(div);
 err_div:
 	kfree(gate);
 err_gate:
 	kfree(mux);
-	return ERR_PTR(-ENOMEM);
+	return ERR_PTR(ret);
 }
 
 struct rockchip_clk_frac {
@@ -291,8 +303,10 @@ static struct clk *rockchip_clk_register_frac_branch(
 		init.num_parents = child->num_parents;
 
 		mux_clk = clk_register(NULL, &frac_mux->hw);
-		if (IS_ERR(mux_clk))
+		if (IS_ERR(mux_clk)) {
+			kfree(frac);
 			return clk;
+		}
 
 		rockchip_clk_add_lookup(ctx, mux_clk, child->id);
 
-- 
1.9.1
