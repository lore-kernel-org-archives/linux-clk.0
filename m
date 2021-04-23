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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC97C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABD6C61417
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237229AbhDWDfc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Apr 2021 23:35:32 -0400
Received: from mail-eopbgr140084.outbound.protection.outlook.com ([40.107.14.84]:10126
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231552AbhDWDfc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Apr 2021 23:35:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw4EcpS0Ex92zh77ixf1EJPSgdJY8C8LY4EQLTBNd/tb99ycrp+vzfF4lDvfxf9LMC7VIS8O4jFcoIRKX8Ez3nQKM7+c1iOx+asM+4mZjLzZnLMGWje/qoAO3ScbgCVg0Hjzw6W8FjAoOGAQLH81jycL8a+bL6vqLKUXfe20SnT3/dlVFhcfi7JLizD5S9x47KXR0OVjzXuQcWJo/0pK7y1tWbBlj5ePff1zN72VIsL0ljd0YHazVgruQweT26r8RwC64ZTrkNualmIynlKGrISxwQMpAQ2Gh+4dT2aHTIEE012o3/uFg/xBOcOYaO9wkGQJPYXJyJJEGh3NicjpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iI23FNDqiWDTN5MsgRlvJf5HcKhqk3YJNQWvXankiSc=;
 b=bnkMTXpllqhuNQnf4sCbAQED1rGxf/x+N2p2k6BZPoiWqiDv6jS9BjCpBLc7ZMQaOh6SbsSwGHHpjrRX6jMs1DzRRIm8jXqrRBk7ZNQsFBisULm0aPiW5UHqL9JcLsYOkJXFPw3WODK1iIcvE9Tfje8zjW7x02KjYo6G45trFe2hc4wnn9grTEMpH1v5FYmwQC8jPANFU4Vj9S0tb8xW/8SPBLikBkz5azlMs+aLAKCEJIGYM+m5/MOR0aoYZRBgADRf/hE6JmE84eyKe+3lZIJX6XFqscIjVfC5n75YYhE3QnhHcIRBxAyJQjhGKfizofIMZCIPf2LLKxUpEB20Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iI23FNDqiWDTN5MsgRlvJf5HcKhqk3YJNQWvXankiSc=;
 b=LrKVaWojIJe81Wx8cu7Soyh2bzwQtUlCg4hAxtjorMRmlBIo/XTO/hvwwWGd6OFjmIwfIZHKHgbswDbXWZ0qCwXe4WjxD4h9/21UODvkZiwGE4Q7ZW5Ebiqkp5/9pnry1PZeq945j3jObyQ6CTJbkSicVsyXd5plRHVqu5aw9Yw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5079.eurprd04.prod.outlook.com (2603:10a6:20b:4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 03:34:53 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 03:34:53 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 5/6] clk: imx8qxp: add clock valid checking mechnism
Date:   Fri, 23 Apr 2021 11:33:33 +0800
Message-Id: <20210423033334.3317992-5-aisheng.dong@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.10 via Frontend Transport; Fri, 23 Apr 2021 03:34:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9745d10d-c7d2-48fd-1445-08d90608c1fb
X-MS-TrafficTypeDiagnostic: AM6PR04MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB50790B9AC249EC78A932E68880459@AM6PR04MB5079.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cxzqzL3WnmI4Qid1kjkGhwpG9cpVwrqjpgBhKoLj1UhC4T+RkHYF5VXS7oemRq+I3QihL01yrhq4xDKRYsXSl3MyG3SHeTYyafOTBL3K5oIaJYwVSmNAM2zlW8EqdHXxSCLqbG2vIO8zONyU+nHu1hFircHRPzKXQ0bLft/p/oHy4PaUqFRjDkuYCx+AebXWfDzxz4j/kVQOLCR/C9h8A6v+5mdlsHMUc5vBl9aVXy+MgzG7FpNWKt1Il/756muirj2aP1ePYLnRn3aCTkcKjEk7CGaty5tAWyZJYmAe5ggj/EkfzgtxXdqUckfrKhHWFHaRvE4P4TZ+ljDR7gSw1Kregp7F41yGE7CEhEsoQjOjQ8c1HL7SInLdF+AmNgPzlCYd1FO36rV1VhXBd7yH2mNGWTfoFlqAeU4TZPm+yd8IK2DWKHNOVMIPqoXCYDd4H4gZ7gE/9BU1Y7JKuJbENliTX4bAVC5djiO9MYRToQu5LKToi30iYaA9xGbrHhDmo3f7w1jVGOddPjCUnTvBfexkMYUDAgw3dEc+RszeLrw2N+b7OBlzmJHLFxW5pyit3PNLsd5M2kF7dOZvIdP5/mcLMfY6OCjgETmjohvpCDKILPUM91wcDte2diZZCfadZsql96CHs71L4xgG/iM4eh7i+3Wcly6sXk/1udQN3fZv5qRDAuuYNESoYI1LDbRKJCXZpXMRRYgrYWQdzAE3NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(16526019)(2906002)(8936002)(6512007)(316002)(38350700002)(8676002)(52116002)(38100700002)(4326008)(66556008)(26005)(86362001)(66946007)(478600001)(36756003)(1076003)(2616005)(956004)(6666004)(5660300002)(6486002)(6506007)(186003)(66476007)(83380400001)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cSJl1w+cntSWP88GM0AwfFb2F4l2UN7IqtJX0IIfVKEnieYn1huPXW0HFS+9?=
 =?us-ascii?Q?x7+pDFjrcHRq3Xci0JC93Z6gQ+0gLVLNubIdoHjn3TD1eLqhVg+qu0UqGlcD?=
 =?us-ascii?Q?Gy+iqHcc+pHSp7yuDAtwmplqe2JbaxkzYGgQYMzHg0rqlI5Qx4MCO0yUGfU0?=
 =?us-ascii?Q?UbJ2imvkUv10TuITBoU6hiRL2ogNveue38Gws7KS4IKhrC/bI17bgU5mNYzh?=
 =?us-ascii?Q?u87VB83ixBf0TlETprD19JdKM7EfLGzhFf4j0gINxAzw21CCgZMU7UqvtlBw?=
 =?us-ascii?Q?4XTBtTppn028cOiy1r+Khqc1ry/ApJ2JSSXiKyi9+EX13MTApf6WqBtrr0Ex?=
 =?us-ascii?Q?rBB/EVdGMo/hDEy0yk7H8Ylx3EIcVDKYBQqZ/xmRxfP3wZ9S1wqi7x2OVsCw?=
 =?us-ascii?Q?OhVvS0u2pP0UG4cNQoDCmcyLIy5CPuFhUpamEhTyrevxaIgr701ZCe/mqgZa?=
 =?us-ascii?Q?WqTG/BNvTXZn6rf4xAwIXYb3Sn8hVzD6JUhPxsK2Jz2fiWchQreppoWETfMW?=
 =?us-ascii?Q?TccG1mm8LIS9Ozc/gzdfV5R73sWfoCDQHhRrXBjVEuue0jS2J1JbHzuQoy+/?=
 =?us-ascii?Q?xMkwN5/F//FgERbGS4aEpRNU/qDBfxZueVTdOuyOLCXW62Fj3V/LTv4vDg3I?=
 =?us-ascii?Q?FnSoyRtdRpyEOfOoEpCVXG3vk3JVm8/kVt2DMRLVdhpfbhIiG2to30vf4EGC?=
 =?us-ascii?Q?nvHIAfKZZ7PJZqIBpbDKRgeRd3l9RVM2Kyn5pCS4n3JPME6TvodHIpkUX2d/?=
 =?us-ascii?Q?8INKR1BsdaH0muWBjH8AM9gSVSZC6Eux9acvJsObfNMVHeLmuFk0JmBbm6wJ?=
 =?us-ascii?Q?ukqPGetSZIh+bjVMApUtkbdabBX0HbmjGj8uY5FrxlV5lNFhNazfU1CvWPUh?=
 =?us-ascii?Q?lybVZo7JF5LrHzEFMYh/xeWc5ZAuo000gatCONERXaw9en4jXXdguVaC5oCD?=
 =?us-ascii?Q?hq06UZqBMLugocZZqKr+gxYOT16jLdKic61X+OnCxUQhiOv/vrUDw/2VLzIq?=
 =?us-ascii?Q?eY3DD9Etj5c/u1BsS7qDEOtlLluQ1Bac4qUL0m8gKbS/sv9IELvocUwVVgY8?=
 =?us-ascii?Q?8JYOK81KnwO4wnbUcd4RMr7YzMLL0ufqQxMXWXVBxTRhvfG18mSYnKQ3sNMD?=
 =?us-ascii?Q?0cm5w1VNhvmiACf1OR5gb882HXDc3RR2kQs9YgtyOZbJAthFR5AegE5w3Ddt?=
 =?us-ascii?Q?6LDBY6wbJDIc+OAo6m5r+4CdUK3/hLyFQGVrEZXNlFbn67GQeSMQKa42jYMP?=
 =?us-ascii?Q?fCIaCsYBjk4zJgYmceiCHlC7BID4pTzaY1Jd5evB/2fzvSmQxyMArPer3xB9?=
 =?us-ascii?Q?ZgIpz4iXnYxQJM/CxGS2I6u7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9745d10d-c7d2-48fd-1445-08d90608c1fb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:34:53.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFtxYRhlSEVYbNVp3VPirLH9dp7jUg5P/EHRjE6pWOJTQEHTXcx85RGjB/MSA/XDSMs5uxbAyVDcGkAgPH0/Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5079
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk-imx8qxp is a common SCU clock driver used by both QM and QXP
platforms. The clock numbers vary a bit between those two platforms.
This patch introduces a mechanism to only register the valid clocks
for one platform by checking the clk resource id table.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/Makefile           |  3 +-
 drivers/clk/imx/clk-imx8qxp-rsrc.c | 89 ++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8qxp.c      |  9 ++-
 drivers/clk/imx/clk-scu.c          | 33 ++++++++++-
 drivers/clk/imx/clk-scu.h          | 11 +++-
 5 files changed, 137 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8qxp-rsrc.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index dd6a737d060b..2fdd2fff16c7 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -27,7 +27,8 @@ obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
 obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
-clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o
+clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
+				     clk-imx8qxp-rsrc.o
 clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
 
 obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
diff --git a/drivers/clk/imx/clk-imx8qxp-rsrc.c b/drivers/clk/imx/clk-imx8qxp-rsrc.c
new file mode 100644
index 000000000000..ab66811ba9c1
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8qxp-rsrc.c
@@ -0,0 +1,89 @@
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
+static u32 imx8qxp_clk_scu_rsrc_table[] = {
+	IMX_SC_R_DC_0_VIDEO0,
+	IMX_SC_R_DC_0_VIDEO1,
+	IMX_SC_R_DC_0,
+	IMX_SC_R_DC_0_PLL_0,
+	IMX_SC_R_DC_0_PLL_1,
+	IMX_SC_R_SPI_0,
+	IMX_SC_R_SPI_1,
+	IMX_SC_R_SPI_2,
+	IMX_SC_R_SPI_3,
+	IMX_SC_R_UART_0,
+	IMX_SC_R_UART_1,
+	IMX_SC_R_UART_2,
+	IMX_SC_R_UART_3,
+	IMX_SC_R_I2C_0,
+	IMX_SC_R_I2C_1,
+	IMX_SC_R_I2C_2,
+	IMX_SC_R_I2C_3,
+	IMX_SC_R_ADC_0,
+	IMX_SC_R_FTM_0,
+	IMX_SC_R_FTM_1,
+	IMX_SC_R_CAN_0,
+	IMX_SC_R_GPU_0_PID0,
+	IMX_SC_R_LCD_0,
+	IMX_SC_R_LCD_0_PWM_0,
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
+	IMX_SC_R_LVDS_1,
+	IMX_SC_R_M4_0_I2C,
+	IMX_SC_R_ELCDIF_PLL,
+	IMX_SC_R_AUDIO_PLL_0,
+	IMX_SC_R_PI_0,
+	IMX_SC_R_PI_0_PLL,
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
+	IMX_SC_R_AUDIO_PLL_1,
+	IMX_SC_R_AUDIO_CLK_0,
+	IMX_SC_R_AUDIO_CLK_1,
+	IMX_SC_R_A35,
+	IMX_SC_R_VPU_DEC_0,
+	IMX_SC_R_VPU_ENC_0,
+};
+
+const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp = {
+	.rsrc = imx8qxp_clk_scu_rsrc_table,
+	.num = ARRAY_SIZE(imx8qxp_clk_scu_rsrc_table),
+};
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index d17b418ac577..9e35ae45b3a0 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Copyright 2018 NXP
+ * Copyright 2018-2021 NXP
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -27,9 +28,11 @@ static const char *dc0_sels[] = {
 static int imx8qxp_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *ccm_node = pdev->dev.of_node;
+	const struct imx_clk_scu_rsrc_table *rsrc_table;
 	int ret;
 
-	ret = imx_clk_scu_init(ccm_node);
+	rsrc_table = of_device_get_match_data(&pdev->dev);
+	ret = imx_clk_scu_init(ccm_node, rsrc_table);
 	if (ret)
 		return ret;
 
@@ -130,7 +133,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 
 static const struct of_device_id imx8qxp_match[] = {
 	{ .compatible = "fsl,scu-clk", },
-	{ .compatible = "fsl,imx8qxp-clk", },
+	{ .compatible = "fsl,imx8qxp-clk", &imx_clk_scu_rsrc_imx8qxp, },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index cff0e1bd7030..02044d48d9bc 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Copyright 2018 NXP
+ * Copyright 2018-2021 NXP
  *   Dong Aisheng <aisheng.dong@nxp.com>
  */
 
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/arm-smccc.h>
+#include <linux/bsearch.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/of_platform.h>
@@ -22,6 +23,7 @@
 static struct imx_sc_ipc *ccm_ipc_handle;
 static struct device_node *pd_np;
 static struct platform_driver imx_clk_scu_driver;
+static const struct imx_clk_scu_rsrc_table *rsrc_table;
 
 struct imx_scu_clk_node {
 	const char *name;
@@ -167,7 +169,26 @@ static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
 	return container_of(hw, struct clk_scu, hw);
 }
 
-int imx_clk_scu_init(struct device_node *np)
+static inline int imx_scu_clk_search_cmp(const void *rsrc, const void *rsrc_p)
+{
+	return *(u32 *)rsrc - *(u32 *)rsrc_p;
+}
+
+static bool imx_scu_clk_is_valid(u32 rsrc_id)
+{
+	void *p;
+
+	if (!rsrc_table)
+		return true;
+
+	p = bsearch(&rsrc_id, rsrc_table->rsrc, rsrc_table->num,
+		    sizeof(rsrc_table->rsrc[0]), imx_scu_clk_search_cmp);
+
+	return p != NULL;
+}
+
+int imx_clk_scu_init(struct device_node *np,
+		     const struct imx_clk_scu_rsrc_table *data)
 {
 	u32 clk_cells;
 	int ret, i;
@@ -186,6 +207,8 @@ int imx_clk_scu_init(struct device_node *np)
 		pd_np = of_find_compatible_node(NULL, NULL, "fsl,scu-pd");
 		if (!pd_np)
 			return -EINVAL;
+
+		rsrc_table = data;
 	}
 
 	return platform_driver_register(&imx_clk_scu_driver);
@@ -582,6 +605,9 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 	struct platform_device *pdev;
 	int ret;
 
+	if (!imx_scu_clk_is_valid(rsrc_id))
+		return ERR_PTR(-EINVAL);
+
 	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
 	if (!pdev) {
 		pr_err("%s: failed to allocate scu clk dev rsrc %d type %d\n",
@@ -749,6 +775,9 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_na
 	if (!clk_node)
 		return ERR_PTR(-ENOMEM);
 
+	if (!imx_scu_clk_is_valid(rsrc_id))
+		return ERR_PTR(-EINVAL);
+
 	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
 	if (!clk) {
 		kfree(clk_node);
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 8ebee0cb0fe6..bcacd8b1d1ab 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * Copyright 2018 NXP
+ * Copyright 2018-2021 NXP
  *   Dong Aisheng <aisheng.dong@nxp.com>
  */
 
@@ -14,10 +14,17 @@
 #define IMX_SCU_GPR_CLK_DIV	BIT(1)
 #define IMX_SCU_GPR_CLK_MUX	BIT(2)
 
+struct imx_clk_scu_rsrc_table {
+	const u32 *rsrc;
+	u8 num;
+};
+
 extern struct list_head imx_scu_clks[];
 extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
+extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp;
 
-int imx_clk_scu_init(struct device_node *np);
+int imx_clk_scu_init(struct device_node *np,
+		     const struct imx_clk_scu_rsrc_table *data);
 struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
 				      void *data);
 struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
-- 
2.25.1

