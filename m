Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E787EEB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jun 2023 07:58:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjF1H6a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Jun 2023 03:58:30 -0400
Received: from mail-am7eur03on2042.outbound.protection.outlook.com ([40.107.105.42]:34144
        "EHLO EUR03-AM7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231747AbjF1H4X (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Jun 2023 03:56:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKNpH/wmuiS+2u+Zo0UWqM2hsieH0EjcL85mYMBEHGXCR3D5iOqGyKjmLGQdL3dZqUe1Wv88tQLnVplxBeIT7iDLtioDCoSD+ktEcHo4gorMbTRhWrSLkOPXx+pWs6IOy2m+GFOcw2TcbqUSVZDLJ1uSkERBJhqZtqrN4/WC3tX54bEm+EMv4A3/Sf13RCsgXC38m1zqqWA8fPErxnyOOdzpMgMcMz7GnKv93/4YLKXdALDBFTFJW9Tsw7GPd7jFzfDCi9gfcJoW+CzgtVZIXy3ur0fe01bQe9G9tymOcfc9x4ERhgUxSX4xQLtjRUasRr6Z9ZHgIF+2NdZ38jtohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dau7wALji5m6iwQ9luV/n+K6wUvlO2c2LAYvrNnqo/s=;
 b=l0TcdFritU/5Cdmbr5baXEGyEE8Zq7+hMf4AxnXPu39AUNARK7n3xIQ3MhpK1unYcXiFhvWKupoRbYw5SWhH0mHMYmg3QYqaAC0+yGybv2Vaq07mXI8LrMhXjUhRj8UKKS9rpkvL6NN+lNnmZ47uK51iuYMSH8LcQdI1CGpRHeuEPX+ZNw2fd/IvdqSC10dcvlB1YD3yYzHhOQ0JfMXbKGgoFq/9LZVUSloRzQWeBnZjDw3jDkOacgUoENMu1lRcDPdr46T7jZ05oiWVrAo85RAV2IPGUbHQJhJ8nZlQ0JR+QkolXyhBZrJ4SmnXqGFCrl+J4HZM2aaMVJwbSeSSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dau7wALji5m6iwQ9luV/n+K6wUvlO2c2LAYvrNnqo/s=;
 b=LSOg2H2QQe1We44UL4MDCthOXpTXoKkI9uCaJMlW1PKnCPTQYz5qdsEyKzD3M8VNfXsc+0KXBrgmkDqe3XKLzRa+pvBUrE9bo/O8hwZwOuGrZlpcz1FRWksEg9krM9R6MmcfHbo0fyiA+hvT0AAySbuwxXpb78vj/AtDjk3sDBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 06:13:56 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::4ecd:8d95:3543:cb6d]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::4ecd:8d95:3543:cb6d%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 06:13:56 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: imx93: Add PDM IPG clk
