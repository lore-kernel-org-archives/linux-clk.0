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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9FFC64E75
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE38124248
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BDxFOU+d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbgKRIiu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:38:50 -0500
Received: from mail-vi1eur05on2051.outbound.protection.outlook.com ([40.107.21.51]:32641
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726158AbgKRIiu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Nov 2020 03:38:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZYFbtIQs6LH5jl1Y4b6c1spB7Yxyibf7EDCoC+dadlr4Vby9Is5tBpq34yQTSHQTcZhckUxhWla6GPZ/in70IOWKhFUqyPI6mC40q4/3awozmgnsfxfgppTMFUGwxv9tlPFmcy106xFo+mL2THWEQ1nsVm+RzkrmmA3Xkmm+xRTVqJ9zrMiR3pGO6SkzzhJaIesN5K3x2sdxqq8d3khk0kOdCfVuYb6jiHb31FLAIGjhIcUHKnlzZSUQjc6wiTLYnZDcebSK3X0gnxWsHYar8HGSxQ9YAdfKy4rKDFeHQS8f/xdXwyFt8A8hZf3swdQibG81LHO96GL1FXmr5mubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMqQ+f2x6tyA/GraSPVhiKjqTiamkld428qrrlB51A8=;
 b=P9bEZcWRZy1y0GigVVeRbNzox5EVcSVhQ6P/DmYh+4hta6VGc+PpiZVkwBzsnywnp0H4WRDocXk4cxrnvFtzuJQSOXfsQAgZav4vYsyyu9AidW9+one24SRxyQkGoLuBci/fCG2uM51qVXolxmFcdiCvWdufjuv3OUjT2gASi1GEuPtYYPW2Z0ofCbygxDt/a+HTZKSvjGuUyvVT9KoG8xUyUcA3Ox7jdAaB7sk88AqQN3RIMwd/FEw7CcarypqX7MjL3bPoa5TnxiiesQYd9VTicrQO7csCHbZmzbXN4l9btLVVm7orXa4qCdDzn206NpCFoSPOleZIs1yDpLjVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMqQ+f2x6tyA/GraSPVhiKjqTiamkld428qrrlB51A8=;
 b=BDxFOU+d6lzD0bPtGE2jYajYBoUWRHZLy7AZMI7HupFlq72E729Wv9iVt9cIBZFieh5MN0gBf0EmletnFc5vSeiZBxc9PF/TWt/InkboTDgqfUKNdQ8P8OIryBxUtXDXaIX6Q3gUnm6mmNHOo/PPgnc3uyN5cMECjNRvSNl5n+c=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2528.eurprd04.prod.outlook.com (2603:10a6:800:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 08:38:45 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 08:38:45 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org, aisheng.dong@nxp.com
Subject: [PATCH 3/5] clk: imx: clk-imx8qxp: Add some SCU clocks support for MIPI-LVDS subsystems
Date:   Wed, 18 Nov 2020 16:31:28 +0800
Message-Id: <1605688290-21805-4-git-send-email-victor.liu@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0166.apcprd03.prod.outlook.com (2603:1096:4:c9::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.17 via Frontend Transport; Wed, 18 Nov 2020 08:38:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b210c8a8-546a-42fa-6840-08d88b9d5c7e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2528:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25280C2838C9CCB4391364B098E10@VI1PR0401MB2528.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aEFByCEJIzDmutaQWKtkxtCkXmA6jZBacZGWBr4aG1NZGomQWJrt7T/BR1KsUZ3us3vDSl1CbTuDqd+2nvlB+JnfWRAnpkQZh19Y71wbmP/iawln/uPBZGFw66fR6R53InOw1DSTYAfupFL6Ai4+cgnCqyC3+NAhQygwIKhandRk9uAclsHhm7Vs0ERBlQJiAxz5O3y3Y4iRFw2gQCmTxv5Gn5yF07PsSnUlO474Qi31b37KxxWeV4z+w3Wrq5CJgpm9D6FlBWW73FlJEAP/P8XcRY61C5+EBZFQ2vdWCAR++KcICsJ2RCo5fNeKlA1VBezS+nf3S4UkImxAcpnu27Vqb/ejRBntqw2WOul+3hnb4YqqnkPQLEEBSpssrBVm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(2616005)(8936002)(2906002)(6506007)(83380400001)(36756003)(86362001)(6666004)(478600001)(26005)(8676002)(6512007)(186003)(7416002)(956004)(316002)(16526019)(66556008)(6486002)(69590400008)(66946007)(66476007)(4326008)(5660300002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3yJLGRK+G8R+QlWGT5jSWxBu9PLLoIKvX5xVhnHYPXHT82xvGoY+Zw1dG6qh4LI97nK/59/kcDNVbkI5W2uuyJaM4sHp0TqdrZoIjEB+q+ahD5thEls4qfKf2kYCPL/flWz2pS17VfygUFzdmPR+4ybDLeH6ENZsTdVV+FeB1Atx93ugZl7DM9D8RcsaDMnaS980BOZqoQ3pk4jaKI01fLnS04BARzK1G1MtadgunABxbOqn/VJuN+dLEtCvkmLbryXoALlhCL2qgKOZVGtubQJR1jHKA7bFgeYPcyNw2Ld0fWQq11P7RKmhKGq5I7XDH3YeGzPTLIbv2bYoye/o5YQa7pWT3/s5OYddGcWluYDhWH1nK7Y1U1E1s8T0/QnYNx0B1+BMBK/XOMPcSrueBDvnc3JbggrEG+pk2QPExu14jWoIqKfDu9FKdHjbYiE7WWg7RYixbeFu920ixoBtCUTZB6ClMvABgFEYPy2MDaZdmCgR8b9Y9ZVbXmoufzYvXp7M76FJg7qi2T4j6t2g+Dwzo2yvVbTiIrjAC4+tdo0+fAIXDELh2Z/v28p4SHDiYbhG8WBfARdqpQsc2p4tcNC2MxkuO7crFSawyw4R5f9/ptj9fDIWBZqCHoaaDS4TJNxnHTqfVZDEI47u4WVzYg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b210c8a8-546a-42fa-6840-08d88b9d5c7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:38:45.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++50wK5O6JNCzNHmPsv2q/vyWz8GI16oHK4LBKUOZR/Hr2D1ThzvJUmCKHdDLul77it0hTt81RaCI4QIGSiQfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2528
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds some SCU clocks support for i.MX8qxp MIPI-LVDS subsystems.

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
 drivers/clk/imx/clk-imx8qxp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index aeafa70..57aa270 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -121,8 +121,18 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	clks[IMX_DC0_DISP1_CLK]		= imx_clk_scu("dc0_disp1_clk", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1, clk_cells);
 
 	/* MIPI-LVDS SS */
+	clks[IMX_MIPI0_LVDS_PIXEL_CLK]	= imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2, clk_cells);
+	clks[IMX_MIPI0_LVDS_BYPASS_CLK]	= imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS, clk_cells);
+	clks[IMX_MIPI0_LVDS_PHY_CLK]	= imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3, clk_cells);
 	clks[IMX_MIPI0_I2C0_CLK]	= imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2, clk_cells);
 	clks[IMX_MIPI0_I2C1_CLK]	= imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2, clk_cells);
+	clks[IMX_MIPI0_PWM0_CLK]	= imx_clk_scu("mipi0_pwm0_clk", IMX_SC_R_MIPI_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_MIPI1_LVDS_PIXEL_CLK]	= imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2, clk_cells);
+	clks[IMX_MIPI1_LVDS_BYPASS_CLK]	= imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS, clk_cells);
+	clks[IMX_MIPI1_LVDS_PHY_CLK]	= imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3, clk_cells);
+	clks[IMX_MIPI1_I2C0_CLK]	= imx_clk_scu("mipi1_i2c0_clk", IMX_SC_R_MIPI_1_I2C_0, IMX_SC_PM_CLK_MISC2, clk_cells);
+	clks[IMX_MIPI1_I2C1_CLK]	= imx_clk_scu("mipi1_i2c1_clk", IMX_SC_R_MIPI_1_I2C_1, IMX_SC_PM_CLK_MISC2, clk_cells);
+	clks[IMX_MIPI1_PWM0_CLK]	= imx_clk_scu("mipi1_pwm0_clk", IMX_SC_R_MIPI_1_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
 
 	/* MIPI CSI SS */
 	clks[IMX_CSI0_CORE_CLK]		= imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER, clk_cells);
-- 
2.7.4

