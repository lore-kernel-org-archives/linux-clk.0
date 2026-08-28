Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2122.outbound.protection.partner.outlook.cn [139.219.146.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D2B3F44F7;
	Fri, 28 Aug 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913118; cv=fail; b=JXP/UpD69Yk4hmwjke51kMWkBbueGq1rxb3wVxotcYoxh/TeZtlpxUiEWMyUO4ZlN77A69KkOJK7sW6kAx1zyKVtaGTsotwxAZgtKAnnUAOv3vaIs/KMfpG/ASdbU3xSEUnuqwvZKCz+LCjAoAlHwIGb07Fo6r/mYtQXLfqNV8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913118; c=relaxed/simple;
	bh=jNxPUlt8Q9ZPFsg5P8oF2tNOIjexvRP500v5p5gQIN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fCqpVGNE58T4WEmipbPN1P0vuDEInXfqHmV8S5Eb3r32LomO4yH4QSU5gJZ3+QkxjszFNryZCFM4vvN0faiNbEnNTPUAAh8/UXXvqMIx7B38HvtBN5Ot94Q5maEu/oAA1ZM+LucqEa8sbQpA0qzo8PgG0SWEVXhP+Z/zfyfGar8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfW432WChC9RdR9YBcZBvhCvZmf1DLDk74su8ZcxKPRV6T9GfCZ2Mp29VmPKv0l+BMqngoZLM/Q2atzMH+NPx0sxtHFO1JRfJX6iklGgG5yNx84A2xE1TvLDMklNFM1JolxM6QTwMcvJcZ02NK1bhP/v/0ZWZ7+bP2AwghG+rog4Wc+0gD25BYgbURRioPYY3IOTlL6tWAv2Sgg0pvCdD9ZsOAYKq4fvx6m6Rx6OJUM3Ns01Lv+tMgNW74hhxKDw/oins6yjvJnG5zQT5ofzhoh2UbNpHuDoY+1Zp9m8dvDtcZ3I6b9kgDHnZg3TUfk8kl/3zIpEKtp0cG2sTao8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6ipw48cwRTgYO61wqFTnV1knB9CJ57TW9nnr9smMac=;
 b=GWJC82SMPXKnDIUX7ZUHfO4I2GecYY3xHdmmb9iiUDyB4xTLLsGnXM0oYpUhsVOpQ/lycyF9qIjOxLjwdPF7zcycG0ebdnYlW6u+s6jvTfIx6xp9Mix5kwhj2+SrElhNwHfxrTkrE0tenjzdrF/3eO5PaCxHHkECRUZgO083NNfyjDMP3hXZOVKfY0zAC5iZVaWkl13svKs5wQs8dl0WfodzXzuXeq6k/7fsv7KXDqX27mJwDNIxO/5OjoENovnUZgDgr4Ig9cDyTUanm2XVgG8C3GEa1yrk58Slt2r4zoT5ODK/+9DttCbr27g4D3etHlX3TrM4vfRCNibq0g3r2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1203.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:24 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:24 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v5 3/8] clk: starfive: Add peripheral-0 domain PLL clock driver
