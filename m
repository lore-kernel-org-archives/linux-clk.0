Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A496C4332B
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 17:27:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1AFC233EF
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 17:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732767AbhATOIe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 09:08:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:52728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732809AbhATNLV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Jan 2021 08:11:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B74623139;
        Wed, 20 Jan 2021 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611148238;
        bh=/n5jpX+Dga0L4p7HwpIfjYOcjPdDWZ/CVpwJlDNpSAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fsCHHXHNopSEqcUuWJtVqPqqbKUWcWdm4uLEhBdMfs7dWH/zXXsn9LOVtPCDFGup4
         LqQqS1TCKnLWwZ1lsztvdxQMTDkoMx5/ZeOQlo/s+3iZ/Xqxwwt+vBnBDyc+aXfjqG
         o1kTtHYggstYj425ZIeb27S6DcSNQoNHzTCzzoZQ6qvrzxmtT7yCOpa+GHV7/WM4lq
         lt64Uz7a5o7yRN3h2I1yuwNB4Hst1cAafobzcwx/Z2ni42OaXMCx0hRjB4UEY7mvBX
         d741IsKW/R+ej6rGwqJY3uPTaX9lJpzWmZtAKUk/N/6YiDR4IaYNiHOW7dKaf0AUSE
         EVgD6BNPYm5Kg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>
Subject: [PATCH 1/4] clk: remove tango4 driver
Date:   Wed, 20 Jan 2021 14:10:23 +0100
Message-Id: <20210120131026.1721788-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120131026.1721788-1-arnd@kernel.org>
References: <20210120131026.1721788-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The tango platform is getting removed, so the driver is no
longer needed.

Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Mans Rullgard <mans@mansr.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../bindings/clock/tango4-clock.txt           | 23 -----
 drivers/clk/Makefile                          |  1 -
 drivers/clk/clk-tango4.c                      | 85 -------------------
 3 files changed, 109 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/tango4-clock.txt
 delete mode 100644 drivers/clk/clk-tango4.c

diff --git a/Documentation/devicetree/bindings/clock/tango4-clock.txt b/Documentation/devicetree/bindings/clock/tango4-clock.txt
deleted file mode 100644
index 19c580a7bda2..000000000000
--- a/Documentation/devicetree/bindings/clock/tango4-clock.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Sigma Designs Tango4 Clock Generator
-
-The Tango4 clock generator outputs cpu_clk and sys_clk (the latter is used
-for RAM and various peripheral devices). The clock binding described here
-is applicable to all Tango4 SoCs.
-
-Required Properties:
-
-- compatible: should be "sigma,tango4-clkgen".
-- reg: physical base address of the device and length of memory mapped region.
-- clocks: phandle of the input clock (crystal oscillator).
-- clock-output-names: should be "cpuclk" and "sysclk".
-- #clock-cells: should be set to 1.
-
-Example:
-
-	clkgen: clkgen@10000 {
-		compatible = "sigma,tango4-clkgen";
-		reg = <0x10000 0x40>;
-		clocks = <&xtal>;
-		clock-output-names = "cpuclk", "sysclk";
-		#clock-cells = <1>;
-	};
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dbdc590e7de3..adf05704336e 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -63,7 +63,6 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
-obj-$(CONFIG_ARCH_TANGO)		+= clk-tango4.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_ARCH_U300)			+= clk-u300.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
diff --git a/drivers/clk/clk-tango4.c b/drivers/clk/clk-tango4.c
deleted file mode 100644
index fe12a43f7a40..000000000000
--- a/drivers/clk/clk-tango4.c
+++ /dev/null
@@ -1,85 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/kernel.h>
-#include <linux/clk-provider.h>
-#include <linux/of_address.h>
-#include <linux/init.h>
-#include <linux/io.h>
-
-#define CLK_COUNT 4 /* cpu_clk, sys_clk, usb_clk, sdio_clk */
-static struct clk *clks[CLK_COUNT];
-static struct clk_onecell_data clk_data = { clks, CLK_COUNT };
-
-#define SYSCLK_DIV	0x20
-#define CPUCLK_DIV	0x24
-#define DIV_BYPASS	BIT(23)
-
-/*** CLKGEN_PLL ***/
-#define extract_pll_n(val)	((val >>  0) & ((1u << 7) - 1))
-#define extract_pll_k(val)	((val >> 13) & ((1u << 3) - 1))
-#define extract_pll_m(val)	((val >> 16) & ((1u << 3) - 1))
-#define extract_pll_isel(val)	((val >> 24) & ((1u << 3) - 1))
-
-static void __init make_pll(int idx, const char *parent, void __iomem *base)
-{
-	char name[8];
-	u32 val, mul, div;
-
-	sprintf(name, "pll%d", idx);
-	val = readl(base + idx * 8);
-	mul =  extract_pll_n(val) + 1;
-	div = (extract_pll_m(val) + 1) << extract_pll_k(val);
-	clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
-	if (extract_pll_isel(val) != 1)
-		panic("%s: input not set to XTAL_IN\n", name);
-}
-
-static void __init make_cd(int idx, void __iomem *base)
-{
-	char name[8];
-	u32 val, mul, div;
-
-	sprintf(name, "cd%d", idx);
-	val = readl(base + idx * 8);
-	mul =  1 << 27;
-	div = (2 << 27) + val;
-	clk_register_fixed_factor(NULL, name, "pll2", 0, mul, div);
-	if (val > 0xf0000000)
-		panic("%s: unsupported divider %x\n", name, val);
-}
-
-static void __init tango4_clkgen_setup(struct device_node *np)
-{
-	struct clk **pp = clk_data.clks;
-	void __iomem *base = of_iomap(np, 0);
-	const char *parent = of_clk_get_parent_name(np, 0);
-
-	if (!base)
-		panic("%pOFn: invalid address\n", np);
-
-	if (readl(base + CPUCLK_DIV) & DIV_BYPASS)
-		panic("%pOFn: unsupported cpuclk setup\n", np);
-
-	if (readl(base + SYSCLK_DIV) & DIV_BYPASS)
-		panic("%pOFn: unsupported sysclk setup\n", np);
-
-	writel(0x100, base + CPUCLK_DIV); /* disable frequency ramping */
-
-	make_pll(0, parent, base);
-	make_pll(1, parent, base);
-	make_pll(2, parent, base);
-	make_cd(2, base + 0x80);
-	make_cd(6, base + 0x80);
-
-	pp[0] = clk_register_divider(NULL, "cpu_clk", "pll0", 0,
-			base + CPUCLK_DIV, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
-	pp[1] = clk_register_fixed_factor(NULL, "sys_clk", "pll1", 0, 1, 4);
-	pp[2] = clk_register_fixed_factor(NULL,  "usb_clk", "cd2", 0, 1, 2);
-	pp[3] = clk_register_fixed_factor(NULL, "sdio_clk", "cd6", 0, 1, 2);
-
-	if (IS_ERR(pp[0]) || IS_ERR(pp[1]) || IS_ERR(pp[2]) || IS_ERR(pp[3]))
-		panic("%pOFn: clk registration failed\n", np);
-
-	if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data))
-		panic("%pOFn: clk provider registration failed\n", np);
-}
-CLK_OF_DECLARE(tango4_clkgen, "sigma,tango4-clkgen", tango4_clkgen_setup);
-- 
2.29.2

