Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF85936920D;
	Fri,  3 Apr 2026 05:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195418; cv=fail; b=sYWR5hO6jJw7uL5+SiVy5pEp5A7T6pE3aZR7AmWGAs2c6VWaldEoiKFLjwSE2BmuHJf8ABzO1nLL/bHfNJsKZJQNYeD0QL8GO/oDce/5YUk2/UuG5ckVolv/isg9RXoGL7HuGaKiFphgXAHznV5Q8S25gcVso9ef04eGZkWsKYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195418; c=relaxed/simple;
	bh=7fdi0+adB0cvV7cPe8kC8nlZTa3z933IsbCs67wpqMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u3EqmDJovN0O6VT7d3bJxuSyE+4FicT+zZvaF5lk0ygwMjI2Fl8iLeLTfQRlFpmTMMTR1tZW5iQGKmJMa1sgkL0g9bYdbrIP4VK2BwqqG2UxWUL91EIE/+1Qgzt0jHRNdQBBDMoHJb6ZD6kcA7UOjOgSKtpB5zI8fIeUWB+wajc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8wSSRbXJcWpK/KPSj2koMI3tr73FIk+l6tVaniuTbyIhuzDOks8TpT0yZp2ugwwYvuR2CVxnj1QYa4WkG+j1Kdt/Ev4IlLQhyjRyj0lsJwma+CJB0uYncNMxttF0yZS/D0Z0fbLWvlmH3C7fmiYHCySoDV2F0c4hGDliTC9nDqgjeqVdyl1Ue7J55nwSM0IvYfvXMntbpVoQrSNy/WoOQmdKMVeRbtST0irPoTnN8W+jO9Q0mJW4h0xM+8eah0XAYMj5K7hnfmilgjypTDVFOmLHgn5M1I/qFIp6Vay48E4wSq0cZL1CIxDBa2fb8v/4ze4PXpfEDFUrMquhKGQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YWtxkSzrQ3rAb6Te+6BdnvlQJTBUwLuBroypVL+OP4=;
 b=mkrI62Z0fiU5BA6P7QMmpktM8eCsCgY5V9x+M/Li+D23ap89eUQe/uCcd7B0h03SAlzo1nVxsyYDjTCrVeYIdngZOAkTlTyLNpRXg10RXmqMQQCdAqJouC2vBPUu83lPrjijW3FCwcKynFki59vOaWQQppdKuajb/+pVB8MoDXPdc2yKUIyJC1DhydV4QCQlSy87wA9rV5ySFUCSaez7DY9cOb2q/BSxGfp34OKvJyyh1GsdJnZi36Tp9cSrdejhXHrCyIIoli1FzjfZ+u0T+jgNjuaPS/lw7EQFYePj6cM30LTqab/CSLmuzfff4ycStvTy7KUeXA07QMNGXJHptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:08 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:08 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 07/13] clk: starfive: Add Peripheral-1 domain PLL clock driver
