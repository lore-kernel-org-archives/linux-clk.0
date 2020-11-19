Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70F0C2D0E4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 12:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32387246D3
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 12:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LCWkyXFv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgKSMAa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 07:00:30 -0500
Received: from mail-am6eur05on2074.outbound.protection.outlook.com ([40.107.22.74]:28455
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726555AbgKSMA0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 19 Nov 2020 07:00:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aC+tv463pB4f4PRK3FGGaBUerfAD/WoPh1lb8f3rPaLtoYEHdxRf2arNu9QuhcPbt2jn7k00xls/kR4Of+Av4jEmBYpQTmMu3w9amruXCBRGQ2gWRVrf7O1sKQcwshwJRSodZ4PYKfaFFLZIGPiBsT7nJcsrPeQqPbELDOMKWcQGyPwOc/WqAfpWkD0RnSVEy328zd7aN0RogJkznncuCmvPfvnqx4Cm0f+xzsDdhEhyUOPA6UQabCKIfURKeuTDpMlFev0Hgn1SqK27EBhAowqJcYiysW07lVD03fqcCFMFUkuWeH8D9OWoFIRwCEM4XC8UxKBVGq8FRI03EDfrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3k9qF0YfZ/991EtvwlBF72pm/Hc7pj0saTKJVN7L7E=;
 b=h0cZQRAHoi652gx1uMHZpYT1rp0Oml7ccbS/FnkPsxIISgYyv60ea1R8MwPcv0Jt0vqXQzRWoaSOorpTmdDjYBI31YqubCXoTh85j1FgavkY+ks9f2X2FjuP9QfEX84vR6Sx5Rdfugzq+e5cOQDT7ARte6k0YjR4HfC1/3eMLApOwLpMbcxz05bYAkfHhI6Hd05ssspiktLmtoGmAWUKWlj5ltFaTl8qSyCHOSXTAnYUvGaFNldLy9SVA0mgQs4jIx1c/W0vg3dZZWWKlJ4OJh84eaw4/RA9A/Lmu91vlL9yqEkxtpycfpWpmbWXwlDvQ5JLQ7qJ6uAEe0iFFmEhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3k9qF0YfZ/991EtvwlBF72pm/Hc7pj0saTKJVN7L7E=;
 b=LCWkyXFvRDI23p2DGExKRR+yPqnuEtb8o78sXrxhue9yDFDrgkYCdvF2qZMyOqVWlGvEo8aNMQgFoWYpRDBfG7SfT8ufyS8aiycCz433vw6eoQWTS2bZm8a3ph/U+NOzM+yXmzpBxowCU826l3DI/25OEN9p25eD9LtnXQ/gQ3E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR0402MB3559.eurprd04.prod.outlook.com (2603:10a6:209:12::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Thu, 19 Nov
 2020 12:00:22 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Thu, 19 Nov 2020
 12:00:22 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 1/1] clk: imx: scu: remove the calling of device_is_bound
Date:   Thu, 19 Nov 2020 19:43:02 +0800
Message-Id: <20201119114302.26263-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.23.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To AM6PR04MB4966.eurprd04.prod.outlook.com
 (2603:10a6:20b:2::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29396-OptiPlex-7040.ap.freescale.net (119.31.174.66) by SG2PR02CA0060.apcprd02.prod.outlook.com (2603:1096:4:54::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 12:00:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad8d557c-49b7-4ed7-a0bd-08d88c82b14b
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3559C48911514281915F7CB180E00@AM6PR0402MB3559.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QiL4FRr/vGHHo6FQDJNHwrTTaTzxk5MwEjJvImFcfjc3ucyy3aFK9dAk40W9LNUVYvrRCv4SnUCuwOaR6E2ghIT5oN5duny3Z5dz1wDAHTqW5K4Etyahgk/SwPfTND/4hN2dr8RA9t3+jDqmdjZzIq1/iNV28a7ml4WcW8tbus3A+YgEFuKrJz0Gec2dL/9kNjZYRVRyOSjNifnADRQcUf1XHk94/3NwBOPrHhIooyjG2vSkciBWPb2PKnhbhlc1yIV0FwO9s3g8qbzBuGCKK+sukrYSvdXGQVkXgYSVbyAEyH/cM5cZnqarAn6pbaZYiZFho5/Pf9IE58Qetu0lLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(66476007)(86362001)(956004)(66946007)(66556008)(6486002)(2906002)(1076003)(6666004)(6916009)(8936002)(478600001)(52116002)(36756003)(2616005)(6512007)(4326008)(6506007)(5660300002)(8676002)(83380400001)(26005)(316002)(54906003)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: e6wfvCdaTYDJun5t4pe0yeDEpkDmHvhl5yjmGj3aQv/0Gjx18Op/svZ8+gn+KLdcpItm63odwnUoXxjlRLihQ5vwU/42ft3vsneuhF2+vGQsLRLoJFGc0y5gdQzjjhLKOYgaIAOtuDA8vBl8+PbzDTUhj10T5yKuTzZJIsG/uAJsO9cap6MyzIGnNQPrYk/cnPWJpmTrVafAupUQHQ2hyRGxe7ohHQt4v2bHO+ukt/+cWkYTULn+u/Pmvr+Zf1MXmmWxbnWWwWPXZaYB/pNtw0nYpvTftcwoyvPGjQXN+NyCVO2NtTO+OmTVBOItDx7+Qqlry9zOKRUOTYwRJDCubj1P+Ul+m5JaWUUsE4VRNIBpvFMY3Vewge+T8zYqpzeqlqe7wEhKzpG8Trv8R5wmdnB+q22tZ/9KSsBCsVbiPDyKviOBtdEj0Xz5V90IYLhILbrCrmXGxHTB9jHHI+Ubo/LRc+fIx81jDkqYJiTLqFhlTWHDi82So+oyRXnYmYe9mhiYQSZYtZO6ze7Adx5VozPHR7V0v2IQdgXT1boSREVxIqSQauWihCa3z5gSU7xRX1t3hjMuyGntjXid3t17LXb8oLSzbir3GabE/FuRo++rA9ciLDfm/qYZsIlYHw8CFAkVEBcq/CII/a5prGCvAQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8d557c-49b7-4ed7-a0bd-08d88c82b14b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 12:00:22.3694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Asl2ZvxJ+YhKH0kMgwP8GAuc4WCyWv6YYq/ltd1qaPLv3/KA267BfuSeuUw9IMTHj8PUIwcQ57+5vFw308mDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3559
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The device_is_bound() is unvisable to drivers when built as modules.
It's also not aimed to be used by drivers according to Greg K.H.
Let's remove it from clk-scu driver and find another way to do proper
driver loading sequence.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index d10f60e48ece..1f5518b7ab39 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -153,7 +153,6 @@ static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
 
 int imx_clk_scu_init(struct device_node *np)
 {
-	struct platform_device *pd_dev;
 	u32 clk_cells;
 	int ret, i;
 
@@ -166,17 +165,11 @@ int imx_clk_scu_init(struct device_node *np)
 	if (clk_cells == 2) {
 		for (i = 0; i < IMX_SC_R_LAST; i++)
 			INIT_LIST_HEAD(&imx_scu_clks[i]);
-		/*
-		 * Note: SCU clock driver depends on SCU power domain to be ready
-		 * first. As there're no power domains under scu clock node in dts,
-		 * we can't use PROBE_DEFER automatically.
-		 */
+
+		/* pd_np will be used to attach power domains later */
 		pd_np = of_find_compatible_node(NULL, NULL, "fsl,scu-pd");
-		pd_dev = of_find_device_by_node(pd_np);
-		if (!pd_dev || !device_is_bound(&pd_dev->dev)) {
-			of_node_put(pd_np);
-			return -EPROBE_DEFER;
-		}
+		if (!pd_np)
+			return -EINVAL;
 	}
 
 	return platform_driver_register(&imx_clk_scu_driver);
-- 
2.23.0

