Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795495310;
	b=snUq7vva2KAs6rSM55bdZcD7M9VdcWboQCH4K4dRuadpQe2Atd3AgfPLBTwolLKLwwAw
	 d2SMnYDj6bKuQrMaR1nLcJGQ+FjeLNMWmEb9v9dj2btndRbx6ls0VTPUPR2vcp9rTJ0Fj
	 /zvCX4UTNpSHbR3Rb4RYIGG7BxJMtrGQA8kduKiXDAlddLo2m41BKolflzIwtmAQKLRSw
	 8zJ/BCqi9VC5BaiXi6cHqQ6+pIAJxNTkEH3C3sfjlYK6+2CMGV4epAxzhOTn58KQnebmu
	 e+wl/97JwSFfZyEW8C/LejW9Yv2/2YgYdjPhIFonAcNJFDUQJdQzGXo4qqFpocnxwNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495310;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vawiQkhy1unj3+xKi+nZXxA+gJhCJlICkiKuGa4H+zI=;
	b=YgfIeDZ5pvgrXAp5tleE6XeKqRsxC8k3o7aD5Pmk2O6r6q5cw17HQTIzhu0vAsldoe/Y
	 eKY+hRkAuRfOM9JgeaTFhaq2k0YrKN4ATg1zdygrZw5/a0Q9iBBymB2NDqbloLTHjiYay
	 JLGYQTY15ZdhzyIBwOeJorLjpnuplRNnyZsrL/NX4riSdc2LKdlyRQk2qo7iMIbUpZZH+
	 d47t3HARyU5INBob8Dx0ac1YTtkFV8t5Xk96mkjIXEeNeWoFap63VZamjBXNb3qLg7co+
	 J8TxBfAs4IMsLEe6UdusaA4IXAMfXIkD85Z39FYjAN7leZCBuM1HU1rG+UsbVQHFa+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYzDeIHy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0272B606A31E;
	Tue, 24 Nov 2026 04:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYzDeIHy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495309;
	b=i/FJhYMefJqYRfRIeGs9w7mG1YrPs2PwhE1sFDM31lZ9pWWf72Mrrp3yK0PGASI0+l/g
	 RqbrPeXPCL0oSDjWgu6shtaCdRMiZ4fudwJwX6j7YLGDzo4/J0BhQ5O4okBh3VyIIgZQ9
	 M8JqfFAWgNgjGYo9wbHtgg88QzhLm2nxN+qLZ01dMMuNVFSoFbqfmZtregw5lSqWYuTe9
	 v4EWXTC29cNS+1VJ3D0ei5sudrTt5cdbJ8F6IoefQlRlf6cZJkOYKHLBCSrHY1fomSh87
	 OhcDNxGOrIjCv7cX5dtcPxQFWDbUm8m5Vy2k2a4BBLhB4q0SbvhYx4GsDEEzdOdLeCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495309;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vawiQkhy1unj3+xKi+nZXxA+gJhCJlICkiKuGa4H+zI=;
	b=z3dPd1yyMEqhJk+XAeyaC37iSjlhd+dzdh2AS5OOQ2aG7BAJNYZkRc1jfbur1bc/awcG
	 VWWB+bbaQuLdd1xQ6DKrWgLzY1SXq2jZnHLFWU0Nehs5uzHaKK1oWlBY7GQo9J9G97J6V
	 d7LZOGq+QOr6lc7L6t0/YC/vyU/OFjTNO6+NfDYDnOhtJx0oOxPy0zSY4p/ziIEfziZ2y
	 mehy+NEi5RAaqQ7ZDq0f96TAek0BDhrPPmNtRkm95tFJqn0Ae+fg6Bek2aKOWh1GmpBwZ
	 MXQEMTNuhCFu2JldaobDY97hm41WmA3USSNt6eVlWGulV10NVebxk7tsmig9aV+ulEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 521CF1F000D8;
	Tue, 24 Nov 2026 04:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495309;
	bh=vawiQkhy1unj3+xKi+nZXxA+gJhCJlICkiKuGa4H+zI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cYzDeIHyD6KmawbmMJK1IgG3i70KW8ifoWTZNedcWl5jbXk2r4mg4/420bDE+sPpU
	 BdE8oCeKWfSTLnzDFpTQ4Pv0lmMmXOCzzxZ7JX0/4jlWSPQ2Q61ifXcbroJYqwA0wq
	 izhUGehQapmwtlX3gNRYvhNU2Nvg0nGMWGCC3exJKUnWyquSDgC3B15/XEaTni08p7
	 tNS9+2WK4jQZw4wYbFgBxOywWvqoIG5fp1ioOnRrsbX/nv/ZFBzTkL29ycz2Zy7Yha
	 3Zyc1wvpQ/4pnyUMmxJDKkXbQ4QYqKZhenDcPhMDG2qVQ8fB9gwn3ewfuVydn9xhWX
	 UACYD8lsgl+/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C85964C8B6;
	Tue, 24 Nov 2026 04:41:24 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 23 Nov 2026 23:41:25 -0500
