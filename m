Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB92C139B;
	Wed, 25 Dec 2024 00:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735085737; cv=fail; b=K4zybRWrctKufW9QKjqeT3U5MYckEGAubAqQSeeheUneSptdAc/jF8YbdbE+WyqHLiJs6qdGbPTYYkqvAETFIxLp/GfwvsMUXFdCRwk9gOPUEnzr7ddiqaqRYG8ejsuEnms+EeE4Y9eJp1oymdPpxxmZOMqHO+g/86sjlIT70bQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735085737; c=relaxed/simple;
	bh=eni7iC1fTYv5ZfLPpDyezZQlG2mmYYfyM/nIGE1Q5Vk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QemFGVhRba7ShCn/MmP47bBYb2wiWWN9OxddFmmvy+Bj9QQWKQZBWc2TWdreIzFriWu194Q2h7pFe1CGUQ6AA8YtChjUUfLuO139mWDf8Hn9LOM+ShvVGEYL4Hpx0SPXzcsmybFj/gjTVWGaVyq0hpoOh/2W6O2ujNQ3lsMmPSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MGxMIvFS; arc=fail smtp.client-ip=40.107.22.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MGxMIvFS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkki6U5y2fu8SltVopt8ZobUZ8MvU7xnoDGSUPViRLl7A7oaEnpFybwsAcP7czwtWj7n1y/I6fmCabSNRyU/u/ji1/KMFBGr5ai5MBNoUtRqB3ZtMQVKSNOlCooNTv5ceDhIrOeAhS/GqntOe/MvF1KX9LJaiJYB0t0V6MVPmBxrtNsjCk+f3bLg3X7YRa39XDcn8c4f8sEnbo1nlUE1IZSjU6ssfKkuTQpk82nVUzj9yn+1/bobJmzJ8LCrRL8ZB+hIhTPI48sTFW+hSaTx5N+DsdsdxCsE4SVAue3dU3F1CRFvu4ginLyC4M0UvuyzvVJ3r9zf6L8b1h3vQF1+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckb1dACYR+n1dwkSbqtZbR3aVWSqxk3MhRMKYD7jIgI=;
 b=yhhVsOzyPdZgPkVyjIqBxaH51APKBH8BjJ1ML6K5tklUGq7vA7Ga6IeDCYQa+uIwAPBT99u4x2aZhjiOyZZoaeAPjzDBWkJ3vkYbuji+DvHyGiwMxsoDJ11O6bGA/KBThYYEYk1gr8m8XOEsFdiJZTp4fI74rHHlThVAcHo3JB/DHc1FNi52EXnuOg6qP7UZ5XJsRkiEollPifrdaVKaDOYYjyDsntHls0TbwopiP06llD+ACry0Hm76b9pjstH1ZzN2Wpb0u2SvLlwZ8xxV7Yi1VLeFsoCMzD/ixkDnsICSk8uxa8ptQr6ZeBLfGuz4fJ4RSTdaXhXeGgUTGyIKzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckb1dACYR+n1dwkSbqtZbR3aVWSqxk3MhRMKYD7jIgI=;
 b=MGxMIvFSEjXgY26vqH2bcKhoMzQcPtYQVD0S2qYWHfBIlaf35NH9Tae85EiBHf2HgIX/x8NLla2Gc0mdjhatGNDUoz3r/ZEfmulzpyHYh+f2E/3Jrpn+aoKLRI30TsKREyPAAKoDFKvbAxLFYZonqFUDV9n+Yj8VCmdsPsBygAvNWZJJxzXJh4d+rW2OtHFvRpz7s4hwYo30dutDsQsK0of6hRQ8tUawCEDLdQbOCm8OmL3SKZAxv7LFa+w8XQMZ0kyNWMJ4JDb4gl8AhU/AL5D2XH//vVOyO/4bU//1noSD/N1bibUAEAWwVlTyq9gokvZIY0O6DaUGp0q/dltXrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 00:15:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 00:15:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	linux-clk@vger.kernel.org (open list:NXP i.MX CLOCK DRIVERS),
	imx@lists.linux.dev (open list:NXP i.MX CLOCK DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V2] clk: imx: Apply some clks only for i.MX93
