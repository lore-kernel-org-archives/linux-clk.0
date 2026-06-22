Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022087.outbound.protection.outlook.com [40.107.75.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898543148DA;
	Mon, 22 Jun 2026 02:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095136; cv=fail; b=RfAamAi1/Y85AvKKVkVZe5+y9WtntB7piwJhJlQ9CCDFNJw7feaAnXpv1Lei0OTaTlqQzeFRNGBU/spXnCtacIOvB9S7pLgsHaOJmPIY2uGXKk2h+T/tIGg5IeM26oywdt1mfIqOJmCqSj9esfj5R+xxwf7Lyz2zHt9BCUh/7gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095136; c=relaxed/simple;
	bh=WsTFDiE9ZXqOK3KN+GLrxZRNnrNtBQosdNTym6Uqw3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0BcYth+qCZvfaeCIZeZUFPJCDAkW1XK+4WGwWBYKnAgC0by4He+afgIsuTxCke0OWncpC15JaSpcPO4UP6qb02YcZC5IWuef7/KW2QrFJDbr2EmX3NCpIJk8CVlYj/CfElKwAMiKAhIFEffoMBeCkW91tGppuCmGsSHLvQ3v1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXr8rbk/alaUJ4c0T8SnjCOkSj5BX1PUPsD1UiK8WpHRbx0leevyAQX5e+4dAQiyA/PotbAn2jIkGQq1MONyLoAcNgkFDZfq/AZstPCVMR4i6/7cIjjKZVdO9DaGVnhH/9Slpjg7tAN1BLHvQoTEw5ACHdcf4nCgoid8C/LC4EHRhAVjJomofwaXqGmHvU6ob3uGrJetDkh9idaekfzICWRACEgdy6FOJjLTZUpMesvllMJoSMt/36OsybiPnrKUlSvzTlO/Hh/fthAC/dybxjwGAaGqN4qYIEAFqD5+x9Oy/J34ynK0qvqAEz/Zv4qMcx81cPMEQoTQhxI4MHyRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxtEYDnBUJoGo23/F5MRhG8LhraBayRFeMoWvdfV6UM=;
 b=Q/8F7oQ3FDZAAK4yopd5NH9LXPcPs2fxKMTvV5o6cL4Eqor2FdVbbhatn4rd5V4NnxV6k9HQQQu5eA4mdqArINrGfnaofw07WSJcLOf407lK4Oa3ZVvGpUYHoXKEl3et68VN1zMUgWK3IPhNU4+7C8vXjVC/MsC70ladq/9RpjUymyzUHJ+UhLo3l0h0edGOr75MhYrsS/A9MLRX+cSGHXmshFWbheL1UJ7HlQTS//KpvIMHkdT22KiR1AYmg9zIxZUB4m2R/X6ZDim6Q80K4QnkG26F1Pq/lCH0WNBniwKetJgs2ZfVY5tJymJDe89ewyV43Su3b475dGcicFOHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0002.apcprd06.prod.outlook.com (2603:1096:4:186::10)
 by KU2PPFDF24F4212.apcprd06.prod.outlook.com (2603:1096:d18::4b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 02:25:30 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::79) by SI2PR06CA0002.outlook.office365.com
 (2603:1096:4:186::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 02:25:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 02:25:29 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3532C40E7F92;
	Mon, 22 Jun 2026 10:25:27 +0800 (CST)
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
Subject: [PATCH v5 3/4] reset: cix: add sky1 audss auxiliary reset driver
Date: Mon, 22 Jun 2026 10:25:19 +0800
Message-ID: <20260622022520.3127103-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KU2PPFDF24F4212:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8945e471-2d38-4179-13f0-08ded005871e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|56012099006|5023799004|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NFPDexi66r2W8J36qgfUF6iwpM8tHLiY/i26Mx+sByebnoUDhS3d2uLd404qrdk7RMkLwpliw4Q1gDxGn/UFMkhIw4MPC8cIwgrSlKFuRaLUW9AJjtAsXg/bLEeHHiVeGJ6qZ4KYNalzfTSU9T4OHbFWYjyTsNu9KY4dp4LfTJ1Htv5mYdujZsZEOm5tukZpyeeG79+0EymvNDEle5vV18ppT3ZluvXsAQf1q8CrYFnWu/NC5APczlwmcDlatDhtgejxmxcl3VthA+VEgoQpNmPl0n7j53glotkblgiYumTMuB5jOiApzpIFXo7d5YBosjfkELJ3jXGEQJ2MCJGaCCHI0smXraAtWjEKIU3nt/m009sNXF3Vbwjk/F4BN4IC7yRMtZ/Mj4TDCma2CrHbNKFHBvWdjXaiOfvML2bF8oYB+P8ZSJIR6IV9Ob+y9TfdsQY2q/xsLXVO3UX1EReYYd88cFzZhjoLUzja2H6U4jnWDt5AwF3RiBeNkkf+AmsOoXkBXWd72u7CtumCG6BiRpIHhdfv8A33gEH+5Y+1o9TaOePGJ6kNhvCDIN4fHVp5GK8ppvJ9jHAPTsVj8i12YyrEY5skLDwsXJ71iH2IXb6uDmM3A0x1Om5vwampVSfZ2irv+1rAyWBDrIShzCHaGqROlZcu1f8UUxt9q1nciDqfg3qCEdt3n2rHZmIMI8F4QC8hdARO8yIj1AYAkfAWkw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(56012099006)(5023799004)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rv8ixmot27SdUQBUNCRKRf0RxYCJG7PiVIMTfKtx+cFPufalXm3e2qnonOi65ZBdfE0KLU68PhThKvUarrPzLSU80L4nNZjZqKrLCsyY5xDUfEkkzWKEzizFbobmYELdhJ41ylxGRK4jxzl2Zvqad6eTYp5inXp6qWF4Eh3rh1NGldIvLCRSTe7yk19dEtTRDFLFhFZWuB0jz7zWEiBz4HxHegDa5zYTHu79QRDe2lyMNt32pGuM+sZxjr22aOk4rBK4wrtWiot96knDnD9X+HoBgWce5NKeudVyDCWXGskSziK2ZsGcQeKyrfG74D3ksNKhbmvtitsu4xxg/zcYS/+K3qhqdpbYja+V4MZr5qLMrjDY2qxuAuf+c7ZyUZSkaLJESp5bLN5oc9tirpp4cdJmi6EtJPAMSrAwobZz8SmjOWsRimCQ1z+of+REG8U6
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 02:25:29.0842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8945e471-2d38-4179-13f0-08ded005871e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFDF24F4212

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
index 000000000000..f29fe3554ec1
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
+#include <dt-bindings/reset/cix,sky1-audss-reset.h>
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

