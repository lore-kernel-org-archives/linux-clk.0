Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Sender: Rob Herring <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@arm.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	arm@kernel.org,
	Rob Herring <robh@kernel.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH 03/15] clk: kill off set_irq_flags usage
Date: Tue,  9 Jun 2015 13:26:29 -0500
Message-Id: <1433874401-27161-4-git-send-email-robh@kernel.org>
In-Reply-To: <1433874401-27161-1-git-send-email-robh@kernel.org>
References: <1433874401-27161-1-git-send-email-robh@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

set_irq_flags is ARM specific with custom flags which have genirq
equivalents. Convert drivers to use the genirq interfaces directly, so we
can kill off set_irq_flags. The translation of flags is as follows:

IRQF_VALID -> !IRQ_NOREQUEST
IRQF_PROBE -> !IRQ_NOPROBE
IRQF_NOAUTOEN -> IRQ_NOAUTOEN

For IRQs managed by an irqdomain, the irqdomain core code handles clearing
and setting IRQ_NOREQUEST already, so there is no need to do this in
.map() functions and we can simply remove the set_irq_flags calls. Some
users also set IRQ_NOPROBE and this has been maintained although it is not
clear that is really needed. There appears to be a great deal of blind
copy and paste of this code.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/at91/pmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index 3f27d21..828b196 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -125,7 +125,6 @@ static int pmc_irq_map(struct irq_domain *h, unsigned int virq,
 
 	irq_set_chip_and_handler(virq, &pmc_irq,
 				 handle_level_irq);
-	set_irq_flags(virq, IRQF_VALID);
 	irq_set_chip_data(virq, pmc);
 
 	return 0;
-- 
2.1.0
