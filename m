Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022089.outbound.protection.outlook.com [40.107.75.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E49B3176E4;
	Sat, 30 May 2026 02:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107416; cv=fail; b=CkqfbcRuzY/RY1tCjkNPxjUTg5nGOrY1KyhxJ+TjYtwgGRRuTmzvkyztZsGQKOkekai+e/WF4C6f8kEIxGUDNqirBONofXSXUn5GB7VSIclctAl137faxZ4bnIuMvj15MGClXvuu8460bn6V+S0Up2hfKWUArM9jROXKVyiJlYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107416; c=relaxed/simple;
	bh=m2asqZ8vtJ91CQ8Bvr+TST/rFk4OwGEmkVIJEAktO9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OneFNgRCYhuZHd+9bFDR7P76fOkEYsEA5Mo43wTHVq8nlHBk8ctuRkvm7o9IM7OsUcap4/cisvyL59oOiiuXPkz8D+q+eKWofPBJPV8JkXVB3GfwLrQFyXNI+hWlXbbWn2ailX+/PCuQCcBbVAIMPB0wjB0lw3zDyqJZNCmUC0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0nez1U9np/ThDAqIsi7Or0J4x8nCPvLtBbqBBISjLwTy6fzzy1cL2LkN74inDY/M2QGUsgFVOKFAF+9VviNl1gx/Z9DLVpmkn634Y+Gx8ZmxAS2jno+ooWMyDvpsTHl49mhzRGVhbdVnk1MwnNqgJki5CK/lVcryefjz5vDMpSSZ7PACJPWmet4Ux1+ScAlbJpxJx6FveXH+R35jVhSOeuaebbcE13P3vVQH5oDyPa3YNGmsc0HX7Tsun6pNTnguYgh72Z2Pt+zdPksOUZwotTcQtc/jUMN2nzVWqKOTJy0XN4+aU5LodBP3N0zcT3mbKa9jjuer3iwlMr4ptsXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLDkNtSasfar7GW5fWpP2vaJchCj2+QFxlMFmSwA3Lw=;
 b=xnwH5Bre44mHwdoee0rBrdzp2CGavPnwUyPBTcDR1IHbqqsvR629qky9wCm8gcmouYiJSVvG8g3c0Zr7V6+a3j5Fs1J52Pv5cYV6Ptn1jbCMPHq6uDvCgsFzRCdiuu6BUy2nWRmvjwQx4/v5zmDDxYluGvOJQClUj5aIsFHBsT+nlmPAjlL3uvXVxreUD/9tCHvGhFqLFgkx7iX0LKAs+6O6VCvbq/2lu53qaB3kNw/UA9U3c4taSd59AGh/qJoN+eRrcTn9XnAr9Io9Te4MdOo8GsGT54dnv6bQCGv+aojyrmxhS906dkxfO0a1Sdbmzu8c95PpSm418cl6t5EhoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYWPR01CA0051.jpnprd01.prod.outlook.com (2603:1096:400:17f::7)
 by SE3PR06MB9067.apcprd06.prod.outlook.com (2603:1096:101:323::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 02:16:51 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:400:17f:cafe::3b) by TYWPR01CA0051.outlook.office365.com
 (2603:1096:400:17f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Sat, 30
 May 2026 02:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sat, 30 May 2026 02:16:50 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 943EB408426E;
	Sat, 30 May 2026 10:16:47 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v1 5/7] reset: cix: add sky1 audss reset controller
Date: Sat, 30 May 2026 10:16:40 +0800
Message-ID: <20260530021642.64059-6-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530021642.64059-1-joakim.zhang@cixtech.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SE3PR06MB9067:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 715ae79f-f890-426a-d6e1-08debdf18292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700016|376014|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	2SJRFOKt+9T41p3KOSvY/W0/1mtvYfq+AwzHBHibRODSPHWxSedb88lGaLse/nzgNm+/3pf/7D0GJBbW6QoCiVdp4KJ20OxOFzJuIfXzfF276nlGWPtF8x+/rFFNq+X7k1O8BU+slBwgFe2aW3RbIu/4eXdJuZaE7wwzsSULouma77jUzDNwxTb2oWe9U9hk4Dh9P3nih8dvCqxV9GzprKRYTwlMQ9F5e486nNQjPE+Tq2Zkw7YC+cCez0Fxqk1LeLKXhSKjiKJGwEVWr+ibFdyfAMOkv/KW9YEyhLoPDhY7DdONV5CghCXjX0H7Iyb3t13G9xOlsScvin29esPA004c+ZhqZSlM+TzR95y2rlSnk8DfQm/EU6vUz83xP7kGFs4ukM+MNbpFTR/U/KesL2SB7Pa6YgLEWretDnx2HBxAauhDeryelt4MBwdtHk/vpnADJ6BQUT7kEq0oEhqA2JhPIY7kAL1JOFji6UIWQevBfOfdG1UAUTjX0BcEJwAao2J8g6GixInFINC+5yLlOv/y/jUbDUwguBr6tUk8oi2BlZ9JDXf0yj5pWjzOuUjt+WJ74+vc0iDjdi3KNTHWpMoB1nHsB3fx57gFrprKrxyEfsXntlIowAnK0voBIY8mhLkOp/WTpRCMrC4qINIq8pmqmgx0GrjzcV3wrEbWXkpZl5jUrOiqFomvb2HMlYokmQWJQ866Jc+/EX76CR+Ugkcvv+PetTLzuy1rAF+Fb0g=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700016)(376014)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k/e/GlfaWitQCKiUUrXtruToN6mMZa2uENnEf1DXnirNNXUMPu70STi06BfiWzEwGmHW6h37ufrHHwqJ5bLDvTa99mwE8N2HEtYDVwNwnLfauSPHFtOPdHuF4qjFO8Q/07ad8CIWtIGQhJ1hlTdrYSkgplBwHW5aQe5vtfcfIvu/xbbjGaVViWhQr/2tPR10AMwiZo9oq1enStJ7BR9lib8GdotxZpZSF9gLtT+uUwXw46IszGK9sPTwZvRc94cCfw4nDfBomwraMEeFMIED+vgiQEURvVCbJ80bxEJEoMeJhrg0A4ltTUigNCcZ+7oskZdl6hTvsyne7bRMrOo8GwLWcI8vdGfIz9rZ3CnuOww/kRSo0uTiwYK1wHWxZusktBnqlv5gaP1NMIYaONrjY6ag9r/g7TGceaLyZgHgBMSWfCT9Q71ZDTQ3hHie00QZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 02:16:50.5391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 715ae79f-f890-426a-d6e1-08debdf18292
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9067

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add reset controller driver for the Cix Sky1 audio subsystem (AUDSS).
The driver controls software reset bits in the audio CRU register block
via the parent syscon regmap and registers a reset controller for SoC
audio IP consumers.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/reset/Kconfig            |  10 ++
 drivers/reset/Makefile           |   1 +
 drivers/reset/reset-sky1-audss.c | 172 +++++++++++++++++++++++++++++++
 3 files changed, 183 insertions(+)
 create mode 100644 drivers/reset/reset-sky1-audss.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..a3fefcdffb37 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -300,6 +300,16 @@ config RESET_SKY1
 	help
 	  This enables the reset controller for Cix Sky1.
 
