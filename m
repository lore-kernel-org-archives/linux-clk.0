Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B056C19F28
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 08:16:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237415AbiHCIQS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237052AbiHCIQN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 04:16:13 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5C863F6;
        Wed,  3 Aug 2022 01:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ad3EpPlacDa+q19Xe56XN/pAFQ9yImXDO5wE3+G5gEkDRXJOU3ZeR+y40Xh6jeyXaLX85AGqLNgrL9RWvI5c/wxcFgls3odfm6IZWkm0GehB7Cb4uI+fSb+uj8Hts2rDkme4fABagERTB0t7e7Q07mLxfKvjJnkDTHnn3IdwPf1ZXUopRKKwfRu0AGwZXp/CHxDPZZ/u1eOJqYwg+JVsd8e3rGH+pHSX+S9RxCqlSa1zCuzTGyiKoutlRp5j2nDNMVy2UT9Hz4FXJT/POzjVhta4NJzVlzMFwGs70v/pVEd3i0qgCtv5jJNNI3MTzvi/ONY2RBCov7yw1UkyxdrN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1+zfEdOW8POG8SMit3wbN0TOoY4OSI8uq5SebYSjCw=;
 b=RDRyXm4Sjs9xbZThBYT7ZFPdwyeKI8GkqXfv8Kfq5n+kVV/mC6Fg+lh/HUuof5fys6WYRL1vp7zUccbjw+a4HxN8cig7fbjOJUhtmY4759g9lb2r62butZ9TmQj78vVAO9Z3bphToLVYovzgDorpDSnq5GToDbueZUtXo2AZ2FR3yWvJYZ5nUk/2QptnWmJs1jRMj475+aiPn8bF+XlL0iGA3OjrvVitS/kWE0SnM4SmkEKV/nPRWlE0FzsuaZKpFaRvjzPpFIvBixKU+Ef73jGY+Owmi4u7lm2gEo8xQykYfSE11GHWscP6cCarQSFfnUcuGD8q9ixDXsUpcWeWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1+zfEdOW8POG8SMit3wbN0TOoY4OSI8uq5SebYSjCw=;
 b=Uz2qsUyYwdeN3HWIHUblJWO6YPKi+VDA7+Zs/u4oujGunpL8M3fMXTJBrcpss3wIFkrOBXh2Rz5J7AUdRYE0YRoqCcJhRoSroVWoKkG+19ZyYVlOORttFOli6fXBbYvUmANgwc0l5D9bqPHrVx3Q03v5bYh2KdInRQZUwzDPeEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR04MB3127.eurprd04.prod.outlook.com (2603:10a6:6:c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.25; Wed, 3 Aug 2022 08:16:09 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:16:08 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 7/7] clk: imx93: add SAI IPG clk
