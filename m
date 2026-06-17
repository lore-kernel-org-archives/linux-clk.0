Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022081.outbound.protection.outlook.com [40.107.75.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA4931A807;
	Wed, 17 Jun 2026 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676296; cv=fail; b=Pdx5JmdrybLa2xRMwMU77AmSYRgihkL6gjdvqTX81V2LUq7LyU52caSZfpHQJFziaBnLKVD7FQWDgL8aVyZ7ifAiJaNgzta/Q7ETPZZsWaw/yOmCjxaoJsxLMwVv+T5jJgoWTECXpz5UiqUIssVaupDJHHYL1bqhy6WtbgzI17Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676296; c=relaxed/simple;
	bh=vX+TCpAGWZ74iSTWpEYpI1v88VcdMl8HWFjpHlaFPEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2hwtgi+bkgIvW2NPaPuXFwwTzm5318wolFLPzDIMfnMBDThNUiwHkm0JdgGM4YeJvqDlzxFyR5aOYSuDe6vMRW/qipWsg3xRuv+ehWskM2G5hEF3l+ye+ZRbsi434vL05gMWY6mLMfi6JUHNaprjMKB6HM+ARbef9z4aDroCss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkZlYkPwiFYBlHUDgwrC+PxsxMtPZz7D9aPz93jj4sX7gUYm0iaHTAlkpSL22UqpOoFxXUY2EGhBC9COEgtC0atNG6UNmRDz5Gul8fZoiToz3AWXSnyjc4vIi0Se+bmp7Y1T/wefLuscEQ58hfMrwtr0txL/oM+9hnWajOqt22mksrw/l7itgrkNtuzFyvexN/zqcPc6ZrAT7d6DP+cai58wWu8J3Y5JeSSzZlpHsmKa76Fte7HA4NvU6a9IG4GVSrYVtLIfxa3cy/yfrYL27k4nqZ3cKZKuCJpVrbk2vLMGn81PluZilIASjsPoB5YoP6Gw6HQjlEdbeVUBygKN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsVcWPOoXobWoPTi/Jzbm85KOJxpXRs4ZYiZlNStTgs=;
 b=r9CaO3WdZATs9IGSYci8G8+mR/jezlPR9yji1yOF8tgEDLJEiVWl2VokF4mCbgDQgzmgL1wJuOhPzLu/SqRe4Vx3LawxGe6hw6OkWSBFJq+tqkItwk2JK/tnP6MZO83H6rkw6q/Vfu3BdqF3e25e7txqvMOzcrdfwBXV1PFqtiDJ3B/Sbk/LPLEUer5sX+02nSDCSDRd4NHD6k7izXcbtpts6gSgP1Sn5iIYs4DDda+XK0D+R6B+iBvFTAPieGQAqUFikb2aEDUTFr9qnwhhflI8IbYTqB6rDG9OsTq7KfwYxnSuwJaKUXRBdn51ijSQSTRr7Jl3MzSbkvuRUDi7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:1f5::18)
 by KL1PR0601MB5704.apcprd06.prod.outlook.com (2603:1096:820:ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 06:04:49 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::46) by SI1PR02CA0049.outlook.office365.com
 (2603:1096:4:1f5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 06:04:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:04:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 85D3F41D400D;
	Wed, 17 Jun 2026 14:04:47 +0800 (CST)
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
Subject: [PATCH v4 2/5] reset: cix: add audss support to sky1 reset driver
Date: Wed, 17 Jun 2026 14:04:34 +0800
Message-ID: <20260617060437.1474816-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|KL1PR0601MB5704:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3b657531-259d-46be-cc07-08decc3656ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VKatRRrKNILXQnxiZpvc1GbDrvHMU+zG+JkVz2fcCz4T/Ru+J/zcjo7qFBLunvr54QQUWjkQ2AXYeQnYqFX6QPpnCWHYSelpOP75hWfNJJlVdFQZN/otVDWErSpi0NuMH8Dc4QNaKARPvGL0E7tevOK95rMWGNHnoU1BgnFhNtYySCtkxBjXabM52gW9r8RGtRGHBJ2s7BwS/UDqa3ZR/9LE8ZvOhpU3sxNSXUyAiG7tgLvzpOBJiIe/2H40e3koKSwKQ6lEnb+mmoFIpQ4lTv/SKq2OUxTe+6dcroZgx4pCCIDfVBSaY4ZQ5Gd6AlMO87hnFvXgfRlzHwIsFx6DXMD0cowHoWItf6G0pZfyX46uXqupBI+ugp8iSIHO7mcbBxHQrklNv+sPyL+/Hk8m4pCTPwQs0hDCagSsNjj2gVBIdKzXS1tM7CB5Fdtt0bVZWkMBm/+YWG8fIw9W34JWcXz+Tp3bBb9DiNjWK1mxfbzsnMdH0oJyVZ52Iy4Px5AXGhwBfwV1nJkClyPpALM1CzQmz1jWtfeKEsHi/tKO5JLTpgpaMbcJty0BUr5snZCYEO6o/KZAlN22XZFB+mnoT0v1DFcoaHqvZPR+G9ynJ1btvz6OExkmBcgE3zzXV5WfKj4t7pGgW7RV5ts41fy7WCIHY0/tZ0FjLY5z4IfPkzrDwUTcuDyMpouvQBSl5Yn0AvGKTO9C30qtRMbA0jwUaAiQhIJVizbrjx7avRRoifY=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O4SemWu1VdrH3xBguFr2DpUpSvEa9h3M8QpOTPxVoco9kJBAUp2BaKMcEbiKeW6suBRULGvieb1AvVMxUH8/XhVeF2TLM9v6tQiX4mmgmQ/KvP5NmpJC8DAHjWJ72Jh2MEKryvkzR4j4nfB9jdqh4CkxvRMUjHvp3lo9Y7gWGXszzWpyhfXaLXqWtYvD64Tz6Lij8wfTbTib9GqoOdxhDyFWpl2DT5TYJbZsqrNa1l7ZoyI5hfnJ5ZvIQkil9xZbgLM0bzoAxu5Jyg/qcisbDJRIV7Q0Qr8fLu1SDvToILJQCR8oehds+HFGiSSg/E9NZPl4XwZH83If4P1qSGxCsRjFFr5l0hRCyOAK9kjexMsmjhvSaVMW/9RNMIhXq77+jV754TWt5vK9s8dUyK7D2TPpL8Ol04IPzy6ZPRVM6SfoGm7IeNqZWu9HHvBBjtcS
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:04:48.9563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b657531-259d-46be-cc07-08decc3656ed
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5704

From: Joakim Zhang <joakim.zhang@cixtech.com>

Extend the Sky1 reset controller driver for the AUDSS CRU syscon. The
AUDSS block provides sixteen active-low software reset bits in one
register for audio subsystem peripherals, reusing the existing
regmap-based reset ops used by the FCH and S5 system control variants.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/reset/reset-sky1.c | 86 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
index 78e80a533c39..462501c2ea06 100644
--- a/drivers/reset/reset-sky1.c
+++ b/drivers/reset/reset-sky1.c
@@ -10,12 +10,16 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/reset-controller.h>
 
 #include <dt-bindings/reset/cix,sky1-system-control.h>
 #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-system-control.h>
 
 #define SKY1_RESET_SLEEP_MIN_US		50
 #define SKY1_RESET_SLEEP_MAX_US		100
@@ -34,6 +38,7 @@ struct sky1_src {
 	struct reset_controller_dev rcdev;
 	const struct sky1_src_signal *signals;
 	struct regmap *regmap;
+	struct reset_control *rst_noc;
 };
 
 enum {
@@ -258,6 +263,34 @@ static const struct sky1_src_variant variant_sky1_fch = {
 	.signals_num = ARRAY_SIZE(sky1_src_fch_signals),
 };
 
+enum {
+	AUDSS_SW_RST = 0x78,
+};
+
+static const struct sky1_src_signal sky1_audss_signals[] = {
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
+static const struct sky1_src_variant variant_sky1_audss = {
+	.signals = sky1_audss_signals,
+	.signals_num = ARRAY_SIZE(sky1_audss_signals),
+};
+
 static struct sky1_src *to_sky1_src(struct reset_controller_dev *rcdev)
 {
 	return container_of(rcdev, struct sky1_src, rcdev);
@@ -318,17 +351,34 @@ static const struct reset_control_ops sky1_src_ops = {
 	.status   = sky1_reset_status
 };
 
+static int __maybe_unused sky1_reset_runtime_suspend(struct device *dev)
+{
+	struct sky1_src *sky1src = dev_get_drvdata(dev);
+
+	return reset_control_assert(sky1src->rst_noc);
+}
+
+static int __maybe_unused sky1_reset_runtime_resume(struct device *dev)
+{
+	struct sky1_src *sky1src = dev_get_drvdata(dev);
+
+	return reset_control_deassert(sky1src->rst_noc);
+}
+
 static int sky1_reset_probe(struct platform_device *pdev)
 {
 	struct sky1_src *sky1src;
 	struct device *dev = &pdev->dev;
 	const struct sky1_src_variant *variant;
+	int ret;
 
 	sky1src = devm_kzalloc(dev, sizeof(*sky1src), GFP_KERNEL);
 	if (!sky1src)
 		return -ENOMEM;
 
 	variant = of_device_get_match_data(dev);
+	if (!variant)
+		return -ENODEV;
 
 	sky1src->regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(sky1src->regmap)) {
@@ -343,12 +393,36 @@ static int sky1_reset_probe(struct platform_device *pdev)
 	sky1src->rcdev.of_node   = dev->of_node;
 	sky1src->rcdev.dev       = dev;
 
-	return devm_reset_controller_register(dev, &sky1src->rcdev);
+	ret = devm_reset_controller_register(dev, &sky1src->rcdev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, sky1src);
+
+	if (of_device_is_compatible(dev->of_node, "cix,sky1-audss-system-control")) {
+		sky1src->rst_noc = devm_reset_control_get_exclusive(dev, NULL);
+		if (IS_ERR(sky1src->rst_noc))
+			return dev_err_probe(dev, PTR_ERR(sky1src->rst_noc),
+					     "failed to get audss noc reset");
+
+		pm_runtime_get_noresume(dev);
+		pm_runtime_set_active(dev);
+		devm_pm_runtime_enable(dev);
+
+		reset_control_deassert(sky1src->rst_noc);
+
+		ret = devm_of_platform_populate(dev);
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	return 0;
 }
 
 static const struct of_device_id sky1_sysreg_of_match[] = {
-	{ .compatible = "cix,sky1-system-control", .data = &variant_sky1_fch},
-	{ .compatible = "cix,sky1-s5-system-control", .data = &variant_sky1},
+	{ .compatible = "cix,sky1-system-control", .data = &variant_sky1_fch },
+	{ .compatible = "cix,sky1-s5-system-control", .data = &variant_sky1 },
+	{ .compatible = "cix,sky1-audss-system-control", .data = &variant_sky1_audss },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sky1_sysreg_of_match);
@@ -358,6 +432,12 @@ static struct platform_driver sky1_reset_driver = {
 	.driver = {
 		.name		= "cix,sky1-rst",
 		.of_match_table = sky1_sysreg_of_match,
+		.pm		= &(const struct dev_pm_ops){
+			SET_RUNTIME_PM_OPS(sky1_reset_runtime_suspend,
+					   sky1_reset_runtime_resume, NULL)
+			SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+						pm_runtime_force_resume)
+		},
 	},
 };
 module_platform_driver(sky1_reset_driver)
-- 
2.50.1

