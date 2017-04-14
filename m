Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:55912 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751962AbdDNV41 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2017 17:56:27 -0400
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] clk: at91: Add sama5d2 suspend/resume
Date: Fri, 14 Apr 2017 23:56:18 +0200
Message-Id: <20170414215618.16534-1-alexandre.belloni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On sama5d2, VDD core maybe be cut while in suspend. This means registers
will be lost. Ensure they are saved and restored properly.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/clk/at91/pmc.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index 526df5ba042d..5cd1f0a2ea72 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -13,7 +13,9 @@
 #include <linux/clk/at91_pmc.h>
 #include <linux/of.h>
 #include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/syscore_ops.h>
 
 #include <asm/proc-fns.h>
 
@@ -41,3 +43,109 @@ int of_at91_get_clk_range(struct device_node *np, const char *propname,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_at91_get_clk_range);
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
+	u32 pcr[64];
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
+	for (i = 2; i < 64; i++) {
+		regmap_write(pmcreg, AT91_PMC_PCR, (i & AT91_PMC_PCR_PID_MASK));
+		regmap_read(pmcreg, AT91_PMC_PCR, &pmc_cache.pcr[i]);
+	}
+
+	return 0;
+}
+
+static bool pmc_ready(unsigned int mask)
+{
+	unsigned int status;
+
+	regmap_read(pmcreg, AT91_PMC_SR, &status);
+
+	return ((status & mask) == mask) ? 1 : 0;
+}
+
+static void pmc_resume(void)
+{
+	int i;
+	unsigned int mask = AT91_PMC_MCKRDY | AT91_PMC_LOCKA;
+
+	regmap_write(pmcreg, AT91_PMC_IMR, pmc_cache.scsr);
+	regmap_write(pmcreg, AT91_PMC_PCER, pmc_cache.pcsr0);
+	regmap_write(pmcreg, AT91_CKGR_UCKR, pmc_cache.uckr);
+	regmap_write(pmcreg, AT91_CKGR_MOR, pmc_cache.mor);
+	regmap_write(pmcreg, AT91_CKGR_MCFR, pmc_cache.mcfr);
+	regmap_write(pmcreg, AT91_CKGR_PLLAR, pmc_cache.pllar);
+	regmap_write(pmcreg, AT91_PMC_MCKR, pmc_cache.mckr);
+	regmap_write(pmcreg, AT91_PMC_USB, pmc_cache.usb);
+	regmap_write(pmcreg, AT91_PMC_IMR, pmc_cache.imr);
+	regmap_write(pmcreg, AT91_PMC_PCER1, pmc_cache.pcsr1);
+
+	for (i = 2; i < 64; i++) {
+		regmap_write(pmcreg, AT91_PMC_PCR, (i & AT91_PMC_PCR_PID_MASK));
+		regmap_write(pmcreg, AT91_PMC_PCR, pmc_cache.pcr[i]);
+	}
+
+	if (pmc_cache.uckr & AT91_PMC_UPLLEN)
+		mask |= AT91_PMC_LOCKU;
+
+	while (!pmc_ready(mask))
+		cpu_relax();
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
+/* This has to happen before arch_initcall becaues of the tcb_clksrc driver */
+postcore_initcall(pmc_register_ops);
+#endif
-- 
2.11.0

