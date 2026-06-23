Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023138.outbound.protection.outlook.com [52.101.127.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70352399001;
	Tue, 23 Jun 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198494; cv=fail; b=S+RAlanIG79toOM3tZtcdhvVq4uqZSIlwj0Urfwca7opCLbJKJqiTzd+NC3kH+OS4elzOGPzeFn5650mpjnojDDBmeaeWF0O6mWEPE67BWuVIBapk/8ef2qiq4TBalFBu3xqh65Dc8QfbU1zcdMiaHTw3ecupgUG8V9ao9VwG7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198494; c=relaxed/simple;
	bh=2mNCXgfYNqpjxtmbbBW4D5ZAwpbhcGfhhN6NMwvjlug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXJ23t7d3YNpdRvNMp2zHABDE9a2ktRDq+d9/InpeXvTfsqWiEthz6Ot1Xva/4foTJ840g8EocSn/OfZ4U4Wt3ywlKvvBbj5OALv036WZcGX4oBj1zSafReaYiYBWXGTWfe+p6fyJRxTg1OZvdMFOmMk3sMxjxGK1oZ6bQ6WZeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdOu31QRHTtNpuNdEATqOoCQzJj+XfMWYUXnLY7h1ICfuwwBU8q8TwJpV3dzIDXF4cluSFjf1gwxV7QbPenYxV8Ov5uQwKYzCWGtA7126aQFYHH1+vXlUBqGwzkQl53jR5FGlpSJak92WYtcvy0oXvrUhyH5o5NV8LUbso+VYuxKIdBsJ7hq8YuwL1kzjOpd4IPEZ8QyRk1uDX6oZIatYMB2eZCUEoyyfbfxYzcQDt5tIBWAnU+RVhXd2pPw5OBngnUzRZZIgXbR0MTiMj+EYtLCQl2Ty+T4hx2QoUrBaUi4C3cWolawpK8bxPSckEN+ij5zcd0n0kpS5i4JsYhVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+dvVqtpf6M71exHT5Qm0NVcoGr1p98SVXPMwoqETbA=;
 b=b2KtxRpFFKsX9GO/GnEMt75SnHgGZWzVxPf/g5Y4Vptw9xDNJt8Jst3zJxBBWaSSRyfQqohScMc2SIREdWUCfetcNgkkZG4uhLv8B7FPhVaFwEzTqX+5B4CqqiwdlfNRJaa0J7sDByWXF0imZw5N9Qz5bqCler88K3xpnoKFB9JKdfxvYJC+mJ/QPw3WqjV5888SrVgzEx0w4MQBI6TCvZaiDypsz6yWuK9NUF0xL1ZdNrpXuB6PSF5PmkhxG+59vtCfAzsNmh6rr3fm9mmP+8n1T/SlURj3XrFQJX6aXzoMEag2BrLquBNuRbsUx78231NWGk1i66ri6GfTwTL6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::21) by SE3PR06MB8384.apcprd06.prod.outlook.com
 (2603:1096:101:32a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 07:08:11 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:990:75:cafe::ac) by JH0PR01CA0168.outlook.office365.com
 (2603:1096:990:75::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 07:08:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 23 Jun 2026 07:08:10 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4AA0B40E7F9A;
	Tue, 23 Jun 2026 15:08:08 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v6 3/4] reset: cix: add sky1 audss auxiliary reset driver
