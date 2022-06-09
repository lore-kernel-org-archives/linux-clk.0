Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C6AC433EF
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343664AbiFIN1f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343670AbiFIN1e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:27:34 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EF54C790
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0dcUIWu+BJDQNiLxLGvlbHo/WvGAJjvNDUX3+xXxEYULiQxrWRSQbthOgDt7V9BazlNwG/Vxbb+tPvgpv7Zsh1TBjRT0rSeTqd85NqRtEpNqR2v3mzty5nOPQzbxLUbil1bvGt2L8OwmrB2lLMOuBckfClrL8tmEXHoD6mIAdqbnMO4QMSFMF3Z6lab4ZzvwYOFeW9ovzv+wCdblq8i3T0wBcHXeistVC79diKUSDbjNn1rrHJOw6L8lFhKExEq/SiJagEYK+FfTOTOZXJzhYm2u4WeOfpuxSr4NI3ot0hTfe9xVeT+F+652S16TxXkNAwEINsSKzWxRh8BFcDVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFTTd/zGYEqlz4BWjQahdRXxvPMopWglz40h2fkgKgA=;
 b=leL8eE0tk64iTFwi9jdl5nKRX0QFZkerc9zqdc77FYDEv0vwO/k4CSE+92f2bv1hjVUfjzMchpgYbRSDeTJRmW7zPZJIPyJbjsUubwelyStwcsjNIcE9w9rQ7sx6byydwFoJLOtcgOcn50W56V9O9O/Ldb15OF1r6gJk3W81yCoDT7GhGVqXPaVe7nH29vgCl8Y38ANS/N4FoUygQgLsie5wXcsmDD5LGlJFngItEkREGDYvTwD76HE7qtC7fJ/PiPlbSaubkXfFXlcZO5mPiHOCfDnzmVRYPT82TLd/trRi/WjdDpAHnnMSvnpLVj6k4MvNZPsfl0TpZ3Jtz7eGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFTTd/zGYEqlz4BWjQahdRXxvPMopWglz40h2fkgKgA=;
 b=ZUSmX9vVP+rsfWHBzvkWPfwXHS/QQTplUh0yZx0CL46Rx3BtWWgyLdOj5LSOT9+QA08NTPTGS6CkeApRNcJc3C3ez1Y4EDmXItr98aszDWliiHBvxngAGt9iEqshUqd3FBhX5rJN/RRY+J0jL/gId3oe/wTfkbwfkcdBmdlLWCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB6220.eurprd04.prod.outlook.com (2603:10a6:10:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 13:27:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:27:30 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 4/7] clk: imx: clk-fracn-gppll: fix mfd value
