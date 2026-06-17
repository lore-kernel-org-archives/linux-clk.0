Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023104.outbound.protection.outlook.com [52.101.127.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC133B38BF;
	Wed, 17 Jun 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781678470; cv=fail; b=gtMWSwigfimu46XXQEwoKmpu5wGZO1b0TVqebMfDhrs4It2aGYR0rcyV+D4I8wImck5Sd3rUMXhKsuaRSfoC3AKqwEgifLOYRFtbup8yh4mJVpg4KT/4J+3mUdVvx3H9Wgu+R6XGZEKRKYzMZa8S+wRtI1uouPOZYIDArot7X0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781678470; c=relaxed/simple;
	bh=y357f0Q+wwGVaItmrLWQrRDFKxWRyjEaE7wwUt67AY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CeI8JidyKd1VsGEOzL/YFpY/RT5D+SOsiiwgJksaM8RP+zyVNHxe/hmJJvrK5g2m5FDJcp+W3nBoSoYOl45LqCW37UimYllOrtlHorl+jsQ08OWtOWSxRGg5bBAtKN9DNhMGKxZ9w0vkYgaX/mulAXPcmWlwAk8yS0Th3MJiijg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4hjG0kefOkwTPXxhn/ziVyzVf5eSzhrr4E5AwPYCYzmnwBDm2MYzcH52Dw0zzplDRH+ImruI5np9uo5oxMywkyTGunHcGCFay2MPeAA9GaIwmjZz2fmgHya2UJYRjy67a6JI3wx1uytG8w5x9bjV1CyOupVJ2564SmZ4TwmhYUjuy5EWIVRFSixizGK6yKQYsfc6NyH+CAGHnFD/xaFrxZ2I1MZuEKdfsukvvU5BJ6gZPhBVv73WMTDpuOzo80LAIzomrJVmXKKgV1r7Igic5L3WYh7qK8iO+1mYTnQ2sXHjLgzdkzzuY9ezo2eKQBZt6p+kc5Q4rSGOomKfbjUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hlJkBLYpPcqdtIPZeETX/10E7tYOmp6HNvxKHpyvUY=;
 b=NGZbWcunnIaRL0XPX733brvpt9/Z9i55jpriBKEBFD2DewAij/ik2/gyPJqKCoj593nhUrpvkX/vWClmIsDvjW3gGiUAh3T5uJr7/sRxJByEYeeqGrGEzzvPY3qRLfjRE3avdDTE9XapB/uvt4uBybyIQNGGdehS2mKPErpLnOGSLiv6WOUbx/5JUQ3KyChi7/ovjxvrWRLR3T+B4tgPS3BmLraU4fir9HlwT42IMLh+evpXA5jBNoVKLqVFLKlP1WSafHHGWTWdFBBT6H1UIX7GSIqDHCN+vwWaF5EQ4E97Vk49c4aE0DlUYFpA4rBhcdzlUOHWP+WkKDTwUiVe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) by KUXPR06MB8084.apcprd06.prod.outlook.com
 (2603:1096:d10:50::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 06:41:06 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:4:189:cafe::49) by SG2PR01CA0193.outlook.office365.com
 (2603:1096:4:189::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 06:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:41:05 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 24ADF41D4003;
	Wed, 17 Jun 2026 14:41:03 +0800 (CST)
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
Subject: [PATCH v4 resend 2/5] reset: cix: add audss support to sky1 reset driver
Date: Wed, 17 Jun 2026 14:40:57 +0800
Message-ID: <20260617064100.1504617-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|KUXPR06MB8084:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de2d30a6-35cf-48e2-4425-08decc3b6813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|23010399003|82310400026|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	STizVlE89SKmm9Bpb5M1R134f7iBTlCJ+pTgHRcDVy1yi0hhNkq0w71lbMcbDphLKKPpUjbRiOU/UCA1HH2GFCSU1Ignq0u3ISTArgwKfylv1pdTenjoGog3N+6pWYTPgYOhWJ0bFGiBknE1ASpkVuTMI8Lpdsk+QPjoAQHQhsicjKjRUXZK9/8qguVsRf9V8HQiQX1WA32ebMl7KGpD4XDWY1a2hr608X8ZMbd+5X8OMDtBi4EMZiMfKsk3gw5kVdaiEmYiPSTLOXIox4ENkbdF+bncqnkSQz+tXVi9gLj99AsRfdOPjsXyxVTo73g2KtqQkYLFYj9cvTTvurm1bYqPd6CEfo3QL3oWubzI1HRWjn4YLkst7eZ2lJSBRxNc59GV55pU+2flUuJe6/Z15+ortIG/5O95yYg4/y1tjq4do73pRChutwT583bvEpZ7Obyb5G7tZBAokWruZFxiYaowWTOiC5X1OnIYj5QMflIQI4mQewHZAVSVk1lkSMU9QGLwqn8q0M12jerwLznjtVfqHar5Qt29X+fKhiooF59074j/8Ak4AShGSbF1ASCXGfsw4EPf9hBQvZGXsKP4/h7bS7uTNvv8VV1RzqDBFXccdhY1rz+5nhvym40G3MTFzn9fA2edVTpaP2nsT7tx7UHwOQQPaGwnzuWdSOS7asscV9AuunW89eNPDx35HJzpvEg8HYYcnO0GKsDZ7ufbOGGbNCMMdm4yq85cdJ8WYGk=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(23010399003)(82310400026)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ap7HU5nRuA8VAxYLn6IjEZCcyNfB0vS5wxklmivAa14UhuwZi5VI9RWlANXJrEU8HWd0bImfZ549x8NDoM94nLWB0/JmFFE8h7OGFPoUdOyVsesJOVCt4JGm67VFlFOrDxMNtbUoXBrKWA7SSpqnZ+4laajG+TJBigQOc4FEDgsnUqBzzTYQqMN67PWe2CgCvR0LSlEQAlH/e1EwVVd7Go7rXme80Z1Uf7ua24dZds/QduWoiujLT/jTqxY8K3A+N6gsV2NqQiOCD4bmaiAzji5gL9dUZwkLEAqIVb6mDtiMlJko7K6YlDXna5eQ5Tfauj3bEhvOgjHTzWKByJHGT0dd+e/i+2iRWxRxG5iWrsmGWvjUcd7wD6BL4b17kDQpe2UuwwX0K3j+yyqb6A2Eo2m6QOKIHw0Dzp5ncylyqzGswxJaInir5ouP6dy/6U1R
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:41:05.2106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de2d30a6-35cf-48e2-4425-08decc3b6813
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8084

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
index 78e80a533c39..af32ee005ebc 100644
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
@@ -323,12 +356,15 @@ static int sky1_reset_probe(struct platform_device *pdev)
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
@@ -343,21 +379,65 @@ static int sky1_reset_probe(struct platform_device *pdev)
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
+}
+
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
 
+static const struct dev_pm_ops sky1_reset_pm_ops = {
+	SET_RUNTIME_PM_OPS(sky1_reset_runtime_suspend, sky1_reset_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
 static struct platform_driver sky1_reset_driver = {
 	.probe	= sky1_reset_probe,
 	.driver = {
 		.name		= "cix,sky1-rst",
 		.of_match_table = sky1_sysreg_of_match,
+		.pm		= &sky1_reset_pm_ops,
 	},
 };
 module_platform_driver(sky1_reset_driver)
-- 
2.50.1

