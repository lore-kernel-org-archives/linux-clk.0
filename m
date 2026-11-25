Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638327;
	b=uWNmC6ZNUr1OChu1juWIRfCWrfaV2hD3FRHYcdvNTjsE1WQ3yC7dgs27cJfA5k2pl3Uk
	 DL20R5xlrLmnEz2jZV/ovng2fAwGIc3FMKE5YxEh5gSFZaw8zmj9j3bbvD7CiGDXtE5Hs
	 axHiCyVI5mB0P60r4HU6ptfBk1x8kiNtW4hazy6Lm5971ahnxpBzY4Us8yoDoV/UgWu71
	 ZBjCH20nhZYd1aKw5g87CzUD7aQvHfz6JG/6vJ7cOrC8aagt0m1KHMOkLZAEprVZ+nXAY
	 vhk5Yya4GtIyUpYBSbtH7G29tR8HcqVlDOBZQdeDAGc9EybJRxZ8QO0FcYGEqakZ5iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638327;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mjvmaImFB+1XxEwcSJFzMYM546bN/yyEMMwuHcQOY1E=;
	b=R+RP6mEAUYA55DzcYloJWsndxXniHH/iNlvoLLSevJqe1fJK4y1OZy3cQK2geHjlFLVG
	 NpnzIQ/TEjinw+1Ul3xK2nLcDzW3rbSjp9/S8lUlfMgVjaO0YsLLkg4QVgwp37Bz1SLpQ
	 GAePCha257ItHaslps2yBURpEXl4Tn6QdkrnSunRwVPjzO2LvvwnYS29/ZzDhLoBxaFOp
	 tOKc6+yh7KskCp9ZqrnkKHljulHzTOu5YCoPN/xMhBlkylW113JJ2DmMEnWbprILH8mvB
	 wi0sFS0qjvE23M/Lz8xNKoAwYj3/iZZeg4w2s9MDXbVm5KR3NTUdRrk4jDGmTqVLcBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CY4/B4UC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B58606A683;
	Wed, 25 Nov 2026 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CY4/B4UC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795638327;
	b=bYqqZfkkaoKRih6IMTV+5Ne+8jNOQVJAgVszUt0og+DQYMnfQq3Umao17y+gbIwPcSD+
	 RbI4OeP3elljng8fGv/prn2mjhor26bQqZZHzFF4nT6VkUIXgo1eJZOqkSDQnSzQl3R4u
	 0nLPfi0uMx8BN9jiA3bqO2azDCQOzD5vnk+4cgUccuRNqjrXXLVy0XD9w3gVpzHPyHGdS
	 RDquLyUe1CsUnwFhOEv/GPzqcwKnoKLCDIY9gJfVpUu8TKrpyL5y7uDLzx2EDk1WsEAmO
	 pp9svg6KRTOOub3gMS+2dMDcVnkS8HOhYRyJRYxzn7a8SCeaC6tJFRmNlgODxsbq9tg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795638327;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mjvmaImFB+1XxEwcSJFzMYM546bN/yyEMMwuHcQOY1E=;
	b=bD6/jx+kvNacFoyMKU6EGWtbQdeUGJ1xuXb9dmF4EzM1WgTcuHdR4AtelLbWGzfx5he7
	 DQZUcI2xVxHhX6/3r8hxAgKKx+0L8faEYFwdpffCBICwkviFluB1teLz6KRGc2gfiW/uH
	 4BVOKWSX0ROmU6i3gMX+lqLjRnO4H0yNlacRPqpCGGQ2dP8h52ccAvk/Io5x4B2JDo+js
	 WTod6EEBssk1QhlVbqSKcIVSGxBFOL0Iu1a0LXYRIw0QCGCPBGCZVsewtjypjQxc8Zc/x
	 y75ROwlNbEVATTebmGB2HxCpOoE4K2y49gXTNzQKrf3LhQkguJuxKkygRJ3acu3hV2g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D78D1F000D4;
	Wed, 25 Nov 2026 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795638327;
	bh=mjvmaImFB+1XxEwcSJFzMYM546bN/yyEMMwuHcQOY1E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CY4/B4UCOuUHMh52U4HZ8Y2tdBDtbBPqfPkIjTU7pJUCOHexpRk/hQJNDYpyzOCX6
	 9A/l0tbovBXxAuJ3Lhbpk1YYnc/1mOQ3VY1Z1LBCPFaL0SWNnOAk3sU0NtqFqCifLX
	 yYOhE+YRrSAYXg2l4zVDRKkjrV+qyeW9AE9ajv+vxeEfYK6xS4gblmgjAD75L8fof4
	 +iNK31GKLyPBZ2itzUC+5TDFNMsDwck/pCgM8ieWCnBoDhrJDUVxj+I83qWJlyFz0j
	 uAuR7zkcTz1jSk3aZ5pNDX09GAg9+cvT7T73wfJrBR3QuBiPI67Hfl0OUuGPCLyWXZ
	 BJVCS7OIs+1jQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E2E2E4D035;
	Wed, 25 Nov 2026 20:24:55 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 25 Nov 2026 15:24:53 -0500
