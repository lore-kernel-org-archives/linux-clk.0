Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6700E48821C;
	Fri, 11 Sep 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133859; cv=fail; b=EYpRLL8FgBXZNTGo/s542tWB1SBEevlvqQRSEi1VTtu6JCwpM1EiNm98nt6VJSjAOcWuhwc1g8luGT6OgETX/gkrGcKhM2bp5lshMmz16++HmtvdHgmykCTBqaj0h+KX3HNRuFgXsFwtcEFY1QqXLsTJwucLqwb07/4gm748ayw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133859; c=relaxed/simple;
	bh=Lxw6AO++aYjSxyMdBBD6q1oPmz0EUoi6gZvVbYb9+3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kie2VV9naiKB0FLSMhW1v2z8NowCj+81G8W5Ufx+4MLo1jlsRT65DMlIrOZBG30S2iDt/ZTLYqu/8JWtnNydG9hN8St5JF7owKcmisrf5gaYml5bOKRrJL86lc9xem1ynzojcDJu0tXiOILsOyU5tYeLQFkb7sl0mLiUAgdHbVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KNUNaQlb; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KNUNaQlb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D07ENaYUDhZSrtWQEMblrpZHtmuWZUOWSYO2Cv/HGWUYB5j28Nu+wYOwhho8xle/MUqBxatkqVN24Df0w5ypEb6zS0bNfjI59PxtRl3CLm9BP+3h5TdsKYkCFFkvq/6lYW/cJ8M8e0olEcO0g5+9jhU0dCbjJudF8DEOg5sAQp5rF4l9QKMhb1gYtP5LiNFJHimxGHTa4U28E3WaIZQgaHc0iVpVkkX9PMha3WEksjXakZIv8waeiGQkrwJ1ivIQgGB9+ywFgpZ16jVErDD4C5icklE6JQuLeg/SrYxhvXvUuSG2Qskd+eZjlWZMYoY1xd4zkRLbiUFRrErDfnaz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnJWmmLvLBWxAs2vZuDsZCJIrSSGM1534MPrffzf94s=;
 b=biwEC4dk+jNuMm99/9gj8LOSLIM0AjUjy9d5ghWbbY95ZrcZwOrKo5v/cgnXkrZ0fBS3xFoOL7dvl3MEe8OsWUS/Hw2PYQ0Ena7Zh5BmiKb/dgKRaBMVs3DX9GcxYugdX7t3EhJZTfs9zk9lcRJH5is5+9cgiq4EqtXVvItWKv1zqAw1vT75M6t5PubOkFaZi0yR/jyBjhs1/r9Eqbt9WWKH0uEbs26150WYYnNZYm07RlYzn/BbYh4ng8a0mL5+4J1oPt1/BOxQjbW1OssBGmBhm8YRpUSIU0rMAHUg8HYssXVocJfYjWmRG6WZDIm1abby/HYt5lcGO9Xmh+E2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnJWmmLvLBWxAs2vZuDsZCJIrSSGM1534MPrffzf94s=;
 b=KNUNaQlbHzjSF+fivg8AJcNO263Gf6jo6nddcXPsznvUmRsDBJFfrx8y5n7qER/MJ5dRWTV9/LWsx/YCgVtEzXI1WgXT2HRK+k1RwPFiJ7S1oYSACG0vUbIe2vgHrhE0o+V6KtHSHOK+tKFRr0lKD+bgO1siBTNoFmrc0SfPf5k=
