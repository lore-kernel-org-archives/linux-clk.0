Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795854984;
	b=a7G5Pl5w+NpB4SEG39/mySWzXV687sFpKZ1ytJz75InmD8d3Ai3BDa2KB7N5DU0WtWnL
	 0x6PiYC9M7hwvgzWI0yyRFZbVODty1iOAfwuA3U2koFYuYCbDzhAhsKfC3q2ZMPWmbpxT
	 ZxY2qkjSXrlS2w8zyPRf1UwYnlYlcepK/EdmC2On8Gzdu+MeyHn7WP5GXKJiw8b9W025j
	 gCxUZU9FIN9lF48GbRRYh42zeKHZg+qUGZ3z9tVM4uChDf/6F1kZo+mXp4vJUJU5003IA
	 K7WSIeRXl4ixsZlIieCGGE4G7nAJxgNzKhq4AlFbrLvljzmthIAWcjgnnT2jdNXciNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854984;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=j4XXSaLqWoi1X+9pDHCBsv589bM2gIFjyZgs6NLxAvo=;
	b=SDnDBanMDhKerqc92xTOhWCno9UrJvmzvGYC87bt9oolHSNBITeXz9LvWBmQZVp4ITSK
	 6PQYgQ5F+5udNXfOD9gvd6lm23nQlnJCseMF/cC3rs/z1mUmmmtD/e1c4u/h7s3LYhm1z
	 j2V6x19rq+RCvawFjB2IZ9nmam9BvauXxr4KAYqAPh8YDdPjO0c6CPvFOCansMTnJMhu0
	 bqEpp5eYNPiDikfVAK8wAB9dU/4i6JnpxQrz/Tkq49rdgMv7/K1ETjA3hAZWro5QJvt8C
	 AULI3x224jK/+g0pkeXbKHktD2bVvVEdS0qAdcbIE9DEYiSlKQwTP1hDvePKhBQx7Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.97
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2004606A329;
	Sat, 28 Nov 2026 08:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2004606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnqQr9AeqrCBolvsmlP8SOZWgGrexzw0G1zqqOXiuhiP6ZjR5c0BcpcPfQVc5Aq8Fu5XMvD+9bT6WERnsdngjZUhexxv2agWQVj5fXvNrCU+YvI9wx7RON2ZgO9T7OBEAf54SRj///N8Cem28paFYZtGEwEHmluWMTdk3//gqWoV8BORf0RGUhG6YpOl7Fh+usGE8n+iNji4yiL6aWrflv+nPiDbwOks5Z6lTgK66B47Ec3e1BwZz2hD+PH7rfEooQd+vviSNeN2MJPTM+YUY9uyExQVR+JxYOlLhXwXFqU2apAhqhdR3nLOySW5/KLqGSaK5l1uhvJLP2Kf6YOF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4XXSaLqWoi1X+9pDHCBsv589bM2gIFjyZgs6NLxAvo=;
 b=R+3RheMxrR97d8HU19po7u6axvDI1ScaPMdydCspddyLalPNXFFqF3U+FrRREpIvzDUVk3k9noo1Am5o4qsD61giUcMXDkbIY1xSc4SfteJfMqmvgTXKNPfYUbfHkzKku95wyRdXapY8A6RfQ+Yk/b8HqzP4DxzUWiSGqLgePZLbY7b/JhAG9vGA7VgjB3TygmWhroXmuDjRM94LZrDI1XnLfK8z9S9s4kJThiYTTgQxW+6+8fwEota5n2wDaN8DJsitwK17hzOsr3Ayl3w1cwic6+zDmtxKEwU7evfjVab2osmx3UDUYZA5CBEK3UFpod8GShaTMQuE3IUTVpElOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1313.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.17; Sat, 28 Nov
 2026 08:36:08 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0639.015; Sat, 28 Nov 2026 08:36:08 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 2/2] reset: starfive: jhb100: Add System-1 reset controller support
