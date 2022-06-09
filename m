Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00878C433EF
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343646AbiFIN12 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239408AbiFIN10 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:27:26 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29834C790
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URoFwBiHDpMMPGUePtu4NytYuw4hH8+7pzuuVM671H3frKg+9XrSOM2JR86mENYsdzEeV9WFLOEjagrxrJGVJdnuMkjcjU1fkruH1FHxO7Fol/57IfniJzBsLFLUGh3GMt2coysThiJnfV6gr5E1fddbqHvZ7Evzg+W70OTozYV3PSwZdwR32asO1pnbymTah83siye5ralzN4F+oP050DuOREe0MPSSV5cKP20754NuzaU/LbLiz92/C5IoX8Yc0/9kN2uyA0fydzcIpNJBwo+I5P2xCtaw+xe/ML0MVVKEyo5AOFZosXqOzjqUb+GgJnIFYshj5I+At1Z8BdRW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hl+xgZGePFEeUUGbcTuyPI30wPbWKc8oesC37XcF550=;
 b=YxahcgT8am510nl6q234KvPGulD8UurSbBtW1t8akFfzNVeYXN6QcByOIIGnT6mXyy1Ii4NlOGFxFlfnCS2JZMXcnLwwvkZ1oDnSVaClFMB4SfRtlULuHqqez89b1IvFQ6Og2vNaq5sgkKC65BU3VvuUMeOSsFJWKRckJJn7gsSid2Pr7ati8w2xf5VGJYHRwGeyTbVti2Z7CUNvomITFuoywdx62h5k1rHva58c5aWud2veqWSLiKVzWiVEslC6kiHLc/jbINt70iByZekXF0CqTSiysdVtXFzxyN4j1hQ/iiyZi8x1zPg75agKXMhX4RlDfn3IULgrWX0IDwNktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hl+xgZGePFEeUUGbcTuyPI30wPbWKc8oesC37XcF550=;
 b=ZcaGd6kFWPBSRiKXQmoqweE18xmkhytuQ/VIoRhss1FFiakY9J9pi78OZJTJ4RMy3zoYjbeT1TJVNZf8rG0aw7wqQZ8RJ/xIuc4/Jnt9YMoki/80EZpdhfqfRUKq1+PyTinjfGkCl3IM37nhCbaStFreqSCfzSOjTV5oqs8vluE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB6220.eurprd04.prod.outlook.com (2603:10a6:10:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 13:27:20 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:27:20 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Haibo Chen <haibo.chen@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 1/7] clk: imx93: use adc_root as the parent clock of adc1