Subject: [PATCH v5 5/6] clk: siflower: Add SF19A2890 peripheral clock
 driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-sf19a2890-sysm-v5-5-4ba44a0db17d@telaak.dev>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
In-Reply-To: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Chuanhong Guo <gch981213@gmail.com>, 
 Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495283; l=12936;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=zmcQCpj/KiTwJ+ABF5tyEjCzeZlBkh1P9Ob4cFI4Fs0=;
 b=DP4zwnoNqRfNkaipux2uuO0NlODRE0Ht+YdMR51NJ/52jTaa62yOSK1D94qRBK8gCpkMuwhmE
 Dbe5hIe8zlQADLLKIQWXABdqHmcbvvCtyR5J6Z533xvx6WiAu2o96JQ
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

Each peripheral block of the Siflower SF19A2890 has a clock and reset
manager with the block's clock gates, its resets and a bus output enable
that the block needs to answer bus requests. Add a driver for the clock
gates. It turns the bus output on with the first gate and off with the
last, and leaves the resets to a reset driver, through an auxiliary
device.

Based on the driver in Chuanhong Guo's SF19A2890 branch, which handled
the resets too and described each block's bits with properties.

Link: https://github.com/981213/linux/commit/37c81bebaf54
Co-developed-by: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                                    |   1 +
 drivers/clk/siflower/Kconfig                   |  12 +
 drivers/clk/siflower/Makefile                  |   1 +
 drivers/clk/siflower/clk-sf19a2890-periphcrm.c | 306 +++++++++++++++++++++++++
 4 files changed, 320 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47a3a72a5d08..34ff7ec0b60e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25704,6 +25704,7 @@ L:	linux-clk@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
 F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
+F:	drivers/clk/siflower/clk-sf19a2890-periphcrm.c
 F:	drivers/clk/siflower/clk-sf19a2890.c
 F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
 F:	include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfig
index ad1b04b4bb9b..fa09bca275b4 100644
--- a/drivers/clk/siflower/Kconfig
+++ b/drivers/clk/siflower/Kconfig
@@ -9,3 +9,15 @@ config CLK_SF19A2890
 	  and the muxes and dividers that feed the CPU, the buses and the
 	  peripherals. The GIC timer runs from the CPU clock, so a kernel
 	  for this SoC needs it built in.
