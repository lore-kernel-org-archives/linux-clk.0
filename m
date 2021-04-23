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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BEAC433B4
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 961C66137D
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbhDWDf0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Apr 2021 23:35:26 -0400
Received: from mail-eopbgr30043.outbound.protection.outlook.com ([40.107.3.43]:54018
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237143AbhDWDf0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Apr 2021 23:35:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPJ7q4HRQPwOGfmzIQ8e06Ik8igIiWX0/dQIad7YtFZNX0gocYyybTRzs0wfgGT0Ap7C0YzRh/sLG7O2TWfQUFmynuLkBDbdxXtkJwtn55+CXus28t+B/wbZZCS5IC4aVYkOzRIBm1TPAu4OEMY1togM9AJjrRDPI1ONIoDaH7g24V20KtUtqqYH0ZlTX5sRcbPT05fJrHO3Q1ldv6EpunppqDJmJtLE3o9AKSJqMKnnQ39phUuoI3iphPKEu9L68hhl3I5VEIfDO09J55F00Xs8l0SA0xxLx9r1wnXZO5ls8DzF6PzosQnbfd/Er2VF6hQJ6L5QWGqLJjBs++W0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpJtdLdIcZJyHnf+XWH2aeuE71jYFop2iBtcb6cz3+Y=;
 b=HZ0LlQFK/fVa7PMgeFepi7KZIWKZrk2T7hoULHLirtwB06qQrrpajEDqWD0HmByRb7vjIIsO+orXRNMb+Oi76Jm6gnXcThjB7Hy2AQHhqIWNr9AIb26PQDz2v+7sbQDKjK6XA+5zrQnTnj9yu9NJB22a2PqiyqizmQu6atHlmg+pXSPZetrDEgXWIvuOr6CxYa5P/DNBqYOo2mwvwviZ7Tky+aPKlqFeLtCF89anmZVcgOmNGVT5wRMzfgdjqj3UXtD4YNHXznU3N3evcpURPGuAy1bDCrbDbcGKE23j0PdBa9sdWMH+sjR69PMHxCRe2t0FnzRJYvnlrmOHATywLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpJtdLdIcZJyHnf+XWH2aeuE71jYFop2iBtcb6cz3+Y=;
 b=X7iawXXLsGrUtQunujGQ2YQSLSiBPc7oMD2tRjXq5+sKC/1IfCr4BaaQ4egN6knAdN+Z5T0A8SE65LqGer9TN79eqG3hFaoV9gFp5awezDCciKb98jVvo7hOdcWLI7ar1Ctg8VKqxqdjgjPu6vwyrJxyCIJt76QN3Kg+PBEZYdA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5079.eurprd04.prod.outlook.com (2603:10a6:20b:4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 03:34:47 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 03:34:47 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 3/6] clk: imx: scu: remove legacy scu clock binding support
Date:   Fri, 23 Apr 2021 11:33:31 +0800
Message-Id: <20210423033334.3317992-3-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423033334.3317992-1-aisheng.dong@nxp.com>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::27) To AM6PR04MB4966.eurprd04.prod.outlook.com
 (2603:10a6:20b:2::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.10 via Frontend Transport; Fri, 23 Apr 2021 03:34:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad2cda74-aa0f-4887-a8dc-08d90608be26
X-MS-TrafficTypeDiagnostic: AM6PR04MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB507955632D35AC6954C38D9980459@AM6PR04MB5079.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwXX9E0ixtF66e9F861JVdXwI0d1GltNHQ933eaIWXjFUvXCyqvT6B76FhtG2Mr/qJIfTm+o9edgArq3q5PJJCburbW/XHXTnnXZtRVV9qe7LOshs9gvbZCnnsrWsWi2dknkKWt03wOwVHpzXNSj4bTgqNvoFfIbZcgEFEGB7Ty1aOHOajHyqY0nro+58sXIJBhoKMmZdoBW12pGoqtnW1sOGOluLnMgn7JRX1gIsw/2CTbbF6eKeqhp/1Mtw0hPP1VE2EHz5VdTmtRRB4zAwmNyn2yNoDnMXhiDStEkzAPYcl1CFaCrZIKNXKuj759Wa2nh8vNW/A7kLIGsIbkyvcdXID9OJ207oXGoqQNNKS5RASxitK3/gYXcu5EJYRphYcmaHjeK247wKRSVQJy5K6+XWReumlJkDA14DEp5p/6X74CwEajvOhLlga2QtzyBTbbJzURUdDhoTFn1VnSQJErtFr/B2a9sgYPqtnvb5KkIsJOv2D1H8ZLTOjFtYDEsPZ7kTgHMO61Ri1gCH55uHmW7p+S8wIwDWtnt7v5VccPdY2lfskjvhXxVXn7f9R1s6KGarTgKTPHXyuNvZICKIU7GZhc+TzznjEQx8egMhAu7D+LrjuF1nGS+MqdyJN4bF7s97xXg4UwOa7aaNRjEDnDrfY+5RhKVstoCXl1GfCULHUyVz9Cx2IJ2o4HnLVs1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(16526019)(2906002)(8936002)(6512007)(316002)(38350700002)(8676002)(52116002)(38100700002)(4326008)(66556008)(26005)(86362001)(66946007)(478600001)(36756003)(1076003)(2616005)(956004)(6666004)(5660300002)(6486002)(6506007)(186003)(30864003)(66476007)(83380400001)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?f8C1/8z2keHq075nnIAAFxASSruQVs0F5V6/E8u9WLJqiJukRN6DtytUatV6?=
 =?us-ascii?Q?e74eCtFz/uqhVSO0p94l1YYtfvE00MUF1zfYRW83rcVqpBLBkZfFUDCtPn+h?=
 =?us-ascii?Q?ngqdj0WiffGnYPihmCxHQnyr1xX+DPD0znLoLJcdTy26Jh3w8iVX6/Y2jFt8?=
 =?us-ascii?Q?b3P+aJzpM2EmuizZ50fmjObh3HN1HIqdozAFoUaXHHQQeN2a0di0PHfs0VfN?=
 =?us-ascii?Q?o2dXMlkPSBSfSQJs6C7tyFbeWT6Q2kItwzmSCKvVeTVzvgI1N1cnbOtbLLIr?=
 =?us-ascii?Q?zBAm2C0V1+t4dnwzPpD34azSUjtRaFFC3PfatPqEcD+S3wHhtSt5rbSi/qUY?=
 =?us-ascii?Q?nYvZ4avQq5fFlkd+2s0KpvfpHlZid3On3PzLTojc3Xm0JWLRrGZceuByP2SN?=
 =?us-ascii?Q?+vZuSfoGDFHwiWNjDgMj2T6sSXBiK0ldVM3f1/IY9guuTYbWb3ewSdQjiWM8?=
 =?us-ascii?Q?P1zCUBD46yyMZQ89xRtSd9BHI65AXAmuRGqHgBZ+27v9umM5G4roRgSxBYmA?=
 =?us-ascii?Q?YHWWVZdwRI7bBP5stnZS7b2RLy6wxor6yMZXwlvoEPdMWdpkcH8hAese0yHQ?=
 =?us-ascii?Q?VbeXEv6V7rJgsL+SEI1Plw/0lcGB7L/Ks4nz4zrBLQx+axR7KkeEoR+O8e7Y?=
 =?us-ascii?Q?IYh6ZnWR3m8qJwCy4W8DTUvKAGuBkCK+upg/b6fZ9S+tph4ki5XQFEGOjMRk?=
 =?us-ascii?Q?U2daCbYv+hb8c66XRNIwJGwpq8oiVNfi2OepC+kTv0NrC5KuI9sYGtOD5u84?=
 =?us-ascii?Q?Eg7GQ8fC4SotfewMG0u6yaz14xsyaWXxNSWy4AvdOQIcy17VgQr9We/dEa6G?=
 =?us-ascii?Q?ONOaynWhzRRBKMGkSV7yWO597McKB/Cm7BKdYJPUh9MHmhOqcTmdo7kHxm3U?=
 =?us-ascii?Q?7GsfJBIbYfckJNMlCneeWpfFRqH1yVBgNidVNHU7TEiaTWcZZmlu0OjipuEM?=
 =?us-ascii?Q?kIKtpy/65pFzu7hylk2ygK0rjugNJK8bnIIQtzxxAMIrt9bcG750cSVw6vzY?=
 =?us-ascii?Q?qBLfDXYDjHE6n+ytuo+hILGSBRaL+ePw84kIi3xQ7CR10myWmh0iNmNVcJS2?=
 =?us-ascii?Q?GlaCAoz3yQ8OGXFtQy6g7pURXHV6oxwDNJ8Kpk6CzP+4QNuAz3hmIbivhF+P?=
 =?us-ascii?Q?Uf1++tleKbC8KLsd29DhXF4FpTnaOfTKO3+hL88JW0wxULPKWuV9kQGlXNKP?=
 =?us-ascii?Q?4qh9h6Is3M15uZ3Q9fTZwNsdW5Ni5NB/dW4kCuTQiJyAEjAts+WJ1AwWfCnu?=
 =?us-ascii?Q?aJZ+cOWgVbh0hRiYvH/iRpSudeW8Xl3QlCGYFtKwM6sQILgfiYagCxwFj6vJ?=
 =?us-ascii?Q?vDshZ0OYeb0CKqrEWpWvcRBC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2cda74-aa0f-4887-a8dc-08d90608be26
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:34:47.2563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4uLrhORuS+FcB80pnghaIZZZavifpa6TO21Hi9+Eo10wwN8hswwmqJmSgKa4huUWDo4FiLd1xJrYLbzKjeb8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5079
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Legacy scu clock binding are not maintained anymore, it has a very
limited clocks supported during initial upstreaming and obviously
unusable by products. So it's meaningless to keep it in
kernel which worse the code readability.
Remove it to keep code much cleaner.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp.c          | 201 ++++++++++---------------
 drivers/clk/imx/clk-scu.h              |  15 +-
 include/dt-bindings/clock/imx8-clock.h | 128 ----------------
 3 files changed, 81 insertions(+), 263 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index fbf1170c09ed..d17b418ac577 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -14,7 +14,6 @@
 
 #include "clk-scu.h"
 
-#include <dt-bindings/clock/imx8-clock.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
 
 static const char *dc0_sels[] = {
@@ -28,149 +27,103 @@ static const char *dc0_sels[] = {
 static int imx8qxp_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *ccm_node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data;
-	struct clk_hw **clks;
-	u32 clk_cells;
-	int ret, i;
+	int ret;
 
 	ret = imx_clk_scu_init(ccm_node);
 	if (ret)
 		return ret;
 
-	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hws,
-				IMX_SCU_CLK_END), GFP_KERNEL);
-	if (!clk_data)
-		return -ENOMEM;
-
-	if (of_property_read_u32(ccm_node, "#clock-cells", &clk_cells))
-		return -EINVAL;
-
-	clk_data->num = IMX_SCU_CLK_END;
-	clks = clk_data->hws;
-
-	/* Fixed clocks */
-	clks[IMX_CLK_DUMMY]		= clk_hw_register_fixed_rate(NULL, "dummy", NULL, 0, 0);
-	clks[IMX_ADMA_IPG_CLK_ROOT] 	= clk_hw_register_fixed_rate(NULL, "dma_ipg_clk_root", NULL, 0, 120000000);
-	clks[IMX_CONN_AXI_CLK_ROOT]	= clk_hw_register_fixed_rate(NULL, "conn_axi_clk_root", NULL, 0, 333333333);
-	clks[IMX_CONN_AHB_CLK_ROOT]	= clk_hw_register_fixed_rate(NULL, "conn_ahb_clk_root", NULL, 0, 166666666);
-	clks[IMX_CONN_IPG_CLK_ROOT]	= clk_hw_register_fixed_rate(NULL, "conn_ipg_clk_root", NULL, 0, 83333333);
-	clks[IMX_DC_AXI_EXT_CLK]	= clk_hw_register_fixed_rate(NULL, "dc_axi_ext_clk_root", NULL, 0, 800000000);
-	clks[IMX_DC_AXI_INT_CLK]	= clk_hw_register_fixed_rate(NULL, "dc_axi_int_clk_root", NULL, 0, 400000000);
-	clks[IMX_DC_CFG_CLK]		= clk_hw_register_fixed_rate(NULL, "dc_cfg_clk_root", NULL, 0, 100000000);
-	clks[IMX_MIPI_IPG_CLK]		= clk_hw_register_fixed_rate(NULL, "mipi_ipg_clk_root", NULL, 0, 120000000);
-	clks[IMX_IMG_AXI_CLK]		= clk_hw_register_fixed_rate(NULL, "img_axi_clk_root", NULL, 0, 400000000);
-	clks[IMX_IMG_IPG_CLK]		= clk_hw_register_fixed_rate(NULL, "img_ipg_clk_root", NULL, 0, 200000000);
-	clks[IMX_IMG_PXL_CLK]		= clk_hw_register_fixed_rate(NULL, "img_pxl_clk_root", NULL, 0, 600000000);
-	clks[IMX_HSIO_AXI_CLK]		= clk_hw_register_fixed_rate(NULL, "hsio_axi_clk_root", NULL, 0, 400000000);
-	clks[IMX_HSIO_PER_CLK]		= clk_hw_register_fixed_rate(NULL, "hsio_per_clk_root", NULL, 0, 133333333);
-	clks[IMX_LSIO_MEM_CLK]		= clk_hw_register_fixed_rate(NULL, "lsio_mem_clk_root", NULL, 0, 200000000);
-	clks[IMX_LSIO_BUS_CLK]		= clk_hw_register_fixed_rate(NULL, "lsio_bus_clk_root", NULL, 0, 100000000);
-
 	/* ARM core */
-	clks[IMX_A35_CLK]		= imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU, clk_cells);
+	imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
 
 	/* LSIO SS */
