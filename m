Return-Path: <tomeu.vizoso@gmail.com>
Return-Path: <tomeu.vizoso@gmail.com>
Sender: Tomeu Vizoso <tomeu.vizoso@gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: rk808: Pass the right pointer as the get_hw context
Date: Fri,  9 Sep 2016 15:25:06 +0200
Message-Id: <1473427506-28244-1-git-send-email-tomeu.vizoso@collabora.com>
List-ID: <linux-clk.vger.kernel.org>

Right now we are passing a pointer to a pointer to the structure that
will be used to fetch the clk hw, which gets casted later to a pointer
to the structure, thus getting garbage in the hw structs.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Fixes: a8b6e85db6a6 ("clk: rk808: Migrate to clk_hw based OF and
registration APIs")
---
 drivers/clk/clk-rk808.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-rk808.c b/drivers/clk/clk-rk808.c
index faa447e191ef..6461f2820a5b 100644
--- a/drivers/clk/clk-rk808.c
+++ b/drivers/clk/clk-rk808.c
@@ -138,7 +138,7 @@ static int rk808_clkout_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return of_clk_add_hw_provider(node, of_clk_rk808_get, &rk808_clkout);
+	return of_clk_add_hw_provider(node, of_clk_rk808_get, rk808_clkout);
 }
 
 static int rk808_clkout_remove(struct platform_device *pdev)
-- 
2.7.4
