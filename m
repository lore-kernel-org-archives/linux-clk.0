Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0252C234A;
	Thu, 21 May 2026 01:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327036; cv=fail; b=ffOhJwZCMah7hbQmL0LTZS+O825TkbK0bhCyaS4Z3LPSjMgY8bKbwNyZNjUmSceZoK2gW2lnZQV8iBI3Xxk0YHtzDXXMRXYT+B+xNfKSQio2vTLYSHrlnp6ra0sv/yT/srXmDdJfwYHxhQvpwOYg/UDLNTrBfxMPHUkWsHMvM90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327036; c=relaxed/simple;
	bh=AttiP9q1o7Sdbd2ro/zQnekChussEQplFAsPK4HqSHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YujBOmuAwLrmjsT3IUc0Yki0zuoJ5s94zHzD0V84uDT93X4vzo9goSv6PZ3uLFegicbDBcn9M7bTweBM7YO12Ho63UWsq0Fs/D80tv+AjRhbYGiQ6Py36w4o3t7oF0mCrSeM/gzYpia6TEcHDlvt6rgd9AhbGsFiQJlMZb8eROQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNQUw6cGTWyHmTmSFHHAGTjSWAH8kIfiz7tv1dpDqLx5Rj/v4rqC3b+SmkzWB60ZrMCEdcZaE4dMFJPovM1OxcLtUYsdHS2Sl3S+Ns9dhXjj6VsJkb7wUaOJH7b2Mx7pGCSaVAXK0aXFn1yLOV525LVSqYdrr1/vDZFvGh1X9NC9jlhoG67ZVmAe2HS/Dpa5v2OzV7Jp0vOk0xH+Gx23hd/Dck03vixbduJiwzzdtPDlSb9A6ZDx64grUS0/JiNWvakCKRR4bn+GyhEFMueJDZ75ethruDs5jVHFnZcYin8stvk0668kiTmn5BBiTQWTdX6C/1Q8XtthJOiwWw1M8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUfxQiPWWhEVHmn/0WJ2Rh0SGcHBQBynzwC5jWvlhvM=;
 b=HeKwhlUOlGL1xPpgyj3NcMrshSWsLhoO4xK2v6fQeFFOD5fKn5DxLITVsJe4tC/Pfg/GFaf10zDRj3WMTPfmrz+rgJ1CaxccaBDj2Qb970uUTjP3FKsdOrIfe8AGTEVZCjFwFVNQVskZCjBxspAEeT8eLRR4ax8PKflu2ExrtRoNdHFaE0VE3IRIuzYWUJxsf5o8khmNOlXfvQRZ4x3JfYU8iFL9Usit7Zof04J0GwMAH82TCGLRZ9EX6zBXu+5ZOWyxfcMVrtb6IFyDFEa7S5pc+wQ1cZYXx0Smm4w6AyRiSIaFPH5QICKkSQeoMhuyVRC2S2CAElf9bXCvNA5sUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:52 +0000
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
Subject: [PATCH v3 4/8] clk: starfive: Add Peripheral-1 domain PLL clock driver
Date: Wed, 20 May 2026 18:29:28 -0700
Message-Id: <20260521012932.24163-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 458d7c8a-4469-4d49-8277-08deb6d87526
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	O5Zu+JWDf9q1ZE682Cqv1vGWmTSH59v4mH/rkL8b/FZbYw3JznvZKpyZIvZwAP2e1oGXzdRfu44wwmC8tlGHB+VLGesIBhKtKSLNoFmG8p5wwd1VJ7dpct2ij9ZoOcWxgHMTyK/V7N066sVlsVrlfFBFmHpTQU4nF6psX4qrTNyqTTa/zPXyVX+741MPseag8UY3CsOPK7+n7EOasQLyKNy5plPTBLlxrcE3VgOtYJPY6dMnVjD6JBZBgZdnTrQF/lY8mjHFZQzXJnvJ0qGAC4+Jx9u4EmbiuCTpf373mKi/eBDZGPrEFGi2Bx2iVOsUno6DDedhukiSwN0ZB0305o+7cMzr9LemJ1W+8J9wYuhWMA/SxLBiThkiJDmcCRsquiEDIWIvA84ELzmFDSacPimoMaKUXvCsdGFQc6wcqqWSK+TUj1hdiF9U2PlHETCTYB8oF0IyG7yxocG4LGn0DvoY6DZ1ed2RH17U5fOao6zZq443NeuRVKnrNsBVyDbck+qeO6Zl9lYkxz1CPPI9rYGd0tBpgyHFnGDRSQx8DwgZXDQH76MFipkrJ9IfZnJ65gRBPYgppdsNTcvSCjL0cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aHu7K6EO/k2+GNzDpBkzLpy/HQ1mIpVs92OVg8CBEeTZBGWp8vtCnKHx8WPs?=
 =?us-ascii?Q?QUzjhdIWLNHtRI84YFxEW896mzUiQGfQF1csmbzoRcTo7I+pUxQhZ883ir7d?=
 =?us-ascii?Q?fcpTf4rK1OKLAOSqYFq/JRWOT46h05RJZKzufhC4erPnlWMxG7blo9ZhXGus?=
 =?us-ascii?Q?LAhez9WxjlftRK0cYTkd86h5smshu850zf/1Vy4GgsKbKMUBMQd2iOOjPcOY?=
 =?us-ascii?Q?E3yFPjeRP9cs4aPibWiFsF65zBUVIev4+qA9QDdJxos1Tab2vaFMSQ+qkJH/?=
 =?us-ascii?Q?oo4rSYDVzwR1LIywslgIt5X+e0PozhKfEkJ7ZmqOwdOmOZh+1xcoFA6e9sua?=
 =?us-ascii?Q?MMGTcknJ2NqTEE8wJG317WYcLQhiHTk/2/7+lPjZeugGiz/6jjwKJMFQMLyC?=
 =?us-ascii?Q?0hOC3KKAl+zNMlATbz55d83pr5POCq1uyeAOS8/wpoprA0DXC5Sdqq227bi5?=
 =?us-ascii?Q?4RYUcWFZ38m+dc/v66yulFfvllLCzWCwxD5/b+8k0o1KivGssr5/6RFfYLiw?=
 =?us-ascii?Q?4H4MnnVi2VNNMftdTcoBiqzC+LOBt0seTi+Ue3gVgRc1WLNx9RSV2236PPyK?=
 =?us-ascii?Q?m0fD19zX0HLw6tt/LuJMQPFAvmM4A9R80+RrXVtXasqAQTNgno11PJDvKMdI?=
 =?us-ascii?Q?h/uOTX7ogYWHJZq1MvXXZ0deKDLZqsQ37g4q83QjipdKmdOLPn2hGXzYViHf?=
 =?us-ascii?Q?9jxymb0pMzni4OcPQroLGUJkR3+9v0D40qqe5RaG+GEyYBbYwTA3SqA9mHC+?=
 =?us-ascii?Q?RJFXu4QgusOplsz1EOmFg+fg5k79/CpHtrK1GbVZsZMndJ/v67hUrLg3aSgI?=
 =?us-ascii?Q?sMRL5X4D8Ie1LsnZ9gr30Reo2F6DUtYXN1TA+LCo6cM2KN5JDAHLDdISN7iH?=
 =?us-ascii?Q?0WQBB4P99YsTirUAUifLMLVPihFSdKc+Sa7n4Dc7kwSI9NFnGh+iX03yPDXv?=
 =?us-ascii?Q?JhVAo0J8GptrRLQjL49PpdnANrOG4voGoDQlFdmHyXo601wW7apaIbtDXEwo?=
 =?us-ascii?Q?7kwq4jSVwXljV0roXp4GJoIcLT95/tK8Tm4RQP0sWIGnZy2B3diWGxYoOCCb?=
 =?us-ascii?Q?O29ju70GpsLBsYND182QjX3aCXmmPmLJDjTRcDmdHucTM5tUOqd/gMk7iWdt?=
 =?us-ascii?Q?bNvCOFgkzFdf0Mu/tkgURgYhGbRzG2FLnpEunPa35MRNurrY/e3NSv5pWMvn?=
 =?us-ascii?Q?AkN73j3bZA6OVQHjHtNFd2GNXoh+S6hjFWDOzYHyL1S0E7BMrNo7HA3BJxb0?=
 =?us-ascii?Q?XiU7QypdXA1a6yAhKm6pMT0YB5x5Bx+x94bFNgs522F87iXvYTpXafk9pt9y?=
 =?us-ascii?Q?qddEidC2hoUJzL0VAqGZe7sWLCYE+QTedzORCaJUbHXluflyEThbZjAEJv5d?=
 =?us-ascii?Q?z7H02mokmTQPL+9kjfUjyCh3UqHSqoEalhH80Apcb184UW8cF6HPfFGvr2rY?=
 =?us-ascii?Q?8JEbn/J+Tet6VJNERTjx9KaSg/2NcSjZtE+X2tFNoRwSti/gjEus8WYSqQx/?=
 =?us-ascii?Q?T1MiTiS10vVtXaw5qa+fTzODx/6kE7KLsjxqdf7YHt+pHb9qZyqqYCcXyAN9?=
 =?us-ascii?Q?j9Xk79+DFMlG7G4yusXEcjYHx51CrIPDRrixOj8g+42k9VjxDMLUZQJWkvgf?=
 =?us-ascii?Q?CKgd8eTX9HvdX65EV4vxXdqjfUqIUC11M425aHKOt56BA3MlDBORDR3UG2RH?=
 =?us-ascii?Q?SgCVg7RRF985z9BntjdG8Y8hY2mzmnwlIw4O+Ceaoc9zubuX6WPyqf3a1tqY?=
 =?us-ascii?Q?Ym4GRTJujc5hpgFfNLrqZ1LPsX13nV6W7jhZ7T6du3X8itCoDWwI?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458d7c8a-4469-4d49-8277-08deb6d87526
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:52.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnqpgFqz/DlWl3M5jPAE0GOR7d7pmI0hM8+xnt2CSt0m80G+yxgJjfhStnYjNrUDn9YqY06G6fBtfD8xbQnCNrKmz7jaJzowIQIGBgEhzvAyAtV1jOx4MBNqBxu7meUD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281

Add Peripheral-1 domain PLL clock driver support for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index 08fac2a55446..9de96bca5f84 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -31,6 +31,9 @@
 /* Peripheral-0 domain PLL */
 #define JHB100_PLL6_OFFSET		0x00
 
+/* Peripheral-1 domain PLL */
+#define JHB100_PLL7_OFFSET		0x40
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -535,6 +538,28 @@ static const struct jhb100_pll_match_data jhb100_per0_pll = {
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
@@ -544,6 +569,10 @@ static const struct of_device_id jhb100_pll_match[] = {
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

