Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:36694 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167AbbFZMeb (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 08:34:31 -0400
From: David Dueck <davidcdueck@googlemail.com>
To: boris.brezillon@free-electrons.com
Cc: mturquette@linaro.org, nicolas.ferre@atmel.com,
	sboyd@codeaurora.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] clk: at91: clk-pll: fix error path
Date: Fri, 26 Jun 2015 14:33:30 +0200
Message-Id: <1435322012-5667-4-git-send-email-davidcdueck@googlemail.com>
In-Reply-To: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
References: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Do not leak memory if request_irq fails and free the irq if
clk_register fails.

Signed-off-by: David Dueck <davidcdueck@googlemail.com>
---
 drivers/clk/at91/clk-pll.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-pll.c b/drivers/clk/at91/clk-pll.c
index cbbe403..18b60f4 100644
--- a/drivers/clk/at91/clk-pll.c
+++ b/drivers/clk/at91/clk-pll.c
@@ -346,12 +346,16 @@ at91_clk_register_pll(struct at91_pmc *pmc, unsigned int irq, const char *name,
 	irq_set_status_flags(pll->irq, IRQ_NOAUTOEN);
 	ret = request_irq(pll->irq, clk_pll_irq_handler, IRQF_TRIGGER_HIGH,
 			  id ? "clk-pllb" : "clk-plla", pll);
-	if (ret)
+	if (ret) {
+		kfree(pll);
 		return ERR_PTR(ret);
+	}
 
 	clk = clk_register(NULL, &pll->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		free_irq(pll->irq, pll);
 		kfree(pll);
+	}
 
 	return clk;
 }
-- 
2.4.4

