Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88229C433EF
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343785AbiFIN1m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343670AbiFIN1m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:27:42 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C1425596
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtB8REKJtyX9eB5sT32Qc3nQu247o1hWxpq/r8CBkGPrihLkLKWNp2V9aetDNNKANSSGlvQrUn2xYhefoHl3K5fi0u7hhCUg9yxBEJgePRAgs4BWZn4qZ5Zwv5ETm05CPq9r7aBQqPrxZn9oiMgQN6HM7ppXQ9SkG2kKJnvELYgGOb+u2wATPbEkbTF7WMj4CZzAe7Tq4ZVxXwUOr5CsBux5TZ7Tuj0l1/n+hJW8LsIPHVcK29UynzHt2sJjUy8iXT0zRokS8moGermS4q/kHRhG2SpbgWyhSYgrg2zntzpX7GRmt3+RG/Kh7+RdR/WmW2x8vrLjZ30mcwol5cJu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39IOYQ1OVj29vsRjkshCimNhsUbfLVyPYF8rzlgq63A=;
 b=TFwncUh0qQ+euOkbRkI1vNM3uL8ay9iQhxdGmoYGZxticm6aLwYud+IxX/AEDWcWwYM09mVDvfVocWSTCg3LRpPMvIYCKICrvdP1HpL5w73eZIF4OrFdhp8ZH6WCSBDs5K6HSKtsFSbhws0CUnAH8VMG1UiQjWgXoDJ48Y3jDrDmk8q01jE7Ip4doBCrsieKiGQogTTXPNwvl37sU0YrPi7ORTYa2APE84GVOyEYu/6rFg/VKWToX+1e7bNirHN11Dn/IjNscYLSoZ8qgj5UuEsvFF99y3NtkH8KyWaz/ltiIhzcKurRy2HbYAmH/ayinc8DGYzRgP+00nLWlCVd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39IOYQ1OVj29vsRjkshCimNhsUbfLVyPYF8rzlgq63A=;
 b=LYiDrnamnkXybGD7znfQ3eQAsPBkVz8DVT3tEg4e0Gqae5pskw28s92lSXvlvsoGDeFzhEYWKpYGlDbZSuhd2jdgHKyMu58I34hFFM478685IGe3q4MROqhkyZXbMh6WUjkhHE4NtKXBrXYMgQwv/uQHYFqAjxAIeRZS0HG979k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB6220.eurprd04.prod.outlook.com (2603:10a6:10:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 13:27:37 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:27:37 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 6/7] clk: imx: clk-fracn-gppll: correct rdiv
