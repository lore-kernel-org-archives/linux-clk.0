Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBE9C19F28
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 08:17:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbiHCIRm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235498AbiHCIPt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 04:15:49 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610C96160;
        Wed,  3 Aug 2022 01:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIOEzuqaX3g6UXP6jr2fTVqQ4BqTToX0XZ/ZZ8AThyqgTMblypOXRWP4HkTSdxM+XCSODd/FMuuB7PTGuy8/g1fllWEFIQtheI0PYy6AQ8T8ZQR1vx27ETMtcp3TyNKWdS2WkaBcgakZdswRGeAD/gaF6yys0IVaR8nTbHYGtn+l0LHsoKt6xpq8Gbi6fssWV6qHmpvNDOaWO3UTnEfq2Z+3eIJAnfjyLHzYTBNioQmdaxTToWLwYOBSwbFha3DpIsP3VaAX3dWTw2NQTlXVcN1by7H6GCGzzHE6daf0Ts7rxNt4cGbOqz5HcYHEEc21RPVAkBVZJQj8qdZqvL+CdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVv+n8+Cxe298qw/EIHWwPbObJC6tSL+b6XysC3rkJI=;
 b=Kh0vMBxW2Lg/r2t/p0kU2NZZOeE7irroVCfwbULniILrQAAYtGrNOclLJHnz5c7BmzEVhGRvwcidmn9JNSeI6smT1iCtlf8SyFuUjL8jyUtB7HGIIKPM3U2UJaQMH3QmtfRevFww8WZAKl8zKgn4Yie1lA/BvMcENczvNOMOramBoa/qOfPL7SaAJLP5lHffs9sniVeNgmJs6ri+ef6WMGAp0khM9j0ikrs1AD1knC/OemCR+rkXKuOCGeOvM+BOjSsE9MDQe91w/fSJ5/75lXgWit7TnfM5Xk3T8CWyZE3i/ent/JvgZh9PVXpuxVAEBqwKYCU1a029Asn4jR7gfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVv+n8+Cxe298qw/EIHWwPbObJC6tSL+b6XysC3rkJI=;
 b=fCI8LiwWZZsLjngoH0Jwfn8l7JZPH5RFIkDq6ofnuqxv3i6ppF+10GjxralrPU+DG/Y5T/4fafqTnur6e2WLBOzXWeEt5UEZ9BOmagHqzGG/qaUmPUOs+Q7auu/N6LX1NFUvojKhYhpH8obPBQaQqtUSvm9LzpoqzA/hlOT0KCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8233.eurprd04.prod.outlook.com (2603:10a6:10:24b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 08:15:41 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:15:41 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/7] dt-bindings: clock: imx93-clock: add more MU/SAI clocks
