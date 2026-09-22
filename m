Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2E33EB7F0;
	Tue, 22 Sep 2026 04:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051253; cv=fail; b=OGB/gUPSvrSDLBt4Bri5SyG/g1Zr+MOzUHsL1tbcPKU4RDyBXEHonNVHTIiFuw3MUpDXfwjavCvC+c13jygO4WDq5+/I8yJ6ENJuWZBKH31CWFdef8BtQ3WIOhW3+zTNh3a/95YWcaGtaSoWrwttV1Wp28Gb80iICtUHpf6Kfps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051253; c=relaxed/simple;
	bh=xIvONCwOw9iTcG/4S3Jh2zdzf4mBII6Mh2M/EVoLFUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FuyY8SoOGwx7dZBtj17sOdXAzow3NC+CLvh1rDZkSfURJbtgYHXmquUGiNIo7es2g9GZJydeGpSL4fBsvu0fRpRzfw1hFm4kvuZd12gM5PtzoYYIPKICcrdfaSKNjMCvwA2O38HeOlJC303l7qDa4DFsA4Qgo7WpRwTcS82V2JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YFc1TeFd; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YFc1TeFd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pc2H8/sTb63W5th9u1N9uyWKiqml6g9hC6kw67GQH+LKwMWblPvFsPs9bl/0bMwRXp+baNdaBW3nL7m+XyjGiYsqARRKUlAwkf2cn7VbY8C9TIcND3MsRbZkcD8DbFcGUpayo0L9NMbjkZBiUaAsO86UC/cPQtfqoXUO6FkW/kPvURnYPY88nQTiaTKsM4q5LGKcEN7zZ6mxhV/B7aQHayJjILhAsTYYbve20cxz1mzj8YuwVqyh5Os6LsgMEAdFdBhV1rW2bW+ZHbikKoInbqfXqBemIPfebHX+IgyUeQkhJQ3BRUWFrPgo6jzI3SJVsjjocBh687MzmdFZxlqoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxNy9b+tQRgDDdRT2KVcRqzPeqo2JCmaf+2b95fDTqw=;
 b=St+++6f4eat7ARHJ7CJQjVIf4uVd2FN8rBwpjpGm4Mr3n3jPD7kh3cUSBc2OpovL8rTnWDTBujKaRdFq5P0HT1ea7JT2hFseY6fPm7IG4k5TB7VSiNt+wx2cNWDOVgMJah/c+GQeOShSYHDJfUHEwQ1sxeVb6Mh8MCL6jvQDNOFBCNfZ70ofzJvfIlrChUU+HAIQXw1mdwcFBBeZdpMQJ+mANhxCmiflnpop8faSt5dJ3OwQKwlx5clcUTEjMKk4jk2+Nt+76Gk0kDJ7u7izS+ko6USCvN8c0Fh3xVR4eGMMOqZksOmuHlgFF+bK5JvZCcHe4FgjbeJg9PlACmM7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxNy9b+tQRgDDdRT2KVcRqzPeqo2JCmaf+2b95fDTqw=;
 b=YFc1TeFdj6A9536v7kubRG6BN54GzSnJh/sxpRTbtMx7VHeF2YFENFoKkAVhHs9B9WoixiR6ghzs9jU/Ux67CPK8Yb+UFEpJQwLciBZRyf2fVI1OASrk5PigZK1Ln1uKhOdc0O5DkWsFhvupLlkKm0MvThlGroh6exyTdP21QPE=
Received: from TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:38e::19)
 by TYCPR01MB18248.jpnprd01.prod.outlook.com (2603:1096:405:3f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 04:27:27 +0000
Received: from TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e:cafe::21) by TYCP286CA0333.outlook.office365.com
 (2603:1096:400:38e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 04:27:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005025.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Tue, 22 Sep 2026 04:27:26 +0000
Received: from biju-VirtualBox.adwin.renesas.com (ree-0065939.adwin.renesas.com [10.226.92.1])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 86282300028A;
	Tue, 22 Sep 2026 13:27:21 +0900 (JST)
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
Subject: [PATCH v3 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and reset
Date: Tue, 22 Sep 2026 05:26:53 +0100
Message-ID: <20260922042707.116378-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922042707.116378-1-biju.das.jz@bp.renesas.com>
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005025:EE_|TYCPR01MB18248:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8b146abc-c300-4421-1f4b-08df1861cea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	iEI1qJGaQi0h1aedO6qjayh9DTpeQdYbWtxjfvxgdT/dfX1z8raWFtolZN/LaFkuztsx90FLY8fzL3tJcmkVJjUfG3rwB+/YnSRDaWbQalabgllC2ZuY/xCrS6IcamNV8FS/u2SHotkgXOiEpoasJlQnR36EDOscaPc82tCYhD8ihZU4KkKT5+SU95R/kT9BMpC0u8HoeEM+cSwMTAYkDQEs6ELwHunHcHC8o3e2TS6b6kuEe96B2eVgHKIxkaYkqyK4rZNf7+Qu5vsOciROB9pEwHOkr34Jcv2H3xrGTO1L0dCT6i7IdtxkClA6Aq8fGtQrOHPKKXo2LiJZXj/HfRKefF7Lzs60mLAyBM0ZBQu4mOWSklyZUZ3qj8i7pshz/9lirqTsh4q36JNCtDPWI+SOJ3plA3nxoNwYrgJtLBYhcqx6ZMjSr+Qt28D6d3P3USCGUyE13w2JxaVI86SFLbPQUE4HCIGAQ/YFI11W4aBywNcuQd2E/0I4J6iDurkbkiP2rHMICfu6A8zrYAwqd1gteCqoDMKQOg7UFuEkbdtKXLLTrKSwaFRuz/jYKK2QA41QT8xwhtmrw7Ex7Uhz6265UgG7F6nsa4oHH1N4iDMXtZT8pLhHckY9sLSan+Z8uTDni/wVGY/h/hNUMzhaoTbMDV3uphnsSccZ/QKwfr9iC7Y/y+Ik+Dn/daVIfeLTce0HQO9rGDr/8mk+8L0FkA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8fAZfJVexQVaaiFLy7G2v/1Vre+sGiq5U3PUAXjNwzhWqfaRRjNtunqxNawrSMwIJKf6B3ABfgOTx8A/0z0eLNdA3VgNS5tNX95bkZC/qOT4OhcjcC7nkjlYRGggETbPLce2RHhUcshZcUU4JiwQw1HK5kFVG8jja6Ye2FnxuJkIjS6tUhcvzZYBE7necBnP0q6+ImMjFyoBlloF4y74NHj56BAhdVz/NLjRWGBcp2WnqgRrhs+s5U5cC/8sOuUzS8z0veZVIE+VdDF6qUCjzmX2p+Lc2MwTEhuUb2pdiPTgUi4cB0/tR0/mLL4NB20SqTJT0r6gQ7m+JVYC17CUTUi4URe26Z+yV6X6V1V01wpn0LOGHsHbeiSuCogdt0JjV9tAYUCIBk68d4md0+e2EUaiuwB5oor4d1lHPU2+6WQfRWgtizniaBAXunWwIk6O
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 04:27:26.6889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b146abc-c300-4421-1f4b-08df1861cea0
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18248

Add clock P20 (PLL2_DIV2/8), module clocks for ADC1 (ADCLK, PCLK)
and TSU (PCLK), along with the corresponding module resets for
ADC1 and TSU on the RZ/G3S (R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
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

