Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764807;
	b=rlBeF/JOQBOVfAoCRmIav7Y8jxHCwysJONu8SiNKqDiTgznyb5cYMidJlrdAyZejvAm8
	 qpb/ZOPdwY1jmuYcVUxmmtmkAqVXIPMNRbigRHVdg07qxcTEqk4jtI4fx0PmjMXJQrqvT
	 M7oOdHbL2JsQIRK+RrwuLiQR2dtAZpb1VnIxSdTu3TixOcsYuQ16kE8veEvmbEj9lUg4c
	 wDIv0vWdMlURrRapVAP2DPiuWXeKZ8yDnNONsXeCqaZIUqb0GSKvqHL9KLOJk7POjxc5B
	 EY/FDVDhBfsuZoaDwovizMS8iBbLOWRmvmxX64Sf/w8UpWa/cq/wal0zKMAXA+ABwAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764807;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1qwbWnvKEU7/ZSqFLUBI0N+EyQGa8+xJ5qlfr0krybI=;
	b=L9TPXU1dTInXqEBYme6Z9JVGhyEVS+lGs8s8pLfgIakf+TtUFjTNNDETe2BHpaeQRjj5
	 il2kULIs1tHTPYOyFHvt750ZJf1eCoowkLGsB11tSIItzmkPEYmTwn+8RsffRC1f2taxE
	 bK06LMs5KQWoHUTF3Faqen97SG+7WyP5S3BHeMXlWaLKD58YEjuB2jzj35V1e4Qf9LtX1
	 60oSim2XlHEb7ldsqpzy8PlNPXJA4xYWQl73SScg1J6k5DzaUTnkR/KGuZxpq4HCxGnlS
	 ynJnl6JwLU3tzcOyUWZjg7KF9LhDOgQcrbonB1pqiZWvliLU+rynxdkDA9uVg9ggpvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=EL3iYBZ3;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C86C606A327;
	Fri, 27 Nov 2026 07:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C86C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=EL3iYBZ3
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 7AB4F4C962;
	Fri, 27 Nov 2026 18:33:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qwbWnvKEU7/ZSqFLUBI0N+EyQGa8+xJ5qlfr0krybI=;
	b=EL3iYBZ3dx//8zLwQlpCHu0GTMDsJYJiFyT6g6GOiRzJS20rsxfggkIW158c4DUzPZYFj4
	TL6QsgSn58PE0+JilNAgWLIeKy44D8RiXLvubC/hbwpaFW0KGBgmmQAwL5cPGZ4ZjOCoSC
	0nFLYHOhgIjuXxUmyMY9DgF2Q4CY/NPPCiRwTf/Mb8jNmiERDDsFPRUGwIONqjmVe0tJUz
	246ksmFcxD9VwO7oZeSS4H46ENRh+PG4njn2gzdS6FhW5FPQVYrRHmLSpIBd6qE7+RBVug
	VH1K9d5XquqCwaPh5i+WAAxHJ0qI7+FXGIS9eZsM1Ux78bTuM/soNBhKa4ZbOQ==
X-GPT-Reason: legitimate; the email is a technical patch submission
	for a Linux kernel/hardware driver (Allwinner A733 USB 2.0 PHY),
	which aligns perfectly with the personal/business identity of
	the recipient (alastair@d-silva.org); the "From" domain (d-silva.org)
	matches the recipient domain exactly, establishing a clear personal
	or professional relationship; there are no phishing indicators,
	no suspicious links, no urgency, and the content is highly specific
	and non-commercial.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY driver
Date: Fri, 27 Nov 2026 18:32:26 +1100
Message-ID: <20261127073231.1776847-7-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB 2.0 PHY driver for the Allwinner A733 DWC3 controller.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/phy/allwinner/Kconfig            |  12 ++
 drivers/phy/allwinner/Makefile           |   1 +
 drivers/phy/allwinner/phy-sun60i-u2phy.c | 233 +++++++++++++++++++++++
 3 files changed, 246 insertions(+)
 create mode 100644 drivers/phy/allwinner/phy-sun60i-u2phy.c

diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfig
index 7518c4b5c379..f8dc4931378b 100644
--- a/drivers/phy/allwinner/Kconfig
+++ b/drivers/phy/allwinner/Kconfig
@@ -68,3 +68,15 @@ config PHY_SUN60I_COMBOPHY
 	help
 	  Enable this to support the SerDes ComboPHY controller on
 	  Allwinner A733 SoCs.