-	clks[IMX_LSIO_PWM0_CLK]		= imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_PWM1_CLK]		= imx_clk_scu("pwm1_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_PWM2_CLK]		= imx_clk_scu("pwm2_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_PWM3_CLK]		= imx_clk_scu("pwm3_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_PWM4_CLK]		= imx_clk_scu("pwm4_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_PWM5_CLK]		= imx_clk_scu("pwm5_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_PWM6_CLK]		= imx_clk_scu("pwm6_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_PWM7_CLK]		= imx_clk_scu("pwm7_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_GPT0_CLK]		= imx_clk_scu("gpt0_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_GPT1_CLK]		= imx_clk_scu("gpt1_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_GPT2_CLK]		= imx_clk_scu("gpt2_clk", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_GPT3_CLK]		= imx_clk_scu("gpt3_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_GPT4_CLK]		= imx_clk_scu("gpt4_clk", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_FSPI0_CLK]	= imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_LSIO_FSPI1_CLK]	= imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER, clk_cells);
+	imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pwm1_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pwm2_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pwm3_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pwm4_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pwm5_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pwm6_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pwm7_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("gpt0_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("gpt1_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("gpt2_clk", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("gpt3_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("gpt4_clk", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER);
 
 	/* ADMA SS */
-	clks[IMX_ADMA_UART0_CLK]	= imx_clk_scu("uart0_clk", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_UART1_CLK]	= imx_clk_scu("uart1_clk", IMX_SC_R_UART_1, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_UART2_CLK]	= imx_clk_scu("uart2_clk", IMX_SC_R_UART_2, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_UART3_CLK]	= imx_clk_scu("uart3_clk", IMX_SC_R_UART_3, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_SPI0_CLK]		= imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_SPI1_CLK]		= imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_SPI2_CLK]		= imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_SPI3_CLK]		= imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_CAN0_CLK]		= imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_I2C0_CLK]		= imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_I2C1_CLK]		= imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_I2C2_CLK]		= imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_I2C3_CLK]		= imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_FTM0_CLK]		= imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_FTM1_CLK]		= imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_ADC0_CLK]		= imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_PWM_CLK]		= imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_ADMA_LCD_CLK]		= imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER, clk_cells);
+	imx_clk_scu("uart0_clk", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("uart1_clk", IMX_SC_R_UART_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("uart2_clk", IMX_SC_R_UART_2, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("uart3_clk", IMX_SC_R_UART_3, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER);
 
 	/* Connectivity */
-	clks[IMX_CONN_SDHC0_CLK]	= imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CONN_SDHC1_CLK]	= imx_clk_scu("sdhc1_clk", IMX_SC_R_SDHC_1, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CONN_SDHC2_CLK]	= imx_clk_scu("sdhc2_clk", IMX_SC_R_SDHC_2, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CONN_ENET0_ROOT_CLK]	= imx_clk_scu("enet0_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CONN_ENET0_BYPASS_CLK]	= imx_clk_scu("enet0_bypass_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS, clk_cells);
-	clks[IMX_CONN_ENET0_RGMII_CLK]	= imx_clk_scu("enet0_rgmii_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0, clk_cells);
-	clks[IMX_CONN_ENET1_ROOT_CLK]	= imx_clk_scu("enet1_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CONN_ENET1_BYPASS_CLK]	= imx_clk_scu("enet1_bypass_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS, clk_cells);
-	clks[IMX_CONN_ENET1_RGMII_CLK]	= imx_clk_scu("enet1_rgmii_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0, clk_cells);
-	clks[IMX_CONN_GPMI_BCH_IO_CLK]	= imx_clk_scu("gpmi_io_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS, clk_cells);
-	clks[IMX_CONN_GPMI_BCH_CLK]	= imx_clk_scu("gpmi_bch_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CONN_USB2_ACLK]	= imx_clk_scu("usb3_aclk_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CONN_USB2_BUS_CLK]	= imx_clk_scu("usb3_bus_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MST_BUS, clk_cells);
-	clks[IMX_CONN_USB2_LPM_CLK]	= imx_clk_scu("usb3_lpm_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MISC, clk_cells);
+	imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("sdhc1_clk", IMX_SC_R_SDHC_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("sdhc2_clk", IMX_SC_R_SDHC_2, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("enet0_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("enet0_bypass_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("enet0_rgmii_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu("enet1_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("enet1_bypass_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("enet1_rgmii_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu("gpmi_io_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS);
+	imx_clk_scu("gpmi_bch_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("usb3_aclk_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("usb3_bus_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MST_BUS);
+	imx_clk_scu("usb3_lpm_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MISC);
 
 	/* Display controller SS */
-	clks[IMX_DC0_DISP0_CLK]		= imx_clk_scu2("dc0_disp0_clk", dc0_sels, ARRAY_SIZE(dc0_sels), IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC0, clk_cells);
-	clks[IMX_DC0_DISP1_CLK]		= imx_clk_scu2("dc0_disp1_clk", dc0_sels, ARRAY_SIZE(dc0_sels), IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1, clk_cells);
-	clks[IMX_DC0_PLL0_CLK]		= imx_clk_scu("dc0_pll0_clk", IMX_SC_R_DC_0_PLL_0, IMX_SC_PM_CLK_PLL, clk_cells);
-	clks[IMX_DC0_PLL1_CLK]		= imx_clk_scu("dc0_pll1_clk", IMX_SC_R_DC_0_PLL_1, IMX_SC_PM_CLK_PLL, clk_cells);
-	clks[IMX_DC0_BYPASS0_CLK]	= imx_clk_scu("dc0_bypass0_clk", IMX_SC_R_DC_0_VIDEO0, IMX_SC_PM_CLK_BYPASS, clk_cells);
-	clks[IMX_DC0_BYPASS1_CLK]	= imx_clk_scu("dc0_bypass1_clk", IMX_SC_R_DC_0_VIDEO1, IMX_SC_PM_CLK_BYPASS, clk_cells);
+	imx_clk_scu2("dc0_disp0_clk", dc0_sels, ARRAY_SIZE(dc0_sels), IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu2("dc0_disp1_clk", dc0_sels, ARRAY_SIZE(dc0_sels), IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1);
+	imx_clk_scu("dc0_pll0_clk", IMX_SC_R_DC_0_PLL_0, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu("dc0_pll1_clk", IMX_SC_R_DC_0_PLL_1, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu("dc0_bypass0_clk", IMX_SC_R_DC_0_VIDEO0, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("dc0_bypass1_clk", IMX_SC_R_DC_0_VIDEO1, IMX_SC_PM_CLK_BYPASS);
 
 	/* MIPI-LVDS SS */
-	clks[IMX_MIPI0_LVDS_PIXEL_CLK]	= imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2, clk_cells);
-	clks[IMX_MIPI0_LVDS_BYPASS_CLK]	= imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS, clk_cells);
-	clks[IMX_MIPI0_LVDS_PHY_CLK]	= imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3, clk_cells);
-	clks[IMX_MIPI0_I2C0_CLK]	= imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2, clk_cells);
-	clks[IMX_MIPI0_I2C1_CLK]	= imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2, clk_cells);
-	clks[IMX_MIPI0_PWM0_CLK]	= imx_clk_scu("mipi0_pwm0_clk", IMX_SC_R_MIPI_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_MIPI1_LVDS_PIXEL_CLK]	= imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2, clk_cells);
-	clks[IMX_MIPI1_LVDS_BYPASS_CLK]	= imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS, clk_cells);
-	clks[IMX_MIPI1_LVDS_PHY_CLK]	= imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3, clk_cells);
-	clks[IMX_MIPI1_I2C0_CLK]	= imx_clk_scu("mipi1_i2c0_clk", IMX_SC_R_MIPI_1_I2C_0, IMX_SC_PM_CLK_MISC2, clk_cells);
-	clks[IMX_MIPI1_I2C1_CLK]	= imx_clk_scu("mipi1_i2c1_clk", IMX_SC_R_MIPI_1_I2C_1, IMX_SC_PM_CLK_MISC2, clk_cells);
-	clks[IMX_MIPI1_PWM0_CLK]	= imx_clk_scu("mipi1_pwm0_clk", IMX_SC_R_MIPI_1_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
+	imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3);
+	imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("mipi0_pwm0_clk", IMX_SC_R_MIPI_0_PWM_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3);
+	imx_clk_scu("mipi1_i2c0_clk", IMX_SC_R_MIPI_1_I2C_0, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("mipi1_i2c1_clk", IMX_SC_R_MIPI_1_I2C_1, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("mipi1_pwm0_clk", IMX_SC_R_MIPI_1_PWM_0, IMX_SC_PM_CLK_PER);
 
 	/* MIPI CSI SS */
-	clks[IMX_CSI0_CORE_CLK]		= imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CSI0_ESC_CLK]		= imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC, clk_cells);
-	clks[IMX_CSI0_I2C0_CLK]		= imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_CSI0_PWM0_CLK]		= imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
+	imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC);
+	imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER);
 
 	/* GPU SS */
-	clks[IMX_GPU0_CORE_CLK]		= imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER, clk_cells);
-	clks[IMX_GPU0_SHADER_CLK]	= imx_clk_scu("gpu_shader0_clk", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC, clk_cells);
-
-	for (i = 0; i < clk_data->num; i++) {
-		if (IS_ERR(clks[i]))
-			pr_warn("i.MX clk %u: register failed with %ld\n",
-				i, PTR_ERR(clks[i]));
-	}
-
-	if (clk_cells == 2) {
-		ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
-		if (ret)
-			imx_clk_scu_unregister();
-	} else {
-		/*
-		 * legacy binding code path doesn't unregister here because
-		 * it will be removed later.
-		 */
-		ret = of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
-	}
+	imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("gpu_shader0_clk", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC);
+
+	ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
+	if (ret)
+		imx_clk_scu_unregister();
 
 	return ret;
 }
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index e8352164923e..a6c6d3103e94 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -32,22 +32,15 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
 void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
 
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
-					 u8 clk_type, u8 clk_cells)
+					 u8 clk_type)
 {
-	if (clk_cells == 2)
-		return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
-	else
-		return __imx_clk_scu(NULL, name, NULL, 0, rsrc_id, clk_type);
+	return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
 }
 
 static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *parents,
-					  int num_parents, u32 rsrc_id, u8 clk_type,
-					  u8 clk_cells)
+					  int num_parents, u32 rsrc_id, u8 clk_type)
 {
-	if (clk_cells == 2)
-		return imx_clk_scu_alloc_dev(name, parents, num_parents, rsrc_id, clk_type);
-	else
-		return __imx_clk_scu(NULL, name, parents, num_parents, rsrc_id, clk_type);
+	return imx_clk_scu_alloc_dev(name, parents, num_parents, rsrc_id, clk_type);
 }
 
 static inline struct clk_hw *imx_clk_lpcg_scu_dev(struct device *dev, const char *name,
diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
index 82b1fc8d1ee0..2e60ce4d2622 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -7,134 +7,6 @@
 #ifndef __DT_BINDINGS_CLOCK_IMX_H
 #define __DT_BINDINGS_CLOCK_IMX_H
 
-/* SCU Clocks */
-
-#define IMX_CLK_DUMMY				0
-
-/* CPU */
-#define IMX_A35_CLK					1
-
-/* LSIO SS */
-#define IMX_LSIO_MEM_CLK				2
-#define IMX_LSIO_BUS_CLK				3
-#define IMX_LSIO_PWM0_CLK				10
-#define IMX_LSIO_PWM1_CLK				11
-#define IMX_LSIO_PWM2_CLK				12
-#define IMX_LSIO_PWM3_CLK				13
-#define IMX_LSIO_PWM4_CLK				14
-#define IMX_LSIO_PWM5_CLK				15
-#define IMX_LSIO_PWM6_CLK				16
-#define IMX_LSIO_PWM7_CLK				17
-#define IMX_LSIO_GPT0_CLK				18
-#define IMX_LSIO_GPT1_CLK				19
-#define IMX_LSIO_GPT2_CLK				20
-#define IMX_LSIO_GPT3_CLK				21
-#define IMX_LSIO_GPT4_CLK				22
-#define IMX_LSIO_FSPI0_CLK				23
-#define IMX_LSIO_FSPI1_CLK				24
-
-/* Connectivity SS */
-#define IMX_CONN_AXI_CLK_ROOT				30
-#define IMX_CONN_AHB_CLK_ROOT				31
-#define IMX_CONN_IPG_CLK_ROOT				32
-#define IMX_CONN_SDHC0_CLK				40
-#define IMX_CONN_SDHC1_CLK				41
-#define IMX_CONN_SDHC2_CLK				42
-#define IMX_CONN_ENET0_ROOT_CLK				43
-#define IMX_CONN_ENET0_BYPASS_CLK			44
-#define IMX_CONN_ENET0_RGMII_CLK			45
-#define IMX_CONN_ENET1_ROOT_CLK				46
-#define IMX_CONN_ENET1_BYPASS_CLK			47
-#define IMX_CONN_ENET1_RGMII_CLK			48
-#define IMX_CONN_GPMI_BCH_IO_CLK			49
-#define IMX_CONN_GPMI_BCH_CLK				50
-#define IMX_CONN_USB2_ACLK				51
-#define IMX_CONN_USB2_BUS_CLK				52
-#define IMX_CONN_USB2_LPM_CLK				53
-
-/* HSIO SS */
-#define IMX_HSIO_AXI_CLK				60
-#define IMX_HSIO_PER_CLK				61
-
-/* Display controller SS */
-#define IMX_DC_AXI_EXT_CLK				70
-#define IMX_DC_AXI_INT_CLK				71
-#define IMX_DC_CFG_CLK					72
-#define IMX_DC0_PLL0_CLK				80
-#define IMX_DC0_PLL1_CLK				81
-#define IMX_DC0_DISP0_CLK				82
-#define IMX_DC0_DISP1_CLK				83
-#define IMX_DC0_BYPASS0_CLK				84
-#define IMX_DC0_BYPASS1_CLK				85
-
-/* MIPI-LVDS SS */
-#define IMX_MIPI_IPG_CLK				90
-#define IMX_MIPI0_PIXEL_CLK				100
-#define IMX_MIPI0_BYPASS_CLK				101
-#define IMX_MIPI0_LVDS_PIXEL_CLK			102
-#define IMX_MIPI0_LVDS_BYPASS_CLK			103
-#define IMX_MIPI0_LVDS_PHY_CLK				104
-#define IMX_MIPI0_I2C0_CLK				105
-#define IMX_MIPI0_I2C1_CLK				106
-#define IMX_MIPI0_PWM0_CLK				107
-#define IMX_MIPI1_PIXEL_CLK				108
-#define IMX_MIPI1_BYPASS_CLK				109
-#define IMX_MIPI1_LVDS_PIXEL_CLK			110
-#define IMX_MIPI1_LVDS_BYPASS_CLK			111
-#define IMX_MIPI1_LVDS_PHY_CLK				112
-#define IMX_MIPI1_I2C0_CLK				113
-#define IMX_MIPI1_I2C1_CLK				114
-#define IMX_MIPI1_PWM0_CLK				115
-
-/* IMG SS */
-#define IMX_IMG_AXI_CLK					120
-#define IMX_IMG_IPG_CLK					121
-#define IMX_IMG_PXL_CLK					122
-
-/* MIPI-CSI SS */
-#define IMX_CSI0_CORE_CLK				130
-#define IMX_CSI0_ESC_CLK				131
-#define IMX_CSI0_PWM0_CLK				132
-#define IMX_CSI0_I2C0_CLK				133
-
-/* PARALLER CSI SS */
-#define IMX_PARALLEL_CSI_DPLL_CLK			140
-#define IMX_PARALLEL_CSI_PIXEL_CLK			141
-#define IMX_PARALLEL_CSI_MCLK_CLK			142
-
-/* VPU SS */
-#define IMX_VPU_ENC_CLK					150
-#define IMX_VPU_DEC_CLK					151
-
-/* GPU SS */
-#define IMX_GPU0_CORE_CLK				160
-#define IMX_GPU0_SHADER_CLK				161
-
-/* ADMA SS */
-#define IMX_ADMA_IPG_CLK_ROOT				165
-#define IMX_ADMA_UART0_CLK				170
-#define IMX_ADMA_UART1_CLK				171
-#define IMX_ADMA_UART2_CLK				172
-#define IMX_ADMA_UART3_CLK				173
-#define IMX_ADMA_SPI0_CLK				174
-#define IMX_ADMA_SPI1_CLK				175
-#define IMX_ADMA_SPI2_CLK				176
-#define IMX_ADMA_SPI3_CLK				177
-#define IMX_ADMA_CAN0_CLK				178
-#define IMX_ADMA_CAN1_CLK				179
-#define IMX_ADMA_CAN2_CLK				180
-#define IMX_ADMA_I2C0_CLK				181
-#define IMX_ADMA_I2C1_CLK				182
-#define IMX_ADMA_I2C2_CLK				183
-#define IMX_ADMA_I2C3_CLK				184
-#define IMX_ADMA_FTM0_CLK				185
-#define IMX_ADMA_FTM1_CLK				186
-#define IMX_ADMA_ADC0_CLK				187
-#define IMX_ADMA_PWM_CLK				188
-#define IMX_ADMA_LCD_CLK				189
-
-#define IMX_SCU_CLK_END					190
-
 /* LPCG clocks */
 
 /* LSIO SS LPCG */
-- 
2.25.1

