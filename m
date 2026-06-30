Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022088.outbound.protection.outlook.com [40.107.75.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBDC40E8E2;
	Tue, 30 Jun 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823462; cv=fail; b=N4UvceK8LJr/6TL9IxL1EiETtghyTXiRBdihZ/RlyMxoAVe78VKb7xkYu0tulZQWY836r0QXM2W9be/qveujfb/LjcQqPNvjwJ4xEcrmoiBon/CxTQcP2QOgR9BnZxCy1d2lzLX1p8qKJSbimnDKulZEYqOkKC9F54CXeUGJXaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823462; c=relaxed/simple;
	bh=hcpQc8TkxBYLssSkBpBmkRoJy7k+tt6OzepS8jWZ0Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nK82FOqE+KPTT76t7DQGG68+ZMOaOAaszx3d+wfA9fcgmVdzy2Ogrspp10yDh3Sfy61PvyKnZYCWrBJbExOoOFmiJyw6BmRRBUrn3z1d13WdwaaaiTfe8VBw+S2UAxn01IxPbPqx4lTdss3/nwK5emg0Ff3Cs+hORN2Qf3RqkWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7AmJ+8FAiPxmcxnCtcnvUjb/UZmBrTY0WD1yQO1ruazIGNwmrciTquq49Y7H/srG49gYDhxy2pvUo9a5vasipgrB1qikn8n2LYPFRdaLutkgNeYZXWnwaMsgocq6+Jve3SYtSzIsdmL4kp8y0RCRSKQmB102XHtiRiCxOzeoFAGsurRVtd/bpZsx0Q8x25ZA4O/B9rLF0ZMKHnx9+ICA9MOEm1tYUkTNMZo8L6zMo8D8MIb0vcsjIiw8HIQRFISlHYLyjk2G33YdbvC7Uyc+7EjGGNKrKEwIxxDmxEjCQzuVm1Xd1SEYoIgND9th1KsN2RfcFmn3WcIhglza4fYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efu/eKs2NQ92JaelL1qHqkQ1iI9MMxrdg9ZC113sUtE=;
 b=xiSz9jRMUxuXvVJzigaezrauJaNyJY5/HLaCizKsMCyceKopks9Oiq1IbgRRsNWyxIKd5fm4ERpU/rFziR2k6oM2XTdoc3siqUyLOKeBEYimh5jAfFpg3WTfuJ3S1HJz7xkovHgy3Iz33eCfFhDM5jJg/mWsFye48x9DSBVfAFyYPaxP76XclcfWa2QW+FESLc95uh8NS6/GJBiho66EA15zA53d35twp1bZ84oG0Z+Q8lC5v3rA0WauKHjwgUe6iNV8W3eC6Xb8gH8WprTpz4qkfNThroXLKzJmztY8yjC0pa25PUg7D5LCVvLJKYmoK8UIItOtYgcntGvQ0Rmxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0004.apcprd06.prod.outlook.com (2603:1096:4:186::20)
 by TYQPR06MB8009.apcprd06.prod.outlook.com (2603:1096:405:2fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:44:18 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::20) by SI2PR06CA0004.outlook.office365.com
 (2603:1096:4:186::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 12:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 12:44:18 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AA93D41C1E45;
	Tue, 30 Jun 2026 20:44:16 +0800 (CST)
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
Subject: [PATCH v8 3/4] reset: cix: add sky1 audss auxiliary reset driver
Date: Tue, 30 Jun 2026 20:44:12 +0800
Message-ID: <20260630124413.1814379-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
References: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|TYQPR06MB8009:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e40fee0-5aa6-4ded-521f-08ded6a54cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|82310400026|5023799004|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CptpQb+iB/h+0l2+zsCecctL/GOcpzAZXkfyQKrqAecIZj8LmaB7L1shiz8JkqmUm7czYqa/dOBcqcOqi1urA5weWbVqj+oK6ohRAc2eNAzxkQPJhh0zn7ug1s/+5ZUyI7OL9SKJZIfjfftLMP9NraiQHkSIFVz1K/TmLF7Wj6BanptyDoS/8dcpF5gmr7F3PZFjFwk1lBEs/AvAJIHrU1VVZipcVyZKv3sh3+vqVCuX7WIgj1FMinT12LPYXwupxUUjJfa/wxcXRWi0lWBWc/CmNnNpHlI+CbaEVTqJ6JaBp5J4UVIP0ASIJeFe/V0E8aXXkdZ45YzYEoL0tzHPk7o7K82GV19Z2Hl3fLTQSmwlTUv/2nh7d6GsSDtkIiSN2qiFpmdS0pX1zT/9r4RgCt+e3Jz8Y0nJ3XL24tuKf7av9TWid9O31QcRA2MicwHO8r2122oQXFhJipQyauctXh1uJBdoeOCnZDCZUR29yQmuKAUv9CoKBN2AN7kMncvzs3mUEBL+FlL5iLAHIPsJiNHYoKZkT1V7t2+NWe/uJ2a2ffZ3S0Unh4H+xJEU045smfpTZcdwUR8gRixHRUMbnzOpL0iDfemMr5pmWh5t2pH8XBs8jsPlU8LZ7MEIIvn/jzgayPxbRiVVo9/twk8mBxPFrVTpagjtyPK+bPWZbRe9EdANbTcRhl39zhkIGyYNGC8/lZRBEBYcdHzBeD+mng==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(5023799004)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lQV3yqkULG7CWAFe1qclcPNNs05j+XCFII43U4GxEgUnwibPUp6SjhwQ87xmwTMaxnP2CrLQuD34jnwdkDhd7xOExjYgpxCH+8IOw0T8xmAxylKMYXE6aTBpl9T0/wCjQHHkkUfAXtuYEklrxeC12L7h0qvHPyaU2PcHJSQxO020xc08RvPQaNXhJJyerQSgM1cXDj/DKrKf8C7SldsenHDbj7maMNF4ApXw0Cd017laUzQ5wbtMqW2GOtbF/pPy7L+8TkbBlVFB2Nj+nRs3r6XYbo+d71oxddzwgMqy72ggRrwhb7RofYk1Gb7GBYrOQtwVXpbK9rbmvdrpv42itHjjJXFDDSu1gvNLWoEdzDkwXsIWWzWxtQtomcl6/SILRzQ7vh9yYX8zAvcEyTujbSxktK4j9PzbDGhffiy8WBowqiO9W5vQya0NxPh4tLGd
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:44:18.0338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e40fee0-5aa6-4ded-521f-08ded6a54cf1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8009

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

