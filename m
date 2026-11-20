Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795152939;
	b=xiK39Rjs432JdnDGxOkExcxjKTwBY1j7wD+KveaADwSFlTSVm4VmLfJZNrFROdHoBPb8
	 6/uzis2C4USmdAbfZoWvxQrkY2jlT8eQxLT3S3wOvuyRJiXsTyqJD0prltSGmzsFIRTP7
	 /RDsg6Tb5JZSPjBdJ7VHKv0qgg30ejIbkmjOqL8Qb5XoWKhjRY94X6tVtOigFFH4kkU6a
	 vazJxroY5kGPa1IaaZOGL8e+oSSpUf6E7UjPSnlDz8SFe2xLo8kEpBwIAn8FeVQbNY2ZJ
	 CFiYJPfw3NTVQ5p5bI72fLcyXmwZnSCdefZ97j0BnWuCULCuKnYxNhovQ9whJaLQbyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152939;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=nzwWT3ESrbmTnBdheacJ7T2KZemBnvRCxOtLHQCJeuc=;
	b=ZdngqX0otvHBaL+BaMGGYL76MauJb+8Gsyx4ro3qpTjY0gBHhQMSZH0256Bn7h5EPVyf
	 jvPV4gHn2seMDcJRBR/2ITFG8BrwQMlXo2PdQIUQE/x0rp5f1Y2keLUpAW2xjm08/xPMd
	 6uZnLRfrDqBxzXF8cDlP/ZD8rhbbj2s2YtmJladyVCyJbI+o1kx3gwZnQRaPx0B8sglNr
	 TrtCIl2ltNbGF+VYF7eZbiAazaBX1r+1XO5ta4phvJqHWcdO1UmR+9kGrKX+EL/QC0tDt
	 gWwYWOy+gp5jms4kcRVX7P7KdD622fI9bVC1TdLjdYomvvT+JxbMeuZ4JDotYGNAfmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.76
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023076.outbound.protection.outlook.com [40.107.44.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7F60A261D;
	Fri, 20 Nov 2026 05:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B7F60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuBXvLhuzYbCPJcQohDg/9hnFCY6RXdWu9xul6XZg5KxTkneHzM6E2KnhMFpnRcUOSC3i5unxoDadvOgcmcfdusXcxB4u4DdXL6/4kK6wn380Qj6Fc1FzASvzGRAGnc1hNbLYk0CTwgvcaH3yDboEfSEUG5wQEhV0Fh9MBJbIjGH4jgtXTG0jm7aMcuVBZKWsZ37uiLSqO8lPRNOVoxNaSI/C0BQzljbJY/X7nxa7cxdRaHys+AZgDhaHKwPTSxCwp9fhe8+GWUY4eOPq+znylUxXCPcj6GOzY5i+xzE6Izch8NrvSQWMcxrtYZ8CoUKQ39CVZCIeIo1K2+1IFelCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzwWT3ESrbmTnBdheacJ7T2KZemBnvRCxOtLHQCJeuc=;
 b=PUPVIQaOkfAsi66TQr02fmkop4oWS13m6EbrqaPp+yZ/hqFBIwXctPooHEskueJp9s9o7ntAx0H2+7P7l9S9Ne/Y/qgi3afQaU3WdqAjiLNVW/y29Yo+ppsw6/Ch1f5RG88Ml983vLJsl/H2xzg0L+6LIr96XFGg3sgnLxE4NSXKXhWUM1f//YKyYDZqsrbgTOFAWhsiFrJNSEinny14CaddNYgXhGfTCq+XSJlOVzTp2TxJxT0Wp0B5du3ANawva7fU0KgLUN8e49543dstG9hMoZdIbUIdm/OM7V6/kwK3NfWyRPLPjm+BDhuOLpzo8L7CTv0+FGZ884dwIGi/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0050.apcprd02.prod.outlook.com (2603:1096:4:196::11)
 by TYZPR06MB6076.apcprd06.prod.outlook.com (2603:1096:400:33b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Fri, 20 Nov
 2026 05:35:34 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::78) by SI2PR02CA0050.outlook.office365.com
 (2603:1096:4:196::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:35:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:33 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 746B040920E7;
	Fri, 20 Nov 2026 13:35:31 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v5 4/6] clk: cix: Register the Sky1 AUDSS IRQ auxiliary device
Date: Fri, 20 Nov 2026 13:35:27 +0800
Message-ID: <20261120053529.371923-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|TYZPR06MB6076:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2de1c2da-ce88-4ba0-db90-08df46c81911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261021123027099003|261028144727099003|921020|261102123227099003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	AAe3tQNMvG2GkioPp1Py4E05aq5lKq/fGkVhhdz+GQMfEfaO7O7PuthBrwx1o2qRPohg9+jxw1Mt+v0EuPoNXWkI70Gp0JW/38GDkYLOe5jM46setgbOfQTPKEkkrS8k4sMo69M1e05da3PNRAGQEGUzY7bbOngbSnl2EHF/eXMtvVVizUmuKJ1JbPX3s3R4+TVm0fFEnx3izrsLIJf7y8wXaiPdw9xneRM65QvBvd3wNloWcrXCE2PrKaMwyNd1wike/rHmCaXmkbRU2O+c60/UkKcYVuzft7DwfD4ZF55GWgKhwfq9QMkxmTTpzIwwC+cJdAjGtL9gpUYkYxzcLmNO5FtonOuQokC8+IJwWwff0MwPztfi6PbAAaCSCmyQ+TjV7aRnWPhr0/m8ltm6eEvg90NZLUcfM9isvm5pic6mE8AQdyQBKIa8n6TUMTndD+1jCR/KCYGHnQ3IPf2G/RjkqZUNNmgJ0t31/T5fjtO0x/WDQt8bBDBQAhlRpmNXAwYyXZY2gaPzXyc9sAsyPHIfiZZhTciggNO7Tm0JfRimDipanvKFz6s/I2gqxMe9+5LJrd7PoAGSUF2k3GMXDhTw1rJkSDz0KFpHSS81Pta+av9RuINrb/iCe/KkJYdiTy+snUssT1MaQWp6dRa25L68KxIoJJ4nI0N5lldYeLmuADlOwbUyldwdEh/zubMuiZSbHrcXbYrayRL6kwEYAngEMPGi+iHg+3M7Cp/vXfvY1Y62NWGDpQ0VVSVfyrCk
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(261028144727099003)(921020)(261102123227099003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yE452XGkgxgfrNMkr2qTzEb+5Z6iZm/B1qAyV49V+W1xdYxXAHKvYNVArSMjDep5CmURJHb3K/IIyZ5lzjm6x3FJVhXkU+C5MnfGUGag/veBhkdnz3TBeHu/hEXiPCeKKf/LZGtSlHIbdxNUdyVip7NC3T6fnAGI8Bmff2F2xf5mXWDEc1aF7CB32QvccwZOHqOtbacdctb8cAgW2xui4J1cK/UXrcucYNoiH3JjTbSnXN88qEJhgWc43Mn+jduzyQ6AlGjWt4fxDL25ogbHmUiDKuKxZwFnF96F2Q2O29lNV2QZpRjBNQnh7VhPgOaj9h4x3dUdGyUt/siHphjjMfHA/FPM0Bu0lXLz6hDNSM/iHUKTDuCYGOAbgh5xwIdiH+F7SsbsZ7ne5gzGSamnA3C5gdXHIc16xxJFJRu+J+cLavUoycwXPF+kO1MN2789
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:33.6003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de1c2da-ce88-4ba0-db90-08df46c81911
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6076

Register an auxiliary IRQ device for CRU nodes declaring an interrupt
controller, following the existing reset device pattern. Share a raw-lock
regmap with the IRQ driver so its hard IRQ callbacks can access the CRU.

Restore the parent before child IRQ delivery resumes using noirq
system-sleep ordering. Use the same PM callback macros as the IRQ driver.
Auxiliary child teardown must run before parent regmap/runtime-PM cleanup.
The existing reset-sky1-audss.c is unchanged.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/clk/cix/clk-sky1-audss.c | 45 +++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
index 1da86f6def4f..34edd19bb95f 100644
--- a/drivers/clk/cix/clk-sky1-audss.c
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -523,6 +523,7 @@ static const struct regmap_config sky1_audss_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
+	.use_raw_spinlock = true,
 };
 
 struct sky1_audss_clks_priv {
@@ -932,6 +933,31 @@ static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
 	return err;
 }
 
+#if IS_ENABLED(CONFIG_IRQ_SKY1_AUDSS)
+
+static int sky1_audss_irq_controller_register(struct device *dev)
+{
+	struct auxiliary_device *adev;
+
+	if (!of_property_present(dev->of_node, "interrupt-controller"))
+		return 0;
+
+	adev = devm_auxiliary_device_create(dev, "irq", NULL);
+	if (!adev)
+		return -ENODEV;
+
+	return 0;
+}
+
+#else
+
+static int sky1_audss_irq_controller_register(struct device *dev)
+{
+	return 0;
+}
+
+#endif /* CONFIG_IRQ_SKY1_AUDSS */
+
 static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
 {
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1114,6 +1140,13 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
 		goto fail_pm;
 	}
 
+	/* Remove auxiliary children before the parent runtime-PM cleanup. */
+	ret = sky1_audss_irq_controller_register(dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to set up AUDSS DMA IRQs\n");
+		goto fail_pm;
+	}
+
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -1123,7 +1156,7 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
+static int sky1_audss_clk_runtime_suspend(struct device *dev)
 {
 	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1143,7 +1176,7 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
+static int sky1_audss_clk_runtime_resume(struct device *dev)
 {
 	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1172,10 +1205,10 @@ static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops sky1_audss_clk_pm_ops = {
-	SET_RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
-			   sky1_audss_clk_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
+		       sky1_audss_clk_runtime_resume, NULL)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				  pm_runtime_force_resume)
 };
 
 static const struct sky1_audss_clks_devtype_data sky1_devtype_data = {
-- 
2.54.0

