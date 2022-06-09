Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96C3C43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236658AbiFIN1e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343670AbiFIN1c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:27:32 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBD91105DE
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUTGzxyTEl9RkVaohvutYbkfSdhSvXuLvl38IOm1LyoCpnLObvXfgGV0eKSmfL7fs47DeUJn+/+W2kyDSUMl7x0HW6L7x+vP+ju1y8KoM1Pa3vUdVLivWaY4CFQwlaFaY+NaRHIh8kpeg2oYW0qVNdkQJKSQXjxOLczVILCt4vJdMuxPb/R0wLEtw6jOLkZx7ozhfuBcoMjJMEO3klv9wSre8fa1gVEGx0S0tzDwCZE16w2mrXNQQLD6QlEpLrUUeg8LK6BXr+8ojE2H25HlxxdyXriDvTqeYFEZ7Y/8BzpWXbV9flMs4SjVDPXI5KCAnDHMQcQwluaCHstjhxmLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+5RDqJE44zfKgqxz+x7BOWkWfjzF2dn1EOinB4MUm0=;
 b=Bx9lBMQWznSC8KLIJHp3aLpsy6UTR9imTFaLh5OnVcNT4SZtNV0zzNb6yVNMAOPfBHpKH+z8Q+6jmB3R/MNE0NwtRMbFSwcB2dQkifbzwCkG2kp+Qjvwubq94GYGQ6EW+USp2XgcQNj36DT0Iajkn+8zCcgsW7ROAhoQGIm3ZkJ6hv8H0s9kV4xkGbwh3WrFUsYGnR6hv/nL1eWwlIpgFBZkJdF6tEZyQIZFFNCpE6ucKeTWrFrlxpBmcp4Qlr/BNy1lKwqa6qKWXKJAPjTTXqZvJlRGrhCM3nhTRtV1i/NEU+e6gtji6qPV+/q1rqlXdPJ70oc95Zx50kJ6dmxx2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+5RDqJE44zfKgqxz+x7BOWkWfjzF2dn1EOinB4MUm0=;
 b=L2LxdiBgTD9uXRy53MCcoUHmdQOguEFnHyqXTAss+SKxwRZJVf/7MQmaQaskQVRd9Ofgx8ypaBlMoFwkomRx6NGseyon6Eb62yyXqaCPajDjGBJCuw27HRRvg7TZcHMGyn7eeFrP6fE31rkAkIUoyVFwDdXzcX1k3pALAUwvEbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB6220.eurprd04.prod.outlook.com (2603:10a6:10:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 13:27:27 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:27:27 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/7] clk: imx93: Correct the edma1's parent clock