Date:   Thu,  9 Jun 2022 21:29:01 +0800
Message-Id: <20220609132902.3504651-7-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 27e6d0ad-780a-426e-8db8-08da4a1bd1e9
X-MS-TrafficTypeDiagnostic: DBBPR04MB6220:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB622016FD0216BF12998F3A1FC9A79@DBBPR04MB6220.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/sg8q7GC2j8orG8erv/xVcEb3JlOez0nzkLXjSfdQT7qzI2RvRzCwlwuKeS3dW/HJs6XPSKvWTP0l+VQvm+oiOuUrXrRonPAagICgQap/sUHk/DUJaGr4Bqn3txOtRMT+vJrcewoGOfkoFfSDIk3h8KA7HDU+erxRtAJKAfl01GcwUPm+aXLbptfX+uz9RhaWZbCieYqCD9kseuYcKZK9Os9oLIQsFRq/DbTIUUCUX9/JlDEXKsPsth+6DhYLpj28kNfx/xvoclv9C1bn06cQoPJSuUwCfIbZQ3xiYPgR0OhaHxAUmaBqztrK4UtI8q2uFMgVjbFs2vuQtWDsItDeqvTJ7jhVHpubBjt2Mu0rSVOIDjGAi8AlRyXSLhEVy8lmoKa29zD0hgVqs/yuawASGTO+OvChCpfQxJdBRb2DhgjkQa/dcTHMowWsfsVx8mcsujaCN6vTUdUGJRAQlOCZAjjSZfvjwlsa5YVkcrzo8bj2fnKAFiqm/LWWg5RxOvt96u/7+teFNUV+6LfH9cFzGrQTupN/HdWMb34mMAzc56r9elSkTVsRWIjN35+5PrEhFlSQ4/nmi881YuPqeB/LCSlMJXVmeFdQOU0pnvRH9AeHszw4aWqSkwxErJGNdCW8JieF44Ik126eHzpYURbySeIvNy+/QcTVm2HRLe1SLFNtCTFRUaTK54udKshViwDm8sMtHFy3h6ASlfmGsevw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6666004)(26005)(6512007)(6506007)(52116002)(2906002)(508600001)(54906003)(38350700002)(86362001)(66946007)(5660300002)(316002)(6486002)(38100700002)(4744005)(186003)(66476007)(66556008)(4326008)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qNGhKLFwPjDz8VjU5n63Ovd/cARx9NV3dziFuH8W9hYZjFT6o3MoV6IoL0+?=
 =?us-ascii?Q?+N5a5j/sP8cx0ZPKguZRIoFFQ5+ECU2YdK2B0o6NwA/ocT9abyTDCU7PBi8i?=
 =?us-ascii?Q?E0bnmG/6tMZ+RI2OjB5V41VoJvPmC/2yl7nA8ACNZBNg2Wa0ODsIcwgNj1zu?=
 =?us-ascii?Q?D1y6Yitpr5JWyI6sEfTO6vhp4OXasnFrXsSPHjq+ArITIYtniho2Zl4b3RTy?=
 =?us-ascii?Q?iUFtOGMZoD2BBmwnJEC8FbjO7CHmcOd24W54s17QEQ5Y9ogP66Gi+N6o87pD?=
 =?us-ascii?Q?QfjaGNj90q/SD2BzmrvztoYWO35L20gfdDcBosNPxVCKP/LUXFsVKQPWFEKk?=
 =?us-ascii?Q?4CoCFTkMilVuXSnLHgtfGwHPr3hl/iwarNneNwJ37m9JulJGGh1p25KwS/X1?=
 =?us-ascii?Q?PKy57Jpoh7pgjpN3TI37mun51L1JA7Wjc7Z+cijVr0QosnYjobas3I/mCvgV?=
 =?us-ascii?Q?fzSHQia5QWORzsXjD/FBxosUANQb4hdffM0gSLnjeoPQosG2TKumgEIuTftX?=
 =?us-ascii?Q?xBO1Yf5qpdIlf0ss89Q7mGpDbnIYsOupcg3C3+X61IVeQFwtRMdzeuGraIWS?=
 =?us-ascii?Q?JrG/CVfbMMz1FuUgBteVoiyAj2/UeqFdpr4aKZSdeByF7aQcuLpqXmLurdQz?=
 =?us-ascii?Q?mX2RRCbUhM+brs816ecKICUCAgANNQ3HLyQSyJjF1l2r2ZldZIH7Mh3EK2ct?=
 =?us-ascii?Q?okrUlYS5ARYIVKs/movNzoH8MC5qsuGos4mqTvegU9TmayomUZe4YR8c9A5+?=
 =?us-ascii?Q?+2yNkkRVN3rO7gL4AIZjW1fDiVamcdj+GBqWJAZrph4PRYNFShShKNuoZ9qn?=
 =?us-ascii?Q?JEFCj3adL/n6IKYcONcGcr1S9EnMuW15WIjwG5RHd6jHQUFLV+fJwjitpDTJ?=
 =?us-ascii?Q?p9C8hywNNnaYPV0pEg6ndxlPb0F4+swXRR14s0zmlrpxzbVsMjo0l4TFSMSm?=
 =?us-ascii?Q?H+1H0jVQQsBq5zaqwaDNR2/bTS5/y4YI7GIPZzJch7F7KbrPCeyuOGdAJY4x?=
 =?us-ascii?Q?IflJ8bnRXl/qVHvGfNtUXbbZ01HljeQ9Ocs0GWdF0xbLRvOjNmrm58ReOwo3?=
 =?us-ascii?Q?q+kffipFiNu5jE0B3ArEubC/qoE1JHVOqkIEnepv+LXCzxGXNjthuxVQ2ISL?=
 =?us-ascii?Q?zaHesTi5Ay8GlTiglFqOesQHseYYHKkWDuQrUyPdjf961UqHAzO+hizlzkcH?=
 =?us-ascii?Q?Nl3RM4+9AesO9hTzDUUNu2Z3mDWj0c3KrB/GWBDbKTWogeAFAUa8zckrsJPn?=
 =?us-ascii?Q?r2lPQlo+TSDKnf19dlGHBDaZg/OAkjMr9luD5cZ/Ckj26m6OezAnOqy72TXn?=
 =?us-ascii?Q?EsFVWT2IBfeRRNwwWPoMMuIvS5L6QdnmWb74oDdUB7h2wB880ZeBfAuEybF5?=
 =?us-ascii?Q?KvqKwq1a4fA0WmdEPBBgOancQ7Y68ZA6UWkJ2ewAbh4SL2v4blIJT+FD0reb?=
 =?us-ascii?Q?JdnN3++orjJtL+HEHNqdvKqlGAo4D/VbQKrWE9qKjwoVQbAsdFgNpscD7WUS?=
 =?us-ascii?Q?ZAbE9E5woyUa7Dzl2z2uOrMdwltfQJEdxahwlMF2vPhOtrQiPMiyanxJoeVG?=
 =?us-ascii?Q?Z2lAAn0N+A+ME5DRARUsQbwT2JTCSpttAPr6egS1Z81NYSgCWCwFfoZUmFPv?=
 =?us-ascii?Q?hIKiT16jOdqr8U1AHGv2i7g7syxNHjRq369QEc9aFu/89F5BQ1FA5Q/NvRxf?=
 =?us-ascii?Q?bK07z2g73Ehc7xqmtih+OlUz1vFS7N0xdHvGG/FtL+a0DTTXoMZZP3nbmVDf?=
 =?us-ascii?Q?tCcHR2z+lg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e6d0ad-780a-426e-8db8-08da4a1bd1e9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:27:37.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvS0v1f3j7Ts/X3ojjkUU4VoaXUxpoz6GWsInrYZWTEh2U59CaksaJ+pJZLSKgVARCQD12IIC7TMY3NYxniqpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6220
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

According to Reference Manual:
 000b - Divide by 1
 001b - Divide by 1
 010b - Divide by 2
 011b - Divide by 3
 100b - Divide by 4
 101b - Divide by 5
 110b - Divide by 6
 111b - Divide by 7

So only need increase rdiv by 1 when the register value is 0.

Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index cb06b0045e9e..025b73229cdd 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -149,7 +149,8 @@ static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned lon
 	if (rate)
 		return (unsigned long)rate;
 
-	rdiv = rdiv + 1;
+	if (!rdiv)
+		rdiv = rdiv + 1;
 
 	switch (odiv) {
 	case 0:
-- 
2.25.1

