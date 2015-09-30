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
Subject: [PATCH 10/16] clk: at91: pmc: move pmc structures to C file
Date: Wed, 30 Sep 2015 18:11:03 +0200
Message-Id: <1443629469-15086-11-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1443629469-15086-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1443629469-15086-1-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

pmc.c is now the only user of struct at91_pmc*, move their definition in
the C file.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/clk/at91/pmc.c | 12 ++++++++++++
 drivers/clk/at91/pmc.h | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index acc8f518b392..3aa886849304 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -29,6 +29,18 @@
 
 #include "pmc.h"
 
+struct at91_pmc_caps {
+	u32 available_irqs;
+};
+
+struct at91_pmc {
+	struct regmap *regmap;
+	int virq;
+	const struct at91_pmc_caps *caps;
+	struct irq_domain *irqdomain;
+	u32 imr;
+};
+
 void __iomem *at91_pmc_base;
 EXPORT_SYMBOL_GPL(at91_pmc_base);
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 3b96c53c194c..550a461c7201 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -24,18 +24,6 @@ struct clk_range {
 
 #define CLK_RANGE(MIN, MAX) {.min = MIN, .max = MAX,}
 
-struct at91_pmc_caps {
-	u32 available_irqs;
-};
-
-struct at91_pmc {
-	struct regmap *regmap;
-	int virq;
-	const struct at91_pmc_caps *caps;
-	struct irq_domain *irqdomain;
-	u32 imr;
-};
-
 int of_at91_get_clk_range(struct device_node *np, const char *propname,
 			  struct clk_range *range);
 
-- 
2.1.4
