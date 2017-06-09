Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Use of_device_get_match_data() helper
Date: Fri,  9 Jun 2017 14:49:43 +0200
Message-Id: <1497012583-24328-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

If CONFIG_OF=n:

    drivers/clk/renesas/renesas-cpg-mssr.c: In function ‘cpg_mssr_probe’:
    drivers/clk/renesas/renesas-cpg-mssr.c:702: warning: dereferencing ‘void *’ pointer
    drivers/clk/renesas/renesas-cpg-mssr.c:702: error: request for member ‘data’ in something not a structure or union

To fix this, use the of_device_get_match_data() helper, for which a
dummy version is provided if CONFIG_OF=n.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Feel free to apply directly, as I currently don't have more material
for clk-renesas-for-v4.13.

 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f44a8125615bd75a..1f607c806f9b9ec3 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -699,7 +699,7 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	struct clk **clks;
 	int error;
 
-	info = of_match_node(cpg_mssr_match, np)->data;
+	info = of_device_get_match_data(dev);
 	if (info->init) {
 		error = info->init(dev);
 		if (error)
-- 
2.7.4