Date:   Thu,  9 Jun 2022 21:28:59 +0800
Message-Id: <20220609132902.3504651-5-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 779d99e9-1961-4306-3ec6-08da4a1bcda0
X-MS-TrafficTypeDiagnostic: DBBPR04MB6220:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB6220CC945A7AB02F38137018C9A79@DBBPR04MB6220.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvljaCKKTCTJasaJeLKkKzTPo6CSjerlQ1CiPI+j/GftGSR+5ktly50xpd02HJnxtbZ/hQtagNMzCi5sIoiJMOFFVPr7Z67shEr3A/TW+ywcbQuLUYutkm/d/5VpNfsndZP0OIeddGLlGQh3ChC6RrFml5Q9LwQ3cQ3MqCNszxyXZuvLnAU1DeaTq+H+Pt322g4eSzml6CFR632jGwRUMLszNqsOQE4nskaDYlrxRBZw7YiuEusi15BN2SlA7MnIlXYjMfiTUWh+KwCvwUvhcwN/ePhKwkrOwlaJt7ALUdGv/2UHM4vccXEu8IumsJsI3HJfY99OjRdidc3o4BTJv/TK5VN6IWdASu8uizfUBwKwntUjDXZykDFDeu/7UmRz4NuJ0TxIb58sG/oHbh1Rx+uyo/MAjz8YVinpjE03pdLCG2JAXW1PRMPVvGbebpQQvzhKT1GwcX5DAYPnrcy6FXFkFcSNruf9C4pPErvSGWJ3/a4w4W/xyfSOBByy0pCzci8u9LRGrDOFBOgH6ajVfifp5BBVHqcSPBE6MmENNCwMAR6AWORgPasdXgUUi/ig+En7CJFLuB5NXPzIIUwrJQOajD7s55uZ6RNdjvxQtBbKv9UszqFZEOxovCejwY5yBL4M8t4NRcMxd2iQTacnVXm5jWQdMxGwTyL8YGkC5Lhlzr7QAxEgOU/507CF3NJzU2t44P+G6ZaOLes5QQB3cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6666004)(26005)(6512007)(6506007)(52116002)(2906002)(508600001)(54906003)(38350700002)(86362001)(66946007)(5660300002)(316002)(6486002)(38100700002)(186003)(66476007)(66556008)(4326008)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rQ8uaj06A9P1OzNH5jGA1cfiW6k6rbf9mDXRAQ6C4XRT22IRcwhJf/msTpjE?=
 =?us-ascii?Q?dRndZ0L3BPaa1GGOXWHOg3QjRYvMAMGh3NW3qZ36X5V9wbG+FHv1u07H+E8f?=
 =?us-ascii?Q?ZygJs/wybOwvlt0LZn8CNT1WVpO5U7Jd/EV/owKDHbd/+fKxB4JslmUooF9N?=
 =?us-ascii?Q?Pzb8F6WINAaCfjX/uEYwHJbna0tPqml0X3Br588oxOxmEJU0/qiV6P2zTCqb?=
 =?us-ascii?Q?7ANTewtUNJr7oD7n+LyHWEHgiEMxHInlbOGgdXluqd2k5xu/PybdEKFzqCaG?=
 =?us-ascii?Q?a+o1W2u0wnDEbd4tL8k+WasxfZGW8AJIdfd9mht4t/x/zcyAwas/1fRLkytA?=
 =?us-ascii?Q?N8+6R633GBdfM2B2NtCCNF+gRDuo/UyhYVxSf8quua04a6ZSqLf0ZgUHousm?=
 =?us-ascii?Q?TvygkfbsPmOpc3Qkz66nacoTk+IMVLTj9++/p9WWN5887OodkqUm/YuQfa27?=
 =?us-ascii?Q?KVz2ES0+LWDT0q5l1k+h512jAvtNTjuV+ZXog0AAVh7pPGf9TOS+FG2wcimR?=
 =?us-ascii?Q?dlyQ7RJq+VzxmjJQho88CVEcoZw0t5el2Sd9Ad/o9RNIjEC8ZnJV82PwHbxU?=
 =?us-ascii?Q?OMSl4XVOa89LiYcLF/25CQhwZ+1HnEJ9iI+LTHQYQcQWGxGzdbX0ESgcokVs?=
 =?us-ascii?Q?BlpZfDmAVcTJgqZv542+p2tIb+U3/L5EU3j2czZvCPeCDPIL4Rs64fTwq9Vv?=
 =?us-ascii?Q?sgv5M8Z8VJfe+Bkarclt+VONvsTLKDXD3jMNt2MR5j+Q+NfhrcxNtUAeeM/A?=
 =?us-ascii?Q?+ucq7TcI1pHpF+PYKcynVhTQ4Au6ArV/Ase07WH1wwd28cg5NpfBhZbNdQfT?=
 =?us-ascii?Q?LFgTU5/h2R4kbHIbZ6nJ3nZpblXU3HWJ5bAOTtcumbKevqnJmcN8fSq4QJOe?=
 =?us-ascii?Q?ZkYsIEwguhmMHjDkbF62wBYv8UBQ2bk7sLrLo+plv90qlGGE0RG8iQ6XdhmT?=
 =?us-ascii?Q?BxBvWHKFhjpS9MI5idTKmMRs8+CFkoSP54LAyyjvbL6IBlie4eliGXBJC0pu?=
 =?us-ascii?Q?Nazq8fapHs8rSJp5Bej65e2CMjpVMXrm6abpJLRZuoSB+ZB+Si7pysu8r6u/?=
 =?us-ascii?Q?zEx0FPrT5wVLVcE3ubVhC6bl/y9GEmux++1qoyepWOT4I/HWt5GijmjYoq5b?=
 =?us-ascii?Q?jQbw/61kQ4AsJ5rbcaTO0Xv3jNaWX8F4hYsgMLFcthcckGu6Inua3ZGGfeu/?=
 =?us-ascii?Q?vjcrWzUJSN+LTWN53eBNvchBFfItO5XrJVoINZJniqf2vM5DHIk6p5ZZE/gq?=
 =?us-ascii?Q?1gi8DZdWxgutnB44wjxA5MkEpPFY6qCSwf3Dgatw0unyKWBFA2NyaJPqWm8N?=
 =?us-ascii?Q?WsT9JcNFgFz/X4qpyW1IQwf4zP5L806N9FAxMOwIVEroasnmjyX6mKi27ADB?=
 =?us-ascii?Q?rydkaKQcouLRLpehUlfkQ01ksGTBrH3pfeG8Thc2/NH+lToikt1f/Y1Eefaj?=
 =?us-ascii?Q?YP6lgBrYxVocWQDzdvDDo36zhcBEWWCVHe1qCb3ImuAJyPybnTSydD/jLeh7?=
 =?us-ascii?Q?wpnMCQPjdKK6VuCZLmJ4Mew8jaS3q1FRfcE6iJsSwUhA1eVwEpV06S2SNnFA?=
 =?us-ascii?Q?tKvDEPQ1ztLDk48liTRIFLRr+gefjNNUunsY2WGceb2FiE2Qn/zFc3k1qL54?=
 =?us-ascii?Q?CYFLNMG95YyhHE1aMeth3bTtOuV27Ava/E0ObrhoitEPrT3WQ9YZfLuEHia2?=
 =?us-ascii?Q?S5NpCMSQtz+GgYzDhVhO7xbv/ORzV7wgkZThu2wlhqWauG29YwHErI/oAWJQ?=
 =?us-ascii?Q?DuvX4MwVyQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779d99e9-1961-4306-3ec6-08da4a1bcda0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:27:30.3730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0FEG3B6UtxiJ8SbMASKhem7k/ZQPyy4vAcxV8a8cxO6T2NcoIKWX1Qlf5dkRzPtY9yuFS/H7rotkbhzi4Ncng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6220
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

According to spec:
A value of 0 is disallowed and should not be programmed in this register

Fix to 1.

Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 71c102d950ab..36a53c60e71f 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -64,10 +64,10 @@ struct clk_fracn_gppll {
  * Fout = Fvco / (rdiv * odiv)
  */
 static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
-	PLL_FRACN_GP(650000000U, 81, 0, 0, 0, 3),
-	PLL_FRACN_GP(594000000U, 198, 0, 0, 0, 8),
-	PLL_FRACN_GP(560000000U, 70, 0, 0, 0, 3),
-	PLL_FRACN_GP(400000000U, 50, 0, 0, 0, 3),
+	PLL_FRACN_GP(650000000U, 81, 0, 1, 0, 3),
+	PLL_FRACN_GP(594000000U, 198, 0, 1, 0, 8),
+	PLL_FRACN_GP(560000000U, 70, 0, 1, 0, 3),
+	PLL_FRACN_GP(400000000U, 50, 0, 1, 0, 3),
 	PLL_FRACN_GP(393216000U, 81, 92, 100, 0, 5)
 };
 
-- 
2.25.1

