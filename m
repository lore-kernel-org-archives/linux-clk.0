Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF04C433DB
	for <linux-clk@archiver.kernel.org>; Tue,  2 Feb 2021 10:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6177564EDA
	for <linux-clk@archiver.kernel.org>; Tue,  2 Feb 2021 10:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhBBKiB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Feb 2021 05:38:01 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:35915 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhBBKhq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Feb 2021 05:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612262265; x=1643798265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ojcd6uu/QscZZxlaVpKpXHu2Wx8Cyb32ijE8hUzp2DY=;
  b=kGC2/MXy3qe1fBqdSiL6VqkY3Pg1motlVFFrBUEAJDgo5pHqJDfrPE9d
   6egET79BINIwi1nlm1Fh47+dKIaMnd1pmc2SK1oqeBNVsog9bBYjRoBuG
   f6osSGfN/l1FkWmFlYm3ooiAGn1+kFyWuUOgfgu0sWbyaaengkBg6c+kr
   4L56qCnvxZf3+ZVFcrmHg/n+if1K0sjWy+CkSmgwQZgQGrM/cNoTbMKxk
   UZVVAYtC/k2l34wWe0/7RDuTMPST7webY4kUzJjbKCKn2cKltLIyhzHLf
   cZ1ks8ANC430dDy7eFBRprMDebMpGLzfKutYSFTdb8fAfOt8tThRw9wzV
   w==;
IronPort-SDR: h7duR51tDacqw/12n1cjIfWGDHPK8J+qrT7h5yVX+imzDhVJFdf0T2b0muA9D7AMZevDF/RIWL
 tMl5r9aEyvKGsJ+ROENH4/i/J3hVEyu3EHpANPl3i9USsKf5RZqH2Q40Y1RGCFdX/h3I4crK7b
 eYDxWEyNwxR2/b9w7eCsxXZNFqk2pWlyGZKJjZ13yJfgLi0hHcEgP9He9rhZmZt0OGwZ26VKJq
 jZSdJxNIUJcQ7ey1jbpV1RpeYvZ5yj8Co3EIpnBIOxURkRNsA+R3jxzoRgI9Bj4nlYrILwoNk2
 Lqc=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; 
   d="scan'208";a="160092477"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:36 +0800
IronPort-SDR: 7CxJrdwLunSXCM3WlSYUbQvUE0E++Vh4C/peU7UD9DEePgHogqi9HXIl88rCxKQoB1PhA4tr8s
 E9j+iXw0ldvzmvVNNTH/CPJyxuDnOeTt9nxuYW+RSjT1gDKShCdcOSuOG/GmQMmgr/kuXAQq13
 SsJLm0rwxBHvweIN4zsOzoi4mxJ+t9WsGevcS1o5YwpYyxnLg9ucelTsRPx3kOVvQzl7JzksWn
 5wIXaZdQm5t/EE8IpQksBls9BbSdKvYvMeCS7gEKpJbO1JwQShWWa9WGNYc9avt6iZomzUOl36
 o/qiuc3aRulA2zBwArPBEBQK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 02:20:44 -0800
IronPort-SDR: XRr7x8jZBmbkx9pHdBUB5O3Wow5pmK1GH/EBu0g99uSusKrMyNxNEaeqZNRdzL8mNBZo0T09Y7
 K80o/ml8k9EIKIy1uH0geQhVeuLkB5pYYbwRbfcoOJm9Ul/GY1Gdh/Zqs3ZqF0Wv2lmYgf2Hqn
 myWNS9GwTIdkr6Xxum9G4MhMWyu5DzM+gUk+5BFrE8M0HGWtnJWvDh8X8hc3zBzxQXhYwfHWUQ
 2XO5233fxXcTPHCXVuo12uMdNv9PbsQjqqCwG14pJn5RrPfOLn4MFpPXTfzWGnnrJjqu7K3Hwr
 4OQ=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.58])
  by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:35 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org
Cc:     Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
        Sean Anderson <seanga2@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH v14 01/16] clk: Add RISC-V Canaan Kendryte K210 clock driver
Date:   Tue,  2 Feb 2021 19:36:08 +0900
Message-Id: <20210202103623.200809-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202103623.200809-1-damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
This new driver with the compatible string "canaan,k210-clk" implements
support for the full clock structure of the K210 SoC. Since it is
required for the correct operation of the SoC, this driver is
selected by default for compilation when the SOC_CANAAN option is
selected.

With this change, the k210-sysctl driver is turned into a simple
platform driver which enables its power bus clock and triggers
populating its child nodes. The sysctl driver retains the SOC early
initialization code, but the implementation now relies on the new
function k210_clk_early_init() provided by the new clk-k210 driver.

The clock structure implemented and many of the coding ideas for the
driver come from the work by Sean Anderson on the K210 support for the
U-Boot project.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 MAINTAINERS                      |    1 +
 drivers/clk/Kconfig              |    8 +
 drivers/clk/Makefile             |    1 +
 drivers/clk/clk-k210.c           | 1012 ++++++++++++++++++++++++++++++
 drivers/soc/canaan/Kconfig       |   18 +-
 drivers/soc/canaan/Makefile      |    2 +-
 drivers/soc/canaan/k210-sysctl.c |  205 ++----
 include/soc/canaan/k210-sysctl.h |    2 +
 8 files changed, 1071 insertions(+), 178 deletions(-)
 create mode 100644 drivers/clk/clk-k210.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dfb95dbe2abe..0f9c2300779b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
 M:	Damien Le Moal <damien.lemoal@wdc.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
 F:	drivers/soc/canaan/
 F:	include/soc/canaan/
 
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 85856cff506c..cb971f6632e2 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -368,6 +368,14 @@ config COMMON_CLK_FIXED_MMIO
 	help
 	  Support for Memory Mapped IO Fixed clocks
 
+config COMMON_CLK_K210
+	bool "Clock driver for the Canaan Kendryte K210 SoC"
+	depends on COMMON_CLK && OF
+	depends on RISCV && SOC_CANAAN
+	default SOC_CANAAN
+	help
+	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
+
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dbdc590e7de3..5f8f9f135df5 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
 obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
+obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
 obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_COMMON_CLK_MAX9485)	+= clk-max9485.o
diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
new file mode 100644
index 000000000000..429db4904ad6
--- /dev/null
+++ b/drivers/clk/clk-k210.c
@@ -0,0 +1,1012 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ */
+#define pr_fmt(fmt)     "k210-clk: " fmt
+
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_clk.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/clk-provider.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <asm/soc.h>
+#include <soc/canaan/k210-sysctl.h>
+
+#include <dt-bindings/clock/k210-clk.h>
+
+/*
+ * Clocks parameters.
+ */
+struct k210_sysclk;
+
+struct k210_clk {
+	int id;
+	struct k210_sysclk *ksc;
+	struct clk_hw hw;
+};
+
+struct k210_clk_cfg {
+	const char *name;
+	u8 gate_reg;
+	u8 gate_bit;
+	u8 div_reg;
+	u8 div_shift;
+	u8 div_width;
+	u8 div_type;
+	u8 mux_reg;
+	u8 mux_bit;
+};
+
+enum k210_clk_div_type {
+	K210_DIV_NONE,
+	K210_DIV_ONE_BASED,
+	K210_DIV_DOUBLE_ONE_BASED,
+	K210_DIV_POWER_OF_TWO,
+};
+
+#define K210_GATE(_reg, _bit)	\
+	.gate_reg = (_reg),	\
+	.gate_bit = (_bit)
+#define K210_DIV(_reg, _shift, _width, _type)	\
+	.div_reg = (_reg),			\
+	.div_shift = (_shift),			\
+	.div_width = (_width),			\
+	.div_type = (_type)
+#define K210_MUX(_reg, _bit)	\
+	.mux_reg = (_reg),	\
+	.mux_bit = (_bit)
+
+static struct k210_clk_cfg k210_clk_cfgs[K210_NUM_CLKS] = {
+
+	/* Gated clocks, no mux, no divider */
+	[K210_CLK_CPU] = {
+		.name = "cpu",
+		K210_GATE(K210_SYSCTL_EN_CENT, 0)
+	},
+	[K210_CLK_DMA] = {
+		.name = "dma",
+		K210_GATE(K210_SYSCTL_EN_PERI, 1)
+	},
+	[K210_CLK_FFT] = {
+		.name = "fft",
+		K210_GATE(K210_SYSCTL_EN_PERI, 4)
+	},
+	[K210_CLK_GPIO] = {
+		.name = "gpio",
+		K210_GATE(K210_SYSCTL_EN_PERI, 5)
+	},
+	[K210_CLK_UART1] = {
+		.name = "uart1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 16)
+	},
+	[K210_CLK_UART2] = {
+		.name = "uart2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 17)
+	},
+	[K210_CLK_UART3] = {
+		.name = "uart3",
+		K210_GATE(K210_SYSCTL_EN_PERI, 18)
+	},
+	[K210_CLK_FPIOA] = {
+		.name = "fpioa",
+		K210_GATE(K210_SYSCTL_EN_PERI, 20)
+	},
+	[K210_CLK_SHA] = {
+		.name = "sha",
+		K210_GATE(K210_SYSCTL_EN_PERI, 26)
+	},
+	[K210_CLK_AES] = {
+		.name = "aes",
+		K210_GATE(K210_SYSCTL_EN_PERI, 19)
+	},
+	[K210_CLK_OTP] = {
+		.name = "otp",
+		K210_GATE(K210_SYSCTL_EN_PERI, 27)
+	},
+	[K210_CLK_RTC] = {
+		.name = "rtc",
+		K210_GATE(K210_SYSCTL_EN_PERI, 29)
+	},
+
+	/* Gated divider clocks */
+	[K210_CLK_SRAM0] = {
+		.name = "sram0",
+		K210_GATE(K210_SYSCTL_EN_CENT, 1),
+		K210_DIV(K210_SYSCTL_THR0, 0, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_SRAM1] = {
+		.name = "sram1",
+		K210_GATE(K210_SYSCTL_EN_CENT, 2),
+		K210_DIV(K210_SYSCTL_THR0, 4, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_ROM] = {
+		.name = "rom",
+		K210_GATE(K210_SYSCTL_EN_PERI, 0),
+		K210_DIV(K210_SYSCTL_THR0, 16, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_DVP] = {
+		.name = "dvp",
+		K210_GATE(K210_SYSCTL_EN_PERI, 3),
+		K210_DIV(K210_SYSCTL_THR0, 12, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_APB0] = {
+		.name = "apb0",
+		K210_GATE(K210_SYSCTL_EN_CENT, 3),
+		K210_DIV(K210_SYSCTL_SEL0, 3, 3, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_APB1] = {
+		.name = "apb1",
+		K210_GATE(K210_SYSCTL_EN_CENT, 4),
+		K210_DIV(K210_SYSCTL_SEL0, 6, 3, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_APB2] = {
+		.name = "apb2",
+		K210_GATE(K210_SYSCTL_EN_CENT, 5),
+		K210_DIV(K210_SYSCTL_SEL0, 9, 3, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_AI] = {
+		.name = "ai",
+		K210_GATE(K210_SYSCTL_EN_PERI, 2),
+		K210_DIV(K210_SYSCTL_THR0, 8, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_SPI0] = {
+		.name = "spi0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 6),
+		K210_DIV(K210_SYSCTL_THR1, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_SPI1] = {
+		.name = "spi1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 7),
+		K210_DIV(K210_SYSCTL_THR1, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_SPI2] = {
+		.name = "spi2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 8),
+		K210_DIV(K210_SYSCTL_THR1, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2C0] = {
+		.name = "i2c0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 13),
+		K210_DIV(K210_SYSCTL_THR5, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2C1] = {
+		.name = "i2c1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 14),
+		K210_DIV(K210_SYSCTL_THR5, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2C2] = {
+		.name = "i2c2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 15),
+		K210_DIV(K210_SYSCTL_THR5, 24, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_WDT0] = {
+		.name = "wdt0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 24),
+		K210_DIV(K210_SYSCTL_THR6, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_WDT1] = {
+		.name = "wdt1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 25),
+		K210_DIV(K210_SYSCTL_THR6, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S0] = {
+		.name = "i2s0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 10),
+		K210_DIV(K210_SYSCTL_THR3, 0, 16, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S1] = {
+		.name = "i2s1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 11),
+		K210_DIV(K210_SYSCTL_THR3, 16, 16, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S2] = {
+		.name = "i2s2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 12),
+		K210_DIV(K210_SYSCTL_THR4, 0, 16, K210_DIV_DOUBLE_ONE_BASED)
+	},
+
+	/* Divider clocks, no gate, no mux */
+	[K210_CLK_I2S0_M] = {
+		.name = "i2s0_m",
+		K210_DIV(K210_SYSCTL_THR4, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S1_M] = {
+		.name = "i2s1_m",
+		K210_DIV(K210_SYSCTL_THR4, 24, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S2_M] = {
+		.name = "i2s2_m",
+		K210_DIV(K210_SYSCTL_THR4, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+
+	/* Muxed gated divider clocks */
+	[K210_CLK_SPI3] = {
+		.name = "spi3",
+		K210_GATE(K210_SYSCTL_EN_PERI, 9),
+		K210_DIV(K210_SYSCTL_THR1, 24, 8, K210_DIV_DOUBLE_ONE_BASED),
+		K210_MUX(K210_SYSCTL_SEL0, 12)
+	},
+	[K210_CLK_TIMER0] = {
+		.name = "timer0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 21),
+		K210_DIV(K210_SYSCTL_THR2,  0, 8, K210_DIV_DOUBLE_ONE_BASED),
+		K210_MUX(K210_SYSCTL_SEL0, 13)
+	},
+	[K210_CLK_TIMER1] = {
+		.name = "timer1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 22),
+		K210_DIV(K210_SYSCTL_THR2, 8, 8, K210_DIV_DOUBLE_ONE_BASED),
+		K210_MUX(K210_SYSCTL_SEL0, 14)
+	},
+	[K210_CLK_TIMER2] = {
+		.name = "timer2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 23),
+		K210_DIV(K210_SYSCTL_THR2, 16, 8, K210_DIV_DOUBLE_ONE_BASED),
+		K210_MUX(K210_SYSCTL_SEL0, 15)
+	},
+};
+
+/*
+ * PLL control register bits.
+ */
+#define K210_PLL_CLKR		GENMASK(3, 0)
+#define K210_PLL_CLKF		GENMASK(9, 4)
+#define K210_PLL_CLKOD		GENMASK(13, 10)
+#define K210_PLL_BWADJ		GENMASK(19, 14)
+#define K210_PLL_RESET		(1 << 20)
+#define K210_PLL_PWRD		(1 << 21)
+#define K210_PLL_INTFB		(1 << 22)
+#define K210_PLL_BYPASS		(1 << 23)
+#define K210_PLL_TEST		(1 << 24)
+#define K210_PLL_EN		(1 << 25)
+#define K210_PLL_SEL		GENMASK(27, 26) /* PLL2 only */
+
+/*
+ * PLL lock register bits.
+ */
+#define K210_PLL_LOCK		0
+#define K210_PLL_CLEAR_SLIP	2
+#define K210_PLL_TEST_OUT	3
+
+/*
+ * Clock selector register bits.
+ */
+#define K210_ACLK_SEL		BIT(0)
+#define K210_ACLK_DIV		GENMASK(2, 1)
+
+/*
+ * PLLs.
+ */
+enum k210_pll_id {
+	K210_PLL0, K210_PLL1, K210_PLL2, K210_PLL_NUM
+};
+
+struct k210_pll {
+	enum k210_pll_id id;
+	struct k210_sysclk *ksc;
+	void __iomem *base;
+	void __iomem *reg;
+	void __iomem *lock;
+	u8 lock_shift;
+	u8 lock_width;
+	struct clk_hw hw;
+};
+#define to_k210_pll(_hw)	container_of(_hw, struct k210_pll, hw)
+
+/*
+ * PLLs configuration: by default PLL0 runs at 780 MHz and PLL1 at 299 MHz.
+ * The first 2 SRAM banks depend on ACLK/CPU clock which is by default PLL0
+ * rate divided by 2. Set PLL1 to 390 MHz so that the third SRAM bank has the
+ * same clock as the first 2.
+ */
+struct k210_pll_cfg {
+	u32 reg;
+	u8 lock_shift;
+	u8 lock_width;
+	u32 r;
+	u32 f;
+	u32 od;
+	u32 bwadj;
+};
+
+static struct k210_pll_cfg k210_plls_cfg[] = {
+	{ K210_SYSCTL_PLL0,  0, 2, 0, 59, 1, 59 }, /* 780 MHz */
+	{ K210_SYSCTL_PLL1,  8, 1, 0, 59, 3, 59 }, /* 390 MHz */
+	{ K210_SYSCTL_PLL2, 16, 1, 0, 22, 1, 22 }, /* 299 MHz */
+};
+
+/**
+ * struct k210_sysclk - sysclk driver data
+ * @node: device node
+ * @regs: system controller registers start address
+ * @clk_lock: clock setting spinlock
+ * @plls: SoC PLLs descriptors
+ * @aclk: ACLK clock
+ * @clks: All other clocks
+ */
+struct k210_sysclk {
+	struct device_node		*node;
+	void __iomem			*regs;
+	spinlock_t			clk_lock;
+	struct k210_pll			plls[K210_PLL_NUM];
+	struct clk_hw			aclk;
+	struct k210_clk			clks[K210_NUM_CLKS];
+};
+
+#define to_k210_sysclk(_hw)	container_of(_hw, struct k210_sysclk, aclk)
+
+/*
+ * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
+ */
+static void k210_aclk_set_selector(void __iomem *regs, u8 sel)
+{
+	u32 reg = readl(regs + K210_SYSCTL_SEL0);
+
+	if (sel)
+		reg |= K210_ACLK_SEL;
+	else
+		reg &= K210_ACLK_SEL;
+	writel(reg, regs + K210_SYSCTL_SEL0);
+}
+
+static void k210_init_pll(void __iomem *regs, enum k210_pll_id pllid,
+			  struct k210_pll *pll)
+{
+	pll->id = pllid;
+	pll->reg = regs + k210_plls_cfg[pllid].reg;
+	pll->lock = regs + K210_SYSCTL_PLL_LOCK;
+	pll->lock_shift = k210_plls_cfg[pllid].lock_shift;
+	pll->lock_width = k210_plls_cfg[pllid].lock_width;
+}
+
+static void k210_pll_wait_for_lock(struct k210_pll *pll)
+{
+	u32 reg, mask = GENMASK(pll->lock_shift + pll->lock_width - 1,
+				pll->lock_shift);
+
+	while (true) {
+		reg = readl(pll->lock);
+		if ((reg & mask) == mask)
+			break;
+
+		reg |= BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);
+		writel(reg, pll->lock);
+	}
+}
+
+static bool k210_pll_hw_is_enabled(struct k210_pll *pll)
+{
+	u32 reg = readl(pll->reg);
+	u32 mask = K210_PLL_PWRD | K210_PLL_EN;
+
+	if (reg & K210_PLL_RESET)
+		return false;
+
+	return (reg & mask) == mask;
+}
+
+static void k210_pll_enable_hw(void __iomem *regs, struct k210_pll *pll)
+{
+	struct k210_pll_cfg *pll_cfg = &k210_plls_cfg[pll->id];
+	u32 reg;
+
+	if (k210_pll_hw_is_enabled(pll))
+		return;
+
+	/*
+	 * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU cores and
+	 * SRAM running.
+	 */
+	if (pll->id == K210_PLL0)
+		k210_aclk_set_selector(regs, 0);
+
+	/* Set PLL factors */
+	reg = readl(pll->reg);
+	reg &= ~GENMASK(19, 0);
+	reg |= FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);
+	reg |= FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);
+	reg |= FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);
+	reg |= FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);
+	reg |= K210_PLL_PWRD;
+	writel(reg, pll->reg);
+
+	/*
+	 * Reset the PLL: ensure reset is low before asserting it.
+	 * The magic NOPs come from the Kendryte reference SDK.
+	 */
+	reg &= ~K210_PLL_RESET;
+	writel(reg, pll->reg);
+	reg |= K210_PLL_RESET;
+	writel(reg, pll->reg);
+	nop();
+	nop();
+	reg &= ~K210_PLL_RESET;
+	writel(reg, pll->reg);
+
+	k210_pll_wait_for_lock(pll);
+
+	reg &= ~K210_PLL_BYPASS;
+	reg |= K210_PLL_EN;
+	writel(reg, pll->reg);
+
+	if (pll->id == K210_PLL0)
+		k210_aclk_set_selector(regs, 1);
+}
+
+static int k210_pll_enable(struct clk_hw *hw)
+{
+	struct k210_pll *pll = to_k210_pll(hw);
+	struct k210_sysclk *ksc = pll->ksc;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ksc->clk_lock, flags);
+
+	k210_pll_enable_hw(ksc->regs, pll);
+
+	spin_unlock_irqrestore(&ksc->clk_lock, flags);
+
+	return 0;
+}
+
+static void k210_pll_disable(struct clk_hw *hw)
+{
+	struct k210_pll *pll = to_k210_pll(hw);
+	struct k210_sysclk *ksc = pll->ksc;
+	unsigned long flags;
+	u32 reg;
+
+	/*
+	 * Bypassing before powering off is important so child clocks do not
+	 * stop working. This is especially important for pll0, the indirect
+	 * parent of the cpu clock.
+	 */
+	spin_lock_irqsave(&ksc->clk_lock, flags);
+	reg = readl(pll->reg);
+	reg |= K210_PLL_BYPASS;
+	writel(reg, pll->reg);
+
+	reg &= ~K210_PLL_PWRD;
+	reg &= ~K210_PLL_EN;
+	writel(reg, pll->reg);
+	spin_unlock_irqrestore(&ksc->clk_lock, flags);
+}
+
+static int k210_pll_is_enabled(struct clk_hw *hw)
+{
+	return k210_pll_hw_is_enabled(to_k210_pll(hw));
+}
+
+static unsigned long k210_pll_get_rate(struct clk_hw *hw,
+				       unsigned long parent_rate)
+{
+	struct k210_pll *pll = to_k210_pll(hw);
+	u32 reg = readl(pll->reg);
+	u32 r, f, od;
+
+	if (reg & K210_PLL_BYPASS)
+		return parent_rate;
+
+	if (!(reg & K210_PLL_PWRD))
+		return 0;
+
+	r = FIELD_GET(K210_PLL_CLKR, reg) + 1;
+	f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
+	od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
+
+	return (u64)parent_rate * f / (r * od);
+}
+
+static const struct clk_ops k210_pll_ops = {
+	.enable		= k210_pll_enable,
+	.disable	= k210_pll_disable,
+	.is_enabled	= k210_pll_is_enabled,
+	.recalc_rate	= k210_pll_get_rate,
+};
+
+static int k210_pll2_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct k210_pll *pll = to_k210_pll(hw);
+	struct k210_sysclk *ksc = pll->ksc;
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&ksc->clk_lock, flags);
+
+	reg = readl(pll->reg);
+	reg &= ~K210_PLL_SEL;
+	reg |= FIELD_PREP(K210_PLL_SEL, index);
+	writel(reg, pll->reg);
+
+	spin_unlock_irqrestore(&ksc->clk_lock, flags);
+
+	return 0;
+}
+
+static u8 k210_pll2_get_parent(struct clk_hw *hw)
+{
+	struct k210_pll *pll = to_k210_pll(hw);
+	u32 reg = readl(pll->reg);
+
+	return FIELD_GET(K210_PLL_SEL, reg);
+}
+
+static const struct clk_ops k210_pll2_ops = {
+	.enable		= k210_pll_enable,
+	.disable	= k210_pll_disable,
+	.is_enabled	= k210_pll_is_enabled,
+	.recalc_rate	= k210_pll_get_rate,
+	.set_parent	= k210_pll2_set_parent,
+	.get_parent	= k210_pll2_get_parent,
+};
+
+static int k210_register_pll(struct k210_sysclk *ksc, const char *in0,
+			     enum k210_pll_id pllid, const char *name,
+			     int num_parents, const struct clk_ops *ops)
+{
+	struct k210_pll *pll = &ksc->plls[pllid];
+	struct clk_init_data init = {};
+	const struct clk_parent_data parent_data[] = {
+		{ .name = in0 },
+		{ .hw = &ksc->plls[K210_PLL0].hw },
+		{ .hw = &ksc->plls[K210_PLL1].hw },
+	};
+
+	init.name = name;
+	init.parent_data = parent_data;
+	init.num_parents = num_parents;
+	init.ops = ops;
+
+	pll->hw.init = &init;
+	pll->ksc = ksc;
+
+	return clk_hw_register(NULL, &pll->hw);
+}
+
+static int k210_register_plls(struct k210_sysclk *ksc, const char *in0)
+{
+	int i, ret;
+
+	for (i = 0; i < K210_PLL_NUM; i++)
+		k210_init_pll(ksc->regs, i, &ksc->plls[i]);
+
+	/* PLL0 and PLL1 only have IN0 as parent */
+	ret = k210_register_pll(ksc, in0, K210_PLL0, "pll0", 1, &k210_pll_ops);
+	if (ret) {
+		pr_err("%pOFP: register PLL0 failed\n", ksc->node);
+		return ret;
+	}
+	ret = k210_register_pll(ksc, in0, K210_PLL1, "pll1", 1, &k210_pll_ops);
+	if (ret) {
+		pr_err("%pOFP: register PLL1 failed\n", ksc->node);
+		return ret;
+	}
+
+	/* PLL2 has IN0, PLL0 and PLL1 as parents */
+	ret = k210_register_pll(ksc, in0, K210_PLL2, "pll2", 3, &k210_pll2_ops);
+	if (ret) {
+		pr_err("%pOFP: register PLL2 failed\n", ksc->node);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct k210_sysclk *ksc = to_k210_sysclk(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ksc->clk_lock, flags);
+
+	k210_aclk_set_selector(ksc->regs, index);
+
+	spin_unlock_irqrestore(&ksc->clk_lock, flags);
+
+	return 0;
+}
+
+static u8 k210_aclk_get_parent(struct clk_hw *hw)
+{
+	struct k210_sysclk *ksc = to_k210_sysclk(hw);
+	u32 sel;
+
+	sel = readl(ksc->regs + K210_SYSCTL_SEL0) & K210_ACLK_SEL;
+
+	return sel ? 1 : 0;
+}
+
+static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct k210_sysclk *ksc = to_k210_sysclk(hw);
+	u32 reg = readl(ksc->regs + K210_SYSCTL_SEL0);
+	unsigned int shift;
+
+	if (!(reg & 0x1))
+		return parent_rate;
+
+	shift = FIELD_GET(K210_ACLK_DIV, reg);
+
+	return parent_rate / (2UL << shift);
+}
+
+static const struct clk_ops k210_aclk_ops = {
+	.set_parent	= k210_aclk_set_parent,
+	.get_parent	= k210_aclk_get_parent,
+	.recalc_rate	= k210_aclk_get_rate,
+};
+
+/*
+ * ACLK has IN0 and PLL0 as parents.
+ */
+static int k210_register_aclk(struct k210_sysclk *ksc, const char *in0)
+{
+	struct clk_init_data init = {};
+	const struct clk_parent_data parent_data[] = {
+		{ .name = in0 },
+		{ .hw = &ksc->plls[K210_PLL0].hw },
+	};
+	int ret;
+
+	init.name = "aclk";
+	init.parent_data = parent_data;
+	init.num_parents = 2;
+	init.ops = &k210_aclk_ops;
+	ksc->aclk.init = &init;
+
+	ret = clk_hw_register(NULL, &ksc->aclk);
+	if (ret) {
+		pr_err("%pOFP: register aclk failed\n", ksc->node);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define to_k210_clk(_hw)	container_of(_hw, struct k210_clk, hw)
+
+static int k210_clk_enable(struct clk_hw *hw)
+{
+	struct k210_clk *kclk = to_k210_clk(hw);
+	struct k210_sysclk *ksc = kclk->ksc;
+	struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
+	unsigned long flags;
+	u32 reg;
+
+	if (!cfg->gate_reg)
+		return 0;
+
+	spin_lock_irqsave(&ksc->clk_lock, flags);
+	reg = readl(ksc->regs + cfg->gate_reg);
+	reg |= BIT(cfg->gate_bit);
+	writel(reg, ksc->regs + cfg->gate_reg);
+	spin_unlock_irqrestore(&ksc->clk_lock, flags);
+
+	return 0;
+}
+
+static void k210_clk_disable(struct clk_hw *hw)
+{
+	struct k210_clk *kclk = to_k210_clk(hw);
+	struct k210_sysclk *ksc = kclk->ksc;
+	struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
+	unsigned long flags;
+	u32 reg;
+
+	if (!cfg->gate_reg)
+		return;
+
+	spin_lock_irqsave(&ksc->clk_lock, flags);
+	reg = readl(ksc->regs + cfg->gate_reg);
+	reg &= ~BIT(cfg->gate_bit);
+	writel(reg, ksc->regs + cfg->gate_reg);
+	spin_unlock_irqrestore(&ksc->clk_lock, flags);
+}
+
+static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct k210_clk *kclk = to_k210_clk(hw);
+	struct k210_sysclk *ksc = kclk->ksc;
+	struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&ksc->clk_lock, flags);
+	reg = readl(ksc->regs + cfg->mux_reg);
+	if (index)
+		reg |= BIT(cfg->mux_bit);
+	else
+		reg &= ~BIT(cfg->mux_bit);
+	spin_unlock_irqrestore(&ksc->clk_lock, flags);
+
+	return 0;
+}
+
+static u8 k210_clk_get_parent(struct clk_hw *hw)
+{
+	struct k210_clk *kclk = to_k210_clk(hw);
+	struct k210_sysclk *ksc = kclk->ksc;
+	struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
+	unsigned long flags;
+	u32 reg, idx;
+
+	spin_lock_irqsave(&ksc->clk_lock, flags);
+	reg = readl(ksc->regs + cfg->mux_reg);
+	idx = (reg & BIT(cfg->mux_bit)) ? 1 : 0;
+	spin_unlock_irqrestore(&ksc->clk_lock, flags);
+
+	return idx;
+}
+
+static unsigned long k210_clk_get_rate(struct clk_hw *hw,
+				       unsigned long parent_rate)
+{
+	struct k210_clk *kclk = to_k210_clk(hw);
+	struct k210_sysclk *ksc = kclk->ksc;
+	struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
+	u32 reg, div_val;
+
+	if (!cfg->div_reg)
+		return parent_rate;
+
+	reg = readl(ksc->regs + cfg->div_reg);
+	div_val = (reg >> cfg->div_shift) & GENMASK(cfg->div_width - 1, 0);
+
+	switch (cfg->div_type) {
+	case K210_DIV_ONE_BASED:
+		return parent_rate / (div_val + 1);
+	case K210_DIV_DOUBLE_ONE_BASED:
+		return parent_rate / ((div_val + 1) * 2);
+	case K210_DIV_POWER_OF_TWO:
+		return parent_rate / (2UL << div_val);
+	case K210_DIV_NONE:
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops k210_clk_mux_ops = {
+	.enable		= k210_clk_enable,
+	.disable	= k210_clk_disable,
+	.set_parent	= k210_clk_set_parent,
+	.get_parent	= k210_clk_get_parent,
+	.recalc_rate	= k210_clk_get_rate,
+};
+
+static const struct clk_ops k210_clk_ops = {
+	.enable		= k210_clk_enable,
+	.disable	= k210_clk_disable,
+	.recalc_rate	= k210_clk_get_rate,
+};
+
+static void k210_register_clk(struct k210_sysclk *ksc, int id,
+			      const struct clk_parent_data *parent_data,
+			      int num_parents, unsigned long flags)
+{
+	struct k210_clk *kclk = &ksc->clks[id];
+	struct clk_init_data init = {};
+	int ret;
+
+	init.name = k210_clk_cfgs[id].name;
+	init.flags = flags;
+	init.parent_data = parent_data;
+	init.num_parents = num_parents;
+	if (num_parents > 1)
+		init.ops = &k210_clk_mux_ops;
+	else
+		init.ops = &k210_clk_ops;
+
+	kclk->id = id;
+	kclk->ksc = ksc;
+	kclk->hw.init = &init;
+
+	ret = clk_hw_register(NULL, &kclk->hw);
+	if (ret) {
+		pr_err("%pOFP: register clock %s failed\n",
+		       ksc->node, k210_clk_cfgs[id].name);
+		kclk->id = -1;
+	}
+}
+
+/*
+ * All muxed clocks have IN0 and PLL0 as parents.
+ */
+static inline void k210_register_mux_clk(struct k210_sysclk *ksc,
+					 const char *in0, int id)
+{
+	const struct clk_parent_data parent_data[2] = {
+		{ .name = in0 },
+		{ .hw = &ksc->plls[K210_PLL0].hw },
+	};
+
+	k210_register_clk(ksc, id, parent_data, 2, 0);
+}
+
+static inline void k210_register_in0_child(struct k210_sysclk *ksc,
+					   const char *in0, int id)
+{
+	const struct clk_parent_data parent_data = {
+		.name = in0,
+	};
+
+	k210_register_clk(ksc, id, &parent_data, 1, 0);
+}
+
+static inline void k210_register_pll_child(struct k210_sysclk *ksc, int id,
+					   enum k210_pll_id pllid,
+					   unsigned long flags)
+{
+	const struct clk_parent_data parent_data = {
+		.hw = &ksc->plls[pllid].hw,
+	};
+
+	k210_register_clk(ksc, id, &parent_data, 1, flags);
+}
+
+static inline void k210_register_aclk_child(struct k210_sysclk *ksc, int id,
+					    unsigned long flags)
+{
+	const struct clk_parent_data parent_data = {
+		.hw = &ksc->aclk,
+	};
+
+	k210_register_clk(ksc, id, &parent_data, 1, flags);
+}
+
+static inline void k210_register_clk_child(struct k210_sysclk *ksc, int id,
+					   int parent_id)
+{
+	const struct clk_parent_data parent_data = {
+		.hw = &ksc->clks[parent_id].hw,
+	};
+
+	k210_register_clk(ksc, id, &parent_data, 1, 0);
+}
+
+static struct clk_hw *k210_clk_hw_onecell_get(struct of_phandle_args *clkspec,
+					      void *data)
+{
+	struct k210_sysclk *ksc = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= K210_NUM_CLKS)
+		return ERR_PTR(-EINVAL);
+
+	return &ksc->clks[idx].hw;
+}
+
+static void __init k210_clk_init(struct device_node *np)
+{
+	struct device_node *sysctl_np;
+	struct k210_sysclk *ksc;
+	const char *in0;
+	int i, ret;
+
+	ksc = kzalloc(sizeof(*ksc), GFP_KERNEL);
+	if (!ksc)
+		return;
+
+	ksc->node = np;
+	spin_lock_init(&ksc->clk_lock);
+	sysctl_np = of_get_parent(np);
+	ksc->regs = of_iomap(sysctl_np, 0);
+	of_node_put(sysctl_np);
+	if (!ksc->regs) {
+		pr_err("%pOFP: failed to map registers\n", np);
+		return;
+	}
+
+	in0 = of_clk_get_parent_name(np, 0);
+	if (!in0) {
+		pr_err("%pOFP: undefined fixed-rate oscillator clock\n", np);
+		return;
+	}
+
+	ret = k210_register_plls(ksc, in0);
+	if (ret)
+		return;
+
+	ret = k210_register_aclk(ksc, in0);
+	if (ret)
+		return;
+
+	/*
+	 * Critical clocks: there are no consumers of the SRAM clocks,
+	 * including the AI clock for the third SRAM bank. The CPU clock
+	 * is only referenced by the uarths serial device and so would be
+	 * disabled if the serial console is disabled to switch to another
+	 * console. Mark all these clocks as critical so that they are never
+	 * disabled by the core clock management.
+	 */
+	k210_register_aclk_child(ksc, K210_CLK_CPU, CLK_IS_CRITICAL);
+	k210_register_aclk_child(ksc, K210_CLK_SRAM0, CLK_IS_CRITICAL);
+	k210_register_aclk_child(ksc, K210_CLK_SRAM1, CLK_IS_CRITICAL);
+	k210_register_pll_child(ksc, K210_CLK_AI, K210_PLL1, CLK_IS_CRITICAL);
+
+	/* Clocks with aclk as source */
+	k210_register_aclk_child(ksc, K210_CLK_DMA, 0);
+	k210_register_aclk_child(ksc, K210_CLK_FFT, 0);
+	k210_register_aclk_child(ksc, K210_CLK_ROM, 0);
+	k210_register_aclk_child(ksc, K210_CLK_DVP, 0);
+	k210_register_aclk_child(ksc, K210_CLK_APB0, 0);
+	k210_register_aclk_child(ksc, K210_CLK_APB1, 0);
+	k210_register_aclk_child(ksc, K210_CLK_APB2, 0);
+
+	/* Clocks with PLL0 as source */
+	k210_register_pll_child(ksc, K210_CLK_SPI0, K210_PLL0, 0);
+	k210_register_pll_child(ksc, K210_CLK_SPI1, K210_PLL0, 0);
+	k210_register_pll_child(ksc, K210_CLK_SPI2, K210_PLL0, 0);
+	k210_register_pll_child(ksc, K210_CLK_I2C0, K210_PLL0, 0);
+	k210_register_pll_child(ksc, K210_CLK_I2C1, K210_PLL0, 0);
+	k210_register_pll_child(ksc, K210_CLK_I2C2, K210_PLL0, 0);
+
+	/* Clocks with PLL2 as source */
+	k210_register_pll_child(ksc, K210_CLK_I2S0, K210_PLL2, 0);
+	k210_register_pll_child(ksc, K210_CLK_I2S1, K210_PLL2, 0);
+	k210_register_pll_child(ksc, K210_CLK_I2S2, K210_PLL2, 0);
+	k210_register_pll_child(ksc, K210_CLK_I2S0_M, K210_PLL2, 0);
+	k210_register_pll_child(ksc, K210_CLK_I2S1_M, K210_PLL2, 0);
+	k210_register_pll_child(ksc, K210_CLK_I2S2_M, K210_PLL2, 0);
+
+	/* Clocks with IN0 as source */
+	k210_register_in0_child(ksc, in0, K210_CLK_WDT0);
+	k210_register_in0_child(ksc, in0, K210_CLK_WDT1);
+	k210_register_in0_child(ksc, in0, K210_CLK_RTC);
+
+	/* Clocks with APB0 as source */
+	k210_register_clk_child(ksc, K210_CLK_GPIO, K210_CLK_APB0);
+	k210_register_clk_child(ksc, K210_CLK_UART1, K210_CLK_APB0);
+	k210_register_clk_child(ksc, K210_CLK_UART2, K210_CLK_APB0);
+	k210_register_clk_child(ksc, K210_CLK_UART3, K210_CLK_APB0);
+	k210_register_clk_child(ksc, K210_CLK_FPIOA, K210_CLK_APB0);
+	k210_register_clk_child(ksc, K210_CLK_SHA, K210_CLK_APB0);
+
+	/* Clocks with APB1 as source */
+	k210_register_clk_child(ksc, K210_CLK_AES, K210_CLK_APB1);
+	k210_register_clk_child(ksc, K210_CLK_OTP, K210_CLK_APB1);
+
+	/* Mux clocks with in0 or pll0 as source */
+	k210_register_mux_clk(ksc, in0, K210_CLK_SPI3);
+	k210_register_mux_clk(ksc, in0, K210_CLK_TIMER0);
+	k210_register_mux_clk(ksc, in0, K210_CLK_TIMER1);
+	k210_register_mux_clk(ksc, in0, K210_CLK_TIMER2);
+
+	/* Check for registration errors */
+	for (i = 0; i < K210_NUM_CLKS; i++) {
+		if (ksc->clks[i].id != i)
+			return;
+	}
+
+	ret = of_clk_add_hw_provider(np, k210_clk_hw_onecell_get, ksc);
+	if (ret) {
+		pr_err("%pOFP: add clock provider failed %d\n", np, ret);
+		return;
+	}
+
+	pr_info("%pOFP: CPU running at %lu MHz\n",
+		np, clk_hw_get_rate(&ksc->clks[K210_CLK_CPU].hw) / 1000000);
+}
+
+CLK_OF_DECLARE(k210_clk, "canaan,k210-clk", k210_clk_init);
+
+/*
+ * Enable PLL1 to be able to use the AI SRAM.
+ */
+void __init k210_clk_early_init(void __iomem *regs)
+{
+	struct k210_pll pll1;
+
+	/* Make sure ACLK selector is set to PLL0 */
+	k210_aclk_set_selector(regs, 1);
+
+	/* Startup PLL1 to enable the aisram bank for general memory use */
+	k210_init_pll(regs, K210_PLL1, &pll1);
+	k210_pll_enable_hw(regs, &pll1);
+}
diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 5232d13f07e5..8179b69518b4 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -1,14 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
-if SOC_CANAAN
-
-config K210_SYSCTL
+config SOC_K210_SYSCTL
 	bool "Canaan Kendryte K210 SoC system controller"
-	default y
-	depends on RISCV
+	depends on RISCV && SOC_CANAAN && OF
+	default SOC_CANAAN
+        select PM
+        select SIMPLE_PM_BUS
+        select SYSCON
+        select MFD_SYSCON
 	help
-	  Enables controlling the K210 various clocks and to enable
-	  general purpose use of the extra 2MB of SRAM normally
-	  reserved for the AI engine.
-
-endif
+	  Canaan Kendryte K210 SoC system controller driver.
diff --git a/drivers/soc/canaan/Makefile b/drivers/soc/canaan/Makefile
index 002d9ce95c0d..570280ad7967 100644
--- a/drivers/soc/canaan/Makefile
+++ b/drivers/soc/canaan/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_K210_SYSCTL)	+= k210-sysctl.o
+obj-$(CONFIG_SOC_K210_SYSCTL)	+= k210-sysctl.o
diff --git a/drivers/soc/canaan/k210-sysctl.c b/drivers/soc/canaan/k210-sysctl.c
index 60b474c33d45..27a346c406bc 100644
--- a/drivers/soc/canaan/k210-sysctl.c
+++ b/drivers/soc/canaan/k210-sysctl.c
@@ -3,165 +3,45 @@
  * Copyright (c) 2019 Christoph Hellwig.
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  */
-#include <linux/types.h>
 #include <linux/io.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/clk-provider.h>
-#include <linux/clkdev.h>
-#include <linux/bitfield.h>
+#include <linux/of_platform.h>
+#include <linux/clk.h>
 #include <asm/soc.h>
 
 #include <soc/canaan/k210-sysctl.h>
 
-#define K210_SYSCTL_CLK0_FREQ		26000000UL
-
-/* Registers base address */
-#define K210_SYSCTL_SYSCTL_BASE_ADDR	0x50440000ULL
-
-/* Register bits */
-/* K210_SYSCTL_PLL1: clkr: 4bits, clkf1: 6bits, clkod: 4bits, bwadj: 4bits */
-#define PLL_RESET		(1 << 20)
-#define PLL_PWR			(1 << 21)
-#define PLL_BYPASS		(1 << 23)
-#define PLL_OUT_EN		(1 << 25)
-/* K210_SYSCTL_PLL_LOCK */
-#define PLL1_LOCK1		(1 << 8)
-#define PLL1_LOCK2		(1 << 9)
-#define PLL1_SLIP_CLEAR		(1 << 10)
-/* K210_SYSCTL_SEL0 */
-#define CLKSEL_ACLK		(1 << 0)
-/* K210_SYSCTL_CLKEN_CENT */
-#define CLKEN_CPU		(1 << 0)
-#define CLKEN_SRAM0		(1 << 1)
-#define CLKEN_SRAM1		(1 << 2)
-/* K210_SYSCTL_EN_PERI */
-#define CLKEN_ROM		(1 << 0)
-#define CLKEN_TIMER0		(1 << 21)
-#define CLKEN_RTC		(1 << 29)
-
-struct k210_sysctl {
-	void __iomem		*regs;
-	struct clk_hw		hw;
-};
-
-static void k210_set_bits(u32 val, void __iomem *reg)
-{
-	writel(readl(reg) | val, reg);
-}
-
-static void k210_clear_bits(u32 val, void __iomem *reg)
-{
-	writel(readl(reg) & ~val, reg);
-}
-
-static void k210_pll1_enable(void __iomem *regs)
-{
-	u32 val;
-
-	val = readl(regs + K210_SYSCTL_PLL1);
-	val &= ~GENMASK(19, 0);				/* clkr1 = 0 */
-	val |= FIELD_PREP(GENMASK(9, 4), 0x3B);		/* clkf1 = 59 */
-	val |= FIELD_PREP(GENMASK(13, 10), 0x3);	/* clkod1 = 3 */
-	val |= FIELD_PREP(GENMASK(19, 14), 0x3B);	/* bwadj1 = 59 */
-	writel(val, regs + K210_SYSCTL_PLL1);
-
-	k210_clear_bits(PLL_BYPASS, regs + K210_SYSCTL_PLL1);
-	k210_set_bits(PLL_PWR, regs + K210_SYSCTL_PLL1);
-
-	/*
-	 * Reset the pll. The magic NOPs come from the Kendryte reference SDK.
-	 */
-	k210_clear_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);
-	k210_set_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);
-	nop();
-	nop();
-	k210_clear_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);
-
-	for (;;) {
-		val = readl(regs + K210_SYSCTL_PLL_LOCK);
-		if (val & PLL1_LOCK2)
-			break;
-		writel(val | PLL1_SLIP_CLEAR, regs + K210_SYSCTL_PLL_LOCK);
-	}
-
-	k210_set_bits(PLL_OUT_EN, regs + K210_SYSCTL_PLL1);
-}
-
-static unsigned long k210_sysctl_clk_recalc_rate(struct clk_hw *hw,
-		unsigned long parent_rate)
-{
-	struct k210_sysctl *s = container_of(hw, struct k210_sysctl, hw);
-	u32 clksel0, pll0;
-	u64 pll0_freq, clkr0, clkf0, clkod0;
-
-	/*
-	 * If the clock selector is not set, use the base frequency.
-	 * Otherwise, use PLL0 frequency with a frequency divisor.
-	 */
-	clksel0 = readl(s->regs + K210_SYSCTL_SEL0);
-	if (!(clksel0 & CLKSEL_ACLK))
-		return K210_SYSCTL_CLK0_FREQ;
-
-	/*
-	 * Get PLL0 frequency:
-	 * freq = base frequency * clkf0 / (clkr0 * clkod0)
-	 */
-	pll0 = readl(s->regs + K210_SYSCTL_PLL0);
-	clkr0 = 1 + FIELD_GET(GENMASK(3, 0), pll0);
-	clkf0 = 1 + FIELD_GET(GENMASK(9, 4), pll0);
-	clkod0 = 1 + FIELD_GET(GENMASK(13, 10), pll0);
-	pll0_freq = clkf0 * K210_SYSCTL_CLK0_FREQ / (clkr0 * clkod0);
-
-	/* Get the frequency divisor from the clock selector */
-	return pll0_freq / (2ULL << FIELD_GET(0x00000006, clksel0));
-}
-
-static const struct clk_ops k210_sysctl_clk_ops = {
-	.recalc_rate	= k210_sysctl_clk_recalc_rate,
-};
-
-static const struct clk_init_data k210_clk_init_data = {
-	.name		= "k210-sysctl-pll1",
-	.ops		= &k210_sysctl_clk_ops,
-};
-
 static int k210_sysctl_probe(struct platform_device *pdev)
 {
-	struct k210_sysctl *s;
-	int error;
-
-	pr_info("Kendryte K210 SoC sysctl\n");
-
-	s = devm_kzalloc(&pdev->dev, sizeof(*s), GFP_KERNEL);
-	if (!s)
-		return -ENOMEM;
-
-	s->regs = devm_ioremap_resource(&pdev->dev,
-			platform_get_resource(pdev, IORESOURCE_MEM, 0));
-	if (IS_ERR(s->regs))
-		return PTR_ERR(s->regs);
-
-	s->hw.init = &k210_clk_init_data;
-	error = devm_clk_hw_register(&pdev->dev, &s->hw);
-	if (error) {
-		dev_err(&pdev->dev, "failed to register clk");
-		return error;
+	struct device *dev = &pdev->dev;
+	struct clk *pclk;
+	int ret;
+
+	dev_info(dev, "K210 system controller\n");
+
+	/* Get power bus clock */
+	pclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk),
+				     "Get bus clock failed\n");
+
+	ret = clk_prepare_enable(pclk);
+	if (ret) {
+		dev_err(dev, "Enable bus clock failed\n");
+		return ret;
 	}
 
-	error = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get,
-					    &s->hw);
-	if (error) {
-		dev_err(&pdev->dev, "adding clk provider failed\n");
-		return error;
-	}
+	/* Populate children */
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		dev_err(dev, "Populate platform failed %d\n", ret);
 
-	return 0;
+	return ret;
 }
 
 static const struct of_device_id k210_sysctl_of_match[] = {
-	{ .compatible = "kendryte,k210-sysctl", },
-	{}
+	{ .compatible = "canaan,k210-sysctl", },
+	{ /* sentinel */ },
 };
 
 static struct platform_driver k210_sysctl_driver = {
@@ -171,12 +51,13 @@ static struct platform_driver k210_sysctl_driver = {
 	},
 	.probe			= k210_sysctl_probe,
 };
+builtin_platform_driver(k210_sysctl_driver);
 
-static int __init k210_sysctl_init(void)
-{
-	return platform_driver_register(&k210_sysctl_driver);
-}
-core_initcall(k210_sysctl_init);
+/*
+ * System controller registers base address and size.
+ */
+#define K210_SYSCTL_BASE_ADDR	0x50440000ULL
+#define K210_SYSCTL_BASE_SIZE	0x1000
 
 /*
  * This needs to be called very early during initialization, given that
@@ -184,24 +65,14 @@ core_initcall(k210_sysctl_init);
  */
 static void __init k210_soc_early_init(const void *fdt)
 {
-	void __iomem *regs;
-
-	regs = ioremap(K210_SYSCTL_SYSCTL_BASE_ADDR, 0x1000);
-	if (!regs)
-		panic("K210 sysctl ioremap");
-
-	/* Enable PLL1 to make the KPU SRAM useable */
-	k210_pll1_enable(regs);
-
-	k210_set_bits(PLL_OUT_EN, regs + K210_SYSCTL_PLL0);
+	void __iomem *sysctl_base;
 
-	k210_set_bits(CLKEN_CPU | CLKEN_SRAM0 | CLKEN_SRAM1,
-		      regs + K210_SYSCTL_EN_CENT);
-	k210_set_bits(CLKEN_ROM | CLKEN_TIMER0 | CLKEN_RTC,
-		      regs + K210_SYSCTL_EN_PERI);
+	sysctl_base = ioremap(K210_SYSCTL_BASE_ADDR, K210_SYSCTL_BASE_SIZE);
+	if (!sysctl_base)
+		panic("k210-sysctl: ioremap failed");
 
-	k210_set_bits(CLKSEL_ACLK, regs + K210_SYSCTL_SEL0);
+	k210_clk_early_init(sysctl_base);
 
-	iounmap(regs);
+	iounmap(sysctl_base);
 }
-SOC_EARLY_INIT_DECLARE(generic_k210, "kendryte,k210", k210_soc_early_init);
+SOC_EARLY_INIT_DECLARE(k210_soc, "canaan,kendryte-k210", k210_soc_early_init);
diff --git a/include/soc/canaan/k210-sysctl.h b/include/soc/canaan/k210-sysctl.h
index 2e037db68f35..0c2b2c2dabca 100644
--- a/include/soc/canaan/k210-sysctl.h
+++ b/include/soc/canaan/k210-sysctl.h
@@ -38,4 +38,6 @@
 #define K210_SYSCTL_DMA_SEL1	0x68 /* DMA handshake selector 1 */
 #define K210_SYSCTL_POWER_SEL	0x6C /* IO Power Mode Select controller */
 
+void k210_clk_early_init(void __iomem *regs);
+
 #endif
-- 
2.29.2

