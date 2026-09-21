Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2675949DB82;
	Mon, 21 Sep 2026 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996816; cv=fail; b=rYer3ZHwRyDvrhWFWgLjKzt9dikCa0FnotGg8MBee9Lxvt2IDh7kyLCxwH+ic1PwXwVzuSyi9jjYqs5xdVE7wrowoChP3QcMAuW8muFDWkkb/BJs+Qsft/FJls/wb6QNBowQ5o6Ot+FW9LudiGJ0l6QpSUSB27RgEZ/XvFVkAhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996816; c=relaxed/simple;
	bh=1KVZ783IXnZ9HfIhhEbCficdREnHQ0TEtGkzeWwGw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTlXxZyxRZe7cE1JhZPFBOLh6bWHSGNZdUEa176rpLJNr0ifiAXm8GoC86n/WqtEmSRNCCgkWIMhdQTvyOBPZdRvt69Q6nmlwylPXtMinmu9u9+58w1jbdFN4gtMp5ub2fZg0eltotHhMX6AivzcR27uM3An8WXal0g0wqBz8ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UVdmLufm; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UVdmLufm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7De9xy4KVzDOXIKtU9C/CRus9LRWjQ0u2hXoFTJAV6n/xrzBNAnsglD90khzJTiVexYhJa0C5A7Yp2I0t1HmGrBf3xDPFaAwgeAFVc7l5T9ylpeyPM39czNudZNaJNVUBEsmqlSpNmUvme0sBx1Eqbi8NLFkwllLffQcciLHWlH5V1C17dedTbfALYHT82eX5dnLOF6kcGgCeUPFaMOTpP6Rcs4QizWFws2oZBriLR8onvU/O4YtuwQ/Lq7EeXkeaxYkx3Ge13acND3hfjT2mc8c1sHRvhs8lfIWL1e9n3XmSHoDU3RUHvVsPsivH6fyTtH9bQ76XohS2G6AxTSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WNzzmFF1ifwO70wToemigjrQb/eU0M6BMpyAOQECgY=;
 b=WKNMjvXeWIvexdsWnHGepKp9k07+/i498wvO3e7LlZpZAXr6oYQCLrdJrylYWOoO2CeTbmN9hRcpRN4w723bSsd+lQMWfBhY+s3JvRtwBgz9Zrg001Yssht3U5+7Eu2gmumpV4QA7P26gRjlDwLK8xuJauK9HYR5LQlNNGjPgqLfNXEvgEL8x1vhd5a5sZwCtKbid1Emea3ZzoHH08CDKnM/2eEuJOkFrb8zlSnYK4q/EDXhhNu9HyC9jdYBvrqS5z5ott+aUKnJZq70xZOKdVihGUm4qJMrk+yfjPrmXYxkpfwz1IKKRvvNaoHnSYiyNg0AWxCnrRgjOxC5YDsdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WNzzmFF1ifwO70wToemigjrQb/eU0M6BMpyAOQECgY=;
 b=UVdmLufmwlAbRfINoAlL+/oEykJI3/no3Z64+rRrfkYTGgYcn6D4gLN20hnUB1SYU15Njz8l0KnffNHqBkmAAxx5wyqhby/INAQh2s6+hbKXkUdEkapqRsX8xEiEKrZWY6KT8voRzwpLZtn0gcHFtv/kgmeRuOt1F3PGNcqKPvQ=
Received: from TYCP301CA0070.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:7d::12)
 by OS9PR01MB17103.jpnprd01.prod.outlook.com (2603:1096:604:45a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:20:09 +0000
Received: from TYO1EPF00005021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7d:cafe::29) by TYCP301CA0070.outlook.office365.com
 (2603:1096:405:7d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005021.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:20:08 +0000
Received: from biju-VirtualBox.adwin.renesas.com (unknown [10.226.93.82])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id CC41B3000283;
	Mon, 21 Sep 2026 22:20:03 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/5] clk: renesas: r9a08g046: Add CANFD clocks and resets
