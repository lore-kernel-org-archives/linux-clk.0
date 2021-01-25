Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C39DC433E0
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 14:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65CB522D50
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 14:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbhAYOn2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jan 2021 09:43:28 -0500
Received: from mail-db8eur05on2075.outbound.protection.outlook.com ([40.107.20.75]:24544
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729627AbhAYOnO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Jan 2021 09:43:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxiy4C8xLtNrw8YooMeLy6GIEp/W1eiQBmNCRbfUSVNAMpTXS7y6Prq35j287jEHovxug5zv3IekhnKUoGJm6UdJ1FaW9B19jL8cVvmdkOJ0YhSyE3jPV7NVUAviik9jtq9NXUjX4hdNS7WlyzRSDdw1/IkeoZexP865GSdvRhQ/tXX3/7zeEpWaJPKAI8nV0z/c1BfOdMAQ5dt/DatmY67LYqaUGuOmLVlFXQhL7epHQ3eBtpZ2LahkDV802Hw4uVQhJ0wvOVVXRbH9RMd12glyMHFK6Fu3lKx7uv2hKo8SFBYORb9NTpDiJErq4IHPDFF9wLWN8NLxQYX1gNB7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/U83aVEOvt1VXj4d0mcGKqJUrxA7Dwvbb4rozBzKPk=;
 b=Ma1Mayx+OjaMb23H7EemC6uQVYGJQqK9nrbTfkewti/HGmcdbt8eogjjXQcPq0V88+PH6jVOfGhy7Zj08i8+n7DaqoFSVExwT5ozDyUC+ICt5IdJZBU/3ExCURxMEU/Cwifd4L40ZLfGN19fCV48ilO2nf2j9TZsCfxeBvYNV6+yqa8x39IKOqGhbPOmGaJVNgwhKSkte2bSirkqogL9qaCKFdtJiTxLSlVTuY1oTMLIb07Rqa4PPOwIs0Y15XLoLWVK0n/zTPODO/FRyAAJvkstV/z6gWIrb8RotVq5iWj/4GxQGicccNPE+lyvCA77cwU/qT53fvp5Ua3ToIRl/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/U83aVEOvt1VXj4d0mcGKqJUrxA7Dwvbb4rozBzKPk=;
 b=eXUfewngNoWUOiDV+MCIiHvuBJKjrxjbwIF2bYmYaUNEfjLb9cnKSiuCng6WJzHk4RXREBrcm1nkTeIkQLkSLXXjnAIKz8ccHeYAN/ANSkQYQFmXKvfJWFc3L/0Lb1TXVMHVHYSRSbCAAHKuq35R2m4Wn00/nEncluANYquN/uA=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB6702.eurprd04.prod.outlook.com (2603:10a6:803:123::13)
 by VI1PR04MB6125.eurprd04.prod.outlook.com (2603:10a6:803:f9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Mon, 25 Jan
 2021 14:25:28 +0000
Received: from VE1PR04MB6702.eurprd04.prod.outlook.com
 ([fe80::8da8:ad8f:e241:457b]) by VE1PR04MB6702.eurprd04.prod.outlook.com
 ([fe80::8da8:ad8f:e241:457b%3]) with mapi id 15.20.3784.016; Mon, 25 Jan 2021
 14:25:27 +0000
From:   Wasim Khan <wasim.khan@oss.nxp.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, V.Sethi@nxp.com
Cc:     linux-clk@vger.kernel.org, Wasim Khan <wasim.khan@nxp.com>
Subject: [PATCH] clk: qoriq: use macros to generate pll_mask
Date:   Mon, 25 Jan 2021 15:25:13 +0100
Message-Id: <20210125142513.3919014-1-wasim.khan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [92.121.36.4]
X-ClientProxiedBy: AM0PR01CA0135.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::40) To VE1PR04MB6702.eurprd04.prod.outlook.com
 (2603:10a6:803:123::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv05369.swis.nl-cdc01.nxp.com (92.121.36.4) by AM0PR01CA0135.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 14:25:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eec41b37-60c2-4b70-d81d-08d8c13d0faf
X-MS-TrafficTypeDiagnostic: VI1PR04MB6125:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6125AD8A2B1093252DFA55B3D1BD0@VI1PR04MB6125.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RA4uyhRXwZV4oJVqGgvhirPUKY1ZxZY9IfGdUzdP1Yw1wIBDNztZhWYfdHCWaIE2zbyH+UnxlhpM+Dlj5XEVRqUBaLdvz+pkCOyCN713XSbQyZSZbb6xn1EozKtxDaWvVJ6Ae2X3JQp+ubPvon+W23tK/DDF0uVez9PDIHpHAOhEs2VneaepXMW/PvR1SbbYzR7FO/jQOMI08Tu2L+TaG7jAGmzxPeAuI/7MN5kGwz/ViFJK/q9pX8N5E8+Gy+QT4TO8yR6JGQ0n6OdmSYdYFO9rdX2sTNZOnQLGaC88N2f2W/QYo401bvD8330ru9T4FugHtyMbhcm2ooxLua1aXY92PVVpEJpp+X9Kbx8lM2aLMQvixsZD6O2+LEnzqlyXdMnZAPxpqjCFNscAy80yXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6702.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(6666004)(44832011)(6512007)(186003)(6486002)(86362001)(16526019)(8936002)(956004)(478600001)(1076003)(6506007)(26005)(8676002)(4326008)(5660300002)(2616005)(66476007)(2906002)(316002)(83380400001)(66556008)(66946007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SitHfiK+nCuQ4cUKv++UTIUXcqqo1bX5FogQLIQtKNR6I0Ui14PUr58H/y9z?=
 =?us-ascii?Q?95e9s86RqC5REfZF+VoXqNyDQkKCOy+9IQ4IsgyWsXejXcRqZwzSRICbz8ly?=
 =?us-ascii?Q?fLDoyeofORwxmtUDSLTTr/nKk+j06AkSxVMIiXgQaOG9XZkc5RwVfcAJayxx?=
 =?us-ascii?Q?qQzT5FZhPkbtrJLYmJOT86OJOZwW2K4FPxHet/0UPj9bsKobuHS9Kuf4bDgn?=
 =?us-ascii?Q?ZEuw0/f+Sgtl9MC4fxZrW914tra8yWh2WwCGCUDdNn4gJSIv3oQha340WXL8?=
 =?us-ascii?Q?Yf5iuyzacTQCUpEXdRsskE9qqfngnr+SNxsVA9v+igIOt3DuiboDu9gQ78s3?=
 =?us-ascii?Q?/2rCPYF6GLNPGbj59ys1kj3rrZNR8p++cgDbUywzHfrMq+IPM5/HdC5tYGxw?=
 =?us-ascii?Q?9H1VOEBWHIF9ExMxWTbyBtAcN9JYv3tW7JS3m+eL+3Hk7BUVgWunAfSMc5Fe?=
 =?us-ascii?Q?7RaYMxW8HOb7ObGYjJImONbh+aiqAWU8QOGMc5fRRo3U31zGyxcckqjibm/m?=
 =?us-ascii?Q?IVdcZh0RhPoJj3xtEp39s7mIFPhH3q9lmH7xSjTRr+lLPsFsLwVgxLUBxRkD?=
 =?us-ascii?Q?nEv1sOKMxSz1M2zMf/h43/4Dyn+/tJ8CcfW+3SNXujZ6yQEbZmd8gvq1z538?=
 =?us-ascii?Q?XYUWiny239vbeuBb8TGUmrxMazNc/KaQ41f4dNFuKv0NGOYYVh5oaLUz0UBM?=
 =?us-ascii?Q?02ZCPEvE5malDbZWllYVFpBKGtqjIPmevkfH/8QBK/NbEJUFnDZPoQ3H+8Jb?=
 =?us-ascii?Q?UjXSMlG6PesXYI0RpHRsEVb2KA8hLSjC9dD4X/ciVzX8xZzxq34sIzQnZX1t?=
 =?us-ascii?Q?qLLHRBjXXcd/65jvlF33gOBgNnJMTEZGi3k4qvTTcn4T+wL8SDR7iCxDO4pl?=
 =?us-ascii?Q?5NvT+2CQwSQntB8fi9BFkFJk6PnD0vewINz2p1L2ssqCp/UFWv8u03vkKbgK?=
 =?us-ascii?Q?djqCglmYyY3vwZ7BKxo7u8XVSgau351Ec4hG3084DqLzmARTr6D4s+FUO2Gz?=
 =?us-ascii?Q?yj4tRUbyqujODzrZI3QStXCXbMc/4cRmxVN8JpQ9xKroqCpWJiQckLVdD+SA?=
 =?us-ascii?Q?efaiVQ4I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec41b37-60c2-4b70-d81d-08d8c13d0faf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6702.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 14:25:27.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nx7RxxYvo5wnjEqA0MNRoSMBvGxmMUwb+hu/DMG/g0W1Vq62yHPrGf6BPIjAa/PYT/34t6l2CCiyRhAP+Z/pOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6125
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Wasim Khan <wasim.khan@nxp.com>

Use macros to generate pll_mask to make code
more readable.

Signed-off-by: Wasim Khan <wasim.khan@nxp.com>
---
 drivers/clk/clk-qoriq.c | 62 ++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 70aa521e7e7f..88898b97a443 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2013 Freescale Semiconductor, Inc.
+ * Copyright 2021 NXP
  *
  * clock driver for Freescale QorIQ SoCs.
  */
@@ -564,7 +565,9 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 1, 1, 1, -1
 		},
-		.pll_mask = 0x3f,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2) | BIT(CGA_PLL3) |
+			    BIT(CGB_PLL1) | BIT(CGB_PLL2),
 		.flags = CG_PLL_8BIT,
 	},
 	{
@@ -580,7 +583,9 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 1, 1, 1, -1
 		},