Date: Wed, 25 Dec 2024 08:14:43 +0800
Message-Id: <20241225001443.883131-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: db2818e6-36ab-48b2-0ba3-08dd24793bb9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2lyDR1mKmNZWr96GsdgS+ns/zyNiEibooXBymU2WE+ccxNYeso7LRrOIzbGU?=
 =?us-ascii?Q?JCBeFyC+Ct4Q90gGvVeuPlySQ+Vf8AhjCXLoOEbgWwb5A90X6Ytst7OpHroY?=
 =?us-ascii?Q?EfoPdIigX4xzipVp/kCER1Gg1f9VOT7sibYedB5UpjiJ4frJ6O27Tltq9HO9?=
 =?us-ascii?Q?7kgBKb7l+uMEIQmHrh51iVQRaPNUqvT8j125Mz75SFfm0Dzjh/SLymK9CSr4?=
 =?us-ascii?Q?6dY2TJD93RmK8Pi2ciCByhG66hdkUUPtaNgJUsceVqcqG6UURr311s4OVWAk?=
 =?us-ascii?Q?gAvKpDQCJ1AtH8pgFZw6bRTxOs85AJK/3qikN4u80mQR8Q3x0wE5VCVSLztb?=
 =?us-ascii?Q?C3uAmNuYVIGrh4NPNx2heiA4whiE6C4q6cOM9sbGqHroNSlQLhWKJvoRwStL?=
 =?us-ascii?Q?NKpwYde8gjiPDphqoZkM1qKXACAaTw0OhuD9O6CE5REQO2RbKwjI/UZT1IlO?=
 =?us-ascii?Q?FfRdXFYpomwp8TDB0xQq2u8HDylB6s3EcmdMJGyg8VSL8p+YHv45L+OmOaOY?=
 =?us-ascii?Q?MfaY/UWoH04frCBOTkjzGQAv/wY3yFcoVZb5RQFjCurmwGWWkRWAen8GSWfR?=
 =?us-ascii?Q?i9DDpJxaKNsNjxzfZIk/xiqu+N9IVwaO+ZItwJ2KuWFzbS5fOvWUvuHdYKys?=
 =?us-ascii?Q?PDwIzspTPqCrO+ZUI2hteEX21AZ0aJuEie1Vn/XiGf+qL+4HU3Xcstd47xN1?=
 =?us-ascii?Q?BDEhPLOYuhhzN/WnBX+65C+G44z4e7G0QWL71ZgMSbg9BF/s/QQjpBNEF798?=
 =?us-ascii?Q?8dlEzJ4PG+QI/C+DxuHo/W8fLMh4zmLNc11g+fR56eWj+Hi98riTAstWF1S7?=
 =?us-ascii?Q?IlEtj13v9njINvuLYjapfcRFqbigLruudqzHnzfPH4pQrhTIKuiBrWX2TwCO?=
 =?us-ascii?Q?5Z5SxqQ+f6ffupJnQ7WH2huwzWgTwJ/XtAi5khzyYAr1uUnKKgIxlzEnxzIv?=
 =?us-ascii?Q?evELzpR6x9H0vFzLHAfN8sUAbajZa7x94slrKMjlT+LwM/8ua44lfvp7QuAj?=
 =?us-ascii?Q?9lKPd/IX7KVkXbzduhYrCYnXnX7uEtgx9J1qEb0RfRqjGPfvrhu4pS8rQdxC?=
 =?us-ascii?Q?3yCkJWi0RrN+XuXQSnl9OudJwGeZztsXqk4+lr/6Wxon0PhLUnNEaj09ECtr?=
 =?us-ascii?Q?8D8/HXPg4urykCqG7RRCYLSdSEYVUeMPr7yyfvOYb1SFmGxYuHsQN9X/rq3P?=
 =?us-ascii?Q?E3MOuHIzFvYBqruNzp7GP8mpsWsAxXOuiqiCZYpSbeScl7hk/zlWY1oYoMeN?=
 =?us-ascii?Q?3FmDe+1do/6omdNcoeBRJGrU/Kkljivgbp0WVcsRa9hm7Qmgw00xyaXRwCfg?=
 =?us-ascii?Q?ZAfpSyh4qTGfvUghklIIxl7EjHCNJHWGs4zHPrgP5W34JEn9mWM3pJ1a1gbh?=
 =?us-ascii?Q?xBJclMMGybLdzwrHdLS/tKcq1orihmW39RhUdRnLEJM8E6stSWinrOLRQsuB?=
 =?us-ascii?Q?oqZYmtChJUAV5Cefay3xblGDj4Ezkqwu63bWNOubhd078VI+ltq2Cw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GO4jFSoGwM1zi93FEQFqZ2IradySOuWBWl+NzueeiB5uQDamDxthu42zvFhG?=
 =?us-ascii?Q?FGA5h7gIf5epD9p1cUrG4vCzV3Ey8DWbcKaBwlT/OK4iHSdoP1ckPLmPsBTg?=
 =?us-ascii?Q?kP9pEzotFXcqNYwDgeXOAWPy4VPg3A5QpAd01H6xMNLdK65MxLXPspcv5T5G?=
 =?us-ascii?Q?FufiQFNxpt1nM54snpR5+J+H1TBpq/MqbNm3iszd1a8EXKhjIy2QKTDMm7g7?=
 =?us-ascii?Q?+CwTHqdWkuK19DvUqfey3gYigAgEsmTCT4lGiKXdXFoKzJEk0GDVinorv4re?=
 =?us-ascii?Q?UYFc/2Z9S2jIDrjQl60rkQVCgWfURPDQjb7F5BQOdJXXmch2lXVKCtumP9QA?=
 =?us-ascii?Q?v8bXaqMzRIjep8DKuMDrA0SvbI80s8zC8TZvBvKUmTLudTcGEenLkdwWApAs?=
 =?us-ascii?Q?lF2INIL4xQ4I7iyQSSOEokiDeRTPI8LzeugsucZYSd7CKDIsEifWBIHMa6Bz?=
 =?us-ascii?Q?qZTnjHO4Ae+RNbTujRg/6WUQNfzahAl/99R5W66Ylputh9hhqcqzE4PMsBSk?=
 =?us-ascii?Q?4KfYwqndENmz/dPLMvquOsQTzBMMDLmncV9EAnhYFDv5LxXs9Z7upbAWzK40?=
 =?us-ascii?Q?jMeTyKveXr30I4z6qRvfco6wD+srs3H+FOOYjOmiTA0qoZZKBoTYCZMV4i9q?=
 =?us-ascii?Q?AqmNl/9rGVPEhPbkOyg3FV8qpu/6IsFxyXJ/oM4pjSvDgW3/3YGDoW02KWYP?=
 =?us-ascii?Q?I8L+xioXHixs7QkV+Cj+U5BxTI1C/7PCNrnSaoBkUvIyWqpzdL6Knf1Ic3vL?=
 =?us-ascii?Q?k1u+uKPNq54hd/DKbscKRwFm8aKt9Uzk2KP2ZCFECCKGMLSLWkKaowqvGRQp?=
 =?us-ascii?Q?XuRkwHzEMeKUA3plB7WB764TLd0NEC8ThSVeKbrhSdBAoY9ox3ozSluybDvf?=
 =?us-ascii?Q?t6n1+i1vWC1twmzW29F/PeWIOe3qOWTk0dF6yTlRFwpZIbh63LybICas6+iH?=
 =?us-ascii?Q?X3PWCkXLm2mjWneq2d8j9SFi1YDx1SUUyXiLMlMMd7XQmoARZbR9wmtiA+37?=
 =?us-ascii?Q?X3idJGzVfKXkkJ5hytcJPM8LJv2hMxl5i2ZHEdf9bJaxmCzbwrcai8ynyhnh?=
 =?us-ascii?Q?DAeCuyxLC94lrUjeQt69NGxlNVn5rwxooh8UVIDn1qXuq2pkzwvKqwXeP4qE?=
 =?us-ascii?Q?gUhijpdpcEd0ZAap1OZs8md9E07XsJd+lpBnVBjyZZ1aq71jBZSHnOxdFcJQ?=
 =?us-ascii?Q?6G647gk1NrMo8qtvindSUAXQR14Y/wzG8IJ7C28fpMkX9bmwg3hWwT0cpmIO?=
 =?us-ascii?Q?p1Z5ceQNCTXLw3WUaNRDGYw3jp9446YQYdanejmRWxt+IP2NRb3RQ46TwK3W?=
 =?us-ascii?Q?0PIc5GFPGGscdysbFVBx5D2aT/to+9J515lnuUBZKeUpMK/jXGUoD9AAd4f5?=
 =?us-ascii?Q?hQpwDllkGuETx/zL1keAmiLeYWOBZH/kYG06tpbfER5jBAjCVfOPoYvIy4n/?=
 =?us-ascii?Q?CJSBujNKMgpcId4TqeAHcHmA4YGPdDSdkP2QdLIgwpM4osUIrEts5zRjEJR4?=
 =?us-ascii?Q?3K9nZPasCpMTGoxP1ro3kEiwpw+D3/1RYmC7rvG0NSRxeL+XCG9quEg/DldV?=
 =?us-ascii?Q?qQijPTJeBg55ZRzgjAGS59ifrUPGJyZcfyJJ0gDX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2818e6-36ab-48b2-0ba3-08dd24793bb9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 00:15:27.0549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZE3X/xbWlBMZuknuoz4mHKo72t3ia50Eb/tikehoCftwHaj3avt2NhvR91L43Whc9u67zMhRkwlMTtdGn/BrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174