Date: Fri, 28 Aug 2026 02:56:03 -0700
Message-Id: <20260828095608.19955-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::15) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1203:EE_
X-MS-Office365-Filtering-Correlation-Id: e699d0e7-bed6-4ac9-f5bf-08df04ea9ed1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|23010399003|366016|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	LoCxzrfb5a7p0ZjOeyS84wJgf02Rmpi9utDsdWE7b9IIVQ/vLSwnET6tLqoE6rCgvoWUUWR4dXZxfLvrBvkqBoHPhycBHR1mEWcp2S/OhzS8MhUxgX5M3t4xFiRmeR94exB7KPGdY6sN7JqxZHKqXuMx8HG5iAbp9MNUhtD/aKx/zqvfHjPD606jsPwp83UciEDewZBY2bXR2Kmn9CoLWtlsPc/qOhFM+IwupZuUM/PdmOdLWwiDeyrFTX4wNvHwyAC1iGV1hzr7HfCIXdD1OuABr24L11DnAQp6PNco37/vS0yf50VnDpZjX6CEWqjfhJ9T/Iiu9agkeIXuoc0J4AwkcpXYWiUtGqfHd2DS62KdHZOkQONZIbqCGT+RHm34HCUsRIsmlHT9oHbZhmFINY+99BbFW1vZYpBodFw7grQcsYMIKiKb/lMPpqQnX4yfalJFxNi1cw2L8dc0gb2hhX/7lEtI8Xtfm6kfd9mTGve3LK3cs182fTlWRSrFfznxtEjq2DR4zMzlY5DK4KOvSqJwWEzpncAAIzGQl5kX0NDao7Ql3rXlvbB3Lel2bJ15vnlu+QD0cSA2tFJoJIm4nQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J42Ik3oSRK+fGE9h7akZaqS6E68YqNEAcsAm90RQ4T2q4BmOBM9GRFWt9dWs?=
 =?us-ascii?Q?MMPmPxQx2L/K2wvmRVbtF+/f0y/kJKv50he4MHmSgodkY40HhB8AmSqDUSd4?=
 =?us-ascii?Q?y++1vqre855FxOTr8gqJ/5OMMh7mC0kUIHIr4uMOetlfKSjWKI5hz5SB1ktR?=
 =?us-ascii?Q?pXoenfrqNOEMYNBIiUYqF/+JeW6dAaUHZ0NnBDRGAI4/D6J7A1Im7xnpr/tJ?=
 =?us-ascii?Q?ZQMiXABjwsnNyZe1Atv4jefJklleUH0Q31T6gJtvJkOpzKmRfvmLLj74yAmT?=
 =?us-ascii?Q?hg9wASukVpw1DXU8WGlvS/iQZyJ7/bx//9E5jxzuAQh+i5N031u72AnW+RxB?=
 =?us-ascii?Q?b70VK8paUcVjb/f1o74VQStxWoeiMXZiKDWzfZvvBclmYY6QnSoy8pw7OmiP?=
 =?us-ascii?Q?oC4QOirl7rcsNGGRB8BaUWZMVrBYmFvUZKx3EEWZ2Gee4LqWIGqk1xsh364z?=
 =?us-ascii?Q?+Pwj4W5BPnu3P+yIGQkkPNwD9pBmHo3FycHnJvafYZHVNlMQSkMHhLyqoIll?=
 =?us-ascii?Q?VuCaElfaMs+M+wapGOAfCeSNAIHwFxvs7Jl0a6h1kIs1QDC0MHzRCBBDEL9k?=
 =?us-ascii?Q?llnStb88tVU24R9MKZ98BvpOc9G4nore+UdlopvwuPvKJ/VDzFeRDutKrpDF?=
 =?us-ascii?Q?Kv/N08+8rsulf5NojV3NhGvphkdNgF0b/dssJEv8jEHWKoUBWocQ6ViK36nM?=
 =?us-ascii?Q?977S7aVKJfUAEdXP4MT7fqtPvYfTcDocchc+1HQIAJol2hbxUqV5totJLMrC?=
 =?us-ascii?Q?NsObXsP497/sY+zqYmWdqRE9ltlzuhlrFRCthg6ZG5vQJTmuOQX5B05qAoQJ?=
 =?us-ascii?Q?RCx/44hwCLO8wPFDmf4EotP4CDcWLG6quNt85BLrcexrHxiQvMTvjGiczS0U?=
 =?us-ascii?Q?F/Kxls3hrxJPHPG8smHlW7IiEl/0JcBnvmRZJ4MrgaTyG+ArXmS2MoalSdpP?=
 =?us-ascii?Q?1HBjs9hUHeANIKyUMcYd4nrIpkzKdB41NCHpVaHosy0mnBZYQp78JZy58Hkn?=
 =?us-ascii?Q?d64M+a2lTQKu/gE9vLvBEeyXV3jI4gPw92wq2DlvzHok2TJXZ3KCBsxoUair?=
 =?us-ascii?Q?UjKaj2cfc98pJiDi1e7WRkayZxPEyeRcuiJ+KKOPUpQorxYj6FtChNoNjhvd?=
 =?us-ascii?Q?X+Bx5x2zflK9Njak6MP6xhEPhkL5cyD4d11uoCD0CouO0OgdVMJD+xx5D1pj?=
 =?us-ascii?Q?JyxduN5nTAuOSmPoZz3ost04sWFeTMIaGsYrw7VWYukbOVI0XUfLd3/53JuO?=
 =?us-ascii?Q?IVl4wXMUrLuoFqk+nDB5DOpKuU3YUZpv5uXcY+mqBggWiuy1f/+Xo6i8+zOo?=
 =?us-ascii?Q?1ybmsOG9LMcJ9yIw2Lb8ldWdG7U3viLBhHCfo0O3ZrZz5VpzXWV/XL2EHv4S?=
 =?us-ascii?Q?DMYoaiYD0ipmAPaTufm/8TiTvMk68bbbhKUCpqtBtsUdsZJHxg51/QIZYOeB?=
 =?us-ascii?Q?A6rLnLivXNVkKuKmXaSV8j+JHqY9W91Wo6TEsWghFh/AE4hgC8ANVKwJZM31?=
 =?us-ascii?Q?n1wVbQBRqJSfkCNkPWYyI0iRe878iwyOxYCI23r7OMhOVfHhZXbqm7wlOt2G?=
 =?us-ascii?Q?x3fXFD8Px5IMufN0E4FV5RiqaznmX1Dj0oKuo3nXMYgh/LY5MIdxytl8fbMI?=
 =?us-ascii?Q?4QelKA3LLQGZj4/fox5ma/qfKga3LT5NIraJOWWJ/SViqd2kfQcqMoGeTR16?=
 =?us-ascii?Q?UzRJjKu35siZVkrN6fm901JRlYiAV42/b7Coxsj82J41u3JrQT5UaktpLdxe?=
 =?us-ascii?Q?oCccd44mtr44IxB4pj9PMaFqUnjWbVMmvUhKUDFq4vDMV9+v6/6K?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e699d0e7-bed6-4ac9-f5bf-08df04ea9ed1
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:24.4689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EZIjZfTpUOH7UwzuQmo8oC92SjUKowZrVGc3l87CuZlA+sYjt16qIgJyoMoDM7GzfJQLBm7TUqnaeAmYiy/hMdltJiNHrXe3HldsDVv7lNcGqD7XxCs4ODAorIimryv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1203