Date: Sat, 28 Nov 2026 00:35:54 -0800
Message-Id: <20261128083554.2993-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261128083554.2993-1-changhuang.liang@starfivetech.com>
References: <20261128083554.2993-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1313:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed75e8f-a953-44c0-063a-08df4d2aa677
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|38350700014|10067099003|56012099006|261021121427099003|261022115727099003|261021133027099003|261022075727099003|261021123027099003|261021130227099003|261021135927099003|261026135527099003|261022105027099003|261022113327099003|261026121527099003|261026130827099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N431XhfxNO+wJ7oKqc9+F6xixWIXDVFMCrXKje3ghdyiSvm5UmuaeHEMZ9fkp50rRxS1tzRwU0Vpbg3c8B86UefoYEJKnL+VgyXB9SWTLGBBtiE2A43u9t/DTwQCFoDEXPE0Uf6nE38vxGk9cgmZIfzdebBdLeBc5M6SeWe+xZprRXzDYkp5umSs+TKwtAag5HovSX8ECF2cDhZQ/7CY9MOa9bZ7VUo3Abu316XrjQZ9avcljjtVz54SXmTaaIh1SNnWwLafSeyhO96ckNkxb81u6jAzwVvNr2qxSGJm7OyS4rfKX3gcBoa6AwoOurSnA6a9mNrTGyfFGdbFyYgVbXp6ddYhfOKxR1bDY5LSPfzaKQJl8fBMUkU0QdW9X4pjXBTX6HVgV7UoY7/ZJgsDJiQj7n663TUD41Gzu+hiQEoaY8B7im6mmECG11C5wjBSBtm7yOUm7UBch2w/q9Xaur9VRZQQZHWig7+AGP3eJCn/BowaaO51dJHWCQxErLzjLVwGYK1mflkuttiHUZxPHs6r+TcJxPVNS+VEl4wh32i33+woHY6jEL2vIM4zt9Pe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(10067099003)(56012099006)(261021121427099003)(261022115727099003)(261021133027099003)(261022075727099003)(261021123027099003)(261021130227099003)(261021135927099003)(261026135527099003)(261022105027099003)(261022113327099003)(261026121527099003)(261026130827099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lYbzFjxr1P0W7BcRc6Y1lthuBImEpyorAF3XWWSo0T8QRR+Vt7FwXkXYU0Bk?=
 =?us-ascii?Q?uPEEtE0m9HOQ/N4OEq7+6X3bw6AtccOlS2A5nij8trbAMk4tiKayDsb4j0DE?=
 =?us-ascii?Q?hPkkNKtUqdhF590woWtNds5OGm4Zsnn7Fh4Q3urSKlmqknYvN5vly845ikZT?=
 =?us-ascii?Q?ZxKk3nMFyOLP4VkTYjifRykdb4OMtI3dz6rwyNH2++fB9Y6beCU6PHc8oIj3?=
 =?us-ascii?Q?MWR1JN2uzxv9YQeHmKSF+hkiZ7CM9WM/peCWv2D0C78uo+D4LyWGHyLFFLIf?=
 =?us-ascii?Q?9Kr/32uIweIH5QqgM3Q2fwo1VmXvle7vhP1XOZCWITHKHFMQIfEBoNdV9s7R?=
 =?us-ascii?Q?yiYdt2BE2RI+Iy8B9KUYoJURWhUv9cY4EQmjE9U+JiEMkLQxVvBz9Z22uavg?=
 =?us-ascii?Q?8zMqjIwL9L7V/ENwHTQTZux0FCJN1U+ivsj8xrUpBnHzNSEsCR/Ia3BGFTFM?=
 =?us-ascii?Q?tOT5W89Syb0C4iSxFqE8oof95E9DHGoV8fjDmPSDG7+WTQCtuHOBTb/n3Wii?=
 =?us-ascii?Q?5a7sGcvDXsW8yMauGBRdVTU4HZ/m7djPSVjFu3OR4x2uDo/SYZC0DNSHr3sU?=
 =?us-ascii?Q?VyAlyg0xOJrWhEu0nWBJW4mg+RzHWtXSUAct2dD2/BgT8Om3tOlMu440Lg94?=
 =?us-ascii?Q?q5fJJJW+unq1VxIymY188pycjbhcUZ7C/Y2V6bfTdD7uCHTBvibQuF1w+k9X?=
 =?us-ascii?Q?UUFqrGlP76BTHi17d4OKIkfgfKHGSoq10sXpKcETiNQI4iVutn6rfjyUJbhf?=
 =?us-ascii?Q?CQVi7RJOH9tRsY0qc0WUUD+l/COhtvAYV2jEP88twjWj4S/7bXXMe+VqOsos?=
 =?us-ascii?Q?QwbN+MlH/EPu2nCFFrkt3HPRD9ljafx/BPLnNUccXQMSqxRMsmD+40E4fo/y?=
 =?us-ascii?Q?ZXOLQISLImPJWFRHKzUnvwFOSPdIhbGq4uMpEpP8XM6V1caFFipAKktfcZXj?=
 =?us-ascii?Q?UQJU1H7POGxxF0j65APzgGEhise57Rf836TDGETwl95EKTXiiM4AGUGP6XWg?=
 =?us-ascii?Q?vlspikrLWtrj8Twaz7wB6zMjNxsJjDlwuu+XTpI5d9bHsnZXrExBZYPBv5S+?=
 =?us-ascii?Q?4pw/uuYBEh9QZFCLh2haHTfet3OkBLyvmsbfctcTAmms90NFTaA1lt5aZ17X?=
 =?us-ascii?Q?gZ2GdokDWXIFzDZwWhJ00x6Ls8k3rvcJ+kxbhj2xFA+VrBJYUL7u905jaVfK?=
 =?us-ascii?Q?20JclOTV3570UaNVJPzNyaSbhLcPkyknpQCEuJZ/ZzjSa4c7dLZY+/KH+hZB?=
 =?us-ascii?Q?B04b1Ctr4TeoXBgky+dH884G99cOPrs1OScRhrw5HeNmKKC8hfbfq/j/kvZJ?=
 =?us-ascii?Q?vCffu/N/GKTmoX5478So4mW0Bx/YV+2wJqMSctkGZ1qk6VdSVmOxYXoNFaTv?=
 =?us-ascii?Q?BjcEDiUtC9Q1wkD+ZSlWqy4n+EFwlQOZDh+HFuY+KmyCXcy2t6qv7npqjdmS?=
 =?us-ascii?Q?hL48EqrSNDk2LV+A0GyFGlZdvacqz2SI6qMH2u2ZGQXp88IQjpbwF8PpXW6a?=
 =?us-ascii?Q?Tv3EAYDsdrQbSfvKvq4IjikmQriQjMba1me0ZkAXshSXKYTx7MQY8udkJSt1?=
 =?us-ascii?Q?dZRoa/+QPV2SEdf1EiWMZBsj43hGvKGpAMYmy9734qNzrfRuIzkCJLvNf1VZ?=
 =?us-ascii?Q?PM5xjSjfHDpsHlfdvS5b4jbUT1R9dSAWrMVaiCd68ihM1L5dqDf11o4GzsGb?=
 =?us-ascii?Q?i5ijliHuhDAp/K2DOfzvFMkoLaxrvvlTrUXq3NleO8tXCd/ffk2DYiVlMOjV?=
 =?us-ascii?Q?tvfDGDPX/xcucSnkjjW5MWu7+rOavK1Q6QtJJ/i7oyxMdrHlgSb5?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed75e8f-a953-44c0-063a-08df4d2aa677
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 08:36:08.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZ/hJEhRpYqIBUaqsud7a/V57AObYWYCrKL6WAMb70GzY0/pozu/xxHK1GIsPdkqos7iLGwmA9Ip2I8ggqW3RsApOHEzCMrAUTkdZXwgL6a90lGX+aYzGcNKwiRFOv+G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1313

Add the reset controller of the JHB100 System-1 clock and reset
generator (SYS1CRG) to the JHB100 reset driver. Its reset IDs do not map
one-to-one to the hardware reset bits, so the controller is registered
with a reset ID map.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jhb100.c    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jhb100.c b/drivers/reset/starfive/reset-starfive-jhb100.c
index 883f67ff1fa6..2170c88810db 100644
--- a/drivers/reset/starfive/reset-starfive-jhb100.c
+++ b/drivers/reset/starfive/reset-starfive-jhb100.c
@@ -38,6 +38,25 @@ static const struct jh71x0_reset_info jhb100_sys0_info = {
 	.map = jhb100_sys0_map,
 };
 
+static const unsigned int jhb100_sys1_map[] = {
+	[JHB100_SYS1RST_SYS1_IOMUX_PRESETN]		= 1,
+	[JHB100_SYS1RST_MAIN_RSTN_CHIPTOP_SENSOR]	= 5,
+	[JHB100_SYS1RST_VOUT_RSTN_HOST0]		= 8,
+	[JHB100_SYS1RST_VOUT_RSTN_HOST1]		= 9,
+	[JHB100_SYS1RST_HOSTSS1_RSTN_BUS_ESPI]		= 10,
+	[JHB100_SYS1RST_HOSTSS1_RSTN_BUS_PCIE]		= 11,
+	[JHB100_SYS1RST_HOSTSS1_RSTN_CRG]		= 12,
+	[JHB100_SYS1RST_BMCPERIPH3_RSTN_CRG]		= 13,
+	[JHB100_SYS1RST_BMCPERIPH3_RSTN_BUS]		= 14,
+};
+
+static const struct jh71x0_reset_info jhb100_sys1_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_sys1_map),
+	.assert_offset = 0x54,
+	.status_offset = 0x58,
+	.map = jhb100_sys1_map,
+};
+
 static int jhb100_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -59,6 +78,10 @@ static const struct auxiliary_device_id jhb100_reset_ids[] = {
 		.name = "clk_starfive_jh71x0.jhb100-r-sys0",
 		.driver_data = (kernel_ulong_t)&jhb100_sys0_info,
 	},
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-sys1",
+		.driver_data = (kernel_ulong_t)&jhb100_sys1_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, jhb100_reset_ids);
-- 
2.25.1

