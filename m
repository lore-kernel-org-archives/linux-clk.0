Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2120.outbound.protection.partner.outlook.cn [139.219.17.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1EE2EF653;
	Thu, 21 May 2026 01:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327020; cv=fail; b=rFQOxAjo1MmxiNLi8QRA0mS/rnb/A6+HldFK/N0Ol/ImfIu0MiCwsMUDoWgfFk7JDzI9HXqd7PFaS3qjOr2ejTV26tCKnvgSpAbWNIlwqzwxkrXqZgoNIUW2ESquWUdjlOYA1T6xbOQ1W5X9ybL4P7qfSYe8FMVmruMQhYZmAlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327020; c=relaxed/simple;
	bh=6z1Q1eYZyWfqhuPpA8m6lIsscn4GjbBQLOUGFD/6w7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e9sPzINzOX2jcp7yY4q4g3bivMKXRGnSvomp//AXBoiXA+J8DQ8ctYQbYxY63mO2X1wIhAVME4gJgL6O9ahoY61evmmYD0qVDZaJvB57GCpEZ39S/TSSPvI/Zrc2yutAFXa8MrLGrun7xgj6pGkmGUBRbpG2mjQ/Ed2Urm6Fo7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm2ifkM+qKnX+L4jopZBxrkxozidJxlGC5AyPEfjSbw3NxCMvlnKx8UbtUXAgdYbuuFo8BUKqxizrV91jEEutNLk1SDetLzxjq6iC1dUWd3fk4PGg4abqGpGZEsRo/xW3cFPY0erSURSkyqjrWjBPdyGWCpbJPYuTljzOIJi189OpzdWrWrj5fQAbywXw7aqLPoiaGsT4JmszqKz/JCjEVpfJDY+8V3fFypYpL+XKGNJ+PNxio/6ygduKukZC/xPKmUSVoWn52radhOL8yQ6LkHN3g+QzyLUs6JRJxiFqcDBpNSBikWGS/hYrykbw3t3WlQHpRW7W0f0MAFyeGkJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJYTaCoW/laMHzvCF3afe/xvhvIBIcVenV4rII+cHd8=;
 b=alHKRMszStU2XBI7r+iR/K6nnexPX4ZtgLVzdr5vZcf5e2xDCeNENayo5TG6uqV5HlkQX/DFFGPj0tzc4vNd3aDT1rEavJqfhvjdEVAz6Tw4Sc0K5ZOBLjLrLwAAr/iLnPwKumlCGEVhVcUUs8YsBV6HnyYVARcrepuApfv1SEpXFcHe1b4KJypbYkbNUix2HmAcmvJgdPm+AOU3GVhwHrfuTIpwGZPqNBJJKZXHwx1tG5ByuSTVAc6JgMHBWOtLsOPNRkhqRvGAL2uLz0LQzSsXa3mOrwC3GdSuuyrIxjq+Y7jegtdFGEJbo1uXjr+21nf9xpqT+zd1wVsyi/rfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:51 +0000
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
Subject: [PATCH v3 3/8] clk: starfive: Add peripheral-0 domain PLL clock driver
Date: Wed, 20 May 2026 18:29:27 -0700
Message-Id: <20260521012932.24163-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd379be-000d-4704-c6a8-08deb6d87431
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	puAOadZpniR/HXtwGUgLBytOwfY01c5KACMtTgexfxI/to3683vI7D8ZR/pCCqoCgahAUMcvSF6lNxeY7CDhjAF+j8agtCeUi0KhK0NAlYjZM9XRnFvgEHrKSjy4qRPl30AWRjFu/aiBNZyN+2IlqtpfoInR+YeFWlq5vsT7N7Mo+raiy424cm2EbPlrutWynt9CXNUH4BntS/XXSxAXdYyL7dvULMa3amvZAozsddDziDqFUZy0+DreHCr1xP7chGTX7o0+v8DHxdL4fiBw01Bxoa9qo1C5y3yKUM9Qm3c8qGL8jAbvmRinUog/EzA8Sz1q6wZqMOImSDuLmvwLyX/hmIaaQ7A/C06g1CLS/IfzNi1cRStO1nfqfOEuNqvFcaDyJHxosbdPEIVDzCOh85AKYt0+lXWkyGfUV9S0y+DUyjDYlClsndOhHsyu8H8V6yEjRzA4jOdgMT2ijndFX1L+xyn8CTR5TKbcsLvXiXGnxgpANe0/t7Tai07czy2EryS+imhOInsQC2h6KZLnTd4FqE8/7aSVU1Y+KQnbGM9NXxrcJ2bVMSDdFAHdooSG+m/3pGov6knT7E8Iyu/c9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y1WEhEwP8WBNp69cVmis0Go8/YOZc0D4F70SfQPM927/vXjxPtigCLtSGI49?=
 =?us-ascii?Q?CIahScAupdL+QqEst6CIrG2+cdLb9Ah6SBC7DXHXHZYs3weIs4g049Ukt0zn?=
 =?us-ascii?Q?HOXKbvHRpyNmyuC3wzpLmt+oIHw/cp/3gro+XshNAb5Wk+aHWcv+7uoynJCG?=
 =?us-ascii?Q?mGuVbRf7I5/EDEyUd3jwgiCxjVPMkX8XZSbZqp4hLV69+xGmBx2FbZ2THHto?=
 =?us-ascii?Q?pIO7UbVOv2IVJazfRKIx9xwyLU/LNP9TJ+zqCftrus0sVP+MMvusUsdWDXG5?=
 =?us-ascii?Q?XpN5E7xhAzkGYvSyD7t7lNyyutLVA5zYy3zOFZNqY+LPf/RuqlGz/oQm6VxQ?=
 =?us-ascii?Q?ig7dsBzs6CWN5Boa28q6YMp43FIlk61/Gfqe3Dmzc8mm+1AGZajV2B/EQ2pQ?=
 =?us-ascii?Q?gPjPlXp4vJXmh7UowPQ4jx3YOCuN8BGF+9nW30JZ6FaKHVa2VO3VOcYbTVIy?=
 =?us-ascii?Q?MDEtrLQ6FO1j8CvFK6UcINDzHIEm4cVIhpyhEveQWUq+08PDw7UHk5kY4qAd?=
 =?us-ascii?Q?zgMTOBoOuIAG62JAcOMMGhZJZY0jjTw23452I7F7BZPjMKVotJAJ4SLNTcaY?=
 =?us-ascii?Q?RacqAahAjQjYtupMMrFd6IZYxpgWf/HMR2ZRrWcN7e/c8gG9C3V0njo4aBId?=
 =?us-ascii?Q?RpFNRXxq5mx69Xofh1ZYHY0lFJ6b0WV/l+yR0vRttE/eSrl47D2eX4Imlly7?=
 =?us-ascii?Q?sShNV3xlXFgc5RCuGgxeSW4SpLWtgcU28UxR5svcZCNtiDr/+02z8p7jtoj/?=
 =?us-ascii?Q?Pgxd0PbjHXmi5gAvdzjCC9MTpYCkwemZ3lUp5QLyS9QuD29CZVlJVe+RAR1f?=
 =?us-ascii?Q?kkWhjlYZGIoKcPPAPew9X3scmFzwU9VYOHZA5E466TSz0oEebwJKEHjK5MLX?=
 =?us-ascii?Q?/IH877lsETSeIEfRF8/tR7DirOUOu/OTsMdorKE5ABsVaVOlNC0JMqokTiBP?=
 =?us-ascii?Q?Ald04b+DcJRfYkAa38BfNP7gNWt/Z/uZEiqPgzLate7O8hxDm8bbnDt7LzyE?=
 =?us-ascii?Q?WxbDnmPBtJxrOHyGHplvHexTCflGTnT/4nyOt0CMSXb8VdrEf+0ULVxez5cT?=
 =?us-ascii?Q?3lQLM3qori1AIw9oUKQYslXW/EX6y0pItpwz9Jfd5Myg2kyDuS9q+1bBcrC7?=
 =?us-ascii?Q?9s7JzRsy5oZqgafH5tpUs1GgOOuPRpjhrD79dUsbp+z9/aIH7W/JlOSp+IA8?=
 =?us-ascii?Q?8yQIXc3cHXrItpOu7Rtt7s0X6yPPAd0IdFiQh3Ijoi0f2CuFN0pV037xrwSk?=
 =?us-ascii?Q?WLnZBgkvvTUQwFMkKhP79WRp4lE2XQ1mWAr8wapT63OL5PkgJGZx8Dgl4kHU?=
 =?us-ascii?Q?iXFldmtnAGzq6cOcCd97+Cx8tyGH7LMzOeehf4J7iCL/VJ0tgNsI+x2V/iSb?=
 =?us-ascii?Q?r6AGzswcMXAQVeNMcvT4H91FONbQcASOi09p8IxO40WGhVbYZelvSCWwU0O+?=
 =?us-ascii?Q?IRvoE1ezD8+m7Hdy2o9jtUHZnlJnyGRHZmeJSVto3iJktaZE0SbEXx6RAzBN?=
 =?us-ascii?Q?uqX4eq0utBjbcWn8v8JWTiLXWYSyhUZmCGBUEoeNF7qWcXMiY8HOKjR9J5Iw?=
 =?us-ascii?Q?XViNZ2qEdN58i9/KklChm2KfvvkJjTC38b7XSbR0Csbin2wSGJKP1n7ELo9T?=
 =?us-ascii?Q?YbR3jJNRhgIVVx/YZBi4N4yhGZ3NeIhVMKSDrr8QUMkoZJNK4DC3cm9hXNns?=
 =?us-ascii?Q?W80w6O+P1Ef5lqLbN60I7s0n68jtTwHIwALY07jQ/qu5zSplBCLb7lsZbqMI?=
 =?us-ascii?Q?t+jXaM6wXKreghNMfBsvV4Q497H/tRhuKy4tYhPhHgq9y7rOEVyZ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd379be-000d-4704-c6a8-08deb6d87431
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:51.3042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO/6GwgnAcfass4N5c+dyjrHMYMb0zh0CjVEOlvO6SNemn7B+z/CDx18YRF/YNQHq3NnT3itolv+xOyT0YkpcgzEO7aWbEo8z6cwUo/Yr2pdMvKvD0zcESsHQvUrbQ2i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281

Add peripheral-0 domain PLL clock driver support for StarFive JHB100
SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index 603b928bbb81..08fac2a55446 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -28,6 +28,9 @@
 #define JHB100_PLL4_OFFSET		0x18
 #define JHB100_PLL5_OFFSET		0x24
 
+/* Peripheral-0 domain PLL */
+#define JHB100_PLL6_OFFSET		0x00
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -510,11 +513,37 @@ static const struct jhb100_pll_match_data jhb100_sys0_pll = {
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
 static const struct of_device_id jhb100_pll_match[] = {
 	{
 		.compatible = "starfive,jhb100-sys0-syscon",
 		.data = &jhb100_sys0_pll,
 	},
+	{
+		.compatible = "starfive,jhb100-per0-syscon",
+		.data = &jhb100_per0_pll,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jhb100_pll_match);
-- 
2.25.1