Add peripheral-0 domain PLL clock driver support for StarFive JHB100
SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 60 +++++++++++++++----
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index e23365164497..f6ebaaf5aa18 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -30,6 +30,9 @@
 #define JHB100_PLL4_OFFSET		0x18
 #define JHB100_PLL5_OFFSET		0x24
 
+/* Peripheral-0 domain PLL */
+#define JHB100_PLL6_OFFSET		0x00
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -417,16 +420,21 @@ static int jhb100_pll_probe(struct platform_device *pdev)
 	unsigned int idx;
 	int ret;
 
-	id = platform_get_device_id(pdev);
-	if (!id)
-		return dev_err_probe(dev, -EINVAL, "no match data\n");
-
-	/*
-	 * Instantiated as an MFD cell of the sys0 system controller,
-	 * which owns the DT node describing the PLL registers.
-	 */
-	match_data = (const struct jhb100_pll_match_data *)id->driver_data;
-	np = dev_of_node(dev->parent);
+	match_data = device_get_match_data(dev);
+	if (match_data) {
+		np = dev_of_node(dev);
+	} else {
+		id = platform_get_device_id(pdev);
+		if (!id)
+			return dev_err_probe(dev, -EINVAL, "no match data\n");
+
+		/*
+		 * Instantiated as an MFD cell of the sys0 system controller,
+		 * which owns the DT node describing the PLL registers.
+		 */
+		match_data = (const struct jhb100_pll_match_data *)id->driver_data;
+		np = dev_of_node(dev->parent);
+	}
 
 	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pll, match_data->num_pll),
 			    GFP_KERNEL);
@@ -504,6 +512,28 @@ static const struct jhb100_pll_match_data jhb100_sys0_pll = {
 	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
 };
 
+static const struct jhb100_pll_preset jhb100_pll6_presets[] = {
+	{
+		.freq = 2400000000,
+		.fbdiv = 192,
+		.frac = 0,
+		.refdiv = 1,
+		.postdiv = 0,
+		.foutpostdiv_en = 1,
+		.foutvcop_en = 0,
+	},
+};
+
+static const struct jhb100_pll_info jhb100_per0_pll_info[] = {
+	JHB100_PLL(JHB100_PER0PLL_PLL6_OUT, "pll6_out", jhb100_pll6_presets,
+		   ARRAY_SIZE(jhb100_pll6_presets), JHB100_PLL6_OFFSET, false),
+};
+
+static const struct jhb100_pll_match_data jhb100_per0_pll = {
+	.pll_info = jhb100_per0_pll_info,
+	.num_pll = ARRAY_SIZE(jhb100_per0_pll_info),
+};
+
 static const struct platform_device_id jhb100_pll_ids[] = {
 	{
 		.name = "jhb100-sys0-pll",
@@ -513,11 +543,21 @@ static const struct platform_device_id jhb100_pll_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
 
+static const struct of_device_id jhb100_pll_match[] = {
+	{
+		.compatible = "starfive,jhb100-per0-syscon",
+		.data = &jhb100_per0_pll,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_pll_match);
+
 static struct platform_driver jhb100_pll_driver = {
 	.probe = jhb100_pll_probe,
 	.id_table = jhb100_pll_ids,
 	.driver = {
 		.name = "clk-starfive-jhb100-pll",
+		.of_match_table = jhb100_pll_match,
 		.suppress_bind_attrs = true,
 	},
 };
-- 
2.25.1