Date:   Wed,  3 Aug 2022 16:17:13 +0800
Message-Id: <20220803081713.3504699-8-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803081713.3504699-1-peng.fan@oss.nxp.com>
References: <20220803081713.3504699-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e21921e-e57d-40f5-b183-08da75286b5c
X-MS-TrafficTypeDiagnostic: DB6PR04MB3127:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiOdMvvJiXQIbJJxLNeXGiCyYQlLJUhUWxfq6HIKUdMwzrZw960wsDjv0qOqKgQXokjHAlgca0kI79QjRploTFR/sgTEh+zGzV24dBHX6MNdWbMXqWLVkiTSi4vMVuwI4YtkBTlSskMx0+pGYTnZ+I5qfUDeOuLBkPDRQv1xEZt09ck7Sk6pnI/RzMjOJ1U/DsP/ORI1tnVw1GY/mZvA/Iu/zu620nv9Rw9hvViNzdNI21dzn1NcYbz7zTa2s9u1Err4LKZH2EkM502FqcXCCKImVjW62D9c2lbWpkfq3SQsZQxFz7PSmeo+p8z3F2RQ9a1Wy7sPs3CXPYobso0jrfF10J7pRSmXypmxlLLtl7EWM/BZvqYlK+vfwFT9aIPVJR1emh+J9pXhP+BL3jelsWydmg33N96HLwhWqwebIVE9oWDm1G/B7jFm4JFUMEfooltMoO0N3h8UzmTyFk6ynErB7HSnSkN+i0Q/bLbqGy0b+LIWU1fqZFh8eT6NiSQftYO9FpOD3awh46HLKjycbzN/xgxuD+JDyLAKT3AWHPnUfdQ2rzNojJK8+Kzpi2XRyXlvE0i8+boo+qt6TdIq1bQyfetKKlbqNdRrEyF4X4sJCtOospKKZIRAbVJd1+iTNGxoGA5+fOKV2T1kHTPLOr1GaXKnXVeTOCwAmE0IfTj/k1Y6qbJ90cabD94KgNb8R+OAcnLkwd1g1JZ1bEc+Ag/EBYiPKxBKAjFRWLS4tTm4wFjTsdRNhZhaA5Q4MTp0kXzWK+TAj3Sg6AJnPe+xf93GVyEVKe+1KjsijdQwJLlRY1DjNUwJ6tVPBM5k3gBg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(1076003)(186003)(83380400001)(316002)(38100700002)(6506007)(38350700002)(52116002)(2906002)(5660300002)(6666004)(26005)(478600001)(6512007)(66946007)(66556008)(6486002)(66476007)(4326008)(8676002)(8936002)(86362001)(2616005)(7416002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//jB6eVEts+sQMKnmE2hiNJjH+iION4N/IkaTEXYTh0yQ4alrZueXo5QBlHP?=
 =?us-ascii?Q?DEtRefq0WX+yI151xZi2JoqdQeRLaxkMxqH/lhCpEiqaXEQoIt3EzTjB0HJ/?=
 =?us-ascii?Q?awCu1mIfaLa10GhIexi1gqAfscAXxomdr40oUY2mpw+U3LhVND/jdXWPWQzV?=
 =?us-ascii?Q?nT9ke5of9AY36KpmaT+Y6VziJJnANey56t5r5Gj25kd53QkhgwX3Q0o2o9Uz?=
 =?us-ascii?Q?phxw2uBSr1yC+XX8cuLT0EFFr+n5r+vDcTS9aY92pD443kLd1f3dBWTCimEz?=
 =?us-ascii?Q?cIEXbvDW0bFxdwDx5WvveIEOqJFB7T2dq7BdHblPWMza7FcuyxwvF/pr2W6z?=
 =?us-ascii?Q?h8heeMadGyrO6L8EpNRpleS9+Ms30WnAGGPyDFKn5epvubpBc/ICXSsACGQg?=
 =?us-ascii?Q?G4PD4CVjBmYKvEOlpU3BUS4d6QLWH4LqB9KMmAOHAvaIMyXKJJaY0JPCPnkD?=
 =?us-ascii?Q?maukrSPTc5nTxINSMZ8spth3KaWXbOC+q85GLEkhVKls+46JeXf4AtrpH3xZ?=
 =?us-ascii?Q?NsRhUn6/jFoYb2cPe363PHUlvOU5Ds9i9mhQFky4+ClpcA0+B21fLlBiWjxD?=
 =?us-ascii?Q?ohTN9fvllKunL8RQALGsSA1bSLDiurMLlxxEjFGKpTy9vWQLvWdJU0JjgUFu?=
 =?us-ascii?Q?Z+GkUwpOlkI7GoZg1D5g0GMWr/skirryex+V9ERjrdngxjmuOfKbD0WtPcLi?=
 =?us-ascii?Q?hkve5aRoNMLEMA9tj4Uguy/sJrcryhNGGNs7B+lbOqOL3jNPsvCmADazs8rP?=
 =?us-ascii?Q?yI/lwTpMAMko2qRwsFVOdR5rCy0ewk8z7mCPnQd+pz4An7zNl9cXCNIqI79K?=
 =?us-ascii?Q?VRE6c0VScmYDJO5pROuXwuUnSp5NrgqxrOZb1vh0XdCH6FvvQnP5gAXKt6N9?=
 =?us-ascii?Q?LIyYaJsQKb0X8FrjeeweObPaiVX399EOTkqp6H3KshQEmFw/gi6DjZBiUN48?=
 =?us-ascii?Q?6NZKKn7R+trJwTOD2EGBFAn8RJpeZHoRrPqwotcRFRm5/Rr91GgSkFHNNu/E?=
 =?us-ascii?Q?1LSpI6KkmEOoeM2Nb5MyfKE/MXE82mZoHusjHruYsvF/Obdn8kGXEnCC8776?=
 =?us-ascii?Q?O2Wp22NOZf6Lt+RISa4SJDEQxdHKt0cm7fSv2uroP5FP+dISwoa/l0BTIgek?=
 =?us-ascii?Q?jaPP/3nCcov9EFpqVJyHW3k1asKvEmu1PgahCweph/mcbdmlsFrnMIbWWOfY?=
 =?us-ascii?Q?Pl3yJimlYW1I4UP4Zre6N/WOuwPh0ANE0VVatQSDgzeYHK042c0h29O7iCIk?=
 =?us-ascii?Q?Ds4nV6Ti+Zf5zKtVLLpeFz0/dNxz+NvpeTB+8uG60tWzLF9rJ2AJinlGDyem?=
 =?us-ascii?Q?LUSjyZOxcVhrs6l6EEMmhmN6hgAXWFRpACExsMFdJn/QhWj8mcOq65TMWw/0?=
 =?us-ascii?Q?fBSwPngtdh2Mn9x39AK6/IjQ9rZUUeLj4OKUlqLwYCvc+sudGrt6rUkXcU2l?=
 =?us-ascii?Q?PESmGvZ+JzGl8ffozLNMqJgyhp9MONR2rEXNBo80IbC7SzKy/i/AjHzDDKjy?=
 =?us-ascii?Q?ZBPq7T8kj/goGlWcn4SMPAEo7QvQKQtRTZPkGoozepNHYGB1fT9bI7qM25o+?=
 =?us-ascii?Q?7FKirGVt/LzxmZEn96kU07UwDJ7Mb/hABNvPB9Ck?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e21921e-e57d-40f5-b183-08da75286b5c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:16:08.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hme3Hb9OxslgRqTAq2qUvp47kSZV7dz2cK7ultIHeqmi08urzI/jqMKJGOCbt8GpuMIW8wH2qet8fJMUAMHFuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3127
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The clk topology is as below:
bus_aon_root------>\                  /--->SAI IPG
                    -->SAI LPCG gate-->
sai[x]_clk_root--->/                  \--->SAI MCLK

So use shared count as i.MX93 MU_B gate.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 79ec46a91ed8..f6a9e7718418 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -28,6 +28,9 @@ enum clk_sel {
 	MAX_SEL
 };
 
+static u32 share_count_sai1;
+static u32 share_count_sai2;
+static u32 share_count_sai3;
 static u32 share_count_mub;
 
 static const char *parent_names[MAX_SEL][4] = {
@@ -215,9 +218,12 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_USDHC1_GATE,	"usdhc1",	"usdhc1_root",		0x9380, },
 	{ IMX93_CLK_USDHC2_GATE,	"usdhc2",	"usdhc2_root",		0x93c0, },
 	{ IMX93_CLK_USDHC3_GATE,	"usdhc3",	"usdhc3_root",		0x9400, },
-	{ IMX93_CLK_SAI1_GATE,		"sai1",		"sai1_root",		0x9440, },
-	{ IMX93_CLK_SAI2_GATE,		"sai2",		"sai2_root",		0x9480, },
-	{ IMX93_CLK_SAI3_GATE,		"sai3",		"sai3_root",		0x94c0, },
+	{ IMX93_CLK_SAI1_GATE,          "sai1",         "sai1_root",            0x9440, 0, &share_count_sai1},
+	{ IMX93_CLK_SAI1_IPG,		"sai1_ipg_clk", "bus_aon_root",		0x9440, 0, &share_count_sai1},
+	{ IMX93_CLK_SAI2_GATE,          "sai2",         "sai2_root",            0x9480, 0, &share_count_sai2},
+	{ IMX93_CLK_SAI2_IPG,		"sai2_ipg_clk", "bus_wakeup_root",	0x9480, 0, &share_count_sai2},
+	{ IMX93_CLK_SAI3_GATE,          "sai3",         "sai3_root",            0x94c0, 0, &share_count_sai3},
+	{ IMX93_CLK_SAI3_IPG,		"sai3_ipg_clk", "bus_wakeup_root",	0x94c0, 0, &share_count_sai3},
 	{ IMX93_CLK_MIPI_CSI_GATE,	"mipi_csi",	"media_apb_root",	0x9580, },
 	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, },
 	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, },
-- 
2.25.1

