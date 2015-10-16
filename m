Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Use %u to format unsigned int in of_clk_src_onecell_get()
Date: Fri, 16 Oct 2015 17:12:32 +0200
Message-Id: <1445008352-27569-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b005f666e3a1a716..31a5bb08ddf27f0e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2932,7 +2932,7 @@ struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data)
 	unsigned int idx = clkspec->args[0];
 
 	if (idx >= clk_data->clk_num) {
-		pr_err("%s: invalid clock index %d\n", __func__, idx);
+		pr_err("%s: invalid clock index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
1.9.1
