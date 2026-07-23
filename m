Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022085.outbound.protection.outlook.com [52.101.126.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C752D4156E4;
	Thu, 23 Jul 2026 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797704; cv=fail; b=Zj0KwkM0O428zqJOb33uNlRQlywagY+GOv7b4gh8jOo2AMuF0/LqVrmBcooQUu2ZEseMK01x8Hsi6R8W3I/9hPTHphb26RGF6gsztOfFV+usFi7mGyfY0125nhL7j223HRii+PO/YuEm37RmV3ngA9Ye+hq93piks3a4EtJ5Xv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797704; c=relaxed/simple;
	bh=P7GVbz0M6JwGdWKQDYnuIW5Ez8o97qcJfuK6ffE4KmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rAFT65h4vDn5Nc3guoQ+oaF7sst3m+5L5iU6z/awL2GdNBjGcBVQp0ILo4s4ZqxIPYq/fIst8P8NeAtTxGZcCQiGj/A5ZWcGYVvhWXPH44vdqo14uoUo7IEtDKTCvB+F5E3pMFCwUF8998PLG3XgyO233jg+q3GGH+Hxviun4mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/xVpBWKfAioikWbFS0GNO9xxuYFg8JaL0lQGvhMuS39hn92mI0uuXvRoSzaK99PUENczynif3GQ7CecHC+XYudu8ObTuix23+qeAble/gyBCQt7A162PT6BfUcA3KNJpS4b2S1JEUbx9nx2ID0gSU648aOn4jsdWBk9QKf9rDw088LA+kkZtQa8N4rlm0ttn1VxO/XCWKXXA/TIsQc4H9MRUjXlChjVZ6++xAXdQul+hVcLxMbbv+14NABF4nU4z4lOYCNDDJHzIDQvNJ7hGmmk9BdDxIYGphZaAPcaNzuVYZ6t6iIp9vABKcDWDjS2vKBlrOUo1tBvOL8B7L3Jiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqod2VNHfaWttBLFYus7WoFDgVmIAo17T6FCGOIDLUI=;
 b=p1DeotkPtCEYIQ49DHNfRiVCHvVncSbbmrvOdE4Q2gPNWZDt8o8oKHQhpUl9CAab2R2b1OMpc7LSfOqUCkL5vKz2/S/nf7x82oLhjp56f13b2jun5dStV5Vq02YJqT6JeHVFqzWZAFtuGaE8MtA6NdTmHv87dU9PcGvb5ywEt8eqiZ9AwoNzqNp0cD1D39bzgS+sjKIe6yMbjvXRlUQWDblOPMi9HWyS23BXH004JTyKLh5rfqWEbxzVMl/h0jvwONdFADx6z+DtdDiE6NjRz0bENVrjlSIOUAZCx3VKMatxz45Qz3/bRyFZEJ82eabPFkWNfc8QCf+vb/dHmZXZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SY5P300CA0053.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:1fe::18)
 by TYZPR06MB6166.apcprd06.prod.outlook.com (2603:1096:400:340::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:08:13 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:10c6:10:1fe:cafe::ae) by SY5P300CA0053.outlook.office365.com
 (2603:10c6:10:1fe::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 09:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:08:11 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7EE2440920E2;
	Thu, 23 Jul 2026 17:08:10 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v11 3/4] reset: cix: add sky1 audss auxiliary reset driver