From: Peng Fan <peng.fan@nxp.com>

Enable the LVDS gate, MIPI DSI, PXP, FLEXIO and MU only for i.MX93,
because i.MX91 does not support them.

Update enet clk entry format to align with others.

Fixes: a27bfff88dd2 ("clk: imx: add i.MX91 clk")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Update subject and commit log after phasing out more clks
 https://lore.kernel.org/lkml/20241203130530.1206526-1-peng.fan@oss.nxp.com/

 drivers/clk/imx/clk-imx93.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 58a516dd385b..5bdd2bdce46e 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -70,8 +70,8 @@ static const struct imx93_clk_root {
 	{ IMX93_CLK_WAKEUP_AXI,		"wakeup_axi_root",	0x0380,	FAST_SEL, CLK_IS_CRITICAL },
 	{ IMX93_CLK_SWO_TRACE,		"swo_trace_root",	0x0400,	LOW_SPEED_IO_SEL, },
 	{ IMX93_CLK_M33_SYSTICK,	"m33_systick_root",	0x0480,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
-	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, },
-	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, },
+	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
+	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
 	{ IMX93_CLK_LPTMR1,		"lptmr1_root",		0x0700,	LOW_SPEED_IO_SEL, },
 	{ IMX93_CLK_LPTMR2,		"lptmr2_root",		0x0780,	LOW_SPEED_IO_SEL, },
 	{ IMX93_CLK_TPM2,		"tpm2_root",		0x0880,	TPM_SEL, },
