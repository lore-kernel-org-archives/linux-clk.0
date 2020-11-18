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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65018C64E7B
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08B6D24248
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ei2HAWQA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgKRIjB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:39:01 -0500
Received: from mail-vi1eur05on2087.outbound.protection.outlook.com ([40.107.21.87]:32096
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726158AbgKRIjB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Nov 2020 03:39:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxsD8DqLxmhxlbUdhwYyCELnIXKpjoRjvib2fFLznG+tp6sH9bmgZd1dPUa4GAL9DcAkLLz1h4DZH/ENu3lKZNeXT8cNmuzTDqTXQ8GDzqahOUZu2ovnS02nf08xqBH9gvckPdwRIpcDPacEV+axazjkeOd9xCuNBnCp61mDegnwdSF//ID3z5GMAz+oh491ZIP8yPA5OcacT3WQLm8xQk7vu7SP2ranZ6BvTztqpA4Dxetwi2ZEy0bVwmJZOrJRiaO6qlZ603fZRtyZZLWPeyxugl3rkpzOXCz2tUqBqSDvVL0wHbSTRYSIbsbwUQDF7atw3mvd7KnHTWWKE18F/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqqR1CHhpAFosJXD/nXFcvXDt7FZk7vp8yz6YCYGZkI=;
 b=iW2aAMOwoSYe6l/GsOOr8fHst7vox7Ta0udg1lf2Sg4/wo5RxSyqVjbN5c5l/VYfCyKKjFetRDXroLU/88OcaUlRicUanL6wfDLYmuoxiocYRdprwQGl6EtUYDoN5ShXjq1SkQzP8F/CsSCo34FDU1MC1iZF6b5j8Z/2oJgiiVsGVNgdnGnkDDP+28dKWcuy+NhjprrU6n0XMYXgjlhrekAO/Y8oO6zV/KwbQCCIECah1mO9f4YVmcvLamM/Imepph5fiX91fIyCeHet/p+pvVJU+okmGypD4xKh9Hxg6cuDNPmvTcr44hYsYkaPfhbQxf9YymuAFP3eUV/nhpE9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqqR1CHhpAFosJXD/nXFcvXDt7FZk7vp8yz6YCYGZkI=;
 b=Ei2HAWQATJmu0Th60W7g+bdrGmMfnQCfIcHWHvva97JxDYUN1kJB6WTVa0QcqG/jge0YVySfFK9oZviFEnqcIy4Mn5hKDCYBtxgsrfl6zCpOv7Vx+G25jZ9V5nvse/AHTkgdONnMq+5dAltPbut3T/J9F7EhS6jxS02DSkNobhg=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2528.eurprd04.prod.outlook.com (2603:10a6:800:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 08:38:53 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 08:38:53 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org, aisheng.dong@nxp.com
Subject: [PATCH 5/5] clk: imx: clk-imx8qxp-lpcg: Add some LPCG clocks support for MIPI-LVDS subsystems
Date:   Wed, 18 Nov 2020 16:31:30 +0800
Message-Id: <1605688290-21805-6-git-send-email-victor.liu@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0166.apcprd03.prod.outlook.com (2603:1096:4:c9::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.17 via Frontend Transport; Wed, 18 Nov 2020 08:38:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5305ae28-45c5-4cc6-d5b8-08d88b9d614d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2528:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25280856840C09009C5C8A0398E10@VI1PR0401MB2528.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93UbOaD5Npla+Tc3tIAK8wvSY8M8tgEjyyCcU5trmncF9SbXUOTq+MDBiSqkNxOHLeT4zmj7vpqeOVjMvTWYQxmqVh2lY2oabhMWtAvD3u4NE5jOZK56d1h9oxJQDQJaL2/cysdHQxUi0XtR9XrIR26GMrtCitsNFQ+Wv6WcOCCN388eBMX9CqbaCuf1D5XU78RA7laO9QDJPYDLzfo4hQyiSJ/P9WGFqWsIkOzAooFbTUAGE24e/dSuyHwW1H5N3VDnAFXj6EBxQZMsQgiL6b/aqnPyE0+XOCjc7GIJBdcUTFSkoTr0DXAI6bj9+XxWXXIkK3oPhf5END0QBXDY/pHjnEJBlSSOAT0CaJKlHvrORADntSDoLFyyarkZtOni
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(2616005)(8936002)(2906002)(6506007)(83380400001)(36756003)(86362001)(6666004)(478600001)(26005)(8676002)(6512007)(186003)(7416002)(956004)(316002)(16526019)(66556008)(6486002)(69590400008)(66946007)(66476007)(4326008)(5660300002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: vzg3dRyhNiq6I4Jtrs3qwmZemnQYHbe7ccwdrm+BtGkJA/mbxHHTJUAkJVNGHavpLSgW9qQe1vOMA5k9QJr86mcUVGGxyQJiOYUdJLtAOni4pCS0SQ6FG/fDvuzNCFHFSyAusVZ1PSkzpaGAg6mpkQ4AeRuXSO2z2WNQFR/8+9wbm+z3MPrEeWoU4otNQCCdsMCIEVlnqkcxPHJXKreAIyF+Uw4/IEnIGD99gZ4OF1cEJ7jXjsli0ReMiKH1lWShRdFY/C3H70Vw/edMg3PN7QH/8l9+Yro3BSRDJFrO5gdSDGE32t6OXgBGHyQGMNpp4tIBYHctpn0fHzNVpaYdLEXJpvJxWlk5LeseSw08YpuDwSilNNtncjzbsSov9BHlPdCTiNEmNhdjMYygBDvHHUPXIDZd6EXEQhlRlGco1YYabTSn8WeIiHTVCB+hB7SNSZsTOjG/6Z/soyVSIMsEq98E2+AU2gCKovbSro8Oe/JdC+H4WDnOtjUsas3I8Fz5v2I24Er/hAHXZdsCJYweAFIaJltzsjxu8ffW35MUQeinABIh2yRf2cbWaN7hCOiGW4P53pesiu4qRyFc0oEUDXdlGXLsSy3QXoVV9B1XdOeMUlYZjTSTCi1aW6ZHayMjCdOhB+yos32mSlcBkjtKRw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5305ae28-45c5-4cc6-d5b8-08d88b9d614d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:38:53.4320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64kg31YRYNW7TUn2B7qOV6eOBIJyIfpLD8hugMsSaMYCwOBVrAKFwQfJC4WQWjLUduxJnHxZn4H2A64SzR1HEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2528
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds some LPCG clocks support for i.MX8qxp MIPI-LVDS subsystems.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c     | 38 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8qxp-lpcg.h     |  9 ++++++++
 include/dt-bindings/clock/imx8-clock.h | 26 +++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 176d426..94c3468 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -199,6 +199,42 @@ static const struct imx8qxp_ss_lpcg imx8qxp_ss_lsio = {
 	.num_max = IMX_LSIO_LPCG_CLK_END,
 };
 
+static const struct imx8qxp_lpcg_data imx8qxp_lpcg_mipi_lvds_0[] = {
+	{ IMX_MIPI_LVDS_0_LPCG_LIS_IPG_CLK, "mipi_lvds_0_lpcg_lis_ipg_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_LIS_LPCG, 16, 0, },
+	{ IMX_MIPI_LVDS_0_LPCG_DI_REGS_IPG_CLK, "mipi_lvds_0_lpcg_di_regs_ipg_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_DI_REGS_LPCG, 16, 0, },
+	{ IMX_MIPI_LVDS_0_LPCG_GPIO_IPG_CLK, "mipi_lvds_0_lpcg_gpio_ipg_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_GPIO_LPCG, 16, 0, },
+	{ IMX_MIPI_LVDS_0_LPCG_PWM_IPG_MASTER_CLK, "mipi_lvds_0_lpcg_pwm_ipg_master_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_PWM_LPCG, 20, 0, },
+	{ IMX_MIPI_LVDS_0_LPCG_PWM_IPG_CLK, "mipi_lvds_0_lpcg_pwm_ipg_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_PWM_LPCG, 16, 0, },
+	{ IMX_MIPI_LVDS_0_LPCG_PWM_PER_CLK, "mipi_lvds_0_lpcg_pwm_per_clk", "mipi0_pwm0_clk", 0, MIPI_LVDS_PWM_LPCG, 0, 0, },
+	{ IMX_MIPI_LVDS_0_LPCG_PWM_32K_CLK, "mipi_lvds_0_lpcg_pwm_32k_clk", "xtal_32KHz", 0, MIPI_LVDS_PWM_LPCG, 4, 0, },
+	{ IMX_MIPI_LVDS_0_LPCG_I2C0_PER_CLK, "mipi_lvds_0_lpcg_i2c0_per_clk", "mipi0_i2c0_clk", 0, MIPI_LVDS_LPI2C0_LPCG, 0, 0, },
+	{ IMX_MIPI_LVDS_0_LPCG_I2C0_IPG_CLK, "mipi_lvds_0_lpcg_i2c0_ipg_clk", "mipi_ipg_root_clk", 0, MIPI_LVDS_LPI2C0_LPCG, 16, 0, },
+};
+
+static const struct imx8qxp_ss_lpcg imx8qxp_ss_mipi_lvds_0 = {
+	.lpcg = imx8qxp_lpcg_mipi_lvds_0,
+	.num_lpcg = ARRAY_SIZE(imx8qxp_lpcg_mipi_lvds_0),
+	.num_max = IMX_MIPI_LVDS_0_LPCG_CLK_END,
+};
+
+static const struct imx8qxp_lpcg_data imx8qxp_lpcg_mipi_lvds_1[] = {
+	{ IMX_MIPI_LVDS_1_LPCG_LIS_IPG_CLK, "mipi_lvds_1_lpcg_lis_ipg_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_LIS_LPCG, 16, 0, },
+	{ IMX_MIPI_LVDS_1_LPCG_DI_REGS_IPG_CLK, "mipi_lvds_1_lpcg_di_regs_ipg_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_DI_REGS_LPCG, 16, 0, },
+	{ IMX_MIPI_LVDS_1_LPCG_GPIO_IPG_CLK, "mipi_lvds_1_lpcg_gpio_ipg_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_GPIO_LPCG, 16, 0, },
+	{ IMX_MIPI_LVDS_1_LPCG_PWM_IPG_MASTER_CLK, "mipi_lvds_1_lpcg_pwm_ipg_master_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_PWM_LPCG, 20, 0, },
+	{ IMX_MIPI_LVDS_1_LPCG_PWM_IPG_CLK, "mipi_lvds_1_lpcg_pwm_ipg_clk", "mipi_ipg_clk_root", 0, MIPI_LVDS_PWM_LPCG, 16, 0, },
+	{ IMX_MIPI_LVDS_1_LPCG_PWM_PER_CLK, "mipi_lvds_1_lpcg_pwm_per_clk", "mipi1_pwm0_clk", 0, MIPI_LVDS_PWM_LPCG, 0, 0, },
+	{ IMX_MIPI_LVDS_1_LPCG_PWM_32K_CLK, "mipi_lvds_1_lpcg_pwm_32k_clk", "xtal_32KHz", 0, MIPI_LVDS_PWM_LPCG, 4, 0, },
+	{ IMX_MIPI_LVDS_1_LPCG_I2C0_PER_CLK, "mipi_lvds_1_lpcg_i2c0_per_clk", "mipi1_i2c0_clk", 0, MIPI_LVDS_LPI2C0_LPCG, 0, 0, },
+	{ IMX_MIPI_LVDS_1_LPCG_I2C0_IPG_CLK, "mipi_lvds_1_lpcg_i2c0_ipg_clk", "mipi_ipg_root_clk", 0, MIPI_LVDS_LPI2C0_LPCG, 16, 0, },
+};
+
+static const struct imx8qxp_ss_lpcg imx8qxp_ss_mipi_lvds_1 = {
+	.lpcg = imx8qxp_lpcg_mipi_lvds_1,
+	.num_lpcg = ARRAY_SIZE(imx8qxp_lpcg_mipi_lvds_1),
+	.num_max = IMX_MIPI_LVDS_1_LPCG_CLK_END,
+};
+
 #define IMX_LPCG_MAX_CLKS	8
 
 static struct clk_hw *imx_lpcg_of_clk_src_get(struct of_phandle_args *clkspec,
@@ -397,6 +433,8 @@ static const struct of_device_id imx8qxp_lpcg_match[] = {
 	{ .compatible = "fsl,imx8qxp-lpcg-conn", &imx8qxp_ss_conn, },
 	{ .compatible = "fsl,imx8qxp-lpcg-dc", &imx8qxp_ss_dc, },
 	{ .compatible = "fsl,imx8qxp-lpcg-lsio", &imx8qxp_ss_lsio, },
+	{ .compatible = "fsl,imx8qxp-lpcg-mipi-lvds-0", &imx8qxp_ss_mipi_lvds_0, },
+	{ .compatible = "fsl,imx8qxp-lpcg-mipi-lvds-1", &imx8qxp_ss_mipi_lvds_1, },
 	{ .compatible = "fsl,imx8qxp-lpcg", NULL },
 	{ /* sentinel */ }
 };
diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.h b/drivers/clk/imx/clk-imx8qxp-lpcg.h
index e1423a9..1505f9b 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.h
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.h
@@ -119,4 +119,13 @@
 #define DC_PRG7_LPCG			0x44
 #define DC_PRG8_LPCG			0x48
 
+/* MIPI-LVDS SS */
+#define MIPI_LVDS_LIS_LPCG		0x00
+#define MIPI_LVDS_DI_REGS_LPCG		0x04
+#define MIPI_LVDS_GPIO_LPCG		0x08
+#define MIPI_LVDS_PWM_LPCG		0x0c
+#define MIPI_LVDS_LPI2C0_LPCG		0x10
+#define MIPI_LVDS_LPI2C1_LPCG		0x14
+#define MIPI_LVDS_MIPI_DSI_LPCG		0x18
+
 #endif /* _IMX8QXP_LPCG_H */
diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
index c9dd0c6..6922ea9 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -325,4 +325,30 @@
 
 #define IMX_DC0_LPCG_CLK_END				31
 
+/* MIPI-LVDS0 SS LPCG */
+#define IMX_MIPI_LVDS_0_LPCG_LIS_IPG_CLK		0
+#define IMX_MIPI_LVDS_0_LPCG_DI_REGS_IPG_CLK		1
+#define IMX_MIPI_LVDS_0_LPCG_GPIO_IPG_CLK		2
+#define IMX_MIPI_LVDS_0_LPCG_PWM_IPG_MASTER_CLK		3
+#define IMX_MIPI_LVDS_0_LPCG_PWM_IPG_CLK		4
+#define IMX_MIPI_LVDS_0_LPCG_PWM_PER_CLK		5
+#define IMX_MIPI_LVDS_0_LPCG_PWM_32K_CLK		6
+#define IMX_MIPI_LVDS_0_LPCG_I2C0_PER_CLK		7
+#define IMX_MIPI_LVDS_0_LPCG_I2C0_IPG_CLK		8
+
+#define IMX_MIPI_LVDS_0_LPCG_CLK_END			9
+
+/* MIPI-LVDS1 SS LPCG */
+#define IMX_MIPI_LVDS_1_LPCG_LIS_IPG_CLK		0
+#define IMX_MIPI_LVDS_1_LPCG_DI_REGS_IPG_CLK		1
+#define IMX_MIPI_LVDS_1_LPCG_GPIO_IPG_CLK		2
+#define IMX_MIPI_LVDS_1_LPCG_PWM_IPG_MASTER_CLK		3
+#define IMX_MIPI_LVDS_1_LPCG_PWM_IPG_CLK		4
+#define IMX_MIPI_LVDS_1_LPCG_PWM_PER_CLK		5
+#define IMX_MIPI_LVDS_1_LPCG_PWM_32K_CLK		6
+#define IMX_MIPI_LVDS_1_LPCG_I2C0_PER_CLK		7
+#define IMX_MIPI_LVDS_1_LPCG_I2C0_IPG_CLK		8
+
+#define IMX_MIPI_LVDS_1_LPCG_CLK_END			9
+
 #endif /* __DT_BINDINGS_CLOCK_IMX_H */
-- 
2.7.4

