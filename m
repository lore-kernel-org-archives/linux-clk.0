Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78688C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jan 2021 15:52:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F401238A0
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jan 2021 15:52:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbhAOPwT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbhAOPwS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jan 2021 10:52:18 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2175C061757
        for <linux-clk@vger.kernel.org>; Fri, 15 Jan 2021 07:51:37 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0RNs-0003NM-PD; Fri, 15 Jan 2021 16:51:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0RNs-0008LN-Ee; Fri, 15 Jan 2021 16:51:32 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, linux-clk@vger.kernel.org
Subject: [PATCH v2 2/7] clk: Drop unused efm32gg driver
Date:   Fri, 15 Jan 2021 16:51:25 +0100
Message-Id: <20210115155130.185010-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Support for this machine was just removed, so drop the now unused clk
driver, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/Makefile      |  1 -
 drivers/clk/clk-efm32gg.c | 84 ---------------------------------------
 2 files changed, 85 deletions(-)
 delete mode 100644 drivers/clk/clk-efm32gg.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dbdc590e7de3..a1197d753d82 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -27,7 +27,6 @@ obj-$(CONFIG_COMMON_CLK_CDCE706)	+= clk-cdce706.o
 obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
-obj-$(CONFIG_ARCH_EFM32)		+= clk-efm32gg.o
 obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
diff --git a/drivers/clk/clk-efm32gg.c b/drivers/clk/clk-efm32gg.c
deleted file mode 100644
index 85beaacb4088..000000000000
--- a/drivers/clk/clk-efm32gg.c
+++ /dev/null
@@ -1,84 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013 Pengutronix
- * Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>
- */
-#include <linux/io.h>
-#include <linux/clk-provider.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
-
-#include <dt-bindings/clock/efm32-cmu.h>
-
-#define CMU_HFPERCLKEN0		0x44
-#define CMU_MAX_CLKS		37
-
-static struct clk_hw_onecell_data *clk_data;
-
-static void __init efm32gg_cmu_init(struct device_node *np)
-{
-	int i;
-	void __iomem *base;
-	struct clk_hw **hws;
-
-	clk_data = kzalloc(struct_size(clk_data, hws, CMU_MAX_CLKS),
-			   GFP_KERNEL);
-
-	if (!clk_data)
-		return;
-
-	hws = clk_data->hws;
-
-	for (i = 0; i < CMU_MAX_CLKS; ++i)
-		hws[i] = ERR_PTR(-ENOENT);
-
-	base = of_iomap(np, 0);
-	if (!base) {
-		pr_warn("Failed to map address range for efm32gg,cmu node\n");
-		return;
-	}
-
-	hws[clk_HFXO] = clk_hw_register_fixed_rate(NULL, "HFXO", NULL, 0,
-						   48000000);
-
-	hws[clk_HFPERCLKUSART0] = clk_hw_register_gate(NULL, "HFPERCLK.USART0",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 0, 0, NULL);
-	hws[clk_HFPERCLKUSART1] = clk_hw_register_gate(NULL, "HFPERCLK.USART1",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 1, 0, NULL);
-	hws[clk_HFPERCLKUSART2] = clk_hw_register_gate(NULL, "HFPERCLK.USART2",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 2, 0, NULL);
-	hws[clk_HFPERCLKUART0] = clk_hw_register_gate(NULL, "HFPERCLK.UART0",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 3, 0, NULL);
-	hws[clk_HFPERCLKUART1] = clk_hw_register_gate(NULL, "HFPERCLK.UART1",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 4, 0, NULL);
-	hws[clk_HFPERCLKTIMER0] = clk_hw_register_gate(NULL, "HFPERCLK.TIMER0",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 5, 0, NULL);
-	hws[clk_HFPERCLKTIMER1] = clk_hw_register_gate(NULL, "HFPERCLK.TIMER1",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 6, 0, NULL);
-	hws[clk_HFPERCLKTIMER2] = clk_hw_register_gate(NULL, "HFPERCLK.TIMER2",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 7, 0, NULL);
-	hws[clk_HFPERCLKTIMER3] = clk_hw_register_gate(NULL, "HFPERCLK.TIMER3",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 8, 0, NULL);
-	hws[clk_HFPERCLKACMP0] = clk_hw_register_gate(NULL, "HFPERCLK.ACMP0",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 9, 0, NULL);
-	hws[clk_HFPERCLKACMP1] = clk_hw_register_gate(NULL, "HFPERCLK.ACMP1",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 10, 0, NULL);
-	hws[clk_HFPERCLKI2C0] = clk_hw_register_gate(NULL, "HFPERCLK.I2C0",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 11, 0, NULL);
-	hws[clk_HFPERCLKI2C1] = clk_hw_register_gate(NULL, "HFPERCLK.I2C1",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 12, 0, NULL);
-	hws[clk_HFPERCLKGPIO] = clk_hw_register_gate(NULL, "HFPERCLK.GPIO",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 13, 0, NULL);
-	hws[clk_HFPERCLKVCMP] = clk_hw_register_gate(NULL, "HFPERCLK.VCMP",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 14, 0, NULL);
-	hws[clk_HFPERCLKPRS] = clk_hw_register_gate(NULL, "HFPERCLK.PRS",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 15, 0, NULL);
-	hws[clk_HFPERCLKADC0] = clk_hw_register_gate(NULL, "HFPERCLK.ADC0",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 16, 0, NULL);
-	hws[clk_HFPERCLKDAC0] = clk_hw_register_gate(NULL, "HFPERCLK.DAC0",
-			"HFXO", 0, base + CMU_HFPERCLKEN0, 17, 0, NULL);
-
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
-}
-CLK_OF_DECLARE(efm32ggcmu, "efm32gg,cmu", efm32gg_cmu_init);
-- 
2.29.2

