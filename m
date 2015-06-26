Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:36603 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751784AbbFZMeZ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 08:34:25 -0400
From: David Dueck <davidcdueck@googlemail.com>
To: boris.brezillon@free-electrons.com
Cc: mturquette@linaro.org, nicolas.ferre@atmel.com,
	sboyd@codeaurora.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] clk: at91: clk-master: fix error path
Date: Fri, 26 Jun 2015 14:33:29 +0200
Message-Id: <1435322012-5667-3-git-send-email-davidcdueck@googlemail.com>
In-Reply-To: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
References: <1435322012-5667-1-git-send-email-davidcdueck@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Do not leak memory if request_irq fails and free the irq if
clk_register fails.

Signed-off-by: David Dueck <davidcdueck@googlemail.com>
---
 drivers/clk/at91/clk-master.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index c1af80b..d7d6c59 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -165,12 +165,16 @@ at91_clk_register_master(struct at91_pmc *pmc, unsigned int irq,
 	irq_set_status_flags(master->irq, IRQ_NOAUTOEN);
 	ret = request_irq(master->irq, clk_master_irq_handler,
 			  IRQF_TRIGGER_HIGH, "clk-master", master);
-	if (ret)
+	if (ret) {
+		kfree(master);
 		return ERR_PTR(ret);
+	}
 
 	clk = clk_register(NULL, &master->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		free_irq(master->irq, master);
 		kfree(master);
+	}
 
 	return clk;
 }
-- 
2.4.4