Date: Mon, 21 Sep 2026 14:19:43 +0100
Message-ID: <20260921131951.187981-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921131951.187981-1-biju.das.jz@bp.renesas.com>
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005021:EE_|OS9PR01MB17103:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 58b7c3e9-e750-41b7-0cb4-08df17e30f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M2h/PsGUru8+AixUnUk9RHCj68g5jKr4rik8Vs6nMXYLJl4mVfNY3pkRNzFocwYMzuKbFNwHbRn9PORwiauXkvV3AhdH3gJHnA+cV6zjd0QUtaFWwAXbmkXbSnLz/sr1uhkm58ihBEKYKz0nkHRGPMlL6fMaNV6xDsXQV/vUsjE0q6qX3IqRn9ciiDzW0txFuymIW6RlL29HKt6mGMSRkZ+fAnMZqOV2M8yq1RS52tAB5/rMexxu3SWhie2HooSl5+atST8bx2jiK2M031MBH32xhzgcjNfCRREBGsxwRPWdJj40J0RbM1Hse8EaStms72tUfdXcRSM1OnXQpUgcHBI9wXjZepzAGGLeh3hr5Dxg7i7Ajb/RPiwXyj5YaftwlRzBHgqQB7Au5oem6untkFaKO8kEQ5fHeb1ctAm+86zKQr4YdvbbsAmgjd86bjQUCELjxXitJqVuebA7eZgf82upQMkHAqxeXildZrJO2sMq+7iD5YxSy6vOB8K0pFyWJM7MCVu0ShGiQY1S5FKf1KVtCIq1Ei3Jx5ycLDVdOWIDn7aDtqVKVoR0wGLFurT2H3hBjR23uFLaoQXcXC9BM2shnQ4ydrxUus3AgHScP7gEj3PkFZ/qECw/ijMVJHvSIl1dshLW6M5WgOHZDZ8NGNqSSpT7xTfUeoaujE7sc8PLvq4wrPczYl5CFnU1JVARKYTQCbv613WoihfvXIoFXQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dmyNOMWoXZmoMPX+BR5BJHRBOGMRb4bs/raAacyAwimgiK2fWvpFVcxl69LGrK8+WDNHKaaVbwT1rJltnxIL5ywtSr7FAdI6lSLYLeltNz1FFeor33w3Y17QNZ3sth48eKRLBXPBgV+LyUaGMTnhf/vNIZC4H078KI6wGD8o2IzuGAH/0pLzdSRA5gmtyxFV0DN8VkL0FDBoW6s4mZOmhpjWNGllaEwjsTFYzat+WPGgu6Xvl/e3kouowomyGKURZx8KWgXiNYMt7VP7Vl651B87jq4w3DhRUr0RibH0mA9kdyZYxz824q291hO+crc98KR7vwB69vBaQmuQtgy97idqB6nrgUqmeuFXI1os+nfLUupZtsU2IcEGdTciLTN+Ke5XdaaVB/633JsKI1JW2OopQ2XTrM4Q+5/51B4vznMH46PfQXHnhmVrtPOy/QZm
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:20:08.9948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b7c3e9-e750-41b7-0cb4-08df17e30f3b
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005021.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17103

Add the P4 and P4_DIV2 core clocks, CANFD module clocks
(canfd_pclk, canfd_clk_ram), and CANFD resets (RSTP_N, RSTC_N)
for the RZ/G3L (R9A08G046) SoC, needed to enable the CANFD
driver on this SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 92c76c4a1e89..a077c1f27a81 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -162,6 +162,7 @@ enum clk_ids {
 	CLK_ETH1_TR,
 	CLK_ETH1_RM,
 	CLK_M2_DIV7,
+	CLK_P4_DIV2,
 	CLK_SD0_DIV2,
 	CLK_SD1_DIV2,
 	CLK_SD2_DIV2,
@@ -337,6 +338,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_8_256, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_FIXED("P4", R9A08G046_CLK_P4, CLK_PLL2_DIV2, 1, 5),
+	DEF_FIXED("P4_DIV2", CLK_P4_DIV2, R9A08G046_CLK_P4, 1, 2),
 	DEF_FIXED("P8", R9A08G046_CLK_P8, CLK_PLL3_DIV2, 1, 8),
 	DEF_G3S_DIV("P13", R9A08G046_CLK_P13, CLK_SEL_RSCI0, G3L_DIV_RSCI0, G3L_DIV_RSCI0_STS,
 		    dtable_2_16, 0, 100000000UL, 0, NULL),
@@ -560,6 +563,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU1, BIT(15))),
 	DEF_MOD("rspi2_tclk",		R9A08G046_RSPI2_TCLK, R9A08G046_CLK_P19, 0x590, 10,
 					MSTOP(BUS_MCPU2, BIT(0))),
+	DEF_MOD("canfd_pclk",		R9A08G046_CANFD_PCLK, CLK_P4_DIV2, 0x594, 0,
+					MSTOP(BUS_MCPU2, BIT(9))),
+	DEF_MOD("canfd_clk_ram",	R9A08G046_CANFD_CLK_RAM, R9A08G046_CLK_P4, 0x594, 1,
+					MSTOP(BUS_MCPU2, BIT(9))),
 	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
 					MSTOP(BUS_PERI_CPU, BIT(6))),
 	DEF_MOD("adc1_adclk",		R9A08G046_ADC1_ADCLK, R9A08G046_CLK_P20, 0x5a8, 2,
@@ -646,6 +653,8 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_RSPI0_TRESETN, 0x890, 8),
 	DEF_RST(R9A08G046_RSPI1_TRESETN, 0x890, 9),
 	DEF_RST(R9A08G046_RSPI2_TRESETN, 0x890, 10),
+	DEF_RST(R9A08G046_CANFD_RSTP_N, 0x894, 0),
+	DEF_RST(R9A08G046_CANFD_RSTC_N, 0x894, 1),
 	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
-- 
2.43.0