+
+config CLK_SF19A2890_PERIPHCRM
+	bool "Clock driver for Siflower SF19A2890 peripherals"
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
+	default MACH_SIFLOWER_MIPS
+	select AUXILIARY_BUS
+	select RESET_CONTROLLER
+	help
+	  Supports the clocks of the peripheral clock and reset managers of
+	  the Siflower SF19A2890. Each peripheral block has one, with its
+	  clock gates, its resets and the bus output enable it needs to
+	  answer bus requests. The resets have a driver of their own.
diff --git a/drivers/clk/siflower/Makefile b/drivers/clk/siflower/Makefile
index 3f4d689f7d9b..c4f4e0b8820d 100644
--- a/drivers/clk/siflower/Makefile
+++ b/drivers/clk/siflower/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CLK_SF19A2890) += clk-sf19a2890.o
+obj-$(CONFIG_CLK_SF19A2890_PERIPHCRM) += clk-sf19a2890-periphcrm.o
diff --git a/drivers/clk/siflower/clk-sf19a2890-periphcrm.c b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
new file mode 100644
index 000000000000..95b3c6927067
--- /dev/null
+++ b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Siflower SF19A2890 peripheral clock and reset manager driver.
+ *
+ * Each managed block has three registers:
+ *   RESET    at base + 0x0  - per-peripheral reset bitmasks
+ *   CLK_GATE at base + 0x4  - one bit per clock gate
+ *   BOE      at base + 0xc  - shared Bus Output Enable; bits [1:0] must be set
+ *                             for any APB peripheral in the block to respond
+ *
+ * The resets are left to the reset driver, through an auxiliary device.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/device-id/of.h>
+#include <linux/idr.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/siflower,sf19a2890-periph-crm.h>
+
+#define REG_CLK_GATE	0x4
+#define REG_BOE		0xc
+#define BOE_EN		GENMASK(1, 0)
+
+struct sf19a2890_periphcrm_gate {
+	const char *name;
+	u8 bit;
+	unsigned long flags;
+};
+
+struct sf19a2890_periphcrm_data {
+	const struct sf19a2890_periphcrm_gate *gates;
+	unsigned int num_gates;
+};
+
+struct sf19a2890_periphcrm {
+	void __iomem *base;
+	spinlock_t lock;	/* serializes gate and BOE updates */
+	struct clk_hw_onecell_data clk_data;
+};
+
+struct sf19a2890_periphclk {
+	struct sf19a2890_periphcrm *crm;
+	struct clk_hw hw;
+	u32 idx;
+};
+
+static inline struct sf19a2890_periphclk *hw_to_periphclk(struct clk_hw *hw)
+{
+	return container_of(hw, struct sf19a2890_periphclk, hw);
+}
+
+static int sf19a2890_periphclk_enable(struct clk_hw *hw)
+{
+	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
+	struct sf19a2890_periphcrm *crm = gate->crm;
+	u32 reg;
+
+	guard(spinlock_irqsave)(&crm->lock);
+	reg = readl(crm->base + REG_CLK_GATE);
+	writel(reg | BIT(gate->idx), crm->base + REG_CLK_GATE);
+	writel(BOE_EN, crm->base + REG_BOE);
+	return 0;
+}
+
+static void sf19a2890_periphclk_disable(struct clk_hw *hw)
+{
+	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
+	struct sf19a2890_periphcrm *crm = gate->crm;
+	u32 reg;
+
+	guard(spinlock_irqsave)(&crm->lock);
+	reg = readl(crm->base + REG_CLK_GATE);
+	reg &= ~BIT(gate->idx);
+	writel(reg, crm->base + REG_CLK_GATE);
+	if (reg == 0)
+		writel(0, crm->base + REG_BOE);
+}
+
+static int sf19a2890_periphclk_is_enabled(struct clk_hw *hw)
+{
+	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
+	struct sf19a2890_periphcrm *crm = gate->crm;
+
+	return !!(readl(crm->base + REG_CLK_GATE) & BIT(gate->idx));
+}
+
+static const struct clk_ops sf19a2890_periphclk_ops = {
+	.enable = sf19a2890_periphclk_enable,
+	.disable = sf19a2890_periphclk_disable,
+	.is_enabled = sf19a2890_periphclk_is_enabled,
+};
+
+#define GATE(_name, _bit, _flags) { .name = _name, .bit = _bit, .flags = _flags }
+
+#define CRM_DATA(_g)							\
+	{								\
+		.gates = sf19a2890_##_g##_gates,			\
+		.num_gates = ARRAY_SIZE(sf19a2890_##_g##_gates),	\
+	}
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_gmac_gates[] = {
+	[CLK_GMAC_BUS] = GATE("gmac", 0, 0),
+	[CLK_GMAC_REG] = GATE("gmac_pclk", 1, 0),
+	[CLK_GMAC_TX_REF] = GATE("gmac_byp_ref", 2, 0),
+	[CLK_GMAC_TSU] = GATE("ethtsu", 3, 0),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_gmac_crm =
+	CRM_DATA(gmac);
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_wlan24_gates[] = {
+	[CLK_WLAN24_AXIS] = GATE("wlan24_axis", 0, 0),
+	[CLK_WLAN24_AXIM] = GATE("wlan24_axim", 1, 0),
+	[CLK_WLAN24_PLF] = GATE("wlan24_plf", 2, 0),
+};
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_wlan5_gates[] = {
+	[CLK_WLAN5_AXIS] = GATE("wlan5_axis", 0, 0),
+	[CLK_WLAN5_AXIM] = GATE("wlan5_axim", 1, 0),
+	[CLK_WLAN5_PLF] = GATE("wlan5_plf", 2, 0),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_wlan24_crm =
+	CRM_DATA(wlan24);
+
+static const struct sf19a2890_periphcrm_data sf19a2890_wlan5_crm =
+	CRM_DATA(wlan5);
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_rf_gates[] = {
+	[CLK_RF_TEST] = GATE("rf_dft", 0, 0),
+	[CLK_RF_AXIS] = GATE("rf_axis", 1, 0),
+	[CLK_RF_BOOT] = GATE("rf_boot", 2, 0),
+	[CLK_RF_LP] = GATE("rf_lp", 3, 0),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_rf_crm =
+	CRM_DATA(rf);
+
+/* Nothing describes a consumer of usb_axim, and gating it is not safe */
+static const struct sf19a2890_periphcrm_gate sf19a2890_usb_gates[] = {
+	[CLK_USB] = GATE("usb", 0, 0),
+	[CLK_USB_AXIM] = GATE("usb_axim", 2, CLK_IS_CRITICAL),
+	[CLK_USB_PHY_REF] = GATE("usbphy_ref", 3, 0),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_usb_crm =
+	CRM_DATA(usb);
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_spi_gates[] = {
+	[CLK_SPI_APB] = GATE("spi_apb", 4, 0),
+	[CLK_SPI_SSP] = GATE("spi_ssp", 5, 0),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_spi_crm =
+	CRM_DATA(spi);
+
+/* UART0 carries the console from the bootloader on */
+static const struct sf19a2890_periphcrm_gate sf19a2890_uart_gates[] = {
+	[CLK_UART0_APB] = GATE("uart0_apb", 0, CLK_IS_CRITICAL),
+	[CLK_UART1_APB] = GATE("uart1_apb", 1, 0),
+	[CLK_UART2_APB] = GATE("uart2_apb", 2, 0),
+	[CLK_UART0] = GATE("uart0", 4, CLK_IS_CRITICAL),
+	[CLK_UART1] = GATE("uart1", 5, 0),
+	[CLK_UART2] = GATE("uart2", 6, 0),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_uart_crm =
+	CRM_DATA(uart);
+
+#define SINGLE_CRM(_name)						\
+	static const struct sf19a2890_periphcrm_gate sf19a2890_##_name##_gates[] = { \
+		GATE(#_name, 0, 0),					\
+	};								\
+	static const struct sf19a2890_periphcrm_data sf19a2890_##_name##_crm = \
+		CRM_DATA(_name)
+
+SINGLE_CRM(i2c0);
+SINGLE_CRM(pwm);
+SINGLE_CRM(timer);
+SINGLE_CRM(wdt);
+SINGLE_CRM(gpio);
+
+static DEFINE_IDA(sf19a2890_periphcrm_ida);
+
+static void sf19a2890_periphcrm_ida_free(void *data)
+{
+	ida_free(&sf19a2890_periphcrm_ida, (uintptr_t)data);
+}
+
+static int sf19a2890_periphcrm_probe(struct platform_device *pdev)
+{
+	const struct sf19a2890_periphcrm_data *data;
+	struct auxiliary_device *adev;
+	struct device *dev = &pdev->dev;
+	struct sf19a2890_periphclk *gates;
+	struct sf19a2890_periphcrm *crm;
+	u32 valid_gates = 0;
+	unsigned int i;
+	int ret, id;
+	u32 reg;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	crm = devm_kzalloc(dev, struct_size(crm, clk_data.hws, data->num_gates),
+			   GFP_KERNEL);
+	if (!crm)
+		return -ENOMEM;
+
+	crm->clk_data.num = data->num_gates;
+
+	gates = devm_kcalloc(dev, data->num_gates, sizeof(*gates), GFP_KERNEL);
+	if (!gates)
+		return -ENOMEM;
+
+	crm->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(crm->base))
+		return PTR_ERR(crm->base);
+
+	spin_lock_init(&crm->lock);
+
+	/*
+	 * Clear any stale bits outside the block's gates so the BOE-disable
+	 * check in periphclk_disable() works correctly.
+	 */
+	for (i = 0; i < data->num_gates; i++)
+		valid_gates |= BIT(data->gates[i].bit);
+	reg = readl(crm->base + REG_CLK_GATE) & valid_gates;
+	writel(reg, crm->base + REG_CLK_GATE);
+
+	for (i = 0; i < data->num_gates; i++) {
+		const struct clk_parent_data parent = { .index = i };
+		struct clk_init_data init = {
+			.name = data->gates[i].name,
+			.ops = &sf19a2890_periphclk_ops,
+			.parent_data = &parent,
+			.num_parents = 1,
+			.flags = data->gates[i].flags,
+		};
+
+		gates[i].crm = crm;
+		gates[i].idx = data->gates[i].bit;
+		gates[i].hw.init = &init;
+
+		ret = devm_clk_hw_register(dev, &gates[i].hw);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to register gate %u\n", i);
+
+		crm->clk_data.hws[i] = &gates[i].hw;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  &crm->clk_data);
+	if (ret)
+		return ret;
+
+	/* Each block gets a reset device of its own, so they need distinct IDs */
+	id = ida_alloc(&sf19a2890_periphcrm_ida, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	ret = devm_add_action_or_reset(dev, sf19a2890_periphcrm_ida_free,
+				       (void *)(uintptr_t)id);
+	if (ret)
+		return ret;
+
+	adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "reset",
+					      (void __force *)crm->base, id);
+	if (!adev)
+		return dev_err_probe(dev, -ENODEV, "failed to create the reset device\n");
+
+	return 0;
+}
+
+static const struct of_device_id sf19a2890_periphcrm_dt_ids[] = {
+	{ .compatible = "siflower,sf19a2890-gmac-crm", .data = &sf19a2890_gmac_crm },
+	{ .compatible = "siflower,sf19a2890-gpio-crm", .data = &sf19a2890_gpio_crm },
+	{ .compatible = "siflower,sf19a2890-i2c-crm", .data = &sf19a2890_i2c0_crm },
+	{ .compatible = "siflower,sf19a2890-pwm-crm", .data = &sf19a2890_pwm_crm },
+	{ .compatible = "siflower,sf19a2890-rf-crm", .data = &sf19a2890_rf_crm },
+	{ .compatible = "siflower,sf19a2890-spi-crm", .data = &sf19a2890_spi_crm },
+	{ .compatible = "siflower,sf19a2890-timer-crm", .data = &sf19a2890_timer_crm },
+	{ .compatible = "siflower,sf19a2890-uart-crm", .data = &sf19a2890_uart_crm },
+	{ .compatible = "siflower,sf19a2890-usb-crm", .data = &sf19a2890_usb_crm },
+	{ .compatible = "siflower,sf19a2890-wdt-crm", .data = &sf19a2890_wdt_crm },
+	{ .compatible = "siflower,sf19a2890-wlan24-crm", .data = &sf19a2890_wlan24_crm },
+	{ .compatible = "siflower,sf19a2890-wlan5-crm", .data = &sf19a2890_wlan5_crm },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver sf19a2890_periphcrm_driver = {
+	.probe	= sf19a2890_periphcrm_probe,
+	.driver = {
+		.name		= "sf19a2890-periph-crm",
+		.of_match_table	= sf19a2890_periphcrm_dt_ids,
+	},
+};
+builtin_platform_driver(sf19a2890_periphcrm_driver);

-- 
Git-155)


