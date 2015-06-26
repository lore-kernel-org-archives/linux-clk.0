Return-Path: <davidcdueck@googlemail.com>
Return-Path: <davidcdueck@googlemail.com>
From: David Dueck <davidcdueck@googlemail.com>
To: boris.brezillon@free-electrons.com
Cc: mturquette@linaro.org,
	nicolas.ferre@atmel.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] clk: at91: clk-system: fix error path
Date: Fri, 26 Jun 2015 14:33:31 +0200
Message-Id: <1435322012-5667-5-git-send-email-davidcdueck@googlemail.com>
In-Reply-To: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
References: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

Do not leak memory if request_irq fails and free the irq if
clk_register fails.

Signed-off-by: David Dueck <davidcdueck@googlemail.com>
---
 drivers/clk/at91/clk-system.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-system.c b/drivers/clk/at91/clk-system.c
index a76d03f..58008b3 100644
--- a/drivers/clk/at91/clk-system.c
+++ b/drivers/clk/at91/clk-system.c
@@ -130,13 +130,17 @@ at91_clk_register_system(struct at91_pmc *pmc, const char *name,
 		irq_set_status_flags(sys->irq, IRQ_NOAUTOEN);
 		ret = request_irq(sys->irq, clk_system_irq_handler,
 				IRQF_TRIGGER_HIGH, name, sys);
-		if (ret)
+		if (ret) {
+			kfree(sys);
 			return ERR_PTR(ret);
+		}
 	}
 
 	clk = clk_register(NULL, &sys->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		free_irq(sys->irq, sys);
 		kfree(sys);
+	}
 
 	return clk;
 }
-- 
2.4.4
