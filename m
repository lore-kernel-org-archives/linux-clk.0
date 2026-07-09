Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022117.outbound.protection.outlook.com [52.101.126.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06635421896;
	Thu,  9 Jul 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598497; cv=fail; b=LEFwJQViERa5svM2Bj8/BWNm5Flnn2M0nL6Un+t5+/lVUzvQHGj6aza2iHA4AJUGGZbmqwtIWdkfg1pGLA/SroFTgzy9NOFk+FcR5w0ldSPDT2Icftg1/N5WEG2vIQ59YhCYv/MtrSA6iMaFQG/vJHFXLKmXsDIq/BljD7Ui1+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598497; c=relaxed/simple;
	bh=hcpQc8TkxBYLssSkBpBmkRoJy7k+tt6OzepS8jWZ0Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZwVd2JdOw/gesn2Q/5mXpeiZVp1IsWdMkL5slHsgcv2qpPrzHuxm4hfT/PoX2sFz+Twq3nb+e8os8gYWVM+UbzTXBLasbBay4WvPlOpAi1DhxI/u7JHWZOwx3LlkFVVOZhXRBRbbB8BJZ2Tq8pM87yFDmxvZT6ZoekfT9WcL+WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOVMgk75worEZW0ZtBmK1cxTmZOcQBnA2ceq57kHLfkAHs1Bt1I1npVmZnqUjqQjQcHBjaaUgZt1YPS9k1R9cJuimCObwlqKeBBiJBBAtQ1+KELz2GFeVtWA/63GEa4uZbikH6bIZS4YWfT1Ip9+hHlm6qWtrNJuFvuWtzVFeWcHCTFpCccgIsPmeApYRrdVSZwmdB0je5zteb8SNJh+eAPj9NHV3ymfy5E+Jd/+jk50XvaGmzjZ+XTC8dbWBcmeqLJtSFUuQwPH5rppM+5hR9uEuKZ148mINJ1bquVHxar4XfarXrOaGK6TPl2L+ItHO82KvYxnYXnOxhLie1MkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efu/eKs2NQ92JaelL1qHqkQ1iI9MMxrdg9ZC113sUtE=;
 b=iwA68grFwvP6Yfd+PGVDTz2AvVHIONvvxfw7+v6Q/MdqXnhJULF6iWE9AqiMi/ETNq/xYoH2vsaZy8GNFlGYpWOVwkS+a4SOtlNIqlz6u8eOWStGXRhFMS+5/YWEAWuHdVQk1yaeWatB7Gc5hde9r23GvsR2ymj9n9QhFwjGoHgTQSQluY3mqKMBhuoJAedgNnJA0UY7drRbG3bPFxD4ebb5Gc8C8GxvSWeJanqe4jS5LM0RCUNRALoFzgS2+aIrOvaUl18SgF2ZF4g4bK5qZvTsuWH1jcVabDMbce0o4PepPNgiVK7r5uKZDsPSXxKuMeBEP9YyU/bm31cNK0o9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:4:194::15)
 by TY2PPF089F03E6D.apcprd06.prod.outlook.com (2603:1096:408::784) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 12:01:31 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::8f) by SI2PR02CA0010.outlook.office365.com
 (2603:1096:4:194::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 12:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 12:01:30 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D00E740920E2;
	Thu,  9 Jul 2026 20:01:29 +0800 (CST)
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
Subject: [PATCH v9 3/4] reset: cix: add sky1 audss auxiliary reset driver
Date: Thu,  9 Jul 2026 20:01:24 +0800
Message-ID: <20260709120125.3997078-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
References: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TY2PPF089F03E6D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fc20061b-dc33-40a4-febc-08deddb1d07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|5023799004|56012099006|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	ieex+3VGMa+ljgq5B5Pt4l6KyIDWh/Fm2eKzg5QmOZ0Ug6UVNo1t4ijtLuQyTnj7cyQoac6lW1eoK5Ge7vFG7UzUkHP8XvyCzQNqCRVB9pfeMolnhkxhxj4m+ouQAcnvdvLTxiXP6an6oA9wLYCvdTIg/ol2i6xNY7WM/AJJne1mIoNU02o+WQ9d9jyi7eFuls+Zjw8eFiR0swHWABsZaRg2ui4FRqgEb/REOTDXMl4dNY59R1ygFswZuuaJ4lRDno+38K4DjrQkA8RDm/YmEH/76uQC8K2mwYoqzlz87shahwwkUOu5wLuM38CbQPkzCRhWhe3bkIJ02+L/G5/p0RPem5Jl9EH5mNt1lDMjRFb218RP981EGBNzGPN70FO0go6A+fClkKYdDwUUc9NdKMr+xvUpFFZP4AUVLR4mvG7XwbHfv2id8D+dguKpM0hazqCB60GvQz3hm/EFAl4vmry9EppJ7147Q5PiIsUIPzCeziT3t63QSEyEtnIXPfylms+FP7vjX44bdUVR1kG3GCZt0ChHqXRGnOPR9u1F1YU1ils67j+DmutUBDcvwH68QyB14RdPt66Kphe9y6fk5WuBAhxs9wCwuW5M/Das653qjhUNCKj41QVnDZiFKPrxaf+TDfH8og7bIWuqXL3BM9wwSZQ2Z6C5QaMKpj53Lm1FeO3Zdz9QhHBB87w+6Ht3g/i4974efbS2c1/FVXjNuA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(5023799004)(56012099006)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qlqVAmZa6lEJ2p/APzKJChpupbRj0FJs0dxs5M3758hPATjyHPpDjnQF465/MsyH3z0M+Las4zBm/0X9Tpup7sJbPGmPh3lnbCr/w6l881Op9JmXoH2HzL6gC4MHh2FMsjLeYkXCrSCggp+kAjha4Z4RaT/PiLqNR2OGjKqhPbapw0MalzYgp+Wsf6F4sR+zR6YBXzn5F1xIoEe43stxdmNef/sykv5TxdOYLAdr/0g6cpn7C84h0qGQut12bAQPpJAUMbAq6cdXm10E6kN2VbUwHa4gMcDSO/isOQEuoLuZEU9c/YZcXjsHL86xqtRVQ6Tqr9/svp3PzAaJrhDmbzJFmSa1bLTycINTq+DANP0bivHM1MrEs62+iDJug2dL/zdlP8Ep4Hfbcbw4mToJImS8CwSqXqcNq/Mq2EXqZA2fedUnZfQJ/5hwMV2DXHEc
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:01:30.7809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc20061b-dc33-40a4-febc-08deddb1d07d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF089F03E6D

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
software reset lines for audio subsystem peripherals are controlled
through one register in the CRU register map.

The driver is created by the AUDSS clock platform driver and registers
the reset controller on the CRU device node.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/reset/Kconfig            |  13 +++
 drivers/reset/Makefile           |   1 +
 drivers/reset/reset-sky1-audss.c | 137 +++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)
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
index 000000000000..d31d80e1251a
--- /dev/null
+++ b/drivers/reset/reset-sky1-audss.c
@@ -0,0 +1,137 @@
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
+#include <linux/of.h>
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
+	int ret;
+
+	ret = sky1_audss_reset_set(rcdev, id, true);
+	if (ret)
+		return ret;
+
+	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);
+	return 0;
+}
+
+static int sky1_audss_reset_deassert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	int ret;
+
+	ret = sky1_audss_reset_set(rcdev, id, false);
+	if (ret)
+		return ret;
+
+	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);
+	return 0;
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