-		.pll_mask = 0x3f,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2) | BIT(CGA_PLL3) |
+			    BIT(CGB_PLL1) | BIT(CGB_PLL2),
 		.flags = CG_PLL_8BIT,
 	},
 	{
@@ -591,7 +596,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, -1
 		},
-		.pll_mask = 0x03,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 	},
 	{
 		.compat = "fsl,ls1028a-clockgen",
@@ -605,7 +611,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 0, 0, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 		.flags = CG_VER3 | CG_LITTLE_ENDIAN,
 	},
 	{
@@ -620,7 +627,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 		.flags = CG_PLL_8BIT,
 	},
 	{
@@ -635,7 +643,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 		.flags = CG_PLL_8BIT,
 	},
 	{
@@ -649,7 +658,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 		.flags = CG_VER3 | CG_LITTLE_ENDIAN,
 	},
 	{
@@ -660,7 +670,7 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, -1
 		},
-		.pll_mask = 0x03,
+		.pll_mask = BIT(PLATFORM_PLL) | BIT(CGA_PLL1),
 	},
 	{
 		.compat = "fsl,ls2080a-clockgen",
@@ -670,7 +680,9 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 1, 1, -1
 		},
-		.pll_mask = 0x37,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2) |
+			    BIT(CGB_PLL1) | BIT(CGB_PLL2),
 		.flags = CG_VER3 | CG_LITTLE_ENDIAN,
 	},
 	{
@@ -681,7 +693,9 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 0, 0, 1, 1, 1, 1, -1
 		},
