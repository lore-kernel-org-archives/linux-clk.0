Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF75C2B9F4
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jun 2021 23:14:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6B676112D
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jun 2021 23:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhFSXQ3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Jun 2021 19:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFSXQ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Jun 2021 19:16:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69972C061574
        for <linux-clk@vger.kernel.org>; Sat, 19 Jun 2021 16:14:15 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id k8so19297619lja.4
        for <linux-clk@vger.kernel.org>; Sat, 19 Jun 2021 16:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MA0l+wQOFyKgXrzLfRB7FfuTspprDQuKA/u4S5A/mck=;
        b=OMLlel+t/Xyde7L3uFdvOTHAYCpdlldCTaTbGzu3L8A6jWObrybkEV5A5v1by2uBPw
         bpinhGVnt56DnWc35EXuopXPxFmhgmjmo365/K277f1R25NxgPsBa1jXu5E7DQt0nsVz
         ve9SKNFvtOFvU6FXBKWDoc3zY4MZ21sbCdY6yaGmacN5DTwpoYhcZmbrPC9ljJqvFjhQ
         SHlSsrxVpOMOVL3pIBJTOebVz3fWkERibihJgrkD3iafNuB2GMieWVsT4GMyLNOARgno
         KXgb9AFRqD1mlFdFmM0mk89zEoZwIeCZvdJiMBesD3tWRl0DdiFdO4kqngc3XX8SNfoB
         k4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MA0l+wQOFyKgXrzLfRB7FfuTspprDQuKA/u4S5A/mck=;
        b=NT47xI4C/6W4QP6htmF8cpJETYedPZjj1agXRHfnyZlOdDIC5Ii2V0HstH2vICvrwG
         wdlHl6dwQJ9GNnstrxVpYtYF9co1AQ5z0XxzY4k2ho799r/LYUQeRGWZBZSIRSGWCBSI
         uxLywomIdw5+WoM2m5I/4Almq9keAH8618ZmUQERPtf4PNu3t33Vp57GUJh++qIgbQcW
         mrr6w7OH7Bow/pms0aIkiBEEcHkSoCjrx76KrS1+EhGOK0nX6HZXVntY1Jc/dE3SmPKR
         3+6IsSW+iAS9zgsbMZYBTCccxq/paB/iaPjxKSWyL4DoQ6uoGNOuhKrQF0WdHsQpVVnO
         vv6A==
X-Gm-Message-State: AOAM533JeRalp9l3dlfQwbn5pyZ1jgZTTBSFsztQLu3FpAhO1K0hu7xK
        bXIJpYwwJS6IFRGkCjMUvzx67SY3YI9EUg==
X-Google-Smtp-Source: ABdhPJwh40JqK8mkYDO8uwmt7b+vJWnDUEKcLta6DVtN5aazP9JsM1Xzap/ukWeMpV9vO+1mN6i6lw==
X-Received: by 2002:a2e:b4d8:: with SMTP id r24mr1517190ljm.321.1624144453598;
        Sat, 19 Jun 2021 16:14:13 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s21sm1579392lji.57.2021.06.19.16.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 16:14:13 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] clk: ux500: Add driver for the reset portions of PRCC
Date:   Sun, 20 Jun 2021 01:05:26 +0200
Message-Id: <20210619230526.1864087-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210619230526.1864087-1-linus.walleij@linaro.org>
References: <20210619230526.1864087-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Ux500 PRCC (peripheral reset and clock controller) can also
control reset of the IP blocks, not just clocks. As the PRCC is probed
as a clock controller and we have other platforms implementing combined
clock and reset controllers, follow this pattern and implement the PRCC
rest controller as part of the clock driver.

The reset controller needs to be selected from the machine as Ux500 has
traditionally selected its mandatory subsystem prerequisites from there.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-ux500/Kconfig      |   1 +
 drivers/clk/ux500/Makefile       |   3 +
 drivers/clk/ux500/prcc.h         |  36 +++++++
 drivers/clk/ux500/reset-prcc.c   | 159 +++++++++++++++++++++++++++++++
 drivers/clk/ux500/reset-prcc.h   |  22 +++++
 drivers/clk/ux500/u8500_of_clk.c |  32 ++++---
 6 files changed, 240 insertions(+), 13 deletions(-)
 create mode 100644 drivers/clk/ux500/prcc.h
 create mode 100644 drivers/clk/ux500/reset-prcc.c
 create mode 100644 drivers/clk/ux500/reset-prcc.h