Date: Tue, 23 Jun 2026 15:08:04 +0800
Message-ID: <20260623070805.211019-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260623070805.211019-1-joakim.zhang@cixtech.com>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SE3PR06MB8384:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 33f77cdf-bb91-4b42-ac26-08ded0f62f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|3023799007|18002099003|22082099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	ykuaEQR2vAi6zEGgaH7P/0hgovS7ovtEUsSpWiWlo9rLIi2vHnHGogngxOPQwVz0BscEKMJXuUgpiqdsQE8RFAuWE6MFLNUE0xfb5knrgPgvMwmc4kLFyjosiDS1ekJjVakYWeDBpufr0yHdagMSM+0rBIbkTEyB/d/lUg85wFnAipnYnS9oEE0tWhoISEIZsVHL2dPp7lWpLSRN4DDb2u4c5zGEIXs3sA0qG0ZhBj2r/TwhVv09wftdCYB6f2y+lhEeUI4eoWydhq2cVmBn4iAnDTQ/dzH/AQWlLemM0m8wE8qRm4nsbTItb/vPoaqNVZ84lJDKx8UhXorKAVea3s4iUqfSM8+jfzQmTahIByEr4Udu1yC5VL84447p1y+b2jk03bgtP/SZUVtF/49VFNpupZ1yOeFy2PV94I5z5kzbPOjtUAAjgX2r2ckmg1EOT+IgYEvCBhfPXxJ/Iku37jGNeAhkGgzXLB+WUUad/WD+Mx3AfqOvRqJ6Hus1XtoiaX84gXuXU51uiBeLnfJkNFr831J++7h27DQPvBDOETaIjNO7tD8DN+3pdpXMh7zewYCncH0OsCt9K1tkE2qsyvwoMfF1YxDpYRnjYFCYV6Zxy+2syxkXWKSQclrUVWn7DiHSol1bcAF0dChX1j6vwpGRGPc0FbnUvZk2Nt8mitKkygrzIUVcoenfvZ0yqu0HAWPUsqvtDlt4WL8tZSGy+g==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(3023799007)(18002099003)(22082099003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ACo/jE1yQ0v1CwVVS8XIr0u9jxVveNMLqehtoZJh22XPKw7Ni5uqKamYzFc1wXNS2FNDwQ3bRVkt9u/g+WCyWjlLwqo3RhzGoEIHsC2KZlEGuOgW3yoZy4zscFemeELCTFT3/3lJjrX1a5Hp7mhB8MY4ONDEGbCaUPvCGrRF7WAc8IX2QTnHNU+S+ql9KL9iv6jyBAZ2BVkJm2krEZ0uPkuNjZetStUdAsaUqFHgGN7QLOrcoT9H/9hlAJnoIHWBIrQBNf78jnGz4e7pa57PhOAjgqiqjZYIElDFh4dxYBxI3qoaB63pVB31ddnwdA+itgwpy+YqqFTJI9L6/FGTOGSLZcWw+5/obZFalMNVXu9ibAvfrgi7sAdybbmYgwjX620cyUHcc0HdzPWXyg9J1tuctW6ULIo2jhuEtncByb57znYLOIaE1D9/Xg40di+s
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:08:10.1598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f77cdf-bb91-4b42-ac26-08ded0f62f4b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8384

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
software reset lines for audio subsystem peripherals are controlled
through one register in the CRU register map.

The driver is created by the AUDSS clock platform driver and registers
the reset controller on the CRU device node.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/reset/Kconfig            |  14 +++
 drivers/reset/Makefile           |   1 +
 drivers/reset/reset-sky1-audss.c | 192 +++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 drivers/reset/reset-sky1-audss.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..f74859b292ae 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -300,6 +300,20 @@ config RESET_SKY1
 	help
 	  This enables the reset controller for Cix Sky1.
 
+config RESET_SKY1_AUDSS
+	tristate "Cix Sky1 Audio Subsystem reset controller"
+	depends on ARCH_CIX || COMPILE_TEST
+	select AUXILIARY_BUS
+	select REGMAP_MMIO
+	default CLK_SKY1_AUDSS
+	help
+	  Support for block-level software reset lines in the Cix Sky1
+	  Audio Subsystem (AUDSS) Clock and Reset Unit. Sixteen reset
+	  outputs for audio peripherals are controlled through the CRU
+	  register map. The driver binds as an auxiliary device from
+	  the AUDSS clock driver. Say M or Y here if you want to build
+	  this driver.
+
 config RESET_SOCFPGA
 	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
 	default ARM && ARCH_INTEL_SOCFPGA
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e52569bd276..e81407ea3e29 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SKY1) += reset-sky1.o
+obj-$(CONFIG_RESET_SKY1_AUDSS) += reset-sky1-audss.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
diff --git a/drivers/reset/reset-sky1-audss.c b/drivers/reset/reset-sky1-audss.c
new file mode 100644
index 000000000000..20870f37d7d7
--- /dev/null
+++ b/drivers/reset/reset-sky1-audss.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cix Sky1 Audio Subsystem reset controller driver
+ *
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#include <dt-bindings/reset/cix,sky1-audss-cru.h>
+
+#include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#define SKY1_RESET_SLEEP_MIN_US		50
+#define SKY1_RESET_SLEEP_MAX_US		100
+
+#define AUDSS_SW_RST			0x78
+
+struct sky1_audss_reset_map {
+	unsigned int offset;
+	unsigned int mask;
+};
+
+struct sky1_audss_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+	const struct sky1_audss_reset_map *map;
+};
+
+static const struct sky1_audss_reset_map sky1_audss_reset_map[] = {
+	[AUDSS_I2S0_SW_RST]   = { AUDSS_SW_RST, BIT(0) },
+	[AUDSS_I2S1_SW_RST]   = { AUDSS_SW_RST, BIT(1) },
+	[AUDSS_I2S2_SW_RST]   = { AUDSS_SW_RST, BIT(2) },
+	[AUDSS_I2S3_SW_RST]   = { AUDSS_SW_RST, BIT(3) },
+	[AUDSS_I2S4_SW_RST]   = { AUDSS_SW_RST, BIT(4) },
+	[AUDSS_I2S5_SW_RST]   = { AUDSS_SW_RST, BIT(5) },
+	[AUDSS_I2S6_SW_RST]   = { AUDSS_SW_RST, BIT(6) },
+	[AUDSS_I2S7_SW_RST]   = { AUDSS_SW_RST, BIT(7) },
+	[AUDSS_I2S8_SW_RST]   = { AUDSS_SW_RST, BIT(8) },
+	[AUDSS_I2S9_SW_RST]   = { AUDSS_SW_RST, BIT(9) },
+	[AUDSS_WDT_SW_RST]    = { AUDSS_SW_RST, BIT(10) },
+	[AUDSS_TIMER_SW_RST]  = { AUDSS_SW_RST, BIT(11) },
+	[AUDSS_MB0_SW_RST]    = { AUDSS_SW_RST, BIT(12) },
+	[AUDSS_MB1_SW_RST]    = { AUDSS_SW_RST, BIT(13) },
+	[AUDSS_HDA_SW_RST]    = { AUDSS_SW_RST, BIT(14) },
+	[AUDSS_DMAC_SW_RST]   = { AUDSS_SW_RST, BIT(15) },
+};
+
+static struct sky1_audss_reset *to_sky1_audss_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct sky1_audss_reset, rcdev);
+}
+
+static int sky1_audss_reset_set(struct reset_controller_dev *rcdev,
+				unsigned long id, bool assert)
+{
+	struct sky1_audss_reset *priv = to_sky1_audss_reset(rcdev);
+	const struct sky1_audss_reset_map *signal = &priv->map[id];
+	unsigned int value = assert ? 0 : signal->mask;
+
+	return regmap_update_bits(priv->regmap, signal->offset, signal->mask, value);
+}
+
+static int sky1_audss_reset_assert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	sky1_audss_reset_set(rcdev, id, true);
+	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);
+	return 0;
+}
+
+static int sky1_audss_reset_deassert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	sky1_audss_reset_set(rcdev, id, false);
+	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);
+	return 0;
+}
+
+static int sky1_audss_reset(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	sky1_audss_reset_assert(rcdev, id);
+	sky1_audss_reset_deassert(rcdev, id);
+	return 0;
+}
+
+static int sky1_audss_reset_status(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	struct sky1_audss_reset *priv = to_sky1_audss_reset(rcdev);
+	const struct sky1_audss_reset_map *signal = &priv->map[id];
+	unsigned int value;
+
+	regmap_read(priv->regmap, signal->offset, &value);
+	return !!(value & signal->mask);
+}
+
+static const struct reset_control_ops sky1_audss_reset_ops = {
+	.reset    = sky1_audss_reset,
+	.assert   = sky1_audss_reset_assert,
+	.deassert = sky1_audss_reset_deassert,
+	.status   = sky1_audss_reset_status,
+};
+
+static const struct regmap_config sky1_audss_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static void sky1_audss_reset_iounmap(void *data)
+{
+	iounmap(data);
+}
+
+static int sky1_audss_reset_get_regmap(struct sky1_audss_reset *priv)
+{
+	struct device *dev = priv->rcdev.dev;
+	void __iomem *base;
+	int ret;
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (priv->regmap)
+		return 0;
+
+	base = of_iomap(dev->parent->of_node, 0);
+	if (!base)
+		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
+
+	ret = devm_add_action_or_reset(dev, sky1_audss_reset_iounmap, base);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register iounmap action\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &sky1_audss_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "failed to initialize regmap\n");
+
+	return 0;
+}
+
+static int sky1_audss_reset_probe(struct auxiliary_device *adev,
+				  const struct auxiliary_device_id *id)
+{
+	struct sky1_audss_reset *priv;
+	struct device *dev = &adev->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->map = sky1_audss_reset_map;
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.nr_resets = ARRAY_SIZE(sky1_audss_reset_map);
+	priv->rcdev.ops = &sky1_audss_reset_ops;
+	priv->rcdev.of_node = dev->parent->of_node;
+	priv->rcdev.dev = dev;
+	priv->rcdev.of_reset_n_cells = 1;
+
+	dev_set_drvdata(dev, priv);
+
+	ret = sky1_audss_reset_get_regmap(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regmap\n");
+
+	return devm_reset_controller_register(dev, &priv->rcdev);
+}
+
+static const struct auxiliary_device_id sky1_audss_reset_ids[] = {
+	{ .name = "clk_sky1_audss.reset" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, sky1_audss_reset_ids);
+
+static struct auxiliary_driver sky1_audss_reset_driver = {
+	.probe = sky1_audss_reset_probe,
+	.id_table = sky1_audss_reset_ids,
+};
+
+module_auxiliary_driver(sky1_audss_reset_driver);
+
+MODULE_AUTHOR("Joakim Zhang <joakim.zhang@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 Audio Subsystem reset driver");
+MODULE_LICENSE("GPL");
-- 
2.50.1

