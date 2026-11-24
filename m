Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795495306;
	b=a+M45mtqq7KrQtez0VLlvRvGISRBENC8g4MnE1ZIpx6F5Fal2fSuPLgUZGY1p3Zn3E0V
	 zM5pxOWZIsdK7M27gYnX+dvj4UjxfRtwjC1RKm6eqgmDf8yH7qRo8AtwnwWbANFAAKAe7
	 xjhMPqap/5HRSz8rXXidAk46AGCli6NchPrWRRjX8e6MiL4Ijf9JuvFasmigco6b2SEaK
	 p9qASJmRlBbHBGemk7GKBMI/8n0RNmYZlrzyf1RnuKNpxu3fiuu9S4P5c2TUXcjZK12om
	 jL5KKi0TQSTIzWOU8obIH4Bd5OMIIcfNE5paROcyaqYNaYA2ZuOCd6wzO0hzmYUSuvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495306;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4flAGIIvXXpEDeF9TOGEI8o2mMQ9LPgzBZ9V1HSUwz8=;
	b=RJupaSGeczq0Wv63F4XPIFgzQsw/I97B1t0YDxe94vPuoHPi6AOndYlNK7mC3sspxs1C
	 6mFwQuOXN+Ig6qob8XQdugFAx0SbmLq6+2WWRRNtWqmGthLgaUcEmVBBoO3OgkBphEC2g
	 JQWMNeBH9beMgbwqfLcoz//Tvq2JKzu9/Lfd5iTcRaz6artrmJYyNjIF08fQ5WAhkT35k
	 xarL/87lORPWkHjaqhTcS046UQ4AaqV1XHoEPiCudAOU79y53XfrHC/OYensDHFUeSMoH
	 ueaEvFSXiIpdhB8MxckIhfFv/TseZGcefWj6d7xbyujg4IQuDyO0D7gswWLrE9bpJmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HI0oWbZ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856B9606A327;
	Tue, 24 Nov 2026 04:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HI0oWbZ0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495306;
	b=3qJvo23YeNa4mP6m6AsYaoHqn+4RelUGH6Ubr+u5S5MsMjtZ+IgOJSbBCLPYZaoaHvsk
	 b7TSa8iP5nA/Dp6EWLEkXR2Hd4OpQNLlZbPibEPDK7jr5JeRO/21vg12g8/273KpjGj0E
	 2u7J6WY59yfHDZ+92QS/AOthhMX9NVbYadZS10CinGCKz89zM3skX+YomHtSIIJnWhV1Q
	 jmdvOxhm9GO438JqXWw/6hTVSxnRhqfSHIW7xJxopPkHa9m0PsZMGk75wdLoAhqwGyzqg
	 EiDY3MkwGHiz1tj6eDTdXe7NEZiCZ73oJuii+Bduwz7Lg76fwFiSHHpXwdbecFx7WHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495306;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4flAGIIvXXpEDeF9TOGEI8o2mMQ9LPgzBZ9V1HSUwz8=;
	b=wR9CeqO2Bsg5p2Pc8jsDg/wOt4L2l/GthlP76s32ggRtlHa6uD8eL/rspFQ/g09dh+nO
	 T3vCVavBTGZpGEZn7I5ffDAvwt/B+HFzkmjX9D3q+xNLpD3yepu40qG6ezH+cRXcEWMbp
	 536uHS2YOJ8FkSQeX1DvaFlFD+3BRNF5pDenXsFi2GfGfRGMTA/5cPLv303d2LTKmEztX
	 GCs7bvlFn5gk0hQVEiWW62uLOKkRvYM3GlgN2Umh1NcZ9Q+hcGIljWpGo0AWKHYxRHbcF
	 aVkSricVZvZE7QQFgoyVgbVZqH/LJUTDqXsDSlEsWyZjAQKAJZedgLqL6+Z5kqGwhRw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5546A1F000E0;
	Tue, 24 Nov 2026 04:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495306;
	bh=4flAGIIvXXpEDeF9TOGEI8o2mMQ9LPgzBZ9V1HSUwz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HI0oWbZ0GUh8kAM9QDPb00FwxhlPxmC3LYpbD02RhNk/QbAk8a68RXOm2hHumByHM
	 KxLcus4gLl7VRfGzh11r3TVuZMLWcZSUEdZgo4eBAcz4eEHXOhYQjSFD+XPldUh1v4
	 bHURCDiyMlj12RPKiC1yiKSeIamv5wiyFHYlPkN2gjNZ0YXwM1q9AdXli0J7x8pI6V
	 23wJNCrCI2gXflcgEHnp1LFt69CDuXhlSqxhjX4IpAxaCUvRThz1YAjWqCYV31wLpz
	 nQ8kG5eENrL57WZZs+czNqwFjvypP/ue0iIeu/fXf95QlTSM12ctyHDswrmAMX3GHB
	 lgYParmwT1Dxw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E4DB04C8BA;
	Tue, 24 Nov 2026 04:41:24 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 23 Nov 2026 23:41:26 -0500
Subject: [PATCH v5 6/6] reset: Add Siflower SF19A2890 peripheral reset
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
Message-Id: <20261123-sf19a2890-sysm-v5-6-4ba44a0db17d@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495283; l=9809;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=tH3G7I3tf7pzBkrIwalM9DcMheb+KjROQWqrMyyrX4M=;
 b=eHNqvau0CxnnsVRw52bxecO5TEsrWbScseUOxy9c4wXYm6gS9nu9JjuaNbbOjFVzvx45tiy7+
 Gbe90jWrHLKCc0ixvXZ3rLHF7GBf58MLxxoM680tVvb0L1MD65dhAI/
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
 drivers/reset/Kconfig                     |  11 ++
 drivers/reset/Makefile                    |   1 +
 drivers/reset/reset-sf19a2890-periphcrm.c | 194 ++++++++++++++++++++++++++++++
 4 files changed, 207 insertions(+)

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
index eda9c698a95f..6e2f6cceb3cb 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -295,6 +295,17 @@ config RESET_SCMI
 	  This driver uses SCMI Message Protocol to interact with the
 	  firmware controlling all the reset signals.
 
+config RESET_SF19A2890_PERIPHCRM
+	tristate "Siflower SF19A2890 peripheral reset controller"
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
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
index 000000000000..54b476237bd4
--- /dev/null
+++ b/drivers/reset/reset-sf19a2890-periphcrm.c
@@ -0,0 +1,194 @@
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
+/*
+ * A reset that covers several bits drives the reset lines of all the clock
+ * domains of one IP, which have to be asserted together.
+ */
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
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
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


