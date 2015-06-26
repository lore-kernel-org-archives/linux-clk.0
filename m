Return-Path: <davidcdueck@googlemail.com>
Return-Path: <davidcdueck@googlemail.com>
From: David Dueck <davidcdueck@googlemail.com>
To: boris.brezillon@free-electrons.com
Cc: mturquette@linaro.org,
	nicolas.ferre@atmel.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] clk: at91: clk-main: fix memory leak
Date: Fri, 26 Jun 2015 14:33:28 +0200
Message-Id: <1435322012-5667-2-git-send-email-davidcdueck@googlemail.com>
In-Reply-To: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
References: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

Do not leak memory if request_irq fails.

Signed-off-by: David Dueck <davidcdueck@googlemail.com>
---
 drivers/clk/at91/clk-main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 59fa3cc..696719e 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -171,8 +171,10 @@ at91_clk_register_main_osc(struct at91_pmc *pmc,
 	irq_set_status_flags(osc->irq, IRQ_NOAUTOEN);
 	ret = request_irq(osc->irq, clk_main_osc_irq_handler,
 			  IRQF_TRIGGER_HIGH, name, osc);
-	if (ret)
+	if (ret) {
+		kfree(osc);
 		return ERR_PTR(ret);
+	}
 
 	if (bypass)
 		pmc_write(pmc, AT91_CKGR_MOR,
-- 
2.4.4