diff --git a/arch/arm/mach-ux500/Kconfig b/arch/arm/mach-ux500/Kconfig
index c1086ebe0050..24ed7f4a87a4 100644
--- a/arch/arm/mach-ux500/Kconfig
+++ b/arch/arm/mach-ux500/Kconfig
@@ -29,6 +29,7 @@ menuconfig ARCH_U8500
 	select REGULATOR_DB8500_PRCMU
 	select REGULATOR_FIXED_VOLTAGE
 	select SOC_BUS
+	select RESET_CONTROLLER
 	help
 	  Support for ST-Ericsson's Ux500 architecture
 
diff --git a/drivers/clk/ux500/Makefile b/drivers/clk/ux500/Makefile
index 53fd29002401..c29b83df403e 100644
--- a/drivers/clk/ux500/Makefile
+++ b/drivers/clk/ux500/Makefile
@@ -8,6 +8,9 @@ obj-y += clk-prcc.o
 obj-y += clk-prcmu.o
 obj-y += clk-sysctrl.o
 
+# Reset control
+obj-y += reset-prcc.o
+
 # Clock definitions
 obj-y += u8500_of_clk.o
 
diff --git a/drivers/clk/ux500/prcc.h b/drivers/clk/ux500/prcc.h
new file mode 100644
index 000000000000..bf978cace563
--- /dev/null
+++ b/drivers/clk/ux500/prcc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __PRCC_H
+#define __PRCC_H
+
+#define PRCC_NUM_PERIPH_CLUSTERS 6
+#define PRCC_PERIPHS_PER_CLUSTER 32
+
+/* CLKRST4 is missing making it hard to index things */
+enum clkrst_index {
+	CLKRST1_INDEX = 0,
+	CLKRST2_INDEX,
+	CLKRST3_INDEX,
+	CLKRST5_INDEX,
+	CLKRST6_INDEX,
+	CLKRST_MAX,
+};
+
+static inline int prcc_num_to_index(unsigned int num)
+{
+	switch (num) {
+	case 1:
+		return CLKRST1_INDEX;
+	case 2:
+		return CLKRST2_INDEX;
+	case 3:
+		return CLKRST3_INDEX;
+	case 5:
+		return CLKRST5_INDEX;
+	case 6:
+		return CLKRST6_INDEX;
+	}
+	return -EINVAL;
+}
+
+#endif
diff --git a/drivers/clk/ux500/reset-prcc.c b/drivers/clk/ux500/reset-prcc.c
new file mode 100644
index 000000000000..91f9f1942fd9
--- /dev/null
+++ b/drivers/clk/ux500/reset-prcc.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <linux/reset-controller.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+
+#include "prcc.h"
+#include "reset-prcc.h"
+
+#define to_u8500_prcc_reset(p) container_of((p), struct u8500_prcc_reset, rcdev)
+
+/* This macro flattens the 2-dimensional PRCC numberspace */
+#define PRCC_RESET_LINE(prcc_num, bit) \
+	((prcc_num * PRCC_PERIPHS_PER_CLUSTER) + bit)
+
+/*
+ * Reset registers in each PRCC - the reset lines are active low
+ * so what you need to do is write a bit for the peripheral you
+ * want to put into reset into the CLEAR register, this will assert
+ * the reset by pulling the line low. SET take the device out of
+ * reset. The status reflects the actual state of the line.
+ */
+#define PRCC_K_SOFTRST_SET		0x018
+#define PRCC_K_SOFTRST_CLEAR		0x01c
+#define PRCC_K_RST_STATUS		0x020
+
+static void __iomem *u8500_prcc_reset_base(struct u8500_prcc_reset *ur,
+					   unsigned long id)
+{
+	unsigned int prcc_num, index;
+
+	prcc_num = id / PRCC_PERIPHS_PER_CLUSTER;
+	index = prcc_num_to_index(prcc_num);
+
+	if (index > ARRAY_SIZE(ur->base))
+		return NULL;
+
+	return ur->base[index];
+}
+
+static int u8500_prcc_reset(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	struct u8500_prcc_reset *ur = to_u8500_prcc_reset(rcdev);
+	void __iomem *base = u8500_prcc_reset_base(ur, id);
+	unsigned int bit = id % PRCC_PERIPHS_PER_CLUSTER;
+
+	pr_debug("PRCC cycle reset id %lu, bit %d\n", id, bit);
+
+	/* Assert reset and then release it */
+	writel(BIT(bit), base + PRCC_K_SOFTRST_CLEAR);
+	udelay(1);
+	writel(BIT(bit), base + PRCC_K_SOFTRST_SET);
+	udelay(1);
+
+	return 0;
+}
+
+static int u8500_prcc_reset_assert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	struct u8500_prcc_reset *ur = to_u8500_prcc_reset(rcdev);
+	void __iomem *base = u8500_prcc_reset_base(ur, id);
+	unsigned int bit = id % PRCC_PERIPHS_PER_CLUSTER;
+
+	pr_debug("PRCC assert reset id %lu, bit %d\n", id, bit);
+	writel(BIT(bit), base + PRCC_K_SOFTRST_CLEAR);
+
+	return 0;
+}
+
+static int u8500_prcc_reset_deassert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	struct u8500_prcc_reset *ur = to_u8500_prcc_reset(rcdev);
+	void __iomem *base = u8500_prcc_reset_base(ur, id);
+	unsigned int bit = id % PRCC_PERIPHS_PER_CLUSTER;
+
+	pr_debug("PRCC deassert reset id %lu, bit %d\n", id, bit);
+	writel(BIT(bit), base + PRCC_K_SOFTRST_SET);
+
+	return 0;
+}
+
+static int u8500_prcc_reset_status(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	struct u8500_prcc_reset *ur = to_u8500_prcc_reset(rcdev);
+	void __iomem *base = u8500_prcc_reset_base(ur, id);
+	unsigned int bit = id % PRCC_PERIPHS_PER_CLUSTER;
+	u32 val;
+
+	pr_debug("PRCC check status on reset line id %lu, bit %d\n", id, bit);
+	val = readl(base + PRCC_K_RST_STATUS);
+
+	/* Active low so return the inverse value of the bit */
+	return !(val & BIT(bit));
+}
+
+static const struct reset_control_ops u8500_prcc_reset_ops = {
+	.reset = u8500_prcc_reset,
+	.assert = u8500_prcc_reset_assert,
+	.deassert = u8500_prcc_reset_deassert,
+	.status = u8500_prcc_reset_status,
+};
+
+static int u8500_prcc_reset_xlate(struct reset_controller_dev *rcdev,
+				  const struct of_phandle_args *reset_spec)
+{
+	unsigned int prcc_num, bit;
+
+	if (reset_spec->args_count != 2)
+		return -EINVAL;
+
+	prcc_num = reset_spec->args[0];
+	bit = reset_spec->args[1];
+
+	if (prcc_num != 1 && prcc_num != 2 && prcc_num != 3 &&
+	    prcc_num != 5 && prcc_num != 6) {
+		pr_err("%s: invalid PRCC %d\n", __func__, prcc_num);
+		return -EINVAL;
+	}
+
+	pr_debug("located reset line %d at PRCC %d bit %d\n",
+		 PRCC_RESET_LINE(prcc_num, bit), prcc_num, bit);
+
+	return PRCC_RESET_LINE(prcc_num, bit);
+}
+
+void u8500_prcc_reset_init(struct device_node *np, struct u8500_prcc_reset *ur)
+{
+	struct reset_controller_dev *rcdev = &ur->rcdev;
+	int ret;
+	int i;
+
+	for (i = 0; i < CLKRST_MAX; i++) {
+		ur->base[i] = ioremap(ur->phy_base[i], SZ_4K);
+		if (!ur->base[i])
+			pr_err("PRCC failed to remap for reset base %d (%08x)\n",
+			       i, ur->phy_base[i]);
+	}
+
+	rcdev->owner = THIS_MODULE;
+	rcdev->nr_resets = 256; /* Only used with simple xlate */
+	rcdev->ops = &u8500_prcc_reset_ops;
+	rcdev->of_node = np;
+	rcdev->of_reset_n_cells = 2;
+	rcdev->of_xlate = u8500_prcc_reset_xlate;
+
+	ret = reset_controller_register(rcdev);
+	if (ret)
+		pr_err("PRCC failed to register reset controller\n");
+}
diff --git a/drivers/clk/ux500/reset-prcc.h b/drivers/clk/ux500/reset-prcc.h
new file mode 100644
index 000000000000..8bdc6df23d14
--- /dev/null
+++ b/drivers/clk/ux500/reset-prcc.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __RESET_PRCC_H
+#define __RESET_PRCC_H
+
+#include <linux/reset-controller.h>
+#include <linux/io.h>
+
+/**
+ * struct u8500_prcc_reset - U8500 PRCC reset controller state
+ * @rcdev: reset controller device
+ * @bases: the PRCC bases
+ */
+struct u8500_prcc_reset {
+	struct reset_controller_dev rcdev;
+	u32 phy_base[CLKRST_MAX];
+	void __iomem *base[CLKRST_MAX];
+};
+
+void u8500_prcc_reset_init(struct device_node *np, struct u8500_prcc_reset *ur);
+
+#endif
diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
index 0aedd42fad52..330d45ab27a9 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -10,10 +10,10 @@
 #include <linux/of_address.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/dbx500-prcmu.h>
