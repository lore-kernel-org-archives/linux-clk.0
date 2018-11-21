Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199A5C43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 14:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAC3E2147D
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 14:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="EMgzepVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC3E2147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730621AbeKVArH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 19:47:07 -0500
Received: from mail-eopbgr30077.outbound.protection.outlook.com ([40.107.3.77]:13147
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726004AbeKVArH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 19:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBDNTz+Tdhnoyt4CLo7bH1/TE9Vie0LcwwB+acRpA4U=;
 b=EMgzepVY4SUSo7KbTAZZICixPDGiY9sa9ytYkWMPymO80INVp3D8IJ5pbtULTD2uIOXNMjSKpDpQOzYLAignUExZmcLqTVHofxpeIrYsjFibarMrmmJJjbkGrXsz4zgftHAYJMRxcRbmN9hpSnbtbQXa1iKYJNjBppUO1ouoZNU=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4996.eurprd04.prod.outlook.com (20.177.40.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.23; Wed, 21 Nov 2018 14:12:27 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1339.027; Wed, 21 Nov 2018
 14:12:27 +0000
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
Subject: [PATCH V8 3/7] dt-bindings: clock: imx8qxp: add SCU clock IDs
Thread-Topic: [PATCH V8 3/7] dt-bindings: clock: imx8qxp: add SCU clock IDs
Thread-Index: AQHUgaQ7Nert7e3VsEagvMvbPgyaBA==
Date:   Wed, 21 Nov 2018 14:12:27 +0000
Message-ID: <1542809234-539-4-git-send-email-aisheng.dong@nxp.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4996;6:q+RUkzKONlgft5LIBaN5fovo5MDYnSzxM4w2G59jd8TN6eCHyI6vyrtTm1gWJ6Flx8So/qWnxSwpnzZwm+DEk5WpRk1CW8mqnHu1wzbi3yfo+BynWfIjk0F/B7jSS0foQXcq9Ac00tN4eAwDUedyKijtOLIXIasD/PCoTT38YVO4oIw9y5tqCvE7oRIOnP05agFlsvSEj16o8pQwhKw8XhsjMDxR9yh0sQt1sIwAoAagHl9KjFa4i3SioYTC82wX2NmJXLFfOtKZeNj5Yh3Jq101bjFqHqGTk/KQJITCQRXViHn8tVOrXbDziiCmol40kT3cMnNngSNrKC9D8PHvHyWqYMfsIimouLvkZI7F/AqR9M2Z/f9GV4AiiJ8gZRq4YqcSiVhLZY6uuKwS42QM9YFyOOZCIoJBodt9re4+UPykKrpE61qn8ml4+tarX2I2v0cOn14oZqV17iDdD5x0EA==;5:CGElq5TQ+KEcA8l1jaMALJVaR4L94DhzpYaJk+7JIprxfYRny7GkY9Arz6thbk9IJEWV5mwQeG+mUYUy8VqLAX3B7UOLIlyy1dY8bz9mbeVhy2R+zMaJtHdhVaxSAfz5/VbPNF2QWhWIpHEAHOk8dGK9jea1wQcoKYai6SMfED4=;7:/tO4jzQ7+qrOp0R8ysERFQSz/7U2+bSHxsiwz2HSGF/m8mg2wILAosO7QJ04mM0GJn0LE4ND9TatlKsWghjTDBa5bpE1oI4f83lOB3gIeN2+RvipxEEFxvTJSxknvkH5VbwsedS9ZIiukuzK2Xo44A==
x-ms-office365-filtering-correlation-id: d3cfa083-22d7-4e14-4254-08d64fbb5dd2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4996;
x-ms-traffictypediagnostic: AM0PR04MB4996:
x-microsoft-antispam-prvs: <AM0PR04MB49964520950A2439E6AC00DF80DA0@AM0PR04MB4996.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231442)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4996;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4996;
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(376002)(366004)(39860400002)(396003)(199004)(189003)(6486002)(478600001)(2351001)(50226002)(6436002)(105586002)(14444005)(186003)(106356001)(256004)(14454004)(2906002)(25786009)(3846002)(6512007)(53936002)(6116002)(5640700003)(36756003)(6916009)(26005)(68736007)(2501003)(54906003)(99286004)(86362001)(71190400001)(71200400001)(81166006)(81156014)(316002)(446003)(11346002)(102836004)(8676002)(8936002)(76176011)(486006)(52116002)(476003)(386003)(2616005)(6506007)(66066001)(2900100001)(7736002)(305945005)(5660300001)(97736004)(4326008)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4996;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ZN+R+MWYwoGCJoytfTQWR6oedn0B/XrAl6Fi+Oc5ew0nZRbiapEDtkusWEJ+rLllTK8V8OAhUXAg+OaO2KHFlmxpmiowd3c4qIdLYpGGwAWGVWvUsCRgZ+28IFsKVhdOMPzMgXBMzhYS0xqrfsmgBIcDpaK+93Yic98OCoex/7fVz3tUX7PaWEUyKjB9CTWGHHm24Vxm/EFPQhAPy8qf/RqUPH6k064tEcjYdlbNIPlPJNKaepmMMvcUecNIOybcJzYSurzgDCfcsPJDTCxW05ez8choQkmmZUVC+aKFkG+R0HTs8Fup3OyglquW7Free+p/bjZ7aWp12OyCOzFAuzphMQaTsSPtYCk/IBSC55g=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cfa083-22d7-4e14-4254-08d64fbb5dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 14:12:27.3543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4996
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
v6->v8:
 * no changes
v6: new patch, separate from driver changes to avoid a checkpatch warning
    IDs are changed a lot due to SCU divider/gate/mux are merged into
    one general SCU clock and LPCG clocks are moved out.
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