Date:   Thu,  9 Jun 2022 21:28:56 +0800
Message-Id: <20220609132902.3504651-2-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f1f95e10-f2de-4082-eb77-08da4a1bc7a5
X-MS-TrafficTypeDiagnostic: DBBPR04MB6220:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB62203BFB0001435A6D137260C9A79@DBBPR04MB6220.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hDYWUPavrq/k8xM7E8K/t7bd949dfHjv9CQlD6QOFi+WhzQOOXw3taRfmtmiVE3RaZsmrJ5nvda+CzoOgcBMVqg2lyPeWdT3RlGE6Bb9V2UjKxcYWVslbTfCnUUK5Sx9eiomukYCmB1tkr/lJ3CIKiQP6lhu9uj0lTKVs8MHgSj27+69YAI+cLhX1uQD5BnOXzbWcKRjlKqlVlLKphsrDl8ZuCp74piD2UulvfnO2a9XFs8gwiTBv6J6/0nJM+08iCMKpUksXXe2qjvdk/pJhsU7+Cgh+I2YvNQ70U/3IpW0fOzLop+wd0ALUFtcaoIjR3u5EzymTZ13W+cZvOA2Wb4Gn/XPPO4wkd8Y1PPROFdU+JIbPnCOITCxQt48jROuhZPI004JVQtSjGIKi4f0BD+miu9SUepOOddehMRzPgSQox1722eoOO4RsI92oSvLVuh4CGFkaN4wg/foo57BPtBQ/Z373zSZ3ONYzcGfxzypXfTo6Ii8aJRPXJSxSjxHBMxWott1SBGNOmTSpcStdOuziAAVsZuajQRyGiYUDnw6l2214GiJfFDQxRKM+y2vizKN4/4lnWVRmRwk58WjQlfAePzzRd7lIYRRtejBYSET9ex6bydR7gQhC8IKdbn3zx5EbUw6q8NZsU8J0mj20PHC1XPIuYUIJlpnuZPYFtdweb+2Cb6xJeG4grJmGHkac5nYBZrBUw2/UOVIXcadCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6666004)(26005)(6512007)(6506007)(52116002)(2906002)(508600001)(54906003)(38350700002)(86362001)(66946007)(5660300002)(316002)(6486002)(38100700002)(186003)(66476007)(66556008)(4326008)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LyZL0fx7VW/cf3OBySR63UB13t2bHyU2DJozMZrpX/bPZIgFQqJzAvd35yY8?=
 =?us-ascii?Q?RXW1mGReiX1bj4rDawt7MYh6hm/0b3UskwDDVFZkk2waRnfPm9z3H4ZgrGRR?=
 =?us-ascii?Q?W+baJde6DezB5KtHAspIo/0ylKsaOTOCFdDd3eXdXUlapQrhOQyNr+ROHx1Q?=
 =?us-ascii?Q?a4PVH9ywvEWJXRihhbs5itIaS0JgqGapWxeFeAxFZRy+OqjVEMA4nQHwsC82?=
 =?us-ascii?Q?Y4x6ueG7coN/d+rEDaxA5HgPfY+CVj+YV50X3VTG+pljlK6ijc/oNCqA1xgy?=
 =?us-ascii?Q?gEVv4WBcmRHZfxCVaLWxTeSN/XNA9JKn4/eeVZxgVumAFVO1CSRt28HnKS9I?=
 =?us-ascii?Q?oDzn/pa3jd4sSWomhnKg+iw2lqMfJTXKs1ZyuapPanjdjZIAVrh0a5kbfEqJ?=
 =?us-ascii?Q?esvCAfql5/jnZb63Qf15ugqUmVICNzVPKZNOOD2ip5SvExqGuifKr/bCz/tV?=
 =?us-ascii?Q?Pc3BeTap4phL2cMqUrGcnkSetip8My6L3fEMG3GNKcehsPWN1B/T3ejml8sV?=
 =?us-ascii?Q?oE8IbFWECvMlI0fWwmDe/vmoZ3qEY7xGjOnf1zm/LVKywMT9QubY6tUZ0DJ0?=
 =?us-ascii?Q?SXq2/qwUsyNOrRsTuwk8Vc2MEZC2XV8FYj8yWjjDgM0BXGWxFY/PpFLOEXuf?=
 =?us-ascii?Q?Wk9+KH1Z9trIH7R4wykNNW0aJz5YsUgYzlM5j9cW8vjWRh9YC8OIRU5khYy8?=
 =?us-ascii?Q?i5yNX7ErLMh5UH7H1+KAaFWUkYO0fLJr6p6oTsEFYfAgJO7KU1HOT5nVBlvF?=
 =?us-ascii?Q?e98cJPQp6tvYWWrX/M15pPGlP925G3pAWSQ8oF/eF5LLgercTNNkH5v4l1lz?=
 =?us-ascii?Q?1OySrdIduHDlilpabfS0d8Z9kXNCUF247FQfMYn/qf3VQhgAUiyGzWdK64+J?=
 =?us-ascii?Q?+rAVbLFe0S4Mh1kVSg+57QFIEi4Cu+We3WGCdyBlHewcU51+AwetUsCJzh4S?=
 =?us-ascii?Q?N9JgHZIM3nN+zseDY9DLg8aR0vufsp9dLsN7Fy4T96W7azNMJwQqemeoZFuc?=
 =?us-ascii?Q?CrEOxPAg7FaiuYib5by0+fnMzCYqjuNVcMjSLrI4YfkwIpFNv56HgqR9PTcD?=
 =?us-ascii?Q?fr/o9XOCDpNnHFFQV3Yzqhv7d5ZHU5p/8jfGs5faEsUA1T18nY7vMLCPHmdk?=
 =?us-ascii?Q?s2HkLfnvk+uKlClp7XqKVMi+pRk0ERg8jsZhBy+mcw3yBrvD1e459xdcW34D?=
 =?us-ascii?Q?eBSTvW0CLz7VeLfoAjEo6+To/CuzvitoVbcNRXzzi7v0wDKl/vyBctdSQRWj?=
 =?us-ascii?Q?pQK9mTWR9oVc9MP20OxeLINMZQvX+AxL3L4824g0McuR7P4aLIED1yPotloE?=
 =?us-ascii?Q?aNLwqLzGkw4nKFUQ+jcNiXvM65v9ILAk5a6Gikic+1weHtbMyYHQPrFLf7yQ?=
 =?us-ascii?Q?vWZ5A+OTkrWC2j85jZ2awK7Ow9q0B/BRWYCOTisNHDKjeasGAuw1dx9nj2aW?=
 =?us-ascii?Q?utGKYs20qk9gK8cauPDhhWjJIWAtLU1dQULearv2XG9WtGT/4tDwpZNgFr1Q?=
 =?us-ascii?Q?SWtTsf0M0G0ISLZfxtAmUU3LTE8CbJjo/4DtU9JqxiTEaPeVHdM8sGWB1SHu?=
 =?us-ascii?Q?AqhAkIEDuFowtC4iqZS7KlbfS+dutLGUVQixeuF97bvwhIJxa3o1XT5iPh00?=
 =?us-ascii?Q?JDKw3iqMyrt9uNLvvgrTx4LJNCYpPZnAQn0y6Ad2dnexpuJXb3dENbo90B6T?=
 =?us-ascii?Q?0NcR+LKLi7IE9ICNreRhuxIMfpsh2/TLe5n6pKHStht4jF06Pi1SFBcd6V2k?=
 =?us-ascii?Q?xGSNBfrtqA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f95e10-f2de-4082-eb77-08da4a1bc7a5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:27:20.3599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3smmhPqK5cnGd4UF8PFN2QaVZsTR3Ed6DVDnayHYXelVExPOEoHQXBoPeQmjWeHl0gKNl66H9ZqbaC4/qTr6yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6220
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

When debug, find after system boot up, all adc register operation
will trigger system hang, this is because the internal adc ipg
clock is gate off. In dts, only reference the IMX93_CLK_ADC1_GATE,
which is adc1, no one touch the adc_root, so adc_root will be gate
off automatically after system boot up.

Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index edcc87661d1f..172cd56c9610 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -150,7 +150,7 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_A55_GATE,		"a55",		"a55_root",		0x8000, },
 	/* M33 critical clk for system run */
 	{ IMX93_CLK_CM33_GATE,		"cm33",		"m33_root",		0x8040, CLK_IS_CRITICAL },
-	{ IMX93_CLK_ADC1_GATE,		"adc1",		"osc_24m",		0x82c0, },
+	{ IMX93_CLK_ADC1_GATE,		"adc1",		"adc_root",		0x82c0, },
 	{ IMX93_CLK_WDOG1_GATE,		"wdog1",	"osc_24m",		0x8300, },
 	{ IMX93_CLK_WDOG2_GATE,		"wdog2",	"osc_24m",		0x8340, },
 	{ IMX93_CLK_WDOG3_GATE,		"wdog3",	"osc_24m",		0x8380, },
-- 
2.25.1