-#include "clk.h"
 
-#define PRCC_NUM_PERIPH_CLUSTERS 6
-#define PRCC_PERIPHS_PER_CLUSTER 32
+#include "clk.h"
+#include "prcc.h"
+#include "reset-prcc.h"
 
 static struct clk *prcmu_clk[PRCMU_NUM_CLKS];
 static struct clk *prcc_pclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
@@ -46,16 +46,6 @@ static struct clk *ux500_twocell_get(struct of_phandle_args *clkspec,
 	return PRCC_SHOW(clk_data, base, bit);
 }
 
-/* CLKRST4 is missing making it hard to index things */
-enum clkrst_index {
-	CLKRST1_INDEX = 0,
-	CLKRST2_INDEX,
-	CLKRST3_INDEX,
-	CLKRST5_INDEX,
-	CLKRST6_INDEX,
-	CLKRST_MAX,
-};
-
 static void u8500_clk_init(struct device_node *np)
 {
 	struct prcmu_fw_version *fw_version;
@@ -63,8 +53,20 @@ static void u8500_clk_init(struct device_node *np)
 	const char *sgaclk_parent = NULL;
 	struct clk *clk, *rtc_clk, *twd_clk;
 	u32 bases[CLKRST_MAX];
+	struct u8500_prcc_reset *rstc;
 	int i;
 
+	/*
+	 * We allocate the reset controller here so that we can fill in the
+	 * base addresses properly and pass to the reset controller init
+	 * function later on.
+	 */
+	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
+	if (!rstc) {
+		pr_err("could not allocate reset controller\n");
+		return;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(bases); i++) {
 		struct resource r;
 
@@ -73,6 +75,7 @@ static void u8500_clk_init(struct device_node *np)
 			pr_err("failed to get CLKRST %d base address\n",
 			       i + 1);
 		bases[i] = r.start;
+		rstc->phy_base[i] = r.start;
 	}
 
 	/* Clock sources */
@@ -562,6 +565,9 @@ static void u8500_clk_init(struct device_node *np)
 
 		if (of_node_name_eq(child, "smp-twd-clock"))
 			of_clk_add_provider(child, of_clk_src_simple_get, twd_clk);
+
+		if (of_node_name_eq(child, "prcc-reset-controller"))
+			u8500_prcc_reset_init(child, rstc);
 	}
 }
 CLK_OF_DECLARE(u8500_clks, "stericsson,u8500-clks", u8500_clk_init);
-- 
2.31.1

