Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9D437F011;
	Fri, 18 Sep 2026 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744097; cv=fail; b=vBH1Xd9s3vOtu987GbGB2hFiINbbrKAsWlmDTEkJi/J923p0PuXikkvmlCg4qs+5ZRg0jE/UEN1V35br8+F8KobXtHkP7tS8d7L31cPIGTtvYeF+lSvvoSnR6FbWbilamRqADHPLwCmYhIWzCZupD+Cjm5t/Ujm+BXBVJIeDCiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744097; c=relaxed/simple;
	bh=SqgCUHOlW2m9ngWw2zBrJMbQpjsE+j8V/a+E/Y6iBfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M/4eTKkUAdud5Dcc+RDWZi7B/+OwJpBZ54PrpxVewxN6duyjTqkY+pX1xGr+UGEYP4Qd0p/lIJw0jQvKT4J10hRZZUFCAgQ3ZKc07vzijtwq+qnhtJzFAJmaPEsls0UN0fHay5prTDQYqGwkGex0J+4V0QMgBOyYy3ScEgdX8w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=r+Ky2uQO; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="r+Ky2uQO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVK8j08koeZSaz+SzYSKfHyBOfJLZN41c3LZzY9lUEZxpXEiF1Gxd5EGsYblAnEdc++i2RY5nZ/6CY/hxgEvaEl3rua8ol3r7oCKcp7R2jBJTyxlcAg+SivJ73mE08EJ2tgtSUBSOwP+jSrQBACzWNQYXrZ/jKMYXLnwfnxmNDHqWLUBpk6ERVXqQS0cgTHf6DwcVZOAeVlw1nSYPvXCmG5H4AQcMigqBaJ9zZUsbDw0eBWVxKnvNNs53hUgZ0wG23Ogo79B7QoT+P+2KRl6vNUnlwJlst3JoOvlB/OZMFG4rEzGFbrSNGZzj3Dg9p8BE6r1gXRWsJCu5pB4pepXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1dCkunPsKyx+15enbLpIEcoKHPe7c1+NmIfRlxzdi4=;
 b=VQSYE5VCLIjRMlR7hEChtlwnP77Oa1D604WlRRuBhPUoe6/fAayDkQ7pAM8X3asHywuue6em7ppT0agyZcDqVdvVTZwZYHlfcilmZuSvnC3Iq6xPcu796+q3QSLT6A+Y4i7ttRoK4m71PrJkW415qYeow3gEZk61rgmdCD9NzHj35AKlICt95sBLkWVk1qXeN+fy+0FVftnAvKyZw5wPiINQfCijguvwDrHwOdtPzDWrOCvzp449+nsui5DK11GMYs9dlzq0oPJIDWzpVxQVBDyb7tBWTGlKXGlelI1zdLC/0ActSw0tTcwxWUtADvMm7KNhnoWqdCQowm8/pHXRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1dCkunPsKyx+15enbLpIEcoKHPe7c1+NmIfRlxzdi4=;
 b=r+Ky2uQOC6CV8+JkLZFqVA2FAsJ/NFDPF8lrDVdarP3STA3tpdN3ur8zlf5Bf8oS4ikfbqvgL66I3ULX6nbo526KHhPt8v+0eVIqWX/92p7SV3LcBPWBgePbx/EcNMyBF1WtuFSHBwrsPGbohvfViUuXw2udz3pvVPFmrT8L9TI=
Received: from TY4P301CA0058.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:36a::18)
 by OS3PR01MB10170.jpnprd01.prod.outlook.com (2603:1096:604:1e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 15:08:10 +0000
Received: from TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36a:cafe::66) by TY4P301CA0058.outlook.office365.com
 (2603:1096:405:36a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 15:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005621.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 15:08:10 +0000
Received: from biju-VirtualBox.adwin.renesas.com (BGR-5CG2270RS1.adwin.renesas.com [10.226.92.53])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id C575530007D2;
	Sat, 19 Sep 2026 00:08:04 +0900 (JST)
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
Subject: [PATCH v2 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and reset
Date: Fri, 18 Sep 2026 16:07:18 +0100
Message-ID: <20260918150730.122056-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918150730.122056-1-biju.das.jz@bp.renesas.com>
References: <20260918150730.122056-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005621:EE_|OS3PR01MB10170:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0aee1fdf-b5e0-4e76-65a5-08df1596a76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rAxKS6PiNoDM75sdSbCPv4j/b8I3Z7AwDE+ej5RLPaP9BhgijxMz5v5A1qKvqfKF0XFUNkP9nw4yCMSa6mnxsew1QVEAf0X3rswl3fPblzm88TzNEBhZ7fNFeEE3u2VlmRsT3SLzpVPlVmvi5Jp5vzrZH1jxzlE6GUq564tceVbRpgDUZdR7wZDH18QN6XJfWVBMf/1+F+xksivucTW0PzggCFRwipFy0cVSRsUi3mB/unQEJvvwPT2lr4EzEHBRM389WQjSJGEdm0co2eu3k3UYoKICPWZp73hVKlX7rIhpz+KYI0Y4V6X8JVazjXJw2u2KlwAmAF7qQ9J9JnXtYjNStQdR46tOoC1S83zNrCh8IKQEQiAciaRouj3NFElztPcFTX8vFSXChlofJnLS2P8fSjpcoTKwvK3rhEFd/cUSmUwPzfCegcnvXXxP9zip233c1MHCffaFmS3uTQvt8cY+FDcIEY8gz0Bu1D1Cl3Xm16Gv7pdJiMh6ozzW/CEQL3Quy4sz7tc3Qad83dflMF6ZM8VVxHV0ryICzXxoEbtxsag8rlr00DxxMUJHeqlZZ3XT8xitepCtzyqpBtfAb1cADvBxaCLv+lgqT4BG47mAB3I8vcAkA0fEBcqLYmwVUx+E3IcXrN/arLUPoE0HEZi0rQ+GloWK8hSUYMiF6a5Z1hgsbVXD1INKpvWQzBQz9m2GuIhIWQWjnEiUDXxm2A==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s5gpwENkaQpCK/lE6WUBO/7dPw8GYjxHLgWmzQUNlIXxwXRAsPPfaDeNC3ABD4P5GZyiLETbXTIQ92tUFpzch1bh/JlXeMLDwqliLyeprA6bPjExCBkTTen5rz8pxC3mRX8L7z/UN0gOEXYJrdWXuDOsA6OOGeFuL4nVWR1ImWtmFSfvBDoqfEH6i4boAeeQk1FnC9ag5Ms+dlhQV3KwOmtmkVRbhqzZIMlLV1aI4fGhONoU084DvjBOxEefJhy5IShyZWH1YVVfiKG+o+5wHLniT98VpKcAH2uhqKIisj4BpquSbmyVPwCK02mr1Ur27ixtAEpd3JUMTf6eV8XWwDgtDQfUmr6WS35rX6cxJp5Lmx+de1/kqKJ/GBzTojD52r9XC9UJxZyUsO4j7acHw5MvlXqQIF/8xt9jVmAnqcp6vS8CPB+YlI9JKh415psm
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 15:08:10.7636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aee1fdf-b5e0-4e76-65a5-08df1596a76d
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10170

Add clock P20 (PLL2_DIV2/8), module clocks for ADC1 (ADCLK, PCLK)
and TSU (PCLK), along with the corresponding module resets for
ADC1 and TSU on the RZ/G3S (R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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

