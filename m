Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: rockchip: free memory for error handle
Date: Tue,  2 Feb 2016 11:37:50 +0800
Message-Id: <1454384270-20018-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Add free memeory if rockchip_clk_register_branch
failed.

Fixes: a245fecbb806 ("clk: rockchip: add basic infrastructure...")
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index d9a0b5d..62fbe2c 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -70,7 +70,7 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 	if (gate_offset >= 0) {
 		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
 		if (!gate)
-			return ERR_PTR(-ENOMEM);
+			goto err_gate;
 
 		gate->flags = gate_flags;
 		gate->reg = base + gate_offset;
@@ -82,7 +82,7 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 	if (div_width > 0) {
 		div = kzalloc(sizeof(*div), GFP_KERNEL);
 		if (!div)
-			return ERR_PTR(-ENOMEM);
+			goto err_div;
 
 		div->flags = div_flags;
 		div->reg = base + muxdiv_offset;
@@ -100,6 +100,11 @@ static struct clk *rockchip_clk_register_branch(const char *name,
 				     flags);
 
 	return clk;
+err_div:
+	kfree(gate);
+err_gate:
+	kfree(mux);
+	return ERR_PTR(-ENOMEM);
 }
 
 struct rockchip_clk_frac {
-- 
2.3.7