Date:   Thu,  9 Jun 2022 21:28:58 +0800
Message-Id: <20220609132902.3504651-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd62b688-2c65-488b-5682-08da4a1bcbbe
X-MS-TrafficTypeDiagnostic: DBBPR04MB6220:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB62203305BDFF2CCF808D79D4C9A79@DBBPR04MB6220.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aIkXc8Of3xjXzu2WY2jgkfrDHWRMe4ZrNjWgvtsf5ZJv/EKLSOT+W53yEraY3S+cqn13H9K7FbBJX1plMSMJHBPk8v7jRfm4/RGqvDxQ1w58pUeohBk611pQnOMxGc7A3+r/WmfwRYWvQNw9iAHC5tzulWr2/K//L+ZMs04osybVY56fPaJkWwdt0f4FAArzxQI6Z4LMtYiz+/oP2KW8inPoH2QT1uMr8RYfoS4PerOsxIY06Hdiem1Z6xkif5+wSSbWOYG1hL+qRlb+BE0uDPX5sBxPalHyToWaWYpTsdTevLFWNQzzyNuDiFkt2DZEUv6fqdooEjQdg/sgkjN11GIE6HxU+nGEJdrjqxa/m1VoLNS+JL9ywC/50fHnJ87QM4nGoVo+//OA4wLt8sXSuaEsjril6euw0TdbR4a/afykRdSm5Wk65gfefe7SUK6lYR6ZhJurh3vfRu9e7eaO84RMyoLfyO+s5ECS3I7wtEpVjwKCFXJJhyUIaFrh4biSx9uTjzoN9ttSHjwoyRjjuZc9DOFsbAMnBAa2mISbs9P2HUAQmr6q0+Xl3QkO0U1+FbC1yYDe6UZwfhUKkuLJbdAuKCKD8BvScaBCIs/Pvd+8NX7Z82MpE7m+PL5hQw8ZoMiPJ04y1nzzOKBSIBoFxJxM2NTyHXOnClAjAC0Acy1sgiyGtVhasKl9rHH86ff+JCbGFSD3MmTUHA9P07nT5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6666004)(26005)(6512007)(6506007)(52116002)(2906002)(508600001)(54906003)(38350700002)(86362001)(66946007)(5660300002)(316002)(6486002)(38100700002)(186003)(66476007)(66556008)(4326008)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KSgTSkl5Txc+Cxn8d0j1hRbs0XjWhL/MS8AsY0PU8rp9Zd74REzxnlZ8wUF0?=
 =?us-ascii?Q?0tnflXI/R473ZJwtXz8NzfzvQu1bmPV8hBSia1Zt+lGFh4uNcGnHWgXaHKOk?=
 =?us-ascii?Q?9eZ5zphnbzNx3ljGMUXj2WeRrejwv2f9lsV71Wq2zALvLssn8WnEiVPo5ZIo?=
 =?us-ascii?Q?thLhAuvGE9fhLkF8tAvxopgiM3oSagCuch/22OTz+ie1kK5X9yMyrcV8Awwg?=
 =?us-ascii?Q?Pbq77mOnyIC321CcgvpIdceErOTD3V3KXJKRE7MFJDNb+WJ7aslVJAfRxHSl?=
 =?us-ascii?Q?SjE+22IiVYso/bfQbKK3DfuS2KOJi+EfoOjRuMzsQkJi/OeHN2OoQf+69HWc?=
 =?us-ascii?Q?Ec4FWnv7N+ZJ1/dVpkb4gRnYP2I31/QWh4W5Q7O7Qkz6GyMdnnBrYyPn4WrN?=
 =?us-ascii?Q?S0ROyw9AXydD2Um/dn6uFoS4I12mnTmz2XrGXA/0M42et6QBQGGRt9RPQV/0?=
 =?us-ascii?Q?cJkfPsgPAU1DW3nhdfEszLvB2+v8rTBiXAlwbE3MOLBmOaB77VicX89kyKhm?=
 =?us-ascii?Q?U2uBCqEc+L+x+Ezk2oJksaVNNQKaq0SWHj1mcinBbp95U3YZweVaxcggsvH7?=
 =?us-ascii?Q?gyZp8K4BJ2gOjPRcV5u8sjwp4qH1GmkORS1EqE4uXlUEKoyEsc7qwR39tO6L?=
 =?us-ascii?Q?kigC494dNYAcSTdPM9T4etT3KJInaqnNYAL/JeZ1zOGxD/q5dfkrBG8oqC30?=
 =?us-ascii?Q?Ols3awklAAq/sRI4z/pQqaw7Bgpot2sFxW/1ZvdvXu5PFGjTVBTLyVtg6/AA?=
 =?us-ascii?Q?CHKon24YLa997ekLK2aHrbfskke2ZWn9dZKC7cdiFvSBAEUz5FV8Z4Wlr7Lc?=
 =?us-ascii?Q?l3fKE3ZTjQHwtNYuKKljGs3kQqNr4ryI0Xs1jPSqCReSLVGx9EDO38/+DaOr?=
 =?us-ascii?Q?bliJ6ow66pf/0cvOddSavgxUv34OiBPrRyi3TVjbmNgzBjmkYelxclL3eVKi?=
 =?us-ascii?Q?XvthkVuAW3WvJwImrKhq6A/d1n2+V76PezL2Oo2qQr4Fm+1vMa3iaFni7I8f?=
 =?us-ascii?Q?jW/zjNzeP6qPhgt6VR8Sm2IDpbSrhJBrWqgS7y3jMtgStfpuytfAu25FO4Xv?=
 =?us-ascii?Q?jagSn9Sj2I5eRBRJKPiKpKxpnyT+lj7pkr/nwYhdX+Gf5457MSE6NiI6qT6m?=
 =?us-ascii?Q?kPWO5E739Bnu3fwkGE07YhJIcF2FrVqxI62MskTH/pdeeO4VhXjzHVF35lpR?=
 =?us-ascii?Q?E3G6t0l3MzjBC74wwZB4Vv8sbzxmACPptT1XOrK2Q3XVMabsoUpAZNkGDXD5?=
 =?us-ascii?Q?8xISq/pUlYyUMyT0SDD7Rj3Fk/v8EzQeCG0H5uwkbjDGQjK0NlC/bXDNIZpT?=
 =?us-ascii?Q?hN49juPs5ezMx/0srDlNvTA1X9WRuvv+HrPAHqe80PcENfP6jNp+SYgQSAuY?=
 =?us-ascii?Q?qftQDtYrXsbJtSmZfNk7gEWePsF22bNTAXXGSMD4Cbs8TAntaItSFVg7W653?=
 =?us-ascii?Q?wziRGEyYrBAk7+dlDCRTQKRMx+3MztQWnSrnDCRYIWOgBI0/32Kg7T7ZWERh?=
 =?us-ascii?Q?B5+1+ogmO8IZB1MbR9B1KihS3j5SJyYjOgXlKkPA+lzUDdmved3VqqAog1kD?=
 =?us-ascii?Q?RpJlMg/E8961DIrU1CqAUNMYomPz8jyArILesuq7X/DozoLDeo/T9UvqJNdK?=
 =?us-ascii?Q?B9iw/UYlRnR8GnXszK9Ubci0TwsbsUIA4io9InO+PBAcl+vNFKjruSxeX7CL?=
 =?us-ascii?Q?mseLPmOIbiDXc6L6u5VMjk0IW/VytFl7gF7nxyMaIAGEqjZvifcN08yrhdWF?=
 =?us-ascii?Q?gDD1TQgKkw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd62b688-2c65-488b-5682-08da4a1bcbbe
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:27:26.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwhgoTSa4H2HlnQeOq0SVJVYnx+SSRtRjAXueknoDWblMfEJ8mc2YmApM0cprSXX2rrmZdqTWU24c+yBFpPN8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6220
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

For EDMA1 in AONMIX, its parent clock should be from cm33_root,
so Correct it.

Fixes: 24defbe194b65("clk: imx: add i.MX93 clk")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 26885bd3971c..f5c9fa40491c 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -160,7 +160,7 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_SEMA2_GATE,		"sema2",	"bus_wakeup_root",	0x8480, },
 	{ IMX93_CLK_MU_A_GATE,		"mu_a",		"bus_aon_root",		0x84c0, },
 	{ IMX93_CLK_MU_B_GATE,		"mu_b",		"bus_aon_root",		0x8500, },
-	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"wakeup_axi_root",	0x8540, },
+	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
 	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
 	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi",	"flexspi_root",		0x8640, },
 	{ IMX93_CLK_GPIO1_GATE,		"gpio1",	"m33_root",		0x8880, },
-- 
2.25.1