Date: Thu,  2 Apr 2026 22:49:39 -0700
Message-Id: <20260403054945.467700-8-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0052.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::19) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: dd47d6df-eccb-4aad-d8aa-08de9144dced
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AGHO89oJDS/rwEGybR6qkoWwA7nBe+bIOU8EF1GUPyBIfB0VnV59fSWk3GlOm3CehXFrRCi5QIPXWHTmPBitvugTi82s6nmmq0MvWVBWqCwbwx8awxch3K5J0YLBWRllhKksVxQgR59Ol2qZhaH6OrQTxDBPgnPL3XBANQU/Y+op+ZpdW6RXusPrfTne3KTnWN4CLgANTFpfGgYU7c7nW2bq3UCRP1dZmz6rEpk0FD3aNJIgkBtdILcd3ru9+Mbm+HCvSNw3ELC3AL5/0zF5OY3hoJyre/5pV0mnYT1gtu4nAZeauJhALjDqw6XxQCj3Yta90qOlbYXYxO5G+YE8cpcQ4GQh0HeT484f3PPQfRCNIBtevRsjEpIuIxtrFeAv/074V1iI7msRpkLeGYW9CDdpkaJIfm0XFVt48OHlABeKkPkzTw156uk63AVK3Co9LN1wCoHWkOrlvu5SSWCwji/JuPVCFPrVc3WdA7TJIX0XVmRQl/l98+yBNo/mjj+CITeh/m23jVOlMLfAchKMmMVwzgRvNpNLbpl9m536skQMVV3U4lMKSe3vsBa5sIFcym6EdidtIskJppLTwEUhkmbjtrXCDo0lRasnAF7Rvd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xyNP5Krhehis/w8g3DLO076eEJvN8+J0azLAmp5061dyXJwjNWwjEWw1aBwS?=
 =?us-ascii?Q?tqYzKWNkzOdA3FrUyIW/fwvAH2B8fVl91qb+tjlJCK7846ReRdQK390s6NE8?=
 =?us-ascii?Q?LT3imujB7KJCgpa9NqjWL9tWON41oQREV+s0xUztFPnBSmCM6Ing/uUJh8UM?=
 =?us-ascii?Q?N6WbPj3Ck7pLZ8OuTSlzpLeluP7RIXt40ZAL3tyI2B2CFR6jUiuLzy5xUC67?=
 =?us-ascii?Q?rMGp4+85yMsF48DjsZRZvsgaES1ck8GR3duOlP4Z6E+8r/H71Liq/bP8nQQz?=
 =?us-ascii?Q?SVD3tb8GU4d4/agbANbi5y9fYV+2Ye1rXkm7H9yNxWDIHJFXxcdoyQvKjbts?=
 =?us-ascii?Q?cunAxNedxSg8JL/lYVu6rcak4eUkuO+SdZlmwaaeUoMnix5dzUd2KdlYSyhN?=
 =?us-ascii?Q?ImvIws+n/0xpthc5IF+u63hcIBPRwRIr/Bm6pax92Ww1aS7uxcmEXJCa7cHQ?=
 =?us-ascii?Q?XN7dYy5VVALDCChBEtNTd1u8q5xGUacoPbgQbj5FWeKbXeTB6o2j1WGzXPbh?=
 =?us-ascii?Q?q81QaEDQvJZpdIrfD5iPaVxQqVkvJ8zL14HsS+5sIjcNscKfJpLASKhe9d+g?=
 =?us-ascii?Q?9gDO+wfSMwjK124LI9UJwIEPqPQVznfRTnnL06Lj4/RUEvkCmYQLYcYtni7E?=
 =?us-ascii?Q?FXx/ytEzvtvbVqAPBGqomKXKllkFFA0SY0X2Mrqz9g+YRMZHvt9lBl6ytC+/?=
 =?us-ascii?Q?/MtRqlqM0la+5UeOQr4sXn1tY+1QiWnmgoDKk50QDvEjXfI5hM+wrvTv4Tn0?=
 =?us-ascii?Q?9PqveSIfOu9gSI2nHiLoQqs6BAAnqPzI2MhRxajLP4PlMGU9p8f28MHj4X/A?=
 =?us-ascii?Q?PAJDB0Nd9FxVwirmI7EERYnYhFtdd+B+s+IeAolNJXAg+DcVsT4bFBkAJ/58?=
 =?us-ascii?Q?t3uLd54X3jLTFyr3szKm8UxVDGvMLi43gza5m17vckdFhaI9rnhSb/A8WYG0?=
 =?us-ascii?Q?x74TVutyeXJdOmDXyzZD3SpsEHKPrrV8bgfhlnzToqQtexA+soKcPbZNpJT+?=
 =?us-ascii?Q?rVRsu6DV/t+UyQaIciZxaAh7UdnsnC95LXiytRnv+HvdccNCqXapXpGISM0/?=
 =?us-ascii?Q?p1m2eiuXmKareIHS3H/PJefB0wkYGVNLC9QBDfnXDdFFHHhS0hXnfLew0hXW?=
 =?us-ascii?Q?6KbnID8RAjMz9E2+Y6kj/u4tvoLt6Aw27vlue2ipYqch22no4JezW+ubs4By?=
 =?us-ascii?Q?37+M9AOVYfqVSYyugM/DljU34FIR5DxUEJjM3YpUDqaJnUBoA8PB1atkS2cu?=
 =?us-ascii?Q?yDszi+CCoKR92akMaVlddpV5YF72staxKwdRS8NfVaX+7Ju0Q1/rlgXeiaaY?=
 =?us-ascii?Q?eWRqLLDFqm/Xe9N1wIf6NjrgbHosOvcBfNKiDXQiSlwDDqwjrLWgD43UxBLF?=
 =?us-ascii?Q?Bet2ql0WjQBTztpNHwpz+St/HAC+YIyqQNzLEQds3KEsa0UP6TuhTSNp7N6/?=
 =?us-ascii?Q?PVXZ0k3prZa3YhwjmkoHsgyZB6FyU3+DZai45I3fdX9qZpTL0SZ+aor6FNeW?=
 =?us-ascii?Q?EwklAJxRQikBM6ppxwt+9zbhXPyH7KgakjcLcUPfQv7Fbz5AYIAXMVeJUwSg?=
 =?us-ascii?Q?GUnBQC9CBpDUKtJ7ILTmuGLhF+nSyItPAcolI4Gl2HuR7Jgse79HfpgaweBX?=
 =?us-ascii?Q?QwWJbcYSGYJDVHZfoHIkOtDstcRjk90cMzmpOSoqIB1jGqldfbBSOn6H4DDT?=
 =?us-ascii?Q?imJbb0+jC8UzHbxbJcmdPruy8uOtIaC6W0oHlKh8VJva52ONKttZci0hjJ4K?=
 =?us-ascii?Q?+EMNFTTNhGqJrhsvEu6LiX7b++Np2C4re8H1hZU0i8kWko+dcobJ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd47d6df-eccb-4aad-d8aa-08de9144dced
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:08.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qX5YKbnudDaTDNeO6RiEzVpJ4MtAe1e61UCCBeDhNHWIay+y56ZmBx/NDWTcxIpj+0M7GvAaK3t8zGCOtbeB5vb2laoR2lIPyyMZvY3Zl3GyJ1vIXF5rAQPVJWxvaf/O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add Peripheral-1 domain PLL clock driver support for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index 5fddb07d0d13..522d920a3353 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -30,6 +30,9 @@
 /* Peripheral-0 domain PLL */
 #define JHB100_PLL6_OFFSET		0x00
 