+
+config PHY_SUN60I_U2PHY
+	tristate "Allwinner A733 USB 2.0 PHY driver"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on HAS_IOMEM && COMMON_CLK && OF
+	depends on RESET_CONTROLLER
+	select GENERIC_PHY
+	help
+	  Enable this to support the USB 2.0 PHY paired with the DWC3
+	  controller on Allwinner A733 SoCs. This driver handles UTMI
+	  PHY initialization, tuning, and host/device mode switching.
+	  If unsure, say N.
diff --git a/drivers/phy/allwinner/Makefile b/drivers/phy/allwinner/Makefile
index 483e9053bb5f..22793d59c4cd 100644
--- a/drivers/phy/allwinner/Makefile
+++ b/drivers/phy/allwinner/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_SUN6I_MIPI_DPHY)	+= phy-sun6i-mipi-dphy.o
 obj-$(CONFIG_PHY_SUN9I_USB)		+= phy-sun9i-usb.o
 obj-$(CONFIG_PHY_SUN50I_USB3)		+= phy-sun50i-usb3.o
 obj-$(CONFIG_PHY_SUN60I_COMBOPHY)	+= phy-sun60i-combophy.o
+obj-$(CONFIG_PHY_SUN60I_U2PHY)		+= phy-sun60i-u2phy.o
diff --git a/drivers/phy/allwinner/phy-sun60i-u2phy.c b/drivers/phy/allwinner/phy-sun60i-u2phy.c
new file mode 100644
index 000000000000..7788fe55ee56
--- /dev/null
+++ b/drivers/phy/allwinner/phy-sun60i-u2phy.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner A733 USB 2.0 PHY driver
+ *
+ * Copyright (C) 2026 Alastair D'Silva <alastair@d-silva.org>
+ */
+
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#define PHY_USB2_ISCR			0x00
+#define   FORCE_ID_MASK			GENMASK(15, 14)
+#define   FORCE_ID_HOST			BIT(15)
+#define   FORCE_ID_DEVICE		GENMASK(15, 14)
+#define   FORCE_VBUS_VALID_MASK		GENMASK(13, 12)
+#define   FORCE_VBUS_VALID_HIGH		GENMASK(13, 12)
+
+#define PHY_USB2_PHYCTL			0x10
+#define   OTGDISABLE			BIT(10)
+#define   VBUSVLDEXT			BIT(5)
+#define   SIDDQ				BIT(3)
+
+#define PHY_USB2_PHYTUNE		0x18
+/* Vendor BSP default USB2 PHY tuning value for A733. */
+#define   PHYTUNE_A733_DEFAULT		0x143338d6
+
+struct sun60i_u2phy {
+	void __iomem *base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct reset_control *reset;
+	struct mutex lock; /* protects mode and initialized state */
+	enum phy_mode mode;
+	bool initialized;
+};
+
+static const char * const sun60i_u2phy_clks[] = {
+	"bus",
+	"ahb",
+};
+
+static void sun60i_u2phy_apply_mode(struct sun60i_u2phy *u2phy)
+{
+	u32 val;
+
+	val = readl(u2phy->base + PHY_USB2_ISCR);
+	val &= ~(FORCE_ID_MASK | FORCE_VBUS_VALID_MASK);
+
+	switch (u2phy->mode) {
+	case PHY_MODE_USB_HOST:
+		val |= FORCE_ID_HOST | FORCE_VBUS_VALID_HIGH;
+		break;
+	case PHY_MODE_USB_DEVICE:
+		val |= FORCE_ID_DEVICE | FORCE_VBUS_VALID_HIGH;
+		break;
+	case PHY_MODE_USB_OTG:
+	default:
+		break;
+	}
+
+	writel(val, u2phy->base + PHY_USB2_ISCR);
+}
+
+static int sun60i_u2phy_init(struct phy *phy)
+{
+	struct sun60i_u2phy *u2phy = phy_get_drvdata(phy);
+	u32 val;
+	int ret;
+
+	guard(mutex)(&u2phy->lock);
+
+	ret = reset_control_deassert(u2phy->reset);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(u2phy->num_clks, u2phy->clks);
+	if (ret) {
+		reset_control_assert(u2phy->reset);
+		return ret;
+	}
+
+	sun60i_u2phy_apply_mode(u2phy);
+
+	val = readl(u2phy->base + PHY_USB2_PHYCTL);
+	val |= OTGDISABLE | VBUSVLDEXT;
+	val &= ~SIDDQ;
+	writel(val, u2phy->base + PHY_USB2_PHYCTL);
+
+	writel(PHYTUNE_A733_DEFAULT, u2phy->base + PHY_USB2_PHYTUNE);
+	u2phy->initialized = true;
+
+	return 0;
+}
+
+static int sun60i_u2phy_exit(struct phy *phy)
+{
+	struct sun60i_u2phy *u2phy = phy_get_drvdata(phy);
+	u32 val;
+
+	guard(mutex)(&u2phy->lock);
+
+	u2phy->initialized = false;
+
+	val = readl(u2phy->base + PHY_USB2_PHYCTL);
+	val &= ~(OTGDISABLE | VBUSVLDEXT);
+	val |= SIDDQ;
+	writel(val, u2phy->base + PHY_USB2_PHYCTL);
+
+	val = readl(u2phy->base + PHY_USB2_ISCR);
+	val &= ~(FORCE_ID_MASK | FORCE_VBUS_VALID_MASK);
+	writel(val, u2phy->base + PHY_USB2_ISCR);
+
+	clk_bulk_disable_unprepare(u2phy->num_clks, u2phy->clks);
+	return reset_control_assert(u2phy->reset);
+}
+
+static int sun60i_u2phy_set_mode(struct phy *phy, enum phy_mode mode,
+				 int submode)
+{
+	struct sun60i_u2phy *u2phy = phy_get_drvdata(phy);
+
+	guard(mutex)(&u2phy->lock);
+
+	switch (mode) {
+	case PHY_MODE_USB_HOST:
+	case PHY_MODE_USB_HOST_LS:
+	case PHY_MODE_USB_HOST_FS:
+	case PHY_MODE_USB_HOST_HS:
+	case PHY_MODE_USB_HOST_SS:
+		u2phy->mode = PHY_MODE_USB_HOST;
+		break;
+	case PHY_MODE_USB_DEVICE:
+	case PHY_MODE_USB_DEVICE_LS:
+	case PHY_MODE_USB_DEVICE_FS:
+	case PHY_MODE_USB_DEVICE_HS:
+	case PHY_MODE_USB_DEVICE_SS:
+		u2phy->mode = PHY_MODE_USB_DEVICE;
+		break;
+	case PHY_MODE_USB_OTG:
+		u2phy->mode = PHY_MODE_USB_OTG;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (u2phy->initialized)
+		sun60i_u2phy_apply_mode(u2phy);
+
+	return 0;
+}
+
+static const struct phy_ops sun60i_u2phy_ops = {
+	.init = sun60i_u2phy_init,
+	.exit = sun60i_u2phy_exit,
+	.set_mode = sun60i_u2phy_set_mode,
+	.owner = THIS_MODULE,
+};
+
+static int sun60i_u2phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sun60i_u2phy *u2phy;
+	struct phy_provider *phy_provider;
+	struct phy *phy;
+	int i, ret;
+
+	u2phy = devm_kzalloc(dev, sizeof(*u2phy), GFP_KERNEL);
+	if (!u2phy)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &u2phy->lock);
+	if (ret)
+		return ret;
+	u2phy->mode = PHY_MODE_USB_HOST;
+	u2phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(u2phy->base))
+		return PTR_ERR(u2phy->base);
+
+	u2phy->num_clks = ARRAY_SIZE(sun60i_u2phy_clks);
+	u2phy->clks = devm_kcalloc(dev, u2phy->num_clks, sizeof(*u2phy->clks),
+				   GFP_KERNEL);
+	if (!u2phy->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < u2phy->num_clks; i++)
+		u2phy->clks[i].id = sun60i_u2phy_clks[i];
+
+	ret = devm_clk_bulk_get(dev, u2phy->num_clks, u2phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+
+	u2phy->reset = devm_reset_control_get_shared(dev, NULL);
+	if (IS_ERR(u2phy->reset))
+		return dev_err_probe(dev, PTR_ERR(u2phy->reset),
+				     "failed to get reset\n");
+
+	phy = devm_phy_create(dev, NULL, &sun60i_u2phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(phy, u2phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id sun60i_u2phy_of_match[] = {
+	{ .compatible = "allwinner,sun60i-a733-u2phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sun60i_u2phy_of_match);
+
+static struct platform_driver sun60i_u2phy_driver = {
+	.probe = sun60i_u2phy_probe,
+	.driver = {
+		.name = "sun60i-u2phy",
+		.of_match_table = sun60i_u2phy_of_match,
+	},
+};
+module_platform_driver(sun60i_u2phy_driver);
+
+MODULE_DESCRIPTION("Allwinner A733 USB 2.0 PHY driver");
+MODULE_AUTHOR("Alastair D'Silva <alastair@d-silva.org>");
+MODULE_LICENSE("GPL");
-- 
2.53.0