Received: from OS3P301CA0038.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:21e::6)
 by TY4PR01MB17199.jpnprd01.prod.outlook.com (2603:1096:405:333::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:37:35 +0000
Received: from OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:21e:cafe::36) by OS3P301CA0038.outlook.office365.com
 (2603:1096:604:21e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 13:37:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20F.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 13:37:35 +0000
Received: from biju-VirtualBox.adwin.renesas.com (ree-0065939.adwin.renesas.com [10.226.92.175])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 3E3CC3000250;
	Fri, 11 Sep 2026 22:37:29 +0900 (JST)
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
Subject: [PATCH 4/5] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and reset
Date: Fri, 11 Sep 2026 14:36:47 +0100
Message-ID: <20260911133653.115553-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911133653.115553-1-biju.das.jz@bp.renesas.com>
References: <20260911133653.115553-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20F:EE_|TY4PR01MB17199:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b847eab3-e4c1-4008-47d8-08df1009d6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	4MWAiNzs5P6pXylVU2Hp2i4D2IkdAoufE/epyK0q+DNFfTr6RBMe5ijXy3HfFfaLVsd5hoyulA+6wGdA66CEDwSJscRkYzwbRyaY5D2mWU09GOrjyRnP/0zxPhviYz4xKBOAVRJnU8jENy73uw3lnYQ69X1m8k82Twl5izn+4/2j6TEgj1+rEo+Q4KWRLYwCG/adCmHFO5nh9lB8srJ9GszMB6qyYggnu2j13VOXTaHBmlOQh04tsmbO2qcPJiToBxR5IiljUwkNeh51VNnU9ogcIoX1F2AdAmWvRzL0U9YyjxwR8H84F3CD2dRuK18NG3BbJrR6AzWDwhYlS9lLqkrurB3HlR8YcRo6xrDD4bySAOlz8D+0j77MePyrkqZbUKVeHQR/vO9/UI5xleV3wqxBNLue38mGM+HUJFGPiWcvQdvoCoD9UafNrKJttYl8BGUy2MaDVS6LG9X2O470ka4oGn3nof6cjx2Q7ZZeQyCankf2WgosNgBXotac7Z5g1LCUD8a7z7XQFvEmrhQsb1qwYg3tk9INlS9b9kd6Cd/Qbf8TX1bxSrXl7S8YUczBeXcH4i/1smkKpnNQmBFzYPfXm8peY16QO0PJhsf3poF7tFtzxisq0neJWzRUz6KQnTOoIRihcfeMXZ/KAWMGqQ98eOYJegyHR+0MW/vKbmrPVrxH5J87tHREu6RbWP8FlQY662q8sZjpGVgE3Xk4VA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3qnmUxKmbiWT26QHLmgtZOU5mMYbkBDwLfYlLSM8nUvYz98sXr3O7zFzYzsw/87j+ZW1xfUqKoxpw/kHH74zKiCMBrmmJ87401xB9k1q/EfcnDIpmkQqzQfTbctOOEwFB427W3bbgj9RWfZIU9gR7O7sQ2uVUP0XY4wIi0WaHjEnP1XHSvEfh1ioH75HYBA6CNc5gY924w8TFoi3VGk+pUoXbB/qs91h5veJ8QGx8HyxXsuuJIYfiCislSDEq/JGQsQpXXUEpk4vIypv7l1hViwQVoUP9qLJzEdrsvglBRicDjj6e0cTdnc093o+k3LzD3ElClCBv8ZYfp2bUMIFjovCFFPwJsib4reFexm/SWopWiAexeEHJa9uuc4wTIDK8T+HMhNaJaH/5vG/HiaQ1QnnwtA8dRT4cSMN2fXPw/grZ/h25Kp3L7JvS6L6dLSM
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:37:35.3860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b847eab3-e4c1-4008-47d8-08df1009d6ce
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17199

Add clock P20 (PLL2_DIV2/8), module clocks for ADC1 (ADCLK, PCLK)
and TSU (PCLK), along with the corresponding module resets for
ADC1 and TSU on the RZ/G3S (R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 22821321a1d3..2c5ca5ab5f57 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -350,6 +350,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_1_8, 0, 200000000UL, 0, NULL),
 	DEF_G3S_DIV("P19", R9A08G046_CLK_P19, CLK_SEL_RSPI2, G3L_DIV_RSPI2, G3L_DIV_RSPI2_STS,
 		    dtable_1_8, 0, 200000000UL, 0, NULL),
+	DEF_FIXED("P20", R9A08G046_CLK_P20, CLK_PLL2_DIV2, 1, 8),
 	DEF_G3S_DIV("SD0", R9A08G046_CLK_SD0, CLK_SEL_SDHI0, G3L_DIV_SDHI0, G3L_DIV_SDHI0_STS,
 		    dtable_1_4, 800000000UL, 600000000UL, CLK_SET_RATE_PARENT,
 		    rzg3s_cpg_div_clk_notifier),
@@ -559,6 +560,12 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU2, BIT(0))),
 	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
 					MSTOP(BUS_PERI_CPU, BIT(6))),
+	DEF_MOD("adc1_adclk",		R9A08G046_ADC1_ADCLK, R9A08G046_CLK_P20, 0x5a8, 2,
+					MSTOP(BUS_PERI_VIDEO, BIT(14))),
+	DEF_MOD("adc1_pclk",		R9A08G046_ADC1_PCLK, R9A08G046_CLK_P20, 0x5a8, 3,
+					MSTOP(BUS_PERI_VIDEO, BIT(14))),
+	DEF_MOD("tsu_pclk",		R9A08G046_TSU_PCLK, R9A08G046_CLK_P20, 0x5ac, 0,
+					MSTOP(BUS_PERI_VIDEO, BIT(15))),
 	DEF_MOD("pci_aclk",		R9A08G046_PCI_ACLK, R9A08G046_CLK_P1, 0x608, 0,
 					MSTOP(BUS_PERI_COM, BIT(10))),
 	DEF_MOD("pci_clkl1pm",		R9A08G046_PCI_CLKL1PM, R9A08G046_CLK_P8, 0x608, 1,
@@ -640,6 +647,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
+	DEF_RST(R9A08G046_ADC1_PRESETN, 0x8a8, 2),
+	DEF_RST(R9A08G046_ADC1_ADRST_N, 0x8a8, 3),
+	DEF_RST(R9A08G046_TSU_PRESETN, 0x8ac, 0),
 	DEF_RST(R9A08G046_PCI_ARESETN, 0x908, 0),
 	DEF_RST(R9A08G046_RSCI0_PRESETN, 0x918, 0),
 	DEF_RST(R9A08G046_RSCI1_PRESETN, 0x918, 1),
-- 
2.43.0

