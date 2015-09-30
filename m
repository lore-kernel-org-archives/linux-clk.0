Return-Path: <alexandre.belloni@free-electrons.com>
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 08/16] clk: at91: only enable available IRQs
Date: Wed, 30 Sep 2015 18:11:01 +0200
Message-Id: <1443629469-15086-9-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1443629469-15086-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1443629469-15086-1-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

Only enable available IRQs in case writing to a reserved bit has an armful
effect.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/clk/at91/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index 6c1f08a73373..45dd32bf2531 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -287,7 +287,7 @@ static int __init atmel_pmc_probe(struct platform_device *pdev)
 	if (!pmc->irqdomain)
 		return 0;
 
-	regmap_write(pmc->regmap, AT91_PMC_IDR, 0xffffffff);
+	regmap_write(pmc->regmap, AT91_PMC_IDR, pmc->caps->available_irqs);
 	ret = request_irq(pmc->virq, pmc_irq_handler,
 			  IRQF_SHARED | IRQF_COND_SUSPEND, "pmc", pmc);
 	if (ret)
-- 
2.1.4