+/* Peripheral-1 domain PLL */
+#define JHB100_PLL7_OFFSET		0x40
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -504,6 +507,28 @@ static const struct jhb100_pll_match_data jhb100_per0_pll = {
 	.num_pll = ARRAY_SIZE(jhb100_per0_pll_info),
 };
 
+static const struct jhb100_pll_preset jhb100_pll7_presets[] = {
+	{
+		.freq = 1950000000,
+		.fbdiv = 156,
+		.frac = 0,
+		.refdiv = 1,
+		.postdiv = 0,
+		.foutpostdiv_en = 1,
+		.foutvcop_en = 0,
+	},
+};
+
+static const struct jhb100_pll_info jhb100_per1_pll_info[] = {
+	JHB100_PLL(JHB100_PER1PLL_PLL7_OUT, "pll7_out", jhb100_pll7_presets,
+		   ARRAY_SIZE(jhb100_pll7_presets), JHB100_PLL7_OFFSET, false),
+};
+
+static const struct jhb100_pll_match_data jhb100_per1_pll = {
+	.pll_info = jhb100_per1_pll_info,
+	.num_pll = ARRAY_SIZE(jhb100_per1_pll_info),
+};
+
 static const struct of_device_id jhb100_pll_match[] = {
 	{
 		.compatible = "starfive,jhb100-sys0-pll",
@@ -511,6 +536,9 @@ static const struct of_device_id jhb100_pll_match[] = {
 	}, {
 		.compatible = "starfive,jhb100-per0-pll",
 		.data = (void *)&jhb100_per0_pll,
+	}, {
+		.compatible = "starfive,jhb100-per1-pll",
+		.data = (void *)&jhb100_per1_pll,
 	}, {
 		/* sentinel */
 	}
-- 
2.25.1

