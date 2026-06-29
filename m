Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023133.outbound.protection.outlook.com [52.101.127.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345563FA5EF;
	Mon, 29 Jun 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724510; cv=fail; b=u3s/zPQKIgqnGLaGEB1w4ac4/X/yVK2S1ft3X21MDcjJB9HpXf2uukZBkjo1moL72bBkv84/6lDQAtxMy7EW/k2q5NVRMW6cUS20eqwksV5VpRWkPETk3ubEn2ysciC8Tpj008SajXgkpMmMD11KE4R0ghTvKmuoByU6d5R63yM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724510; c=relaxed/simple;
	bh=R6FopQZfuKPTqxkNPqx63DBMlrztoYokkWjx+HNlOik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pn7V0stPA2quHHpD4OS2VbBjc87k6Zyh1cRlv0Znk1PzyUs+Yeh3IKYPb9LkqQJ5sxZB1r4geu/5bj0xyeCXUOMkdkSYQKCjkaU2dMDlYfhVwnB6nwwrqv9plA2UJbB1WlDGVC3bXfxvwuFnBl/26kC/MYpsafgsP9J0Q93RxSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejOEmbXim6XRUNsgO9jXYOZiwmZY75KFoGfo/nVQJ/UCj+PdD7bw6R7vec3v6GKBZ25bg51dseTqmaI4yhJOYKrqF1aboy4XTmEGKhHywa27kaayP1diuMq7WJ0wK208WTxAWoupABsJTGA2V1GvAMyo0pRp4Zcig/hB80vfbNn6J4F1MIFbvYTqFT8mdWr7iwiXjXo6iMco54w2JwoWDvR5YSrMTwdCg/ET1CrLGz98gton97elVkr10UmLJ/KkEPqEWU7ttvhzP/1zltVFvOgXLtwqBxgg7hdXIAb7l947s3SHtcSo7Cm24SplHU+qBPhEZj+dzo1ndIDPxawhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WIGaG5iKSctPzp5sLCnlbCC4JSKL2/YonaF1JRBjj0=;
 b=CvVcyLZ7OAWRtGszbsu0C9GA0gssrHF+so8+NgesrFaEl7RIIWdB/VPAclmhsbSvkK5Bt4KCg47TH0LNniLlE425CAZIVY9Wtr3jD01yGAjmmUv503PfPNcaNIgIT0eO0HE13l3TkUjQsdnmTU7HQXHs3fJG1J5rRKwn77oE/0ScomEmt6j+T08+OpNlkrykOgwDSxV2HSDj1rPrE7GXYhwSeIwFZovtgXQA06ZZVCVILADi3FE/o4fucnvY68WPkWf8sZdf0nR8a+wnQiKyieETvoP/iSvo4kQ3mdS8YBaO0zRkiJDfGaZMKVfnCe8dx9rUHcy4lJFK9dTKAIYf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096::20) by
 SE1PPF93ED7187F.apcprd06.prod.outlook.com (2603:1096:108:1::420) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 09:15:04 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096::cafe:0:0:43) by SG2P153CA0010.outlook.office365.com
 (2603:1096::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.1 via Frontend Transport; Mon, 29
 Jun 2026 09:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:15:04 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7806E4092101;
	Mon, 29 Jun 2026 17:15:03 +0800 (CST)
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
Subject: [PATCH v7 3/4] reset: cix: add sky1 audss auxiliary reset driver
Date: Mon, 29 Jun 2026 17:14:59 +0800
Message-ID: <20260629091500.52540-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260629091500.52540-1-joakim.zhang@cixtech.com>
References: <20260629091500.52540-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SE1PPF93ED7187F:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3549b9d-5acd-40d4-833e-08ded5bee7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|7416014|1800799024|56012099006|5023799004|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FMtBfKPb8bZw8FXurfWiO32WlsG9qGtExc0TNizbKaxQWNDUWPAyZMdE0Mdg7Azk/7a0I+FzJcj49aorM/RREm/Zm41TN6N6qxSb2KcaVxrU/u+IfGGf9SnWmuuNUwVdSLJuL1n4QPlDewdqEEtEI8O7YWZKDFODC57ptwKiQBpc4gYuYQQli3PdLBDiHJ5sPwUILwNPub5XTPYJ1TysgehUTBrjlCTp0SjBtuOVUy4y65l8W2sGWwvW9aP4KiOwyqkEtXMKPSmnePXb5Al4doFPfr99aHOtq/WFWlP+SkO9uqj52pAB9KAMSRQcWGnviQL1wMqPYYzYw590eRxx84kF3okoZEKaISkRcwjPF5WqlYVfrXty/fyqCNW9zVfNP8AEhNfJ+RzuU9cQ8hzjfdMGGUTFqHoPGJB7jcskWk5LlNc1NPuyWKrfe7EgsVOCzM7ZOtGp4fes3Inp/zvsfMN7+eu+ARrfG2LpThXz06Hnc1QIzzzzvFVwDGtYkaG2TW6BCXobkdfpuanBALsM3pS6Sv4lNQaoZK9G5hXm3iN1F4zF7ipAWhuR3W94n5t62Vdob3AtXX8osb/euRiXlPyox0eE4Nj9pjb355KTb3w8fX36NTAV1z11kG6p2P1904cQ3OwYKzLcaZZjDgpWbR0EBeMl1ZzfPRf/M3+UuN3fvT2AFBdO9YLH8Zw7mUvTJZHLZqoZY/SAR316eIZqNA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(7416014)(1800799024)(56012099006)(5023799004)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4j+CBZ6vs/tUYQKBvnhrMpa4Y59zMROpgLTVd3QLAtA1pbShll/kt/SwcUB8KJaEfdpxivQPtxx3wo9INuKsv60xyv+ZCKBWgcvCmp44W+WqqFuIDCyD/vVUneKonBpga1d4ZWUVcjcvgbYPxnTfRd5UL+guvy/7+8bxU5LFyWLEJ7MSQXsFTCAhnJN95Pqm8nKXRFB0UXr7nzt4hT2WoQBvluqfgez0Wu4FGo4Rz8kuR/CwtcnXY5BMTrvA6aR21l0Al5Cjxki9g/kdGM5SNyDkWq8dSh5nXr5ot3PI0nYnMXt81d0LllGi9tqLi6FYcO7g4zrmveiJvAQtFWrrmMrAjeKu41JJhEq49uAP6y5rTQuvp89olMTrIWehAupKEbOTRJR6SEIWx9+GN1W5fdpAAPlI52X34y1550cFper7lNfO/B8WOl2Hbo/GfJ5D
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:15:04.2458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3549b9d-5acd-40d4-833e-08ded5bee7ed
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF93ED7187F

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
software reset lines for audio subsystem peripherals are controlled
through one register in the CRU register map.

The driver is created by the AUDSS clock platform driver and registers
the reset controller on the CRU device node.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/reset/Kconfig            |  14 ++++
 drivers/reset/Makefile           |   1 +
 drivers/reset/reset-sky1-audss.c | 137 +++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+)
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