@@ -177,10 +177,10 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_WDOG5_GATE,		"wdog5",	"osc_24m",		0x8400, },
 	{ IMX93_CLK_SEMA1_GATE,		"sema1",	"bus_aon_root",		0x8440, },
 	{ IMX93_CLK_SEMA2_GATE,		"sema2",	"bus_wakeup_root",	0x8480, },
-	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED },
-	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED },
-	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub },
-	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
+	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED, NULL, PLAT_IMX93 },
+	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED, NULL, PLAT_IMX93 },
+	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub, PLAT_IMX93 },
+	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub, PLAT_IMX93 },
 	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
 	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
 	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi1",	"flexspi1_root",	0x8640, },
@@ -188,8 +188,8 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_GPIO2_GATE,		"gpio2",	"bus_wakeup_root",	0x88c0, },
 	{ IMX93_CLK_GPIO3_GATE,		"gpio3",	"bus_wakeup_root",	0x8900, },
 	{ IMX93_CLK_GPIO4_GATE,		"gpio4",	"bus_wakeup_root",	0x8940, },
-	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, },
-	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, },
+	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, 0, NULL, PLAT_IMX93},
+	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, 0, NULL, PLAT_IMX93},
 	{ IMX93_CLK_LPIT1_GATE,		"lpit1",	"bus_aon_root",		0x8a00, },
 	{ IMX93_CLK_LPIT2_GATE,		"lpit2",	"bus_wakeup_root",	0x8a40, },
 	{ IMX93_CLK_LPTMR1_GATE,	"lptmr1",	"lptmr1_root",		0x8a80, },