Subject: [PATCH v6 6/6] reset: Add Siflower SF19A2890 peripheral reset
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
Message-Id: <20261125-sf19a2890-sysm-v6-6-181875c10682@telaak.dev>
References: <20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev>
In-Reply-To: <20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795638294; l=9822;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=erSumJvPtRKGfELrVfiKPo+Ic3ADjyGrMETiodgT1qU=;
 b=qUlvUzdyDHOLQWJ+uGjBvWpd4CpunDZhcJtgA9+34BTJV84uypyIphRqWYF3plQ0+cXkMUUdn
 iCT1S8iR+XmCtXRbWPcbNhUWtNDwN5D5c/Nm1hxIbjzUrAqsPctkUgF
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

Add a driver for the resets of the Siflower SF19A2890 peripheral clock
and reset managers. It binds to the auxiliary device that their clock
driver creates and uses the registers that driver has mapped. Where an
IP has a reset line for each of its clock domains, as the PL011 UARTs
and the PL022 SPI controller do, one reset drives all of them, since
they have to be asserted together.

Based on the reset part of the driver in Chuanhong Guo's SF19A2890
branch.

Link: https://github.com/981213/linux/commit/37c81bebaf54
Co-developed-by: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                               |   1 +
 drivers/reset/Kconfig                     |  12 ++
 drivers/reset/Makefile                    |   1 +
 drivers/reset/reset-sf19a2890-periphcrm.c | 195 ++++++++++++++++++++++++++++++
 4 files changed, 209 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34ff7ec0b60e..ae47322d15dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25706,6 +25706,7 @@ F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
 F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
 F:	drivers/clk/siflower/clk-sf19a2890-periphcrm.c
 F:	drivers/clk/siflower/clk-sf19a2890.c
+F:	drivers/reset/reset-sf19a2890-periphcrm.c
 F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
 F:	include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..fe7beb2530b2 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -295,6 +295,18 @@ config RESET_SCMI
 	  This driver uses SCMI Message Protocol to interact with the
 	  firmware controlling all the reset signals.
 
+config RESET_SF19A2890_PERIPHCRM
+	tristate "Siflower SF19A2890 peripheral reset controller"
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
+	depends on OF
+	select AUXILIARY_BUS
+	default CLK_SF19A2890_PERIPHCRM
+	help
+	  Supports the resets of the peripheral clock and reset managers of
+	  the Siflower SF19A2890, one manager for each peripheral block.
+	  The driver binds to the auxiliary device that their clock driver
+	  creates, so it needs CLK_SF19A2890_PERIPHCRM to do anything.
+
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST || EXPERT
 	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || ARCH_SOPHGO || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3..d4b707505c3d 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
 obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
