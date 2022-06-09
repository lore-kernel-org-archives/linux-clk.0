Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA585C43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbiFIN1x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343731AbiFIN1u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:27:50 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DECC150B7D
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6HAuHfmaWxqUh3OxzWA7mvuCbYy9dwWD0oDbRZ388FctnbH9SV6u+3Ft2WFYWzSdGjX5L9IqKgUMhRx3waK6HxZAks6HUxOk3VhmPxw37kOC8LrbZc0XjcPuz/FfRMmiSdpQhdA6TsZy9zZTX+s4lRAbWemoL59zjuYBszfzrNryaZSG+mrrw2s9R6UnOUb3oFpN5Cqqs4UfjAdtSYheEHgTXMB8NLZFg1GC8UeYucN11T6XDKZbF6cnByO20vdaJkfzLbDWknEZ8iUjYyvQkz9eupcEH3IUwJBqtiKS6YZK5WvLbwYj3MPPxCSc9Vi++bVrF5TCAFCEcuHT54jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0/lJ5LzVnnSTHoj3ouR8c0021L9oWrazF5d7v9VbzY=;
 b=ogfbLyVdfi8Kyn5dvLPWnalljpo2Bkjk9zqO60exOLwWYYW4kbUoMHmUBbNd55XEf9l87ua46iZeh7/LnqOCfuGvAxWDUNBfjwLj2OYueYXePXkv2MtUWXJO9+9qUBWk/GeaIBlk8ciXqfvANbVhUSTEXfUPy47e+KxPHvI1q9rEgptCaY75hJh8KuQGgV1brsT43K/u7bVDGsHKjEGQy2ypU2gyDeqYv15ULR656vCyW6w/KLELfv54RiBEoUIQOFtCE6GtXwdHW9+TrNps5azszFKCQikF2PToA2SiXknAUhwPJTwbZisH1NXmkSPsryVNZ4hWpdsehz29+hE8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0/lJ5LzVnnSTHoj3ouR8c0021L9oWrazF5d7v9VbzY=;
 b=QE79eZMzFIEOD0DeP1tvgECIWIKDFuEFwBthZX0EC3OcvhUXeNPaFrw/etx5Baq2oRCRvqaXxmYDyJuuIaiJ5FpgIC13UgVz4ps/YPuUDhrvaiv1VDBK5JXxKA55ERQi4nTIlSOuQNJVQSLXfP2yZm2vHARAGPWVR4UNrhGz2FI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB6220.eurprd04.prod.outlook.com (2603:10a6:10:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 13:27:43 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:27:41 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 7/7] clk: imx: clk-fracn-gppll: Add more freq config for video pll