Date:   Wed, 28 Jun 2023 14:17:22 +0800
Message-Id: <20230628061724.2056520-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|DB9PR04MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 2115366c-86f8-4bcb-4992-08db779eda95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTJ9G8fZSwFl0dNoncMZjry/kgl48lzKX/rsd/b0G3oJRuUY28SxAKAdizR5h1wY9a9kn5lo6Nq0uf47hj9JwCbh5k+tMPPUNRds0b91dS9+8gKIvLHVz5l20WuogxtPpYwhw4RlB837h61jnlpZIJiqZx3CeuD+p+JiUCTO1Ed5qmx4sFpL+0gOWyeZZj/V96Kxw3zQOxsVaMh85mK+s7gxOESew5jD31FgAr/8cJig4V6tBYUTbs1NUgrL7Dql/++3KuTmbHu3FyuBzlrrjaZK6zlqtNzNoYRlbpvL4vr4P5fXY+Y6CuEwBTUDz6ttP3gCzH0BFj5RyaLmmwqvWdudzM7CKycGSZRm5w7j7ZchW3TVjMIVICj2X2dZsyZIArQuIM3DJQKcjDU722beBDLDPiGbnOp1WZGGLk43Sl7QVAXqrTF7Q0ADANlR5o2/11f/xDzbcPsn1NE0q7amltpbtyXd1PtXig6nGS/AW/WM9gA8QtbifWHD/OzAfMorB//xDSeiyHrvqcNLa6ruvqVbDqcZSD5eSrsy4mqLvlzrgcxVXw/JS31neNrPhd9YlSXefammh77X4BbVKJeZO772hFMCupO2MwPjWx2i1HwFDQH19wXrhi8QEdWtYz9W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(186003)(26005)(2906002)(4744005)(1076003)(38350700002)(52116002)(38100700002)(2616005)(6506007)(6512007)(5660300002)(66476007)(83380400001)(66556008)(66946007)(8936002)(41300700001)(8676002)(6666004)(36756003)(316002)(86362001)(6486002)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?duqRVGWXStSapukWvC8JkE7Hrhj2cixaNLOR2u72g/vVqIy7a7K7urWoEpmc?=
 =?us-ascii?Q?OLTqc5Us9d0JYb20u0YL/CbN/WwydJR3AYuxbYPfBrMKPaR1r3vcg0eDNSO4?=
 =?us-ascii?Q?i8eEhutEzWmvULW0xVjd5KDRCA4sjOqpUq22pQeaIqwQIw3Hp5QJHMbnZ37J?=
 =?us-ascii?Q?tQlIQYXry3csECK271l68nW0Lp4NqpBRt02W8zFGEZukatou05YHMs09bjIW?=
 =?us-ascii?Q?a/735R3UrSCt0VHQzld7hGxl7ZcE2y7MHGn7YwaxINLR3CfBtOinr2s5gUbN?=
 =?us-ascii?Q?TTFswXQiisTw1aPAlTF3T+kzNpN4cjeeD52TjoL1yBmqcVhGlwYb1hoqO883?=
 =?us-ascii?Q?lVozSBsUACFYYChpXeJKm7LGExvk5T7A7qbusJxf4tAh5tWfwB6F/Db0ZhRK?=
 =?us-ascii?Q?q7YbsRNrZzRWigfq4l4sKJlXQe+RKUfcVpANKp+7ZJ2miAQKraN+5f4k2lvV?=
 =?us-ascii?Q?1XKkKgOnA2VIEtXKYXuCNz5LJg4ujiY0rpyz0Y9YLOgv/qSfWZemCsWZQRlc?=
 =?us-ascii?Q?KssmyOfFgxPMDCJqy/q21DNgmj8rACNVzZwSys+6HT6Pu93B+pjd3SwbdFYa?=
 =?us-ascii?Q?bDf455zuUVD+2k2hD9ZRlFBHw/Laof9mF8+sDtMvRFyMmk+zYJ/M6C98+tDC?=
 =?us-ascii?Q?GRyUQ/iaHFBTOm0t7V4uJpyHOEMXZUXRXlC6qioBdOuDANFZ3DJg34pcmOWP?=
 =?us-ascii?Q?+mBtDOE8xKqzQMf2AVgK5VMDSbGjnyJ0siO2AdOXUtYhYx22XkV8zyWmSMtt?=
 =?us-ascii?Q?ETs4W88/tcdmtuWSPzXBsiAjVswLJSRLICmCV0dNssx9tTFwJiv+m81KqRKy?=
 =?us-ascii?Q?83UBdieqGwLI8qXTdl0pDNW3Mu/DY1WQB6EL5et/bqxunEh+NDnlJzJ8Gw5X?=
 =?us-ascii?Q?+J98G+zzpLbj8jXz3xkwYt0u7HZTK878LYGPXQIKOL8mQeqYlnWsETcSykdN?=
 =?us-ascii?Q?iBjZsaE22D+eo7i29q56RVkdAieqahijgdP617wSt82ig+BmrAXGqj+MwCmM?=
 =?us-ascii?Q?que28yUIf7VrRak+YkARcZ5VNFDwuFgdRsL6s6LGYSPVfenGCYffCmwIr1gw?=
 =?us-ascii?Q?RKFr9Q6ktC8Ne9b47htXFEUdVOJovrw6AtKQp8diYWytCQDx+1smVpD7g9uD?=
 =?us-ascii?Q?XAFcjaD63/Du5L4w2tY+XoiXFbKRGUCtn0vFOi0AAiJjUMbH3WXO/1QSbvbs?=
 =?us-ascii?Q?E/JiKjJRmHJHXrr9/6ktG0iuq19adumPgdrRXliQQ6WKLga5COVGAs+GoMhU?=
 =?us-ascii?Q?ZLPYf/XTItaXrEo9y/lv+VjZrRUNzAoCQNaROkOyRvyYQU+WPU3Mdo4xdUDl?=
 =?us-ascii?Q?qdZYSb6iCUZmr8l2X58jqs3y7QL7ama+PWrFclg2D1iHQN71JXP20A3ZIQWg?=
 =?us-ascii?Q?f9lY1fVguREdsQfZRvgiVALxoqJW/hCQTdnQJ5I54Qluc1V8qflmHiZzno0t?=
 =?us-ascii?Q?DXUhvdn6YFrioaGnUmILQ56oobntcq3IDNKpgR54wFEsplESLkQOQmIrhkAa?=
 =?us-ascii?Q?uYawUTERPIgu7lNWnGV6kYZaA6lwvqOFnCO8MpTw/OeGySOdR73lJ8s3OGwL?=
 =?us-ascii?Q?IfhN3aDkRv4Z4QBwk/gRa7bGkouZwggkftJ0wYGl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2115366c-86f8-4bcb-4992-08db779eda95
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 06:13:56.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXFjUEj31v80gEAAFJd0gArA+/mNkyD+lSSrN5QEjpmOfAPRbITyFqcSoCL2GZOQx0KgNjkf6tzOyJCAEykfcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chancel Liu <chancel.liu@nxp.com>

Add PDM IPG clk.

Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 include/dt-bindings/clock/imx93-clock.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx93-clock.h b/include/dt-bindings/clock/imx93-clock.h
index 35a1f62053a5..787c9e74dc96 100644
--- a/include/dt-bindings/clock/imx93-clock.h
+++ b/include/dt-bindings/clock/imx93-clock.h
@@ -203,6 +203,7 @@
 #define IMX93_CLK_ARM_PLL		198
 #define IMX93_CLK_A55_SEL		199
 #define IMX93_CLK_A55_CORE		200
-#define IMX93_CLK_END			201
+#define IMX93_CLK_PDM_IPG		201
+#define IMX93_CLK_END			202
 
 #endif
-- 
2.34.1

