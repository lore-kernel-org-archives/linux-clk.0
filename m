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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02370C5519F
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96D84241A5
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kcibZ4SM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgKRIil (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:38:41 -0500
Received: from mail-vi1eur05on2075.outbound.protection.outlook.com ([40.107.21.75]:18482
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726158AbgKRIik (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Nov 2020 03:38:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOsLUqXgWBLDk8lzLNMmU9+bd+jIvdGeL+WdeKtpFOCa/RHYQpLiISLmpiB+Wg5hHztwuvD5glwf/RqSKTE3A2ShrVBA33xt6N54rbuDeydoz/GunNmAqrg8YC2IOSRkL4Gn75OCqvIxBukEp1nxdSLhlWJ8paHyvkWV1lBZ5s/YZ6L+79yyvzyld4QhuBSTHnjhct38slLE3xAcc3TghHCz648VzFRqmgQ75DDqPkXTiraWAcddHwz0+I4MC6cd/udRC0PVyqkVLZ//T3fY4uIRbCtFcR4pSUBqpHPmJDlifjrf+7hRpx7xEQl9rU6CDJL2PaGx5q0HU+lIlyC5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3ay5WWStjCoD93qn410y8ul4HgSEWlzkbYE0TJEJxE=;
 b=eF0TZ59oI2v6NSlfpRG/p0XylCVbsHPHv6gQzQ0Ur4lNKtE4PtTMrw1e/6RBfD28kLrpkyI4sFGbcXHIqJ6agsv28Z7mLrWbzhfOPGDWzDtrdt0L8QOpiR3i0KJuvNhiHn7jNPB53gg3yB/qlywuRNwcMuWdFvGLSEQgcSWjsRaSP9ySlcs6rCY2vPNTwxIGfSFvjVh9NTAPAP1aIFB9+Cwe7JZo/B6SBQ/MIVpnPQ7tsvyHvU2LBey5rL36ur+ClMM1QvvRy+brUq3/J9MUYXyQcC33DOeNmQUm4ySuYDl8jau4FjZ/YzHDHe+gLvgh+N49wnr0NhoUvFHDSON7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3ay5WWStjCoD93qn410y8ul4HgSEWlzkbYE0TJEJxE=;
 b=kcibZ4SMXQ8XL3f1QBuGKGYs31t11rXDeyMVV6kUETEq0e6s2oo43zTZOe5S2YePkxNE+bPpdnsE6KLayFQYqusNHLgcWFohkj+PAneL/OX5LN6KlA2I3I9hdrWaY82k/nsBUI0iGLWrXGwElo8WBepqzpGUDKZf2a20ULsZHeI=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 08:38:37 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 08:38:37 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org, aisheng.dong@nxp.com
Subject: [PATCH 1/5] clk: imx: clk-imx8qxp: Add SCU clocks support for DC0 PLL clocks
Date:   Wed, 18 Nov 2020 16:31:26 +0800
Message-Id: <1605688290-21805-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
References: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0166.apcprd03.prod.outlook.com
 (2603:1096:4:c9::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0166.apcprd03.prod.outlook.com (2603:1096:4:c9::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.17 via Frontend Transport; Wed, 18 Nov 2020 08:38:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c045b38-78bc-4cda-f51f-08d88b9d57c2
X-MS-TrafficTypeDiagnostic: VI1PR04MB6990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6990702B11A723D3139E32BD98E10@VI1PR04MB6990.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYzdzJasrFqHLrkDeYa9gddgS0Om1/T2BtPfvz/nbvPWU6cwjBH9Sle39QMx0ES8ZK1Pi6qWZzdMqwU9vc1fAommN8is6xKAcMvSlB7g/8s3CMzm1vBpAU2Duq+OravwY55u/+6oIdslHezeEDVgM3XGVNg246U9JGaH+HFYBXLSNUPXhfqJEdhI5J/C358fjxyzAsrbK3K/Y10aVyHuCK4TqLYlhJFpZBvWnMjURjOF+ZgTUBMGe2oyFMezTFf6rTQsWislKzVzXN8oEGkPtGO0JxCpWTV8wTjctOvRP7gIdItbP46e1WDJdYHTygudMwMzc1yIjtcKrdOJQTqD1VREWjY3CI8kidDi8pBIoiAMrCp23sjXZKvCRm7pYuTA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(2616005)(956004)(66556008)(8676002)(5660300002)(86362001)(6512007)(4326008)(66946007)(186003)(6506007)(6486002)(478600001)(316002)(66476007)(26005)(16526019)(83380400001)(52116002)(8936002)(36756003)(7416002)(6666004)(2906002)(69590400008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Ra+j/OhU7pfvbm0vW89rG06JeCI8T1ZS4WW+r9QqdWi43LiLMc2j4OgJTXSsLZLwdWUE6PKBFQ7hhjeTcEx7VB3TIIVaohg+n/H/YAxtRVmTbm/goANhu6Gh78QjL6NXfSBzlvoVIrVewpkjOsoqUUwV3qPJ8pMwMY4CB3z4IqprV7IFTGFdES8Md0HA2DaTwiR6ubyaVBKLn3oN4FDBzCPGAN5PbFzq+PTsLPRx9KgIgEnRxgD2SbiuBx+A0EpEkpnOGBem3M+Hei9UJvORgBNq1RfO4H26yq1459URIJnFY8bv0xTAgHYG/FDFecOr45PxZtqIMQyzTV8B9I5lDBKkWApKaaJsPNjR296J731YerZrFr3du/df778LflmY/hVoENGT2o9/hN4MDEFNomiR3cJ9cGsIoUXRy1V0SHN54ZB9FXEjNrBdPPd7o2jqOVQhCHbiAqvehr4XeKC2D+IvmSuJ27OfeDFY8X9ioV2HnAErFJi6YeAm8R0HXg+H4+PStkgwheoAEPTaV+f7ZoAlSknz6DFHwGeXKyYUdeEdwvh/PNKHnekILCGrUp4h/XuIp4rwVjyI+6kCblTt2tqmal3yRJKv6WmzuzKV4O2lb+vbCOHruH82jlY+FqhGhydPSer7fuygbngC26rmrQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c045b38-78bc-4cda-f51f-08d88b9d57c2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:38:37.5243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMKcV0BIAwXoiMWsfhqrynIZskZL4ZmM6e+ioQ76Mz00q9CYnUncDfijThwSJyeraCX+GrUQYYrSYRFnM/UO+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds SCU clocks support for i.MX8qxp DC0 subsystem PLL clocks.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 5b3d4ed..aeafa70 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -115,6 +115,8 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	clks[IMX_CONN_USB2_LPM_CLK]	= imx_clk_scu("usb3_lpm_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MISC, clk_cells);
 
 	/* Display controller SS */
+	clks[IMX_DC0_PLL0_CLK]		= imx_clk_scu("dc0_pll0_clk", IMX_SC_R_DC_0_PLL_0, IMX_SC_PM_CLK_PLL, clk_cells);
+	clks[IMX_DC0_PLL1_CLK]		= imx_clk_scu("dc0_pll1_clk", IMX_SC_R_DC_0_PLL_1, IMX_SC_PM_CLK_PLL, clk_cells);
 	clks[IMX_DC0_DISP0_CLK]		= imx_clk_scu("dc0_disp0_clk", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC0, clk_cells);
 	clks[IMX_DC0_DISP1_CLK]		= imx_clk_scu("dc0_disp1_clk", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1, clk_cells);
 
-- 
2.7.4

