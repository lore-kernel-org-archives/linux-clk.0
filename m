Return-Path: <k.kozlowski.k@gmail.com>
Return-Path: <k.kozlowski.k@gmail.com>
From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH] clk: at91: Constify irq_domain_ops
Date: Mon, 27 Apr 2015 21:52:38 +0900
Message-Id: <1430139158-3919-1-git-send-email-k.kozlowski.k@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

The irq_domain_ops are not modified by the driver and the irqdomain core
code accepts pointer to a const data.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/clk/at91/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index 3f27d21fb729..39be2be82b0a 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -153,7 +153,7 @@ static int pmc_irq_domain_xlate(struct irq_domain *d,
 	return 0;
 }
 
-static struct irq_domain_ops pmc_irq_ops = {
+static const struct irq_domain_ops pmc_irq_ops = {
 	.map	= pmc_irq_map,
 	.xlate	= pmc_irq_domain_xlate,
 };
-- 
2.1.0
