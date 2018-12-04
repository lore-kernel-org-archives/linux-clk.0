Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30257C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 14:39:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFA0520672
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 14:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="S/XJOTZY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFA0520672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbeLDOjj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 09:39:39 -0500
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:62432
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725955AbeLDOjj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Dec 2018 09:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V18/oO+5K/k9ivhjiRcTDQ2R5+K1MdjC0f/+1Inv7rk=;
 b=S/XJOTZYceyrFR/TeBdD41QRAYtcxP4PA9l8bhA0VXjnP/C7gW6nPK69knFNlqQXuhL/1lpwgiNLx8ybJyWOBj8MxZ0svoHby//QiciG/Nvv8BUx1zrb4AcUO6WC6m4a/Kl9i25UiMD0Z6Wf6WDEExeIDDQL3qOXNXy5BMeCbw0=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4546.eurprd04.prod.outlook.com (52.135.148.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Tue, 4 Dec 2018 14:39:29 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1382.023; Tue, 4 Dec 2018
 14:39:29 +0000
From:   Aisheng DONG <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH V9 3/7] dt-bindings: clock: imx8qxp: add SCU clock IDs
Thread-Topic: [PATCH V9 3/7] dt-bindings: clock: imx8qxp: add SCU clock IDs
Thread-Index: AQHUi98pFWnjxoezlUGzfCstNxU7fw==
Date:   Tue, 4 Dec 2018 14:39:29 +0000
Message-ID: <1543934041-12572-4-git-send-email-aisheng.dong@nxp.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::27) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4546;6:+fVK1ODpkBrSOvbCucHfjAmobHBvIBwiJi0g0DSpaobX7bLSku0+mU2cT56/XQIDtxX3Y45gM6+4kmI/WjpEy8vkZrSX9dVzE8uxR8KC9ijQpxQhRNKS4ro99VMrtTY1vsDZ0mQrHiErG5VRlu1MQVvpJuokhnRlvDAVKkmn1NksgDybj9mBOq1HOFrywuKyjACNc6Z+DQsxtZ/8s8Hjs+jlJoM7+wvaMjtT07644HSWj0OXR9gmYKdgSVVD6w36ULK4GHCuac8knnExXtVJTVxojrdLOEaSI4+zZHDLEEj/bEc7QSWJ6Z+2YFLzQMHf59O52sgsU817RlQGpKR+mlkpg0SDG9g5EBO2ufYPUdDnk/y68QuVzu6DVKuzzW4itXU4hs5TBzdjKPpPP5Q7a4jST5AJjW2+Yyopg4wzCpQbsC8DPobTxvDWqAxxPoIxCVWWsYf3oGrImAB9XCg+Yg==;5:YP4hecoKoCfaOozSGFfpeqM5zP9ShFzmXWVsbT54Q9EVUAWj31sgEmhKHchoVeSb2HOcAySWhXSq8Y9ck3tvmNJ4PPH6HUPtdMTaHR5LOqabGG014aVcMut8EQNNizs9bg++790SNhyYtkqrF+3dC5CcxCNWzD7lrYFnJT1iNi0=;7:ZBoq8Vb6/ljC16smBSNOnOCrn2ClEY7rrW1R1U5CvXt1l8RdFb21m8xOLtepRWDUBvbpLCafwNBmvFG2qnbZrrytg9aNuFvFWxTXJvsstq6ZnkoxVuiyIp6vfX1qaq3ZuSoiFyOaJrxwJLL+fxxbpg==
x-ms-office365-filtering-correlation-id: 9b92c132-c6e8-46e9-8b16-08d659f64c2f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4546;
x-ms-traffictypediagnostic: AM0PR04MB4546:
x-microsoft-antispam-prvs: <AM0PR04MB4546AD3EA77B3E36A5B3BB5680AF0@AM0PR04MB4546.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(944501493)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4546;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4546;
x-forefront-prvs: 0876988AF0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(396003)(39860400002)(346002)(366004)(189003)(199004)(68736007)(36756003)(66066001)(316002)(2501003)(6486002)(6916009)(97736004)(71200400001)(71190400001)(81156014)(50226002)(81166006)(5660300001)(8936002)(8676002)(4326008)(3846002)(6512007)(386003)(6116002)(26005)(186003)(102836004)(2351001)(2906002)(99286004)(52116002)(6506007)(76176011)(106356001)(53936002)(305945005)(105586002)(5640700003)(256004)(2616005)(86362001)(478600001)(486006)(476003)(25786009)(7736002)(446003)(6436002)(54906003)(11346002)(14454004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4546;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: j93fD/y1Voq51x+qPkbpVIk952/5dOFFRQ15mco7/vlM5aSXoansGzXZpDm6sxWaaxWKqXgeyEQqpH+nCRzzLx4mVs8oOkreve1vZFgEoq/2+NbgbashYAxNNCqFkUKI0LTGUXnxAl8Sozn0S5Sxg09fWASU78ZerEP0kg8FbboN/rfHpn/2UxVV0jOwAxllongJuhG7XCy1IQuJPgn1oJL+Lk6dRP858CuPiEpqHEJYJa1z9th5hsg47QYhtiWRFQSUQKej8dkA/gBLqPAznoY/oGJ2J+8e4rHOX1LgDdzV4ELwwevJsMT045B1XqOeIYyT+L5ddNX0c18iHXomUvB/D3viillbXjDVLK121IM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b92c132-c6e8-46e9-8b16-08d659f64c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2018 14:39:29.7056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4546
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add IMX8QXP SCU clock IDs.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 include/dt-bindings/clock/imx8qxp-clock.h | 136 ++++++++++++++++++++++++++=
++++
 1 file changed, 136 insertions(+)
 create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h

diff --git a/include/dt-bindings/clock/imx8qxp-clock.h b/include/dt-binding=
s/clock/imx8qxp-clock.h
new file mode 100644
index 0000000..d72a39c
--- /dev/null
+++ b/include/dt-bindings/clock/imx8qxp-clock.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2018 NXP
+ *   Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_IMX8QXP_H
+#define __DT_BINDINGS_CLOCK_IMX8QXP_H
+
+/* SCU Clocks */
+
+#define IMX8QXP_CLK_DUMMY				0
+
+/* CPU */
+#define IMX8QXP_A35_CLK					1
+
+/* LSIO SS */
+#define IMX8QXP_LSIO_MEM_CLK				2
+#define IMX8QXP_LSIO_BUS_CLK				3
+#define IMX8QXP_LSIO_PWM0_CLK				10
+#define IMX8QXP_LSIO_PWM1_CLK				11
+#define IMX8QXP_LSIO_PWM2_CLK				12
+#define IMX8QXP_LSIO_PWM3_CLK				13
+#define IMX8QXP_LSIO_PWM4_CLK				14
+#define IMX8QXP_LSIO_PWM5_CLK				15
+#define IMX8QXP_LSIO_PWM6_CLK				16
+#define IMX8QXP_LSIO_PWM7_CLK				17
+#define IMX8QXP_LSIO_GPT0_CLK				18
+#define IMX8QXP_LSIO_GPT1_CLK				19
+#define IMX8QXP_LSIO_GPT2_CLK				20
+#define IMX8QXP_LSIO_GPT3_CLK				21
+#define IMX8QXP_LSIO_GPT4_CLK				22
+#define IMX8QXP_LSIO_FSPI0_CLK				23
+#define IMX8QXP_LSIO_FSPI1_CLK				24
+
+/* Connectivity SS */
+#define IMX8QXP_CONN_AXI_CLK_ROOT			30
+#define IMX8QXP_CONN_AHB_CLK_ROOT			31
+#define IMX8QXP_CONN_IPG_CLK_ROOT			32
+#define IMX8QXP_CONN_SDHC0_CLK				40
+#define IMX8QXP_CONN_SDHC1_CLK				41
+#define IMX8QXP_CONN_SDHC2_CLK				42
+#define IMX8QXP_CONN_ENET0_ROOT_CLK			43
+#define IMX8QXP_CONN_ENET0_BYPASS_CLK			44
+#define IMX8QXP_CONN_ENET0_RGMII_CLK			45
+#define IMX8QXP_CONN_ENET1_ROOT_CLK			46
+#define IMX8QXP_CONN_ENET1_BYPASS_CLK			47
+#define IMX8QXP_CONN_ENET1_RGMII_CLK			48
+#define IMX8QXP_CONN_GPMI_BCH_IO_CLK			49
+#define IMX8QXP_CONN_GPMI_BCH_CLK			50
+#define IMX8QXP_CONN_USB2_ACLK				51
+#define IMX8QXP_CONN_USB2_BUS_CLK			52
+#define IMX8QXP_CONN_USB2_LPM_CLK			53
+
+/* HSIO SS */
+#define IMX8QXP_HSIO_AXI_CLK				60
+#define IMX8QXP_HSIO_PER_CLK				61
+
+/* Display controller SS */
+#define IMX8QXP_DC_AXI_EXT_CLK				70
+#define IMX8QXP_DC_AXI_INT_CLK				71
+#define IMX8QXP_DC_CFG_CLK				72
+#define IMX8QXP_DC0_PLL0_CLK				80
+#define IMX8QXP_DC0_PLL1_CLK				81
+#define IMX8QXP_DC0_DISP0_CLK				82
+#define IMX8QXP_DC0_DISP1_CLK				83
+
+/* MIPI-LVDS SS */
+#define IMX8QXP_MIPI_IPG_CLK				90
+#define IMX8QXP_MIPI0_PIXEL_CLK				100
+#define IMX8QXP_MIPI0_BYPASS_CLK			101
+#define IMX8QXP_MIPI0_LVDS_PIXEL_CLK			102
+#define IMX8QXP_MIPI0_LVDS_BYPASS_CLK			103
+#define IMX8QXP_MIPI0_LVDS_PHY_CLK			104
+#define IMX8QXP_MIPI0_I2C0_CLK				105
+#define IMX8QXP_MIPI0_I2C1_CLK				106
+#define IMX8QXP_MIPI0_PWM0_CLK				107
+#define IMX8QXP_MIPI1_PIXEL_CLK				108
+#define IMX8QXP_MIPI1_BYPASS_CLK			109
+#define IMX8QXP_MIPI1_LVDS_PIXEL_CLK			110
+#define IMX8QXP_MIPI1_LVDS_BYPASS_CLK			111
+#define IMX8QXP_MIPI1_LVDS_PHY_CLK			112
+#define IMX8QXP_MIPI1_I2C0_CLK				113
+#define IMX8QXP_MIPI1_I2C1_CLK				114
+#define IMX8QXP_MIPI1_PWM0_CLK				115
+
+/* IMG SS */
+#define IMX8QXP_IMG_AXI_CLK				120
+#define IMX8QXP_IMG_IPG_CLK				121
+#define IMX8QXP_IMG_PXL_CLK				122
+
+/* MIPI-CSI SS */
+#define IMX8QXP_CSI0_CORE_CLK				130
+#define IMX8QXP_CSI0_ESC_CLK				131
+#define IMX8QXP_CSI0_PWM0_CLK				132
+#define IMX8QXP_CSI0_I2C0_CLK				133
+
+/* PARALLER CSI SS */
+#define IMX8QXP_PARALLEL_CSI_DPLL_CLK			140
+#define IMX8QXP_PARALLEL_CSI_PIXEL_CLK			141
+#define IMX8QXP_PARALLEL_CSI_MCLK_CLK			142
+
+/* VPU SS */
+#define IMX8QXP_VPU_ENC_CLK				150
+#define IMX8QXP_VPU_DEC_CLK				151
+
+/* GPU SS */
+#define IMX8QXP_GPU0_CORE_CLK				160
+#define IMX8QXP_GPU0_SHADER_CLK				161
+
+/* ADMA SS */
+#define IMX8QXP_ADMA_IPG_CLK_ROOT			165
+#define IMX8QXP_ADMA_UART0_CLK				170
+#define IMX8QXP_ADMA_UART1_CLK				171
+#define IMX8QXP_ADMA_UART2_CLK				172
+#define IMX8QXP_ADMA_UART3_CLK				173
+#define IMX8QXP_ADMA_SPI0_CLK				174
+#define IMX8QXP_ADMA_SPI1_CLK				175
+#define IMX8QXP_ADMA_SPI2_CLK				176
+#define IMX8QXP_ADMA_SPI3_CLK				177
+#define IMX8QXP_ADMA_CAN0_CLK				178
+#define IMX8QXP_ADMA_CAN1_CLK				179
+#define IMX8QXP_ADMA_CAN2_CLK				180
+#define IMX8QXP_ADMA_I2C0_CLK				181
+#define IMX8QXP_ADMA_I2C1_CLK				182
+#define IMX8QXP_ADMA_I2C2_CLK				183
+#define IMX8QXP_ADMA_I2C3_CLK				184
+#define IMX8QXP_ADMA_FTM0_CLK				185
+#define IMX8QXP_ADMA_FTM1_CLK				186
+#define IMX8QXP_ADMA_ADC0_CLK				187
+#define IMX8QXP_ADMA_PWM_CLK				188
+#define IMX8QXP_ADMA_LCD_CLK				189
+
+#define IMX8QXP_SCU_CLK_END				190
+
+#endif /* __DT_BINDINGS_CLOCK_IMX8QXP_H */
--=20
2.7.4

