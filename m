Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Initialize error pointer using ERR_PTR()
Date: Wed, 17 May 2017 16:38:55 +0200
Message-Id: <1495031935-15261-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Coccinelle warns:

    drivers/clk/renesas/renesas-cpg-mssr.c:323:14-21: ERROR: PTR_ERR applied after initialization to constant on line 260

Initialize clk using ERR_PTR(-ENOTSUPP) instead of NULL to fix this.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.13.

 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 38a01406740dfc04..51d4af0a53ec2d38 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -257,7 +257,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 					      const struct cpg_mssr_info *info,
 					      struct cpg_mssr_priv *priv)
 {
-	struct clk *clk = NULL, *parent;
+	struct clk *clk = ERR_PTR(-ENOTSUPP), *parent;
 	struct device *dev = priv->dev;
 	unsigned int id = core->id, div = core->div;
 	const char *parent_name;
-- 
2.7.4