-		.pll_mask = 0x37,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2) |
+			    BIT(CGB_PLL1) | BIT(CGB_PLL2),
 		.flags = CG_VER3 | CG_LITTLE_ENDIAN,
 	},
 	{
@@ -694,7 +708,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 1, 1, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 	},
 	{
 		.compat = "fsl,p3041-clockgen",
@@ -706,7 +721,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 1, 1, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 	},
 	{
 		.compat = "fsl,p4080-clockgen",
@@ -718,7 +734,9 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 0, 0, 1, 1, 1, 1, -1
 		},
-		.pll_mask = 0x1f,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2) |
+			    BIT(CGA_PLL3) | BIT(CGA_PLL4),
 	},
 	{
 		.compat = "fsl,p5020-clockgen",
@@ -730,7 +748,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 1, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 	},
 	{
 		.compat = "fsl,p5040-clockgen",
@@ -742,7 +761,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 1, 1, -1
 		},
-		.pll_mask = 0x0f,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2) | BIT(CGA_PLL3),
 	},
 	{
 		.compat = "fsl,t1023-clockgen",
@@ -757,7 +777,7 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, -1
 		},
-		.pll_mask = 0x03,
+		.pll_mask = BIT(PLATFORM_PLL) | BIT(CGA_PLL1),
 		.flags = CG_PLL_8BIT,
 	},
 	{
@@ -770,7 +790,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 0, 0, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 		.flags = CG_PLL_8BIT,
 	},
 	{
@@ -786,7 +807,8 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, -1
 		},
-		.pll_mask = 0x07,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2),
 		.flags = CG_PLL_8BIT,
 	},
 	{
@@ -802,7 +824,9 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_to_group = {
 			0, 0, 1, -1
 		},
-		.pll_mask = 0x3f,
+		.pll_mask = BIT(PLATFORM_PLL) |
+			    BIT(CGA_PLL1) | BIT(CGA_PLL2) | BIT(CGA_PLL3) |
+			    BIT(CGB_PLL1) | BIT(CGB_PLL2),
 		.flags = CG_PLL_8BIT,
 	},
 	{},
-- 
2.25.1

