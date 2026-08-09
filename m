Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB33033FD;
	Sun,  9 Aug 2026 01:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786240353; cv=fail; b=Wk78oFykxWaAJn1UTJ6PhGO85yMysEHTB4ve18UlsxqnYhDHdkfWrVKD7UkzjSWOGryrLcU5EbVIB2KmVxft9RP9kWN1pdF698+9NARrQN8ibjm7kWX1ML6L+aQN4tdXXwMYY2mtev6p+sUvyVgma3D54ojxwPEuRJxMzUEzc7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786240353; c=relaxed/simple;
	bh=mODCxGhA+kHp52AQ4haKcXHPAliubg1ov+wY5W7gIZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YhYNUqrbvZgC4hMGD3gtc0ImZ4xaeAFJ8mBiM8WckdbC7F2i3+ItBXqXe5JmooIVt5rhYXVGn2HmWvCQ8ewlunaMpzYIKM4tCFrnNhuRGnrsZSozkZcAYh3ISSaRJSJzP1Xt+fTvyFJnm6pEXVaDDAXjCI4FZbNGSfI3yLtgoKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B43Y/PSenQeiemQqDpRZUvpfjsgsfOt5/2NqJBqKE2MbG2X8JdgsCmYH5UgJqUleOYif6skzrxEMEAPEic03OwmqBGBh6S0R8VwIyHKPrdiWqI+yYzmyFkxG2J43TDWAK2nWR3KV2p/ZYLRafLx3M3dEstgfS/6muZsYRNAnHAgLZ6YcxPydzvQYZEtu6fThV7NfHHqlLDDc+OKeGRXp1yM5CrCsEBQUySe7bO9x2khlCsQB/fXsKHYvpl09geRZUnMxyN56/jwOQI4vDpBXx0sTf6P9535Kg2pn++jZ0IPAmOho+hDqzAH/ZfUytbeRWu3AXktgodzhmd8latjjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoIctU+Q/i3k61CMCoK3RFNEE151ujKoTiertm8apH8=;
 b=myPGBCh0NiRrFcXmpiDGXq9/+72TmwpIt1a+/VjPHrnk+MoPH8AQ8QFPgTbB6wBDccVYR+mO/pltevKv0jJGxmXIdkG+gOkf5o2ObqB7gOz7RdFAuey1GCcKSLN82AW2M2HjdmCK9+zwM/rjCmyPI7ZZ8PnzxJzFO9AjHCIC3wGn17Z8uLY6q8mQk6yMefeRAP4yuJ0Gbm8p56t9Rqw5GGVLw+Mbhidxr6gn4fc02FbDsanpXpTgeRuaH9uXWY8wwRk2ydjA234GdJentKXVSbz9z5z4TSfKVbAzWTomqn8/F3xtzfoLRLTMO/4yX+KFVgur1a6UObnHLqT1kXlxbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 01:51:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Sun, 9 Aug 2026 01:51:10 +0000
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
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 4/8] clk: starfive: Add Peripheral-1 domain PLL clock driver
Date: Sat,  8 Aug 2026 18:50:50 -0700
Message-Id: <20260809015054.210577-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0016.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1265:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e03dc5a-f4d8-4e18-8233-08def5b8af8e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|23010399003|366016|921020|38350700014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YTTtLQaOlel7llRo/TyqW04iXmV0Gx0i8aMkTXI1Z2Rdl8372SctIAmxF54Cx8WV3TI6Bmw2XNH8jmLnis86BbpYyPa1QWTJaXizuLRzH3avsdl2xrSH8osn91DDHjDPajeUaljFNq6qqO0U9TIYdN5pJOus8RGUuBZVJzEiJpAfao/sM/5fiYvzLEeKYhxiauk4I0oIi8z3YbVHvT6a7LZW5JhsXe4Mdq4j92j/58T5TMwwbcGkOu+RRnmf4aWIX4g6lems77lU1ycbhQMLd+c1erJt9LLYNa2iq5hS2Sq1rXi6lVJCQDjyxVKTzeyZhKMeoCL515wAoYm3O31o1+ukV4jVXvobnD65qit2MOkfs3rq3eMXnYDu/a6+UKWp9byXMlUBZo5yc25w37phJ8f1gfwKGbTzy1GZCGePZxFn8ukmjPeCDoXEU97HXCpociDtG9+PrFjH3BRreULWTPyYrgF9Dh9I0nWjuX9x7VUUmFyoiBlVlLnVouJ6usH70XI+jvkAV1/TeEABPpORCN5OmVtz9dGP01UGtb6SpUqLPZBI+2361fLyIkfM02luTh5HJUFs6EeuuMKE6X3csg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(23010399003)(366016)(921020)(38350700014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eRV5rN7rYRZtTr83PCWjAAyxKQvjx6beYhfidsoGSYumpEEG/pfqVSE5BDr5?=
 =?us-ascii?Q?+HQQcOt2adcu7IDAKHiO3yCQY4TiXxaZSTVUMQRoRcXgGhZ7iRHdksH4oZL6?=
 =?us-ascii?Q?30jjpl13qmsI3zv+Rv/xZcc0hy+Tb9F2grcDhHgLzAM+Yex/KrNTz1LNwyqi?=
 =?us-ascii?Q?vAFQRlrAZ2GECFIwtpUKTta0EEJn00I43h6bqtJTuL5LgqmjkrQHhf56UlFG?=
 =?us-ascii?Q?37iq+yzihP+ZV87pvPRr9owtfaYyxokwrsKDJYWIvLsmA2WpNCM55BuMZYDx?=
 =?us-ascii?Q?f8es70eWn0aKuFbC2MI+QsYMWO9K//dN+jtRjvSFcHNs1S+ZcNLuj1yX4s1e?=
 =?us-ascii?Q?afQ0J5lAcKDm2OzdRxuWJo35N03DvpxGiC+RyGH8QTd4AORX7neVyOY5vs9r?=
 =?us-ascii?Q?HnQO8BbrSDj+ojJ7v5QEviwzJCpvbWot4ZilowZpEeZeZnTYK+vorEyT/8NL?=
 =?us-ascii?Q?7Ib6ZvaDKw4/g8YWVeeS6nFacxnNzSll3ovpBvc9zsbvQWIHHSojNw3lSOzb?=
 =?us-ascii?Q?nwJUBu3M5OaJDSUGukobHLt5VIOLND+Xz6R7Zhk4FUSpYWi6TK2/jDIiNcAR?=
 =?us-ascii?Q?QG5ewU/5mTQrBBMOQcQWGKRaxYja77hjNNc2p9+Ns9Fsh+Cqn4lcUPXj+NtB?=
 =?us-ascii?Q?C3SBL4F8TDBTVi0UPMl9210MQe1ef+xkbPsSUERJdO3MqafRbfUnhgK3zuCu?=
 =?us-ascii?Q?fBAmSlNkHhh5VnzktFt4m6cMH7a6qSg12vg63oTg1oOa4I/JsCP5Ow4worI4?=
 =?us-ascii?Q?QnbKLplq5NZCZ2vVMTOqcfjo4CrJaCSLWboW9kj8ZNgQKdHpD7+cUNJDOF8r?=
 =?us-ascii?Q?Cv8h1zQQQdfAF+qc0cMXratek9FCeYtLwLyheGx5y/ezlW+L5XImJGFrhCI+?=
 =?us-ascii?Q?5uuudlA52cBxfsak1eOJFl50/MWXJE7cZSXZjhyReqXesjsRs4ROSkfO9WZ+?=
 =?us-ascii?Q?N02uVVfTGptXMG2xUK8V3DXAFFe/y0vAPW62WY/3YHEmvhwC9lz2dvaqv7RJ?=
 =?us-ascii?Q?on9LXDcOXqceBbpNYw5A/XZWqCsOvmuuQnqT/I73plaTR0rWbEJfXwoWKL4b?=
 =?us-ascii?Q?vH5HASMhlUfZePhAAwlX8gsp2Lrgf0/d15OkPOKQcMq2MSU40s8vWH4veYgR?=
 =?us-ascii?Q?LqknYe444sF2w2ycMKU6oBlF0CvwnhTn1OAIJDfXcBTp+3ySuGGc5QkHjjHl?=
 =?us-ascii?Q?kQMJ5kt5g2bkN/2HGOXA6w8ApREZ/3iutmJeQIm8EPb4L2+7wkB7WINd2neN?=
 =?us-ascii?Q?zXStgg77fWkyBNKslfHx9oLRgVEQStpElBU6Y9ei0FeL8bgeYVnjJZ0sNi6L?=
 =?us-ascii?Q?1vEuZzj53AQViqO73hkyE6vyeARxLZglbqKMqTHJU7D6kjWD458GUtnjimnd?=
 =?us-ascii?Q?iKSwqfDgHNxT1eV/YMF8LKtKU4yrPYxM9age0lWkhTYNi02yMJ7abVuPWWc5?=
 =?us-ascii?Q?2Hc/XXX+b+dZ9DzIW0kzsPRQFvmIToILs6D+wbT6cXr+gmF7spCNBY6NMSBW?=
 =?us-ascii?Q?fBqgwr+FPj2QwbEDML0yXDKjU3a/R9iiCUb2jgoNqFmGrlrBSoaVVlzdtRl2?=
 =?us-ascii?Q?HX1uPNIZvt8f5gaIvW9RX2qRdHP/YIgLLquVZaiH7i7hav/+GIGNF3MtMScg?=
 =?us-ascii?Q?J6viJz48ead0pCi60Zm00dEY6Xf4meIbpUMwqx7i/gcPBFlO3RuUmJf015LW?=
 =?us-ascii?Q?Qbj1yeSj3HYrpjfXDqZg1vXd0kcO+80cNAGH3Vw+2c6vkaBWqqrovFXQs8vD?=
 =?us-ascii?Q?rLBBJwg6yZwi9ao1k4BT8Vk2JTzY5eaYnE2fFRNTcToBjCozuy0l?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e03dc5a-f4d8-4e18-8233-08def5b8af8e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 01:51:10.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vh8gOBSDb9NcQzRsQARbK1pVvQzQW84Zdknc58pStS62QjeGSh+rb1I1eYfIoBvCpD8KoYmFm63SVclTdDCjHhqepswzOp88FkhsYtHfrty6HL2kBoF3mQkTwpo7VAV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265

Add Peripheral-1 domain PLL clock driver support for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index 3547dcd340dd..1612b0f71cab 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -32,6 +32,9 @@
 /* Peripheral-0 domain PLL */
 #define JHB100_PLL6_OFFSET		0x00
 
+/* Peripheral-1 domain PLL */
+#define JHB100_PLL7_OFFSET		0x40
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -540,6 +543,28 @@ static const struct jhb100_pll_match_data jhb100_per0_pll = {
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
 		.compatible = "starfive,jhb100-sys0-syscon",
@@ -549,6 +574,10 @@ static const struct of_device_id jhb100_pll_match[] = {
 		.compatible = "starfive,jhb100-per0-syscon",
 		.data = &jhb100_per0_pll,
 	},
+	{
+		.compatible = "starfive,jhb100-per1-syscon",
+		.data = &jhb100_per1_pll,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jhb100_pll_match);
-- 
2.25.1

