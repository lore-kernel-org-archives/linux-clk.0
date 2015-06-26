Return-Path: <davidcdueck@googlemail.com>
Return-Path: <davidcdueck@googlemail.com>
From: David Dueck <davidcdueck@googlemail.com>
To: boris.brezillon@free-electrons.com
Cc: mturquette@linaro.org,
	nicolas.ferre@atmel.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] clk: at91: clk-utmi: fix error path
Date: Fri, 26 Jun 2015 14:33:32 +0200
Message-Id: <1435322012-5667-6-git-send-email-davidcdueck@googlemail.com>
In-Reply-To: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
References: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

Do not leak memory if request_irq fails and free the irq if
clk_register fails.

Signed-off-by: David Dueck <davidcdueck@googlemail.com>
---
 drivers/clk/at91/clk-utmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index ae3263b..30dd697 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -118,12 +118,16 @@ at91_clk_register_utmi(struct at91_pmc *pmc, unsigned int irq,
 	irq_set_status_flags(utmi->irq, IRQ_NOAUTOEN);
 	ret = request_irq(utmi->irq, clk_utmi_irq_handler,
 			  IRQF_TRIGGER_HIGH, "clk-utmi", utmi);
-	if (ret)
+	if (ret) {
+		kfree(utmi);
 		return ERR_PTR(ret);
+	}
 
 	clk = clk_register(NULL, &utmi->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		free_irq(utmi->irq, utmi);
 		kfree(utmi);
+	}
 
 	return clk;
 }
-- 
2.4.4