+obj-$(CONFIG_RESET_SF19A2890_PERIPHCRM) += reset-sf19a2890-periphcrm.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SKY1) += reset-sky1.o
 obj-$(CONFIG_RESET_SKY1_AUDSS) += reset-sky1-audss.o
diff --git a/drivers/reset/reset-sf19a2890-periphcrm.c b/drivers/reset/reset-sf19a2890-periphcrm.c
new file mode 100644
index 000000000000..17f24f773fac
--- /dev/null
+++ b/drivers/reset/reset-sf19a2890-periphcrm.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Siflower SF19A2890 peripheral reset driver
+ *
+ * The peripheral clock and reset managers keep their resets in the first
+ * register of the block. Their clock driver creates an auxiliary device for
+ * them and passes the mapped registers in its platform data.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/siflower,sf19a2890-periph-crm.h>
+
+#define REG_RESET	0x0
+
+struct sf19a2890_periphrst_data {
+	/*
+	 * A reset mask that covers several bits drives the reset lines of all
+	 * the clock domains of one IP, which have to be asserted together.
+	 */
+	const u32 *masks;
+	unsigned int num_resets;
+};
+
+struct sf19a2890_periphrst {
+	struct reset_controller_dev rcdev;
+	void __iomem *base;
+	spinlock_t lock;	/* serializes reset register updates */
+	const u32 *masks;
+};
+
+static inline struct sf19a2890_periphrst *
+rcdev_to_periphrst(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct sf19a2890_periphrst, rcdev);
+}
+
+static int sf19a2890_periphrst_update(struct reset_controller_dev *rcdev,
+				      unsigned long id, bool assert)
+{
+	struct sf19a2890_periphrst *rst = rcdev_to_periphrst(rcdev);
+	u32 reg;
+
+	guard(spinlock_irqsave)(&rst->lock);
+	reg = readl(rst->base + REG_RESET);
+	if (assert)
+		reg |= rst->masks[id];
+	else
+		reg &= ~rst->masks[id];
+	writel(reg, rst->base + REG_RESET);
+
+	return 0;
+}
+
+static int sf19a2890_periphrst_assert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	return sf19a2890_periphrst_update(rcdev, id, true);
+}
+
+static int sf19a2890_periphrst_deassert(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	return sf19a2890_periphrst_update(rcdev, id, false);
+}
+
+static int sf19a2890_periphrst_status(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	struct sf19a2890_periphrst *rst = rcdev_to_periphrst(rcdev);
+
+	return !!(readl(rst->base + REG_RESET) & rst->masks[id]);
+}
+
+static const struct reset_control_ops sf19a2890_periphrst_ops = {
+	.assert = sf19a2890_periphrst_assert,
+	.deassert = sf19a2890_periphrst_deassert,
+	.status = sf19a2890_periphrst_status,
+};
+
+#define RST_DATA(_name)							\
+	static const struct sf19a2890_periphrst_data sf19a2890_##_name##_rst = { \
+		.masks = sf19a2890_##_name##_masks,			\
+		.num_resets = ARRAY_SIZE(sf19a2890_##_name##_masks),	\
+	}
+
+static const u32 sf19a2890_single_masks[] = { BIT(0) };
+
+RST_DATA(single);
+
+/* The two sides of an asynchronous AXI bridge */
+static const u32 sf19a2890_gmac_masks[] = { [RST_GMAC] = GENMASK(1, 0) };
+
+RST_DATA(gmac);
+
+/* The AXI slave, AXI master and platform domains */
+static const u32 sf19a2890_wlan_masks[] = { GENMASK(2, 0) };
+
+RST_DATA(wlan);
+
+/* The DWC2 controller's clock domains, then the PHY's */
+static const u32 sf19a2890_usb_masks[] = {
+	[RST_USB] = GENMASK(2, 0),
+	[RST_USB_PHY_POR] = BIT(3),
+	[RST_USB_PHY] = BIT(4),
+};
+
+RST_DATA(usb);
+
+/* The PL022's PRESETn and nSSPRST */
+static const u32 sf19a2890_spi_masks[] = { [RST_SPI] = GENMASK(5, 4) };
+
+RST_DATA(spi);
+
+/* Each PL011's PRESETn and nUARTRST */
+static const u32 sf19a2890_uart_masks[] = {
+	[RST_UART0] = BIT(0) | BIT(4),
+	[RST_UART1] = BIT(1) | BIT(5),
+	[RST_UART2] = BIT(2) | BIT(6),
+};
+
+RST_DATA(uart);
+
+static const struct of_device_id sf19a2890_periphrst_ids[] = {
+	{ .compatible = "siflower,sf19a2890-gmac-crm", .data = &sf19a2890_gmac_rst },
+	{ .compatible = "siflower,sf19a2890-gpio-crm", .data = &sf19a2890_single_rst },
+	{ .compatible = "siflower,sf19a2890-i2c-crm", .data = &sf19a2890_single_rst },
+	{ .compatible = "siflower,sf19a2890-pwm-crm", .data = &sf19a2890_single_rst },
+	{ .compatible = "siflower,sf19a2890-rf-crm", .data = &sf19a2890_wlan_rst },
+	{ .compatible = "siflower,sf19a2890-spi-crm", .data = &sf19a2890_spi_rst },
+	{ .compatible = "siflower,sf19a2890-timer-crm", .data = &sf19a2890_single_rst },
+	{ .compatible = "siflower,sf19a2890-uart-crm", .data = &sf19a2890_uart_rst },
+	{ .compatible = "siflower,sf19a2890-usb-crm", .data = &sf19a2890_usb_rst },
+	{ .compatible = "siflower,sf19a2890-wdt-crm", .data = &sf19a2890_single_rst },
+	{ .compatible = "siflower,sf19a2890-wlan24-crm", .data = &sf19a2890_wlan_rst },
+	{ .compatible = "siflower,sf19a2890-wlan5-crm", .data = &sf19a2890_wlan_rst },
+	{ /* sentinel */ }
+};
+
+static int sf19a2890_periphrst_probe(struct auxiliary_device *adev,
+				     const struct auxiliary_device_id *id)
+{
+	const struct sf19a2890_periphrst_data *data;
+	struct device *dev = &adev->dev;
+	const struct of_device_id *match;
+	struct sf19a2890_periphrst *rst;
+
+	/* The OF node is the parent's, so device_get_match_data() cannot be used */
+	match = of_match_node(sf19a2890_periphrst_ids, dev->of_node);
+	if (!match)
+		return -ENODEV;
+	data = match->data;
+
+	rst = devm_kzalloc_obj(dev, *rst);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->base = (void __iomem __force *)dev_get_platdata(dev);
+	if (!rst->base)
+		return -EINVAL;
+
+	spin_lock_init(&rst->lock);
+	rst->masks = data->masks;
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.nr_resets = data->num_resets;
+	rst->rcdev.ops = &sf19a2890_periphrst_ops;
+	rst->rcdev.of_node = dev->of_node;
+	rst->rcdev.dev = dev;
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct auxiliary_device_id sf19a2890_periphrst_aux_ids[] = {
+	{ .name = "clk_sf19a2890_periphcrm.reset" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, sf19a2890_periphrst_aux_ids);
+
+static struct auxiliary_driver sf19a2890_periphrst_driver = {
+	.probe = sf19a2890_periphrst_probe,
+	.id_table = sf19a2890_periphrst_aux_ids,
+};
+module_auxiliary_driver(sf19a2890_periphrst_driver);
+
+MODULE_AUTHOR("Chuanhong Guo <gch981213@gmail.com>");
+MODULE_AUTHOR("Joseph Telaak <joseph@telaak.dev>");
+MODULE_DESCRIPTION("Siflower SF19A2890 peripheral reset driver");
+MODULE_LICENSE("GPL");

-- 
Git-155)