Date: Thu, 23 Jul 2026 17:08:07 +0800
Message-ID: <20260723090808.1727598-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|TYZPR06MB6166:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 06d5e32b-281e-4ff0-cf9e-08dee899ebfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|5023799004|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PErn9Xp/RuEXdp5Vd4/EzikAKOfZ7+8fFv1k+oNa/i04fLJIXazD7az/IrRAto8NnnySp1cmO4t/ohCSsuxu5SqHcEFlDNsOidFnd7h37gyRoCWcYe/dz2VjFbziquBftNvXjMXkh7mPtF9+KNqW34efaePXtdVkQ5F7iI7T2tyX01afrM+8hhqpFLg7TeNcwwKYPsD/BaHHCS4h807axscAk0lTwynaRWaYo57yqSasIqgwclNHL1qTtOo0sXEpUgbZqniFRR6qXnNQT2QTGh9KDRrQuUvggwLH/QVONLAcxNyJAUd65iaFDiYUUy/M0SZ1TGs6yhs2l7Mffro/DscLI6uqdkq0KNIQf8wsBW8Tumr84HvRByakTGig7Pn3SEdV5x8lO01Wzt0OilAkQPZa/RkdIy0c0QrKgwS5LjdSWVLw4VYvU/UevhX9YFguEqpMFoo72ELOGrBxsRbJQgrUq6Pu/vRPxocso2XOWiXD/M+KI/zFDRQwIsxZFCZFw/A+ii9AqNupq/3LVmoXb5E70yFKLNyScfAc1yx8I8QWoAIeRDTbuhhbE224LFepkw+Iah0DxcpFmW1EaRRNVJ9wF4F/l8pI7WJMTlYsAe04/e9r9um/lZ8lsZ85ZNFh6Gi+v4Q9BYtwif6CiS1oU+JH9Ux6L0FKlENbXO0jcRPT0edpp0lDN/vxHf1vB6CgwtLXldJiT22dxIu/oVbJHQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tq60/iCv2GW2hwLbGqgSv1hwIpbAPb8culvTZ5ZXfefFxoguuVcmgioSlYGin4HEWnZmhzcEz5CkIpXxshSF/Iu9BSdSGh/86ONIJhrQ+JyoFylI4sV7HfqDxLX2YPcCKGS8Cvggh5DD0t+teqVKmiIKMIZNU79XdtxfttqLrW3npaI07xWrqsqydo43P3owRQywj9NwcX0YbIaSIMlVD8BFnlL5drEqgrlGJeQAXMr10WvH4+5XhyvKip8z5GWlXm3vL+Bh+cObOxDXyavVZMTSG3T17d0Wj1xhCQs5EQ/sP/mxH8tPyDbn7InloSV2/Le77SmwSlNi3oEwTfaYZP41vJp4TMu5igl1DC+0IEe1LLbSOtwjbNDKC3iOXjbb2fiIsXEYW3V6ocbuUBuvD7Ie4NPV7kMglbweDrD7yfsleOEfbgZZDa8a0mhOYJ1W
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:08:11.7626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d5e32b-281e-4ff0-cf9e-08dee899ebfd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6166

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
software reset lines for audio subsystem peripherals are controlled
through one register in the CRU register map.

The driver is created by the AUDSS clock platform driver and registers
the reset controller on the CRU device node.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/reset/Kconfig            |  13 ++++
 drivers/reset/Makefile           |   1 +
 drivers/reset/reset-sky1-audss.c | 127 +++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/reset/reset-sky1-audss.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..b19e719f2abe 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -300,6 +300,19 @@ config RESET_SKY1
 	help
 	  This enables the reset controller for Cix Sky1.
 
+config RESET_SKY1_AUDSS
+	tristate "Cix Sky1 Audio Subsystem reset controller"
+	depends on ARCH_CIX || COMPILE_TEST
+	select AUXILIARY_BUS
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
index 000000000000..d9735db681c7
--- /dev/null
+++ b/drivers/reset/reset-sky1-audss.c
@@ -0,0 +1,127 @@
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
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#define SKY1_RESET_SLEEP_US			50
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
+	int ret;
+
+	ret = regmap_assign_bits(priv->regmap, signal->offset,
+				 signal->mask, !assert);
+	if (ret)
+		return ret;
+
+	fsleep(SKY1_RESET_SLEEP_US);
+	return 0;
+}
+
+static int sky1_audss_reset_assert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return sky1_audss_reset_set(rcdev, id, true);
+}
+
+static int sky1_audss_reset_deassert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	return sky1_audss_reset_set(rcdev, id, false);
+}
+
+static const struct reset_control_ops sky1_audss_reset_ops = {
+	.assert   = sky1_audss_reset_assert,
+	.deassert = sky1_audss_reset_deassert,
+};
+
+static int sky1_audss_reset_probe(struct auxiliary_device *adev,
+				  const struct auxiliary_device_id *id)
+{
+	struct sky1_audss_reset *priv;
+	struct device *dev = &adev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get parent regmap\n");
+
+	priv->map = sky1_audss_reset_map;
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.nr_resets = ARRAY_SIZE(sky1_audss_reset_map);
+	priv->rcdev.ops = &sky1_audss_reset_ops;
+	priv->rcdev.of_node = dev->of_node;
+	priv->rcdev.dev = dev;
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
+module_auxiliary_driver(sky1_audss_reset_driver);
+
+MODULE_AUTHOR("Joakim Zhang <joakim.zhang@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 Audio Subsystem reset driver");
+MODULE_LICENSE("GPL");
-- 
2.50.1

