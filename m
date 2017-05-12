Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH v4 2/2] clk: at91: Add sama5d2 suspend/resume
Date: Fri, 12 May 2017 16:25:31 +0200
Message-Id: <20170512142531.11274-2-alexandre.belloni@free-electrons.com>
In-Reply-To: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
References: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On sama5d2, VDD core maybe be cut while in suspend. This means registers
will be lost. Ensure they are saved and restored properly.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
Changes in v4:
 - only save and restore PCR for used ids

 drivers/clk/at91/clk-generated.c  |   3 +
 drivers/clk/at91/clk-peripheral.c |   4 +-
 drivers/clk/at91/pmc.c            | 129 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/at91/pmc.h            |   2 +
 4 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
index 70474bd97a10..f0b7ae904ce2 100644
--- a/drivers/clk/at91/clk-generated.c
+++ b/drivers/clk/at91/clk-generated.c
@@ -266,6 +266,9 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 	if (ret) {
 		kfree(gck);
 		hw = ERR_PTR(ret);
+	} else {
+		pmc_register_id(id);
+	}
 
 	return hw;
 }
diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index dc29fd979d3f..770118369230 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -367,8 +367,10 @@ at91_clk_register_sam9x5_peripheral(struct regmap *regmap, spinlock_t *lock,
 	if (ret) {
 		kfree(periph);
 		hw = ERR_PTR(ret);
-	} else
+	} else {
 		clk_sam9x5_peripheral_autodiv(periph);
+		pmc_register_id(id);
+	}
 
 	return hw;
 }
diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index 526df5ba042d..a4cd9f35160e 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -13,12 +13,16 @@
 #include <linux/clk/at91_pmc.h>
 #include <linux/of.h>
 #include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/syscore_ops.h>
 
 #include <asm/proc-fns.h>
 
 #include "pmc.h"
 
+#define PMC_MAX_IDS 128
+
 int of_at91_get_clk_range(struct device_node *np, const char *propname,
 			  struct clk_range *range)
 {
@@ -41,3 +45,128 @@ int of_at91_get_clk_range(struct device_node *np, const char *propname,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_at91_get_clk_range);
+
+static u8 registered_ids[PMC_MAX_IDS];
+
+void pmc_register_id(u8 id)
+{
+	int i;
+
+	for (i = 0; i < PMC_MAX_IDS; i++) {
+		if (registered_ids[i] == 0) {
+			registered_ids[i] = id;
+			break;
+		}
+		if (registered_ids[i] == id)
+			break;
+	}
+}
+
+#ifdef CONFIG_PM
+static struct regmap *pmcreg;
+
+static struct
+{
+	u32 scsr;
+	u32 pcsr0;
+	u32 uckr;
+	u32 mor;
+	u32 mcfr;
+	u32 pllar;
+	u32 mckr;
+	u32 usb;
+	u32 imr;
+	u32 pcsr1;
+	u32 pcr[PMC_MAX_IDS];
+	u32 audio_pll0;
+	u32 audio_pll1;
+} pmc_cache;
+
+static int pmc_suspend(void)
+{
+	int i;
+
+	regmap_read(pmcreg, AT91_PMC_IMR, &pmc_cache.scsr);
+	regmap_read(pmcreg, AT91_PMC_PCSR, &pmc_cache.pcsr0);
+	regmap_read(pmcreg, AT91_CKGR_UCKR, &pmc_cache.uckr);
+	regmap_read(pmcreg, AT91_CKGR_MOR, &pmc_cache.mor);
+	regmap_read(pmcreg, AT91_CKGR_MCFR, &pmc_cache.mcfr);
+	regmap_read(pmcreg, AT91_CKGR_PLLAR, &pmc_cache.pllar);
+	regmap_read(pmcreg, AT91_PMC_MCKR, &pmc_cache.mckr);
+	regmap_read(pmcreg, AT91_PMC_USB, &pmc_cache.usb);
+	regmap_read(pmcreg, AT91_PMC_IMR, &pmc_cache.imr);
+	regmap_read(pmcreg, AT91_PMC_PCSR1, &pmc_cache.pcsr1);
+
+	for (i = 0; registered_ids[i]; i++) {
+		regmap_write(pmcreg, AT91_PMC_PCR,
+			     (registered_ids[i] & AT91_PMC_PCR_PID_MASK));
+		regmap_read(pmcreg, AT91_PMC_PCR,
+			    &pmc_cache.pcr[registered_ids[i]]);
+	}
+
+	return 0;
+}
+
+static void pmc_resume(void)
+{
+	int i, ret = 0;
+	u32 tmp;
+
+	regmap_read(pmcreg, AT91_PMC_MCKR, &tmp);
+	if (pmc_cache.mckr != tmp)
+		pr_warn("MCKR was not configured properly by the firmware\n");
+	regmap_read(pmcreg, AT91_CKGR_PLLAR, &tmp);
+	if (pmc_cache.pllar != tmp)
+		pr_warn("PLLAR was not configured properly by the firmware\n");
+
+	regmap_write(pmcreg, AT91_PMC_IMR, pmc_cache.scsr);
+	regmap_write(pmcreg, AT91_PMC_PCER, pmc_cache.pcsr0);
+	regmap_write(pmcreg, AT91_CKGR_UCKR, pmc_cache.uckr);
+	regmap_write(pmcreg, AT91_CKGR_MOR, pmc_cache.mor);
+	regmap_write(pmcreg, AT91_CKGR_MCFR, pmc_cache.mcfr);
+	regmap_write(pmcreg, AT91_PMC_USB, pmc_cache.usb);
+	regmap_write(pmcreg, AT91_PMC_IMR, pmc_cache.imr);
+	regmap_write(pmcreg, AT91_PMC_PCER1, pmc_cache.pcsr1);
+
+	for (i = 0; registered_ids[i]; i++) {
+		regmap_write(pmcreg, AT91_PMC_PCR,
+			     pmc_cache.pcr[registered_ids[i]] |
+			     AT91_PMC_PCR_CMD);
+	}
+
+	if (pmc_cache.uckr & AT91_PMC_UPLLEN) {
+		ret = regmap_read_poll_timeout(pmcreg, AT91_PMC_SR, tmp,
+					       !(tmp & AT91_PMC_LOCKU),
+					       10, 5000);
+		if (ret)
+			pr_crit("USB PLL didn't lock when resuming\n");
+	}
+}
+
+static struct syscore_ops pmc_syscore_ops = {
+	.suspend = pmc_suspend,
+	.resume = pmc_resume,
+};
+
+static const struct of_device_id sama5d2_pmc_dt_ids[] = {
+	{ .compatible = "atmel,sama5d2-pmc" },
+	{ /* sentinel */ }
+};
+
+static int __init pmc_register_ops(void)
+{
+	struct device_node *np;
+
+	np = of_find_matching_node(NULL, sama5d2_pmc_dt_ids);
+
+	pmcreg = syscon_node_to_regmap(np);
+	if (IS_ERR(pmcreg))
+		return PTR_ERR(pmcreg);
+
+	register_syscore_ops(&pmc_syscore_ops);
+
+	return 0;
+}
+/* This has to happen before arch_initcall because of the tcb_clksrc driver */
+postcore_initcall(pmc_register_ops);
+#endif
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 5771fff0ee3f..aa7e1f1e3265 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -29,4 +29,6 @@ struct clk_range {
 int of_at91_get_clk_range(struct device_node *np, const char *propname,
 			  struct clk_range *range);
 
+void pmc_register_id(u8 id);
+
 #endif /* __PMC_H_ */
-- 
2.11.0
