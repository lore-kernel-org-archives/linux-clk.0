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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ADBC433B4
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F22161422
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhDWDff (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Apr 2021 23:35:35 -0400
Received: from mail-eopbgr30064.outbound.protection.outlook.com ([40.107.3.64]:42065
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231552AbhDWDfe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Apr 2021 23:35:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eq6IHL6eq9SMmFvAlYy8G/BcInDXwDl5vR+IeLmS0w8qv/DN1/I5HUT0AJj06tZOZaRVy6SI/NE1yZb6Xi3TAxQ5vd4MhGr8TpOJFNyRBmfwxTaffAvxh04rDshXUb1Tnw6mGdPEgjLYVGxe74NkJvUMznwPXWx+3p5fZ+z33J+LpDGIFxdhvSlRKGmsTYIyftzpZKIgEw6kiNmM4WjDLDximi/gA9n49PsS8SoFXVXruVK3Wf3YpdV0TseSq0MI+Urx2jDM+ZuhBTqRJ/pw37u+eg8wMoGgE4vUAiuOgcEChocsQPZNv7scyL9Cfsi1kMpRLW4O6SUBkTjhmYAoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6xdeG7rddQFEimh1we2s9ToOlvf75Ufqg9yy/i/LCM=;
 b=JPabRxnWjT8GHVejq8cNQagNb/hIe2ka4VL3CehnU0lygizlGpcUCi8zRCpR/4/3nNfgz2sDwTBA8xMqDo+Jaudij4SIgKmKFpua3mqnCYi0irhP4TZAxZRsnwG12s/waOnKb4+DGlWE5qu/VJZ7Xx8wFUxwjT+QL+9XADtxoUoHf537blBX2LZrJ0aAt9rDmxLd2gLgRD2GEfzG6TGzEh6uPGWK5fsWPABGCCYSgacFmhN+qjgWyeAfHOGIk40xZuNPKj2ajao7/tCMG1aYLxE2DryAwHdL8ANkTh9PPwE2/ei5vUsvSagbeUoMQq/+2fza26jdn0oM1xaj2KRvcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6xdeG7rddQFEimh1we2s9ToOlvf75Ufqg9yy/i/LCM=;
 b=NO9fItFBa8Joi785Ywx0+haXjstvtsUMg0W7B6yLuxh6YqUlzEwPZW5vBpUF0S6A0XCz08ywYb7ZMNUPwiGl98EQAjbmzPXCGkcL/RBdSPqSwoe9HeiGVJlWRuWqOe40NL35julP4rEOZYRLPJ10RF/VoFFQNMbrt+kFjdxnFHo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5079.eurprd04.prod.outlook.com (2603:10a6:20b:4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 03:34:56 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 03:34:56 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 6/6] clk: imx8qm: add clock valid resource checking
Date:   Fri, 23 Apr 2021 11:33:34 +0800
Message-Id: <20210423033334.3317992-6-aisheng.dong@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.10 via Frontend Transport; Fri, 23 Apr 2021 03:34:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb9b7228-51d5-4103-4cdd-08d90608c3db
X-MS-TrafficTypeDiagnostic: AM6PR04MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB507946BBDB8D57445D079EC580459@AM6PR04MB5079.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gplYpGMtW2z6upPv8l/BilkpNPJvc/Unirgd6UZkLDAxjEDgHbhjqhlVdfqxsy45rjdZg224GW9T4lO3iyX7xiH//87Yrp3c94Xid9P9e4cg3XJtV/nI0TkNEX4ozlUd3M2kudu8O+zzetqFVKTxoLC5gK7pFmYVIS4eKnKcipMqCdDdwnSlvn1NjvhTB9zUb3liR8EfHRJW5yK1wiTvnwd4hme5sCPx87HwZB3WAFVijfxjeEAKbuDs0afH0PxF6CHAGyKS0K/io4Nl4Ij/oZuhwfyn7us3Av1acIo+vdF08q41ucFmdBLqlKYzbj2nXZ8U1V+c/OAPs5RlyOLIz92XAFrn0caRi75weqwugs+BNaV/tOwTBACJ50k6/U16/q7xwLcx6kdYpk7b3w2V1g+OQW18+qjzBLpAO6Q7WS/4aKcvYhx17EBp/U4sRXzhhCnVUVv/zp56o/F9qLlY0q3bijHejPd4iFjiCPZZfoPZ4QtGvl34COhYDLNBASDN/k5zkwZM6mT4vxD7ZH92VgIH0iSRrgwOHVIra2MwNWTBpvrPDq6BU9oMQWFplRdFnUc6Th0mgQNDUWhdvyF3JLnOWQ6p8rkiheYOu/n2UTCLW+KD7jsMwY0TMxQ+a9ujw0LVe1KE9Dw44bqCHUoQyDZtXr+j55pNMnvozhU+z9Wp6KULIDUfBBhUPaERGgNAYhzQq83yFlixhOvPIs37Mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(16526019)(2906002)(8936002)(6512007)(316002)(38350700002)(8676002)(52116002)(38100700002)(4326008)(66556008)(26005)(86362001)(66946007)(478600001)(36756003)(1076003)(2616005)(956004)(6666004)(5660300002)(6486002)(6506007)(186003)(66476007)(83380400001)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Kh+fhDBWpe4e5GaKe2FFq/wdTGDFwJtuwvWMVGQkhKybIIYdgjMzIx7OuPmM?=
 =?us-ascii?Q?c/9so/iQVsHqKArVZrLbCR0oAXAQbvk+aTDSbhybjGIjwZjhVIwtuGwcQXqx?=
 =?us-ascii?Q?u2UcheDob7Mkx1aDZQBf7OGZBi7P+Hmu8xd7mD5MVA27cSIOwsjV/C2dpecE?=
 =?us-ascii?Q?nMPnDGeiOwa1mIt3wIHXIvw0URjDmn1j2zPDfd7tfccy5gWwGCVbln53e3tm?=
 =?us-ascii?Q?GuaBo6YuduzfJcygTqhVkyJcrs1QyPrX+N3+q404FmgokGcnphBX+GDJraRP?=
 =?us-ascii?Q?KYzpMLAjbpMvAlefW8cvqtHZBcWDCOeT8hy4dgFZ3sbkNs01H948JqID6ln/?=
 =?us-ascii?Q?dyx6y4a/PSMBkWmwXdtwZBbqtnfT0f5kxsrAWI5KZxdQhw1ZQwiuyjBKxMsh?=
 =?us-ascii?Q?EjY0+6IklQMwrbrfdTVBQl6aBPJdE60TVvCz4l6wDBkJyGT4YcuqAlfw+nYW?=
 =?us-ascii?Q?KsJCzCq1p1Hj2yYdd52N4AXSEmbdIFlttw/bytvXRmOs5d4dDLL7BaUqfcs/?=
 =?us-ascii?Q?D8ASJfEFrdb3n8dH+hy5bDPa+ssYlk2JbW7uVPKeWevYniJE8VgOx9PTZfCG?=
 =?us-ascii?Q?vGydnzKm2D6EqZp6/azVZX8yZ718gJeBt4Zi+uIqyAyT2v1Z22zOj3waCG7i?=
 =?us-ascii?Q?vy0YWv89iV+sQpEkrabD3OPNci9Za9KJpADaa0EYGoOUljmvM1L76qEqU7zU?=
 =?us-ascii?Q?7b6rkeoz4skCfBDE2if/kw8hMSGa1IF6HULS5UapBdG5kLLmgK1ZZwq38I7A?=
 =?us-ascii?Q?i+BW2ax7zhTH78lMvsN0KVqcpz/QVXt9i2oKBsVLVb0DUFES0PvgnZ9/Kh3N?=
 =?us-ascii?Q?9k5sVR7wq2GzR85ldNE1/CpSgsmid8KkoYpGnadtowgVLVDP65ovbketyXUA?=
 =?us-ascii?Q?39+dy16boLMK1d86bUiojWZAhMBTwkK7VmCmRgkj66F/zLJjETJhiebG+gRu?=
 =?us-ascii?Q?tqHYBvpTK7gTDj4BjUNzfqu4XegtoKfSTOhH+wvjHCOm7Cw63Dq5FojDZ6bF?=
 =?us-ascii?Q?rMkZXYYfH6COvdAf5LIOkCTcUg67dsNM7ZzihIiFSA24/1W2dYf6sxtRZsOD?=
 =?us-ascii?Q?V/XiGi1MkDEBHhyTA+rPTlz8Qth1dZviwGTNLfkpH+GOsVGkYBsw8cL+p5Dm?=
 =?us-ascii?Q?ma5mnIeQQYO8NGache0TrKYwPsvnHPpMo/lopG0AznQWm/rW+VMb3WIKY9A9?=
 =?us-ascii?Q?93o0Vt/AFie+qMT29L3dSfE9rfMWxrhw34k9+Iif7ObrdHS8i3k60HS3imK6?=
 =?us-ascii?Q?jrNKCBvPgbpJCT3cNfHJIEYmngs+hSrE3KboQdNZeXQfgGTIr0PYcXOesPef?=
 =?us-ascii?Q?Nbc+/YyHpqvGnWshQby1z9Qx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9b7228-51d5-4103-4cdd-08d90608c3db
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:34:56.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nX6wY3QQROw36xG/7Pon/+zuClgOIFij2lBcQXBZT7MjKfHzZ8LAkyy/LKRrmiwUoeWf0+5Y3AwbawwOgjYNBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5079
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imx8qm clock valid resource checking mechanism

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/Makefile          |   2 +-
 drivers/clk/imx/clk-imx8qm-rsrc.c | 116 ++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8qxp.c     |   1 +
 drivers/clk/imx/clk-scu.h         |   1 +
 4 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-imx8qm-rsrc.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 2fdd2fff16c7..c24a2acbfa56 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -28,7 +28,7 @@ obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
 obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
 clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
-				     clk-imx8qxp-rsrc.o
+				     clk-imx8qxp-rsrc.o clk-imx8qm-rsrc.o
 clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
 
 obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
diff --git a/drivers/clk/imx/clk-imx8qm-rsrc.c b/drivers/clk/imx/clk-imx8qm-rsrc.c
new file mode 100644
index 000000000000..183a071cbf20
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8qm-rsrc.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019-2021 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#include "clk-scu.h"
+
+/* Keep sorted in the ascending order */
+static u32 imx8qm_clk_scu_rsrc_table[] = {
+	IMX_SC_R_A53,
+	IMX_SC_R_A72,
+	IMX_SC_R_DC_0_VIDEO0,
+	IMX_SC_R_DC_0_VIDEO1,
+	IMX_SC_R_DC_0,
+	IMX_SC_R_DC_0_PLL_0,
+	IMX_SC_R_DC_0_PLL_1,
+	IMX_SC_R_DC_1_VIDEO0,
+	IMX_SC_R_DC_1_VIDEO1,
+	IMX_SC_R_DC_1,
+	IMX_SC_R_DC_1_PLL_0,
+	IMX_SC_R_DC_1_PLL_1,
+	IMX_SC_R_SPI_0,
+	IMX_SC_R_SPI_1,
+	IMX_SC_R_SPI_2,
+	IMX_SC_R_SPI_3,
+	IMX_SC_R_UART_0,
+	IMX_SC_R_UART_1,
+	IMX_SC_R_UART_2,
+	IMX_SC_R_UART_3,
+	IMX_SC_R_UART_4,
+	IMX_SC_R_EMVSIM_0,
+	IMX_SC_R_EMVSIM_1,
+	IMX_SC_R_I2C_0,
+	IMX_SC_R_I2C_1,
+	IMX_SC_R_I2C_2,
+	IMX_SC_R_I2C_3,
+	IMX_SC_R_I2C_4,
+	IMX_SC_R_ADC_0,
+	IMX_SC_R_ADC_1,
+	IMX_SC_R_FTM_0,
+	IMX_SC_R_FTM_1,
+	IMX_SC_R_CAN_0,
+	IMX_SC_R_GPU_0_PID0,
+	IMX_SC_R_GPU_1_PID0,
+	IMX_SC_R_PWM_0,
+	IMX_SC_R_PWM_1,
+	IMX_SC_R_PWM_2,
+	IMX_SC_R_PWM_3,
+	IMX_SC_R_PWM_4,
+	IMX_SC_R_PWM_5,
+	IMX_SC_R_PWM_6,
+	IMX_SC_R_PWM_7,
+	IMX_SC_R_GPT_0,
+	IMX_SC_R_GPT_1,
+	IMX_SC_R_GPT_2,
+	IMX_SC_R_GPT_3,
+	IMX_SC_R_GPT_4,
+	IMX_SC_R_FSPI_0,
+	IMX_SC_R_FSPI_1,
+	IMX_SC_R_SDHC_0,
+	IMX_SC_R_SDHC_1,
+	IMX_SC_R_SDHC_2,
+	IMX_SC_R_ENET_0,
+	IMX_SC_R_ENET_1,
+	IMX_SC_R_MLB_0,
+	IMX_SC_R_USB_2,
+	IMX_SC_R_NAND,
+	IMX_SC_R_LVDS_0,
+	IMX_SC_R_LVDS_0_PWM_0,
+	IMX_SC_R_LVDS_0_I2C_0,
+	IMX_SC_R_LVDS_0_I2C_1,
+	IMX_SC_R_LVDS_1,
+	IMX_SC_R_LVDS_1_PWM_0,
+	IMX_SC_R_LVDS_1_I2C_0,
+	IMX_SC_R_LVDS_1_I2C_1,
+	IMX_SC_R_M4_0_I2C,
+	IMX_SC_R_M4_1_I2C,
+	IMX_SC_R_AUDIO_PLL_0,
+	IMX_SC_R_VPU_UART,
+	IMX_SC_R_VPUCORE,
+	IMX_SC_R_MIPI_0,
+	IMX_SC_R_MIPI_0_PWM_0,
+	IMX_SC_R_MIPI_0_I2C_0,
+	IMX_SC_R_MIPI_0_I2C_1,
+	IMX_SC_R_MIPI_1,
+	IMX_SC_R_MIPI_1_PWM_0,
+	IMX_SC_R_MIPI_1_I2C_0,
+	IMX_SC_R_MIPI_1_I2C_1,
+	IMX_SC_R_CSI_0,
+	IMX_SC_R_CSI_0_PWM_0,
+	IMX_SC_R_CSI_0_I2C_0,
+	IMX_SC_R_CSI_1,
+	IMX_SC_R_CSI_1_PWM_0,
+	IMX_SC_R_CSI_1_I2C_0,
+	IMX_SC_R_HDMI,
+	IMX_SC_R_HDMI_I2S,
+	IMX_SC_R_HDMI_I2C_0,
+	IMX_SC_R_HDMI_PLL_0,
+	IMX_SC_R_HDMI_RX,
+	IMX_SC_R_HDMI_RX_BYPASS,
+	IMX_SC_R_HDMI_RX_I2C_0,
+	IMX_SC_R_AUDIO_PLL_1,
+	IMX_SC_R_AUDIO_CLK_0,
+	IMX_SC_R_AUDIO_CLK_1,
+	IMX_SC_R_HDMI_RX_PWM_0,
+	IMX_SC_R_HDMI_PLL_1,
+	IMX_SC_R_VPU,
+};
+
+const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qm = {
+	.rsrc = imx8qm_clk_scu_rsrc_table,
+	.num = ARRAY_SIZE(imx8qm_clk_scu_rsrc_table),
+};
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 9e35ae45b3a0..88cc737ee125 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -134,6 +134,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 static const struct of_device_id imx8qxp_match[] = {
 	{ .compatible = "fsl,scu-clk", },
 	{ .compatible = "fsl,imx8qxp-clk", &imx_clk_scu_rsrc_imx8qxp, },
+	{ .compatible = "fsl,imx8qm-clk", &imx_clk_scu_rsrc_imx8qm, },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index bcacd8b1d1ab..22156e93b85d 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -22,6 +22,7 @@ struct imx_clk_scu_rsrc_table {
 extern struct list_head imx_scu_clks[];
 extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
 extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp;
+extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qm;
 
 int imx_clk_scu_init(struct device_node *np,
 		     const struct imx_clk_scu_rsrc_table *data);
-- 
2.25.1