+config RESET_SKY1_AUDSS
+	tristate "Cix Sky1 Audio Subsystem reset controller"
+	depends on ARCH_CIX || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  Support for the Audio Subsystem reset controller present on
+	  Cixtech Sky1 SoC. This driver exposes software reset lines for
+	  I2S, HDA, DMA, mailbox and related blocks in the audio CRU.
+	  Say M or Y here if you want to build this driver.
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
index 000000000000..c18cb4e1a61e
--- /dev/null
+++ b/drivers/reset/reset-sky1-audss.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright 2026 Cix Technology Group Co., Ltd.
+
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/sky1-reset-audss.h>
+
+#define SKY1_RESET_SLEEP_MIN_US		50
+#define SKY1_RESET_SLEEP_MAX_US		100
+
+struct sky1_audss_signal {
+	unsigned int offset;
+	unsigned int bit;
+};
+
+struct sky1_audss_variant {
+	const struct sky1_audss_signal *signals;
+	unsigned int signals_num;
+};
+
+struct sky1_audss {
+	struct reset_controller_dev rcdev;
+	const struct sky1_audss_signal *signals;
+	struct regmap *regmap;
+};
+
+enum {
+	AUDSS_SW_RST = 0x78,
+};
+
+static const struct sky1_audss_signal sky1_audss_signals[SKY1_AUDSS_SW_RESET_NUM] = {
+	[AUDSS_I2S0_SW_RST_N]   = { AUDSS_SW_RST, BIT(0) },
+	[AUDSS_I2S1_SW_RST_N]   = { AUDSS_SW_RST, BIT(1) },
+	[AUDSS_I2S2_SW_RST_N]   = { AUDSS_SW_RST, BIT(2) },
+	[AUDSS_I2S3_SW_RST_N]   = { AUDSS_SW_RST, BIT(3) },
+	[AUDSS_I2S4_SW_RST_N]   = { AUDSS_SW_RST, BIT(4) },
+	[AUDSS_I2S5_SW_RST_N]   = { AUDSS_SW_RST, BIT(5) },
+	[AUDSS_I2S6_SW_RST_N]   = { AUDSS_SW_RST, BIT(6) },
+	[AUDSS_I2S7_SW_RST_N]   = { AUDSS_SW_RST, BIT(7) },
+	[AUDSS_I2S8_SW_RST_N]   = { AUDSS_SW_RST, BIT(8) },
+	[AUDSS_I2S9_SW_RST_N]   = { AUDSS_SW_RST, BIT(9) },
+	[AUDSS_WDT_SW_RST_N]    = { AUDSS_SW_RST, BIT(10) },
+	[AUDSS_TIMER_SW_RST_N]  = { AUDSS_SW_RST, BIT(11) },
+	[AUDSS_MB0_SW_RST_N]    = { AUDSS_SW_RST, BIT(12) },
+	[AUDSS_MB1_SW_RST_N]    = { AUDSS_SW_RST, BIT(13) },
+	[AUDSS_HDA_SW_RST_N]    = { AUDSS_SW_RST, BIT(14) },
+	[AUDSS_DMAC_SW_RST_N]   = { AUDSS_SW_RST, BIT(15) },
+};
+
+static const struct sky1_audss_variant variant_sky1_audss = {
+	.signals = sky1_audss_signals,
+	.signals_num = ARRAY_SIZE(sky1_audss_signals),
+};
+
+static struct sky1_audss *to_sky1_audss(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct sky1_audss, rcdev);
+}
+
+static int sky1_reset_set(struct reset_controller_dev *rcdev,
+			  unsigned long id, bool assert)
+{
+	struct sky1_audss *sky1rst = to_sky1_audss(rcdev);
+	const struct sky1_audss_signal *signal = &sky1rst->signals[id];
+	unsigned int value = assert ? 0 : signal->bit;
+
+	return regmap_update_bits(sky1rst->regmap,
+				  signal->offset, signal->bit, value);
+}
+
+static int sky1_audss_reset_assert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	sky1_reset_set(rcdev, id, true);
+	usleep_range(SKY1_RESET_SLEEP_MIN_US,
+		     SKY1_RESET_SLEEP_MAX_US);
+	return 0;
+}
+
+static int sky1_audss_reset_deassert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	sky1_reset_set(rcdev, id, false);
+	usleep_range(SKY1_RESET_SLEEP_MIN_US,
+		     SKY1_RESET_SLEEP_MAX_US);
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
+	unsigned int value = 0;
+	struct sky1_audss *sky1rst = to_sky1_audss(rcdev);
+	const struct sky1_audss_signal *signal = &sky1rst->signals[id];
+
+	regmap_read(sky1rst->regmap, signal->offset, &value);
+	return !(value & signal->bit);
+}
+
+static const struct reset_control_ops sky1_audss_ops = {
+	.reset    = sky1_audss_reset,
+	.assert   = sky1_audss_reset_assert,
+	.deassert = sky1_audss_reset_deassert,
+	.status   = sky1_audss_reset_status
+};
+
+static int sky1_audss_reset_probe(struct platform_device *pdev)
+{
+	const struct sky1_audss_variant *variant;
+	struct device *dev = &pdev->dev;
+	struct sky1_audss *sky1rst;
+	struct device_node *parent_np;
+	struct regmap *regmap_cru;
+
+	parent_np = of_get_parent(pdev->dev.of_node);
+	regmap_cru = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
+	if (IS_ERR(regmap_cru))
+		return dev_err_probe(dev, PTR_ERR(regmap_cru),
+				     "unable to get audss_cru regmap");
+
+	sky1rst = devm_kzalloc(dev, sizeof(*sky1rst), GFP_KERNEL);
+	if (!sky1rst)
+		return -ENOMEM;
+
+	variant = of_device_get_match_data(dev);
+	if (!variant)
+		return -ENODEV;
+
+	sky1rst->regmap          = regmap_cru;
+	sky1rst->signals         = variant->signals;
+	sky1rst->rcdev.owner     = THIS_MODULE;
+	sky1rst->rcdev.nr_resets = variant->signals_num;
+	sky1rst->rcdev.ops       = &sky1_audss_ops;
+	sky1rst->rcdev.of_node   = dev->of_node;
+	sky1rst->rcdev.dev       = dev;
+
+	return devm_reset_controller_register(dev, &sky1rst->rcdev);
+}
+
+static const struct of_device_id sky1_audss_reset_of_match[] = {
+	{ .compatible = "cix,sky1-audss-reset", .data = &variant_sky1_audss},
+	{},
+};
+MODULE_DEVICE_TABLE(of, sky1_audss_reset_of_match);
+
+static struct platform_driver sky1_audss_reset_driver = {
+	.probe	= sky1_audss_reset_probe,
+	.driver = {
+		.name		= "sky1-audss-rst",
+		.of_match_table = sky1_audss_reset_of_match,
+	},
+};
+module_platform_driver(sky1_audss_reset_driver)
+
+MODULE_AUTHOR("Joakim Zhang <joakim.zhang@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 audss reset driver");
+MODULE_LICENSE("GPL");
-- 
2.50.1