Date:   Wed,  3 Aug 2022 16:17:07 +0800
Message-Id: <20220803081713.3504699-2-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb63d5c8-f9ce-4e68-c2eb-08da75285ae4
X-MS-TrafficTypeDiagnostic: DB9PR04MB8233:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CqhfFVPnPvNJB8Q6TYSeZ2PHlYQVW3BIh89+eSjYZCWDp6dLIW2CiBH8Y3LjoOSf3HRQNQhRDj8LE4Mg3cKTHPUeHj30P4LoniqQIZrEtxI3Kz4fxDf/AVh4RXedrhRCc2lSRwd5PVx/7DMGfA4gbjDo9WxIQaiqJ+zJkB05aYuyQ6YLvoIvrIzrM0gXc8zpSw1I5n8L8lEo5T59dKMgO3TeuMjgmsFQCpXnDXzVS5jGP5V2ykwfe0M0vRzydj6JQD36wZLwUzxRyJYS/6An6VK5+uoIfASuaEiCCsbE6kx31MgD+JNrLNVS/BwFKhr2WQALmZFGgwQaeNYqLZFqnX9cJcmnnrS6JgultLWlGKHj5drAsCsG7/GXVGlcekhU02if/5E40ZuUn3xMkmr0LZmNNkLEmfOdnu76nzTJhrE8hjK4EVojVurQPcLvNMem0U8Q+J0aW9fBauxI5UU1jjRlLal6ksYnfi6eNPHKigcPynXnsn1lAW3PJ+GaZfcf3wRe63RByuYSxmflNOdTfU3qt6s/Wx1r/fIylKclNjLv1BozwPxBVkEDVxExpKGRfBwbipJL3hI42nI9II965GXTMIBFTJKc2h/kNZIzyueff8HVFis+iA9TXzNpI3/4TFTA5CeC879WJ8r81CJMsJTDx+toTgbSZePArZ2VCZW9RwHfB4ZjRHgFqmVtz9nUk+pRn/3X+Zmw+5z489SpYIknht3YoKZV5COzEmmUHQPE60xACqSBubv9Fiwio9AHYf9oim6eF8insJiublrl5lOIwDnaQsWgeE3wWvW7ogGgG/NXRkZlBldSORSzkVyN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(7416002)(2616005)(6512007)(5660300002)(26005)(186003)(4744005)(1076003)(66556008)(66476007)(8676002)(4326008)(66946007)(316002)(86362001)(6506007)(41300700001)(478600001)(8936002)(52116002)(6666004)(38100700002)(38350700002)(83380400001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wM+wyGjGyMpuMdiqEvVBnIZWaOcjLXlCsjjTyZ+KyWGMNXb3hp4EPyCLAi4p?=
 =?us-ascii?Q?Ka6bTZT69MLxDGdFdL3hmDOsSNropOClVj3VicgUh+2rcBApt62EPeUplm7y?=
 =?us-ascii?Q?CNV9aWGhJk8Qui7+Gy1g0yWW4A3jZnwwcg+pAbNOQ0j7ShUabOyPmHLCrpKn?=
 =?us-ascii?Q?3WzSUGNAabkNzQEBbM/VTsnFj6ZT/VKezBbE3ifi8DTbR/QD5ufslluRkWbr?=
 =?us-ascii?Q?+B4Ci0JKTHevAy5qJN15kyeoIeob9sZPZeM32aX90/yALhtKo8Xg1vzuRpP/?=
 =?us-ascii?Q?P6TWsx5026Fb8bmXiOas92sI10DU4RlYkMQre0TG66Zk+9C+0cogBBXIXy9/?=
 =?us-ascii?Q?cBOMvGC29iJ8MMEegsTqadGXwGJW13hn5DAzeNMGMwd/qxmayRHgV/JAsu69?=
 =?us-ascii?Q?4to1Ow8wOjk+7hog1nC8A/trAAj9qwxuYFpgsbYrEBjcva3v3g/MtWnGG2RE?=
 =?us-ascii?Q?hHFOSTTD+7apNRxYclKJW/IuX1mjrQp5H0G/6VfmQz3q486A2ZPS65+hQWpf?=
 =?us-ascii?Q?2am/NT+s1K6MnUf2530mzVzcgr/0A5ARPZM+byVlUYgC7+MK2TAqagAnQ7w0?=
 =?us-ascii?Q?ABk135zLZuXqmMJQKwgOj59ZZwYuqF8kz0Z1d3/5atHpq6FCrAwRPqZaYMAN?=
 =?us-ascii?Q?lBHKioBGNLnp0i7IQPxK6Q3GZkwLOoKbcroRkKXERVxt203S0Ts+PQYZJQow?=
 =?us-ascii?Q?a/I072IpO2xU9UVOVLesQOUI6ECc3C5HNrKVruM7tq49jc7UG5fQFKS3+CnO?=
 =?us-ascii?Q?P5TOtc/G6zr3c3oMFznt6S6e7SIvKTA0vTmnYYWg4wS3suoIpk6z+Be4/xSJ?=
 =?us-ascii?Q?wnYmB2ufELuXFw+Rr18/MahlINwpoIG5/5QIDxEDtG8NPywM6gsnNJ/yQWzS?=
 =?us-ascii?Q?oHMLLUVd6tAN9jGQrhiQ6IyQCbs6+KiM+SXakresf223Jb6+HRiFudlFVtFL?=
 =?us-ascii?Q?7+JK5IapVgRRn5B8Q+XWt+PLlU9pPbuiUgKSpWXJ9X7HQ1VR9FW4k6hArjsF?=
 =?us-ascii?Q?VxcJ8rOQV3R4CousSzu8jbp38O6rxK1TOSKxn2QQD6XO692w3OebtZfgvsr4?=
 =?us-ascii?Q?TFu1k7vi3Vr5LfMGBAVVrJpQaNp2pF11gKzkuEIoOnsIMC/eYzhGSLKd9SkT?=
 =?us-ascii?Q?t5glMvH4ksW+JvkiTuh+EviRrh34mWtoTLopAQ65EoyFBCZx6q2hMPLHVy6S?=
 =?us-ascii?Q?d3StiK2JCxAkZc0dCooSZ0FoDwlOnYBnnxFCiCS+CLGntGzWL8Iuk9iNQvHr?=
 =?us-ascii?Q?RWU5sdUJz1aaA8Pg04wqzgNIE9lE99nqBjINnIyHmM4xYkunmPZ0b1fSPp/n?=
 =?us-ascii?Q?SNlZAXIIKw0x0RYe9h2xO463rr9z9T84tTdrzZFdhMairQJz7iDL01xKu56Q?=
 =?us-ascii?Q?mubMuMMja2m6SVF+NJQOz3zUisI579xHMYLATWYWKqxQOlE04LeOG3glcVow?=
 =?us-ascii?Q?KXaEy9R58KW3gYKwP/n/tBVcVxTF+Nf5BkMddERm/aAGxMq4zZiPOF7YhugK?=
 =?us-ascii?Q?ZyH7XCOCsQr83/oeY0Ytt3/q+lSMp8nqS7EBewkwZe//eBZ7g4gpQArj1mZ2?=
 =?us-ascii?Q?ax+SNNYzV9ZTHU8KnLsRn1PkKmmDj3d9ZVoZuY8p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb63d5c8-f9ce-4e68-c2eb-08da75285ae4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:15:41.3866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X61acvdr5plaHkG63n5FmI/I2Fo5cma/icM5mCgtc1+/WQifU3YzG7Ztx3QnNK7vqE6VtL/tnFZGd1XyTI+c3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8233
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add MU[1,2]_[A,B] clock entries.
Add SAI IPG clock entries.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/dt-bindings/clock/imx93-clock.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx93-clock.h b/include/dt-bindings/clock/imx93-clock.h
index 21fda9c5cb5e..19bc32788d81 100644
--- a/include/dt-bindings/clock/imx93-clock.h
+++ b/include/dt-bindings/clock/imx93-clock.h
@@ -196,6 +196,13 @@
 #define IMX93_CLK_TMC_GATE		187
 #define IMX93_CLK_PMRO_GATE		188
 #define IMX93_CLK_32K			189
-#define IMX93_CLK_END			190
+#define IMX93_CLK_SAI1_IPG		190
+#define IMX93_CLK_SAI2_IPG		191
+#define IMX93_CLK_SAI3_IPG		192
+#define IMX93_CLK_MU1_A_GATE		193
+#define IMX93_CLK_MU1_B_GATE		194
+#define IMX93_CLK_MU2_A_GATE		195
+#define IMX93_CLK_MU2_B_GATE		196
+#define IMX93_CLK_END			197
 
 #endif
-- 
2.25.1