@@ -238,10 +238,10 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_SAI3_GATE,          "sai3",         "sai3_root",            0x94c0, 0, &share_count_sai3},
 	{ IMX93_CLK_SAI3_IPG,		"sai3_ipg_clk", "bus_wakeup_root",	0x94c0, 0, &share_count_sai3},
 	{ IMX93_CLK_MIPI_CSI_GATE,	"mipi_csi",	"media_apb_root",	0x9580, },
-	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, },
-	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, },
+	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, 0, NULL, PLAT_IMX93 },
+	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, 0, NULL, PLAT_IMX93 },
 	{ IMX93_CLK_LCDIF_GATE,		"lcdif",	"media_apb_root",	0x9640, },
-	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, },
+	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, 0, NULL, PLAT_IMX93 },
 	{ IMX93_CLK_ISI_GATE,		"isi",		"media_apb_root",	0x96c0, },
 	{ IMX93_CLK_NIC_MEDIA_GATE,	"nic_media",	"media_axi_root",	0x9700, },
 	{ IMX93_CLK_USB_CONTROLLER_GATE, "usb_controller", "hsio_root",		0x9a00, },
@@ -256,8 +256,8 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_HSIO_32K_GATE,	"hsio_32k",	"osc_32k",		0x9dc0, },
 	{ IMX93_CLK_ENET1_GATE,		"enet1",	"wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX93, },
 	{ IMX93_CLK_ENET_QOS_GATE,	"enet_qos",	"wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX93, },
-	{ IMX91_CLK_ENET2_REGULAR_GATE, "enet2_regular",        "wakeup_axi_root",      0x9e00, 0, NULL, PLAT_IMX91, },
-	{ IMX91_CLK_ENET1_QOS_TSN_GATE,     "enet1_qos_tsn",        "wakeup_axi_root",      0x9e40, 0, NULL, PLAT_IMX91, },
+	{ IMX91_CLK_ENET2_REGULAR_GATE, "enet2_regular", "wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX91, },
+	{ IMX91_CLK_ENET1_QOS_TSN_GATE, "enet1_qos_tsn", "wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX91, },
 	/* Critical because clk accessed during CPU idle */
 	{ IMX93_CLK_SYS_CNT_GATE,	"sys_cnt",	"osc_24m",		0x9e80, CLK_IS_CRITICAL},
 	{ IMX93_CLK_TSTMR1_GATE,	"tstmr1",	"bus_aon_root",		0x9ec0, },
-- 
2.37.1

