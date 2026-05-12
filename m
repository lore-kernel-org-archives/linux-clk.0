Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45CB49551B;
	Tue, 12 May 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574959; cv=fail; b=MkS8AK8TcdPGo+koMNQ5BoGuy+pu4DPxOGV8QiRygrTJQ1QGTHyXKuu91ggjm3fuQPJGmyXLcREfGIzFsxszF2bwsLuipQkqkN/ifyUf/keXjZtvSEVpV0e95V41u0w9C7mCzFk9Az1/KuMJVoRdSOa5lfIFAzWozkP3cWQCe3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574959; c=relaxed/simple;
	bh=3qfHlT9HbOogVeahAC2gB1eXkcbEbcRCTcKhFkYbZu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oiknnxU9nmGJ2tAvakF8zquMtCMd6TbeqO8rhLnbUYi2OKhCX30YDo2/f0S77e1T+KTPS0P6BI5OUy41YRm9rav2Un1IprQcar/qTo/BQSQFzO3RoF2YwecQbUI59Cash86jJ+7VKPQDjbLmpfjIcW7oO3nf1UTwp3AFYrNqoKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC5tqqv6VVAwKEmK1XjKqPMvG4+v+ekh7yPgrjJaq4ZIJa67VpmIcqOi+tNkOdJ4UR1+KX1dJ3s3D2/ZAIyaRololwtKTEysDAx/+AqGY1ChpNzVSdfoC4zSuyOhwkkkq52cG+ZFU/Uhkauxf5IBSLp6Xu63W+4Kfag473Y0R6kW+6NG+9sBlHak5Fhwhv/faOAGD1LVR5C7U/FD0sKYMuGejMormuS8d1QEzCTIGoyKsOeIcQTnrtTLprSQrSvVLnXKq2DxmdRf+eQsqt78cf8A/4NCbhkspNygpP8MDJ8XqMdj5DIyGvh5VGwBOlp2YSMFQTxbIgzKfYeRt+T5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcbxma7J028mW9paovwHZoprV4N/UVecgOUszvaC2TQ=;
 b=TQ53J7aK+cThkQdUpFSDyBtloAsmY2zrBvmfMbmb/K27Kgo0wTXdDFQ7qXA6LeZ3JK/hVQJdR/83mIqEILfo33A3d7awiSoCEniaMEHa4pwoXyKyDFp+HCHLgdGKDEcBrmCu6Ts96TC27M8Zv8hSXrrnfTrSwPo9h5NWOsxcg3cm5ZkLIYq+FOt8OMSjMrte9+o81LU0Eh5NDOXXZdI2EG9VvRQqNV9M2gvicz36PDYFKZgWDMxL80D5PhmhRSPcELAL5cupIZC0hYRaLfCq0jkPpRjHKXi9S0R0HHRZCtPiRaAVwY+fvnHePnqwahmQ8+FZMXgEdNJzX+HbhTBeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:43 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:43 +0000
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
Subject: [PATCH v2 07/12] clk: starfive: Add Peripheral-1 domain PLL clock driver
Date: Tue, 12 May 2026 01:35:16 -0700
Message-Id: <20260512083521.3448-8-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: 171d4258-4a6d-44ab-b7e0-08deb0017475
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ewd6RN6ymuUqaal3YAepevxtUv1xn1p+NWcJbVnQXJThTXwTdc0k+NvgLSzZzQkbN965pTOni/11/7cl+vmkhKsJAEOBSgho15Ln6TDfhzzgmzL7WvSYAuzjkMnRbBEBjdRNX1wi0IdRO8NElBqdazeflic7pi1kMxfFx49b9S9i9pFrl6sD+bfaWBRHZtDwd8fCwUUWyho0LR02KI2Ewg19k9flkWw2ruqALsS4iMyCmfhW+/zmxyiotLOMM227UBMqHYVu384YlJxI0NdxvfiLCUDiL7MbwJ9+RMkhwAbMqvX7onhsLf7KojABMwlbjGZzlZB1jtlx72AsZ8M0SlLNgOJmTk+5LGqwavLjdzVmTQYlBy1jroVa6UiqdDeHlXH7SydEw1a2YVCD1t/9SRnJZUgQ4SxzhaLj/02T29O96vqa3/pvk9N6nAIPkz0JB9OaBt4rc9/9U3mQFzvqK5z9tDBYqcXYGFmLX48yoloJpgzsvQq70XyOVnD33we18bEtgccus1pUc2zgcYr93Op0Z6o4jgRRaFdtgBZYNY+lahqjTQm1GmI09zfci4J9638oJpCOT3Sf84XZmhLx1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0TkhbzfvfP7Gq5CfftMhEhS4T685gWWcZmdjUZegg8NOxuCGB3NYhLdVx5Yf?=
 =?us-ascii?Q?ViqqotYbLnMfq0mHslKDPNmUt/VV8RS3tIdgG4EPGsFW7A3lwdkc7renhtD1?=
 =?us-ascii?Q?TWFA2la5ZpjWSIaxXxL2t2QSXsHj3pszyiKfhEHY/oVoE5aKFleO7OUavBx/?=
 =?us-ascii?Q?M+n5Vk9K68rMIIuOTnw0kcWq1puesZx0L9IrvqD2eAshBalAB40/U/ACX8W8?=
 =?us-ascii?Q?5dY7E7AxxdY5KcE6BFaPgE668UOkkNcz428ng8N9IDCTcdcToJgXk/M6LBEO?=
 =?us-ascii?Q?1fW9Ul/qypeP0Nwzph7xOBqV18RintaHQy7T/NjSHGT8tztNQ/T0JvnJ7Joe?=
 =?us-ascii?Q?OZiv6ZehFUXzFFtMD2IY9VLP6xISfsRze7LcekuRN7rvNXyWtrgy0GNIQ0Ws?=
 =?us-ascii?Q?f5i3g7XSh3EvfIdc3qgPtl8ZWVXOWCNFULOG47bBMsDEp1iFQ7UcQX+/1dQu?=
 =?us-ascii?Q?pgWrPxgnejnkyxemIDwW+d4+NXD/C0kVPAXYmfbX0CLO3gPACoycs8+t3sYQ?=
 =?us-ascii?Q?nz5jU9nRKH9S9DpHEhLYN1rQwSx3xDw6M2RPS9Bihv/XD75Kad+CMcho4l6X?=
 =?us-ascii?Q?v8pAlmULZLGQ/0uI+VMkGgbplt41mfv7ReVP33XmAcbwNWx64xTM+l8NruiH?=
 =?us-ascii?Q?KfpAMXv6JUljkBGxf0tfeGh3f0dMd7nliAjI9QlC5nc16cZwS3B4POYnmeVU?=
 =?us-ascii?Q?ikbuOyUbR45MPbxTmFZ1UtdHn4SlnULHOOJl030VuCd5OcRHkOnvyo4nu4Jc?=
 =?us-ascii?Q?AfUyKA58Iu2AvpPjQc5jdHjaDV2bfC/umUqxPCI8HdfWDQ7gsQdxdTvM9rZ2?=
 =?us-ascii?Q?WqJvHkU7rLSfX6OYaaCu4Srzh/GmL3B4/9/ry+KTPKcPlObxco6C6V7Fl0QK?=
 =?us-ascii?Q?N44GBtye0qd3b2tMfIkHwDAnGjL0//zaoeH26wGizDjsgwDOSfwbjGqHXFlL?=
 =?us-ascii?Q?vxOGmSMQ3liTftAAVhaXtnyqubgS/ScbyubTDeZn1SfDNsIxMmKxSv2Jb76w?=
 =?us-ascii?Q?1yuU7W8itIrwE6uOejJwt9Olb47niRtGW5GnMYHULYCX26dKLjNC347n2em6?=
 =?us-ascii?Q?H/89TFxNEYY605Np1SkvB0A73CtqwI1iVZTMK09wzTz/Ng0BjNmf0MK5duoX?=
 =?us-ascii?Q?AU7NKt5dAvkzBrRtPrARKJBCwO7IbU2aK6HK4w4HwBl0IQ1b/HWfV40rKbS0?=
 =?us-ascii?Q?HQ4ZECJs6HCUJAqOiq+nRXUR9cgmU6iC9eQJE6YGG6zx2rJtuQeQaQjoKNay?=
 =?us-ascii?Q?7Kk9G4UMHeoTGnM/mlMo8gWf1EM9EOuullsrKatZTouW1Wk4fggGoz+/TpwN?=
 =?us-ascii?Q?6jSr/wOivfI1GY7F4HiNj1/7p4lqULN3dnCALkVvdfylYS7yez4AlQ/GWQoS?=
 =?us-ascii?Q?K49CkMDzaoilWSSUTgureXI6UiKDTMDdfkf7M9pA2uSLpD5p9/FU+ubDO+Ey?=
 =?us-ascii?Q?WCXK+kZivArc+wuuXTuimP50+oidF7JBzLvT6tadkU3SQofT5lBZLfOg+DEv?=
 =?us-ascii?Q?0ugI5ZwP+ywR+w8UWOKpQRpqR9ihox6P17crBtxdZ8K/fcU7w1IIAMDFs5PG?=
 =?us-ascii?Q?Ny1P6S9cDWV1xpjtwEHnqS37fgx+N5CKPHk9AMBsvlvMlURgmm9wGm/Rzz4B?=
 =?us-ascii?Q?kHuxSzpN7boxKIEvmASqU+lAYXr5eGyz9gYpp5Jtdho203QieRAUT0ugX7P5?=
 =?us-ascii?Q?ayiQmoShXJIDuyEWC3lRliXrv++Ut3WtYXS4ObRZQ97E7jjYwVbtnucUVZBj?=
 =?us-ascii?Q?4nXUYrjViIoYMayFZ5HHj0iHounIo6VrWo80walGLP8RYsBeARjJ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 171d4258-4a6d-44ab-b7e0-08deb0017475
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:42.9740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/IcxPdxTMs4vwEu3a8IrcInYYPYVk5+agwnQwYmeg/KfOTbdTcgQx+eyB4Yd3xJw/q7MxXwhS7THH9wP15qXxhwNWgWvOq6eHVGntcOQFS96iUXO+vtbNXnUtEWz2nK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204

Add Peripheral-1 domain PLL clock driver support for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index 44a33afc04dd..50bfb76634d1 100644
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
 		.data = (void *)&jhb100_per0_pll,
 	},
+	{
+		.compatible = "starfive,jhb100-per1-syscon",
+		.data = (void *)&jhb100_per1_pll,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jhb100_pll_match);
-- 
2.25.1

