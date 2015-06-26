Return-Path: <davidcdueck@googlemail.com>
Return-Path: <davidcdueck@googlemail.com>
From: David Dueck <davidcdueck@googlemail.com>
To: boris.brezillon@free-electrons.com
Cc: mturquette@linaro.org,
	nicolas.ferre@atmel.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] clk: at91: clk-h32mxclk: fix memory leak
Date: Fri, 26 Jun 2015 14:33:27 +0200
Message-Id: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

Do not leak memory if clk_register fails.

Signed-off-by: David Dueck <davidcdueck@googlemail.com>
---
 drivers/clk/at91/clk-h32mx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
index 152dcb3..61566bc 100644
--- a/drivers/clk/at91/clk-h32mx.c
+++ b/drivers/clk/at91/clk-h32mx.c
@@ -116,8 +116,10 @@ void __init of_sama5d4_clk_h32mx_setup(struct device_node *np,
 	h32mxclk->pmc = pmc;
 
 	clk = clk_register(NULL, &h32mxclk->hw);
-	if (!clk)
+	if (!clk) {
+		kfree(h32mxclk);
 		return;
+	}
 
 	of_clk_add_provider(np, of_clk_src_simple_get, clk);
 }
-- 
2.4.4
