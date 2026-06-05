Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023085.outbound.protection.outlook.com [40.107.44.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCAA3655ED;
	Fri,  5 Jun 2026 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629831; cv=fail; b=tCYYe+RG6t5tD1rnfPiFcNkYmdL2RiZEk6pekp16Qh+a/jHCL13OXk54Vb9Q6rz0CO/Ah8Inq2o+qiiiLWFLr/wimOEZN0fIZQPLrD0XUaO/DlvUMnpQkNJDeS4STd3zGAVkSn3ll/iPmN1ceZ7rsVwp6uHzdPCKbvADpdNbdjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629831; c=relaxed/simple;
	bh=HAN2K1qL/asHw4VFSfG8g/t7GM9waHAicDK/UNLkyeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6DOLKDkUIbRgjAbVcF52RWKnLV8iMyMKhjmZvCIE5LNmcLIgczirwPCi+hhPy9A3MIwNpLvqo9SowHKmg/ZM/5MkwqOyEbaHkXb1MvlpchMGLOnCTRn8PyocPIw9H0oPm3072I8EZAr4oWtiFbhy92oludaPVQ+r0/z8Hw91y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7F29dybWEhdHpWsvQKpfnjbJHOSJFCJwGGhrzfLaKvlfe5Pvh1ZYoiiJ/jQ9paUKlMYfwjmtpPpdsFny5IWSyLZBrR4UBe/EceBYLXlzdH5fqAUW5i2wihnsm/O8NPBAUX8i9pwfmVVBw8U5NL9L3XA0Z0fG3MvCQD1jBWXEI3pJr0aKs6srv5EIfY2gDoYFWFAKDoxxVV4+agv47X1f3ZQeNK+O8T8jPri9YnPqGiGw59U9s+Oy9iW9PrNzqzU3VJFUYJ/tE9fwmF0en+2W6CEiTmL9ND6nBw9uGupWaeL5Zc/+E3WT7j/lD+D2MBWebETFQ0L6rvsdgA+zZezBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eStjkTf8zCvwgenDIUF+sE2rhNMOr8T1cbk4UFRPC0Y=;
 b=otvlvkFs9I6FF2R6XSfXuV8lfShuijzrpA1U5iJ7s4yc5IbQ+JcrM923QbzqTRUf3PQWB5G1EGqWV84P3pUDLF/fS2SlveADYj2BGzRLahd9AlAvGv/8pjoS2zYJd1uQfpi6QpfT3pSgvUgtn0wKL8C+KGkkrlsVH/p2HM2bp3rcHCY/KaqO/sdYIvPiEH0mze+UXnaDUk/0KIuEVfNfrzz9H4zF0M2ZKa5QeFxrNEtuw4q71tOWt9ULTzdgghvQawwtI0WOHggSTZI3XgYLAjEIgVhO/fJcBll831iNMHPXGse5iG2TmwnOiohvA87M0hU9cWWT390L8NMKnuGN2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) by KUYPR06MB8914.apcprd06.prod.outlook.com
 (2603:1096:d10:9b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 03:23:42 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::34) by SI2PR01CA0008.outlook.office365.com
 (2603:1096:4:191::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 03:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 03:23:41 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E7DD74084272;
	Fri,  5 Jun 2026 11:23:39 +0800 (CST)
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
Subject: [PATCH v2 2/5] reset: cix: add audss support to sky1 reset driver
Date: Fri,  5 Jun 2026 11:22:22 +0800
Message-ID: <20260605032225.523669-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260605032225.523669-1-joakim.zhang@cixtech.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|KUYPR06MB8914:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b0ee41ad-d6cd-47fd-7abf-08dec2b1d7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xr6n8Avl7o9frkpTDEbQFK/AmxTARPzDdYBKOzSz/dyORCzsXJke+RbJ1lOod2wklf+8haB4v58uDCP55IOVCRQOE9AwzcmW94ElQj6D1MXpe4b0NRxt9KDOQxvdDsZYpxnZ81vEKONMiG+XrlTYSF1QZAAulReY5IO0BGTGVc/mixM888YecVKO28dqDpGOkvGOp6eslcISeYlAXhD6UUkPVHNIBTyOBdH3SgJwbQr+cWMPNfUwRric0dQcorfpmTVA5I0mL4S4zZM4Eg53tSa7zk3PGJD05CsuRfl3lnYRrifzjrk7a2oKVGGHM2Y/HYYDyWVPDKusq4jhPVoPgaAZHLMR3G/89snlGr+6IiHuLF/K7UN1LJh93w2ml7acdzT6hSGFNcWLCJYJol74a6PD5CMY597mRo8aEgqBU879SOWVZjsOT2NgVOMvtdGwvXO69LzFYVzmDJ0TLSUFJ70Xp0nVtKwGrmPjhYwYIEIAPj2idwp5Sh77hLgr7kJJpA/bItXMIxBTq4PqrKDLF2oIOe5DRKFjQhXMyGon9gWJ970Xt1WF6bZP1Un+PYXHCLLjNKp1FDqVH9tcTdGFEdMCl6+uE66ep77mqbHo5/a5BNmfPI9eEVbGl/B99Lsuv8uu/Ladf2xL2MWGYsU/mHPdarP4ccuAAiaqpyIgScLLIOg1tDsfpCIzo/7h4iT4/TYb0L31nd0GbaB/DJ3coLNkNxa5PvMqC3uKKVAGXQI=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FMOcfrtPJ6Wc+v0h9F4jEBWAdplvHeqHMwSofIeQOp5rnZpBWlu9Ues1ds/dOD9yYQf019/xtyYXM333hNkcckMy+EWAyPiQTOakt8yHba/lV6VVMTuI4WYy/6U4IMzasxKDnhtiC8x7AYcYzVutm/0MXkW8jJIYBkk2C0joWO+g/rI7dLhYVs49nGZ1vEAvu6EopUSAe9wsZjghXCuQYk6Fp+HH694qOoUX1cxfN7E5BkQVA9JmwWkEjTntg2jwZ8XCm+P8t05WsGVn9iBf3Pivv5nm03oVRGs4p7EvVDPG22EYijtITUNYKYC/fMdVZs/4piIWLWRdwSBvzXlBtXdfBoK67oIgu2QeCjl6qDXtqWHOZpSHbWGtrug1VdMKK7DNWDuqMK4eLsKHKcdIKhwojVzxBdkQC1xlvxWfkANurkIE6w1006EPM3ALt3ZO
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 03:23:41.9092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ee41ad-d6cd-47fd-7abf-08dec2b1d7ee
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8914

From: Joakim Zhang <joakim.zhang@cixtech.com>

Extend the Sky1 reset controller driver for the AUDSS CRU syscon. The
AUDSS block provides sixteen active-low software reset bits in one
register for audio subsystem peripherals.

Add a device tree match for cix,sky1-audss-system-control and the
corresponding reset signal table in reset-sky1.c, reusing the existing
regmap-based reset ops used by the FCH and S5 system control variants.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 drivers/reset/reset-sky1.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
index 78e80a533c39..ff91ce93c16b 100644
--- a/drivers/reset/reset-sky1.c
+++ b/drivers/reset/reset-sky1.c
@@ -16,6 +16,7 @@
 
 #include <dt-bindings/reset/cix,sky1-system-control.h>
 #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-system-control.h>
 
 #define SKY1_RESET_SLEEP_MIN_US		50
 #define SKY1_RESET_SLEEP_MAX_US		100
@@ -258,6 +259,34 @@ static const struct sky1_src_variant variant_sky1_fch = {
 	.signals_num = ARRAY_SIZE(sky1_src_fch_signals),
 };
 
+enum {
+	AUDSS_SW_RST = 0x78,
+};
+
+static const struct sky1_src_signal sky1_audss_signals[SKY1_AUDSS_SW_RESET_NUM] = {
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
+static const struct sky1_src_variant variant_sky1_audss = {
+	.signals = sky1_audss_signals,
+	.signals_num = ARRAY_SIZE(sky1_audss_signals),
+};
+
 static struct sky1_src *to_sky1_src(struct reset_controller_dev *rcdev)
 {
 	return container_of(rcdev, struct sky1_src, rcdev);
@@ -329,6 +358,8 @@ static int sky1_reset_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	variant = of_device_get_match_data(dev);
+	if (!variant)
+		return -ENODEV;
 
 	sky1src->regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(sky1src->regmap)) {
@@ -347,8 +378,9 @@ static int sky1_reset_probe(struct platform_device *pdev)
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
-- 
2.50.1