Date:   Thu,  9 Jun 2022 21:29:02 +0800
Message-Id: <20220609132902.3504651-8-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f871f5bb-b06c-449d-3313-08da4a1bd40f
X-MS-TrafficTypeDiagnostic: DBBPR04MB6220:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB622070A03A44CF31FA731265C9A79@DBBPR04MB6220.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWODQ92hZVkCZzhl6oINQ/O+TCVOLhdeJ6ijDJN7JFFKtsOtQpxGRWzWfZ+7yGvGLO32I4f21W4Mz7+U61w+wY3gZhKrst+4ibxcVPf+M+araPb1hn0U61m9sFn+PcYk220y698wRSwbZR6yrJ1wtwYAmreW6zK3nuHTfmFJmXquWuATKqhgpJ73keC+9VF5RCFt1ctAIwoYWMX0kv3Cd3g9TiT+pwPEacg0nAtAjS6QcOPGakpMWowo+GIARXsqiMhnoV8wzAtx7Dgyu3b2PC1q8ux/duVssPGCTKaeJfQlndh9zIWsG3hVKRAoA08AwieNcGjj7d5D413s8IXx158D0CxmIdrkyRpg+wQt+oxbEl7N94/5HqLjrQ8XnfrgFxj+qpiBrFplTL0LIKvNnsSKSZz1gA1rTHwN4m67C3o/MPPP4ZsesZy9n4ghpVNLPl7L2Q5Kfx1Rxm5Arpz+1QgE0Cxva8FAHf7FLJuxi8dlsFNHmZOrnkjZUs2eK6sdFBczfcQooK0DkxqeeHZZADFQofomVkP0CW6vUb66SxZH7qk11dmR5rVqtU6m58Cq7dmKHBQbzLYx4W285X0Vvp022QiKBP7bGPfojj54eBwnsstAGhwIsNh+UjDw2o5SeQBeELdvWK8cWlYn11/UO/JsJSq3vroknU9FeK3b1h3uqboHG3gcVdEDsqc+lb/GTl9Rri0SUQ3BpabuldrxXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(6666004)(26005)(6512007)(6506007)(52116002)(2906002)(508600001)(54906003)(38350700002)(86362001)(66946007)(5660300002)(316002)(6486002)(38100700002)(4744005)(186003)(66476007)(66556008)(4326008)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1brcWL5jgsvaZsQt6jT5GQmoLcT/ebto3ZfPEBfXS9D9oB8x6UCvifia7o5Z?=
 =?us-ascii?Q?RTg5DftMSSEsWNxNdrGneApt+7ZTxt0pdfuMSf8A3i8ll7VcjB3yPxwue4i0?=
 =?us-ascii?Q?eMVlxy4bU6SZPr/t3izEVQZLyx2uW1haNavuZyhE5vjk2iq1WjjlJLVGjPUX?=
 =?us-ascii?Q?KZxlKmKHxzgeTPP3P62b9yuXtL7x2uCzPqKlQSROtmN8rgN0L0Xx0we0AGmy?=
 =?us-ascii?Q?ZDpuj/iCfF9CutKJoUcVlRRiHgeo1AJNGPB2+VSSb/m4oxP6m0CQiZTeeENe?=
 =?us-ascii?Q?C96aaoIc+mJIlF5pJkJ5OGnyaXhzgAsJJRuxoa4K1wJZl5U++ZZGyfN4AJPA?=
 =?us-ascii?Q?GS6IEAWB4TctsalJu1GPzu6Hcs3sigVnmAK0YmeFInoGR9DkSOwLx9rEizQY?=
 =?us-ascii?Q?RJPzeD8xd0AwXKfRwZOrUTwaGru1EwCWoR7cnkTmh+Jip7aygsr+UFlv1IQk?=
 =?us-ascii?Q?deN9HZ0lvC2XXeC9cAJDwGa7w/jWQ7fMsjpPqa8Nys79BgxyEUWADamuE+DG?=
 =?us-ascii?Q?dNy1eP69vJstlrfMlg13b7XNijkMW1IOmarRLnY4oRESTR3qpyR4lFieUmCO?=
 =?us-ascii?Q?mBf6VRcs3h/XU5AAQMgFU3s74YlVSJ0eIW3UfdELskqz5eQRuch6BZeqvurg?=
 =?us-ascii?Q?BL7NkVIeZG1zqcQrN/XUTCWQITz9utgr+ivd0P0NQ6HylUNeKOugrhfqx08f?=
 =?us-ascii?Q?3u0NlA60MKZ8iog1LAAEA39TjOHWtZZwRO95oCSUCCtJkWyp0emCx3vC4G2r?=
 =?us-ascii?Q?/fM1c+zuYQb2CwcZk6R2u3ft7FI0aHPyBIHsBH6nBcFC5Q1pdTbFTsZupgin?=
 =?us-ascii?Q?zVc6JVrNVYYDAGXVBu6bll58sSaIoy+Gq/FSlyWvOfriXHfmWo/wxYQq0bFz?=
 =?us-ascii?Q?XebCFMMU6a5Sd7Rt1RX2uecZ3eKrc6+Lv+kIxfh3dMg5bysQGyIU5waGw+Mo?=
 =?us-ascii?Q?uH5q1s+mxq6BgKnmYjTudi0G98NuU3/6yBlsUkzTABwy/Y8o69OvtZ6DO2Ah?=
 =?us-ascii?Q?RdI14WGsVWj75554mkGE5Or5bKZxcPcuzFFbTucGl6VDvJerwbaf6qbb+1XT?=
 =?us-ascii?Q?MWh/bci4WIfiUI5KTWME+BJrezWnWb1xTj4nuiyD5FI3KEJx/q3+KFjjk8QH?=
 =?us-ascii?Q?bpBPSoz6bInFEzDz6awX/z7JyGNSC76GCCplUpAtL0khFYeo0er4iEy/ax7/?=
 =?us-ascii?Q?oqbADETlo0a6e0KOO6PVRRx3N1wnFLlBDvB6nrbfgNyDuZSQfCiiuRDP95Ix?=
 =?us-ascii?Q?i4rU/ax0DCKtk7y8Nubf0bJYEb8L35/LroYtXXhhtGhnclmO0LuETTc8ExiL?=
 =?us-ascii?Q?4okFer/fA7ntI5aB/1wlCwA6aYEbDHIec0wXubmHnFlxxd7/kgJxPpS01zaU?=
 =?us-ascii?Q?SJkskV3kNViVzNgGK9J0sydCM23OV6WZSRnW5Y/e9N71+bYI9IysaD3ZzVxm?=
 =?us-ascii?Q?yRB/hDbk6Qt8GrQvS9vwfI23r/3wE4aRyuBm6Gs+MDbizac3G6NkMZS1bQNm?=
 =?us-ascii?Q?WT+H02DGyzvj9Y8YJFbah4a1Qi8r0rB2pFsUanVHkrdlZ7n5zHg1s+dqmJjU?=
 =?us-ascii?Q?4nJgehIXVco35eMbFs4NA/tvcQr6JWZ/szC6zFb6ubSwgXRaoqst5/kOy2j5?=
 =?us-ascii?Q?8MDw++bd0klwKXmOq/ZwybHYo3b5BmL3sHSRZYnvMSC7JYRLR1ql9Z+ghruA?=
 =?us-ascii?Q?JB23/8RjXreiDrl+rF1FyXMYVoXvPy5lkx/uo3ixxHKB+1Wx08bFvV1/h2PW?=
 =?us-ascii?Q?7CFHZtxqmw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f871f5bb-b06c-449d-3313-08da4a1bd40f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:27:41.1340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bygo37e6BwntUEh6nnhwon/C2JO89kMdYvLMn6eGN4wPXZjNTegPIsNwIGX/w4m4PdUfiwBrykpcNuWo4rfRSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6220
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add the [484,498,445.3]MHz frequency support that will be used
by video subsystem on imx93.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 025b73229cdd..a2aaa14fc1ae 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -67,6 +67,9 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(650000000U, 81, 0, 1, 0, 3),
 	PLL_FRACN_GP(594000000U, 198, 0, 1, 0, 8),
 	PLL_FRACN_GP(560000000U, 70, 0, 1, 0, 3),
+	PLL_FRACN_GP(498000000U, 83, 0, 1, 0, 4),
+	PLL_FRACN_GP(484000000U, 121, 0, 1, 0, 6),
+	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 50, 0, 1, 0, 3),
 	PLL_FRACN_GP(393216000U, 81, 92, 100, 0, 5)
 };
-- 
2.25.1

