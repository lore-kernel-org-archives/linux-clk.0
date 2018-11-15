Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E05C43441
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 08:56:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC5AC22419
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 08:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="EZdXO2Q7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC5AC22419
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbeKOTDn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 14:03:43 -0500
Received: from mail-eopbgr00047.outbound.protection.outlook.com ([40.107.0.47]:14452
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729071AbeKOTDm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 14:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I3ns50OAZe5lxwVf1ORO/K2WwRkQGoo/iWSFocTp2A=;
 b=EZdXO2Q72XXSnZk0bbBUq07LEvLqniAnacTmLYRIn4NP9QA9US+0T9PaDmSNG0zfccX07VJScLGIRHyF2q2AKk8srzm0oxrPyx5kn3Vy5fP5G17cdCwuasPvW0Zi25qRSrDklq49g8TgbHRk7zPpfS7irOZBxcdvcTqOl5SSvx0=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4740.eurprd04.prod.outlook.com (20.176.214.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Thu, 15 Nov 2018 08:56:38 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.045; Thu, 15 Nov 2018
 08:56:38 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V7 7/7] clk: imx: add imx8qxp lpcg driver
Thread-Topic: [PATCH V7 7/7] clk: imx: add imx8qxp lpcg driver
Thread-Index: AQHUfMEebb7vtsbjIUOJ3n3KgCnXsg==
Date:   Thu, 15 Nov 2018 08:56:38 +0000
Message-ID: <1542271869-18600-8-git-send-email-aisheng.dong@nxp.com>
References: <1542271869-18600-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1542271869-18600-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:2e::22) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4740;6:KI31qNIFITBP1kD5B6sYnH/7SOGGmc7vaLDiWaLTt0a3MP6UGRhPfmm+juGuxJ6mab7xeR689gdisHGpjQHQKzlVtPZbdeompoUKz85NYy1JDApoGFnfIhiPmVlnuX1l+JdSF34zv9WeqOwR3SvafHpdggP0z8MzRtjXd3tyPIOkbxV/1WXAIuEVwIukCnu7sw+VcidFyjKP1tYoeOMGt3yR1RO9J8s91qs+a1mc3a1KNh8t/8LS7Psov7ovg/oW7gHkg34uEEqAZOG6l7OhHsaR2x71a1I2nwJrueqZyawh2kGe27A4EqA/jvn8nJ2k2DYMGKhsOZS6fN1lIIQHERB7UrUbntZ8VG2myIK4gIiODfK/FR9gUbVz3njv7adhIZt91DBkTTkTOBBHoo0z8g37SjrIWwtw0E+7S08B/uCV/xguAHbnosMlY2UOspKE1yjn/dxJn00Ktoq8fs+VDg==;5:tILcLrUEcmWtc+Q48yWF9zJHBx65sORrg4Wa3de/J5sUC4dReljXYkyeOcs9RDS/k7w2P/DDuzPZdI6MdnLUXWkmKgDPnMSGe53CHt1EXqkGTmvZbSJEH3KJkvwwaGMn41Cdo3JHGDxVLvsEBkQuxbvLmVEMRgv0gLN4+JV0i7Q=;7:aombWTKsqnywhvCPVYXG/4RRPuajCkizvTt3gThbOW9JQqKXBNr+9HSGUZvL11Ybcdtdp8QNiABfkmP3T9cVTda/MgXkQtirDympWreF5tE+PXvO4nlq11LlBmipRPtfDuYvSlkV67/J7tAuOj6+yg==
x-ms-office365-filtering-correlation-id: a793ff48-a23f-4457-5686-08d64ad840ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4740;
x-ms-traffictypediagnostic: AM0PR04MB4740:
x-microsoft-antispam-prvs: <AM0PR04MB47400E1D3F986CD2C5ED30A280DC0@AM0PR04MB4740.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4740;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4740;
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(346002)(396003)(136003)(39860400002)(189003)(199004)(54534003)(36756003)(53946003)(53936002)(5640700003)(575784001)(86362001)(6512007)(7736002)(5660300001)(305945005)(2501003)(6436002)(105586002)(2351001)(97736004)(81166006)(6916009)(6116002)(50226002)(3846002)(106356001)(8936002)(66066001)(8676002)(81156014)(11346002)(478600001)(25786009)(446003)(476003)(4326008)(486006)(2616005)(4744004)(2906002)(76176011)(26005)(6506007)(186003)(102836004)(52116002)(14454004)(54906003)(14444005)(386003)(256004)(316002)(99286004)(68736007)(2900100001)(71200400001)(6486002)(71190400001)(32563001)(473944003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4740;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: tr2eUWp2kfV2e0kMY7xb6Aa7rDfDFj4nNLgy7ntvAvije3To1u0/VUvwmxw+u199jRagrDUq8D5bz5eF1gg9UMeVS1oXxa2Ar/3NlTd0wCbvR9IfbqBkJDydKnKaUBCtenG4gdnJFc3g3AVZwKKr8K4WpLaNz/tY0sX6g9y0ypoN67ShAjE+3aKNs/BR4lpu5wV+pqNKP/hw3kP1jvIQcA996v1Xt/trLDLuEIFyJMM64dmMHwXLI3gUyfIZH15a85ZBvmmBCuUok269AsUVyEu9RLEM7zkkpwjV0Pvtv3NB16oyG3TRwy9wn8cp9xd4gWaLyqOntvulWSg+bnXL59+7P95aeXy2KHPL3P9+vgQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a793ff48-a23f-4457-5686-08d64ad840ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 08:56:38.2179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4740
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imx8qxp lpcg driver support

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v6->v7:
 * use struct_size()
 * add kernel doc for structs
 * Include this after <linux/*> and before locals
 * remove MODULE_ macros
 * add suppress_bind_attrs
v6:
 * new patch, separate from scu gate driver
---
 drivers/clk/imx/Makefile           |   2 +-
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 216 +++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-imx8qxp-lpcg.h | 102 ++++++++++++++++++
 3 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-imx8qxp-lpcg.c
 create mode 100644 drivers/clk/imx/clk-imx8qxp-lpcg.h

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index cd2b6f0..96ab82b 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -32,4 +32,4 @@ obj-$(CONFIG_SOC_IMX6UL) +=3D clk-imx6ul.o
 obj-$(CONFIG_SOC_IMX7D)  +=3D clk-imx7d.o
 obj-$(CONFIG_SOC_VF610)  +=3D clk-vf610.o
=20
-obj-$(CONFIG_SOC_IMX8QXP)	+=3D clk-imx8qxp.o
+obj-$(CONFIG_SOC_IMX8QXP) +=3D clk-imx8qxp.o clk-imx8qxp-lpcg.o
diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8q=
xp-lpcg.c
new file mode 100644
index 0000000..dcae1dd
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "clk-scu.h"
+#include "clk-imx8qxp-lpcg.h"
+
+#include <dt-bindings/clock/imx8qxp-clock.h>
+
+/*
+ * struct imx8qxp_lpcg_data - Description of one LPCG clock
+ * @id: clock ID
+ * @name: clock name
+ * @parent: parent clock name
+ * @flags: common clock flags
+ * @offset: offset of this LPCG clock
+ * @bit_idx: bit index of this LPCG clock
+ * @hw_gate: whether supports HW autogate
+ *
+ * This structure describes one LPCG clock
+ */
+struct imx8qxp_lpcg_data {
+	int id;
+	char *name;
+	char *parent;
+	unsigned long flags;
+	u32 offset;
+	u8 bit_idx;
+	bool hw_gate;
+};
+
+/*
+ * struct imx8qxp_ss_lpcg - Description of one subsystem LPCG clocks
+ * @lpcg: LPCG clocks array of one subsystem
+ * @num_lpcg: the number of LPCG clocks
+ * @num_max: the maximum number of LPCG clocks
+ *
+ * This structure describes each subsystem LPCG clocks information
+ * which then will be used to create respective LPCGs clocks
+ */
+struct imx8qxp_ss_lpcg {
+	const struct imx8qxp_lpcg_data *lpcg;
+	u8 num_lpcg;
+	u8 num_max;
+};
+
+static const struct imx8qxp_lpcg_data imx8qxp_lpcg_adma[] =3D {
+	{ IMX8QXP_ADMA_LPCG_UART0_IPG_CLK, "uart0_lpcg_ipg_clk", "dma_ipg_clk_roo=
t", 0, ADMA_LPUART_0_LPCG, 16, 0, },
+	{ IMX8QXP_ADMA_LPCG_UART0_BAUD_CLK, "uart0_lpcg_baud_clk", "uart0_clk", 0=
, ADMA_LPUART_0_LPCG, 0, 0, },
+	{ IMX8QXP_ADMA_LPCG_UART1_IPG_CLK, "uart1_lpcg_ipg_clk", "dma_ipg_clk_roo=
t", 0, ADMA_LPUART_1_LPCG, 16, 0, },
+	{ IMX8QXP_ADMA_LPCG_UART1_BAUD_CLK, "uart1_lpcg_baud_clk", "uart1_clk", 0=
, ADMA_LPUART_1_LPCG, 0, 0, },
+	{ IMX8QXP_ADMA_LPCG_UART2_IPG_CLK, "uart2_lpcg_ipg_clk", "dma_ipg_clk_roo=
t", 0, ADMA_LPUART_2_LPCG, 16, 0, },
+	{ IMX8QXP_ADMA_LPCG_UART2_BAUD_CLK, "uart2_lpcg_baud_clk", "uart2_clk", 0=
, ADMA_LPUART_2_LPCG, 0, 0, },
+	{ IMX8QXP_ADMA_LPCG_UART3_IPG_CLK, "uart3_lpcg_ipg_clk", "dma_ipg_clk_roo=
t", 0, ADMA_LPUART_3_LPCG, 16, 0, },
+	{ IMX8QXP_ADMA_LPCG_UART3_BAUD_CLK, "uart3_lpcg_baud_clk", "uart3_clk", 0=
, ADMA_LPUART_3_LPCG, 0, 0, },
+	{ IMX8QXP_ADMA_LPCG_I2C0_IPG_CLK, "i2c0_lpcg_ipg_clk", "dma_ipg_clk_root"=
, 0, ADMA_LPI2C_0_LPCG, 16, 0, },
+	{ IMX8QXP_ADMA_LPCG_I2C0_CLK, "i2c0_lpcg_clk", "i2c0_clk", 0, ADMA_LPI2C_=
0_LPCG, 0, 0, },
+	{ IMX8QXP_ADMA_LPCG_I2C1_IPG_CLK, "i2c1_lpcg_ipg_clk", "dma_ipg_clk_root"=
, 0, ADMA_LPI2C_1_LPCG, 16, 0, },
+	{ IMX8QXP_ADMA_LPCG_I2C1_CLK, "i2c1_lpcg_clk", "i2c1_clk", 0, ADMA_LPI2C_=
1_LPCG, 0, 0, },
+	{ IMX8QXP_ADMA_LPCG_I2C2_IPG_CLK, "i2c2_lpcg_ipg_clk", "dma_ipg_clk_root"=
, 0, ADMA_LPI2C_2_LPCG, 16, 0, },
+	{ IMX8QXP_ADMA_LPCG_I2C2_CLK, "i2c2_lpcg_clk", "i2c2_clk", 0, ADMA_LPI2C_=
2_LPCG, 0, 0, },
+	{ IMX8QXP_ADMA_LPCG_I2C3_IPG_CLK, "i2c3_lpcg_ipg_clk", "dma_ipg_clk_root"=
, 0, ADMA_LPI2C_3_LPCG, 16, 0, },
+	{ IMX8QXP_ADMA_LPCG_I2C3_CLK, "i2c3_lpcg_clk", "i2c3_clk", 0, ADMA_LPI2C_=
3_LPCG, 0, 0, },
+};
+
+static const struct imx8qxp_ss_lpcg imx8qxp_ss_adma =3D {
+	.lpcg =3D imx8qxp_lpcg_adma,
+	.num_lpcg =3D ARRAY_SIZE(imx8qxp_lpcg_adma),
+	.num_max =3D IMX8QXP_ADMA_LPCG_CLK_END,
+};
+
+static const struct imx8qxp_lpcg_data imx8qxp_lpcg_conn[] =3D {
+	{ IMX8QXP_CONN_LPCG_SDHC0_PER_CLK, "sdhc0_lpcg_per_clk", "sdhc0_clk", 0, =
CONN_USDHC_0_LPCG, 0, 0, },
+	{ IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK, "sdhc0_lpcg_ipg_clk", "conn_ipg_clk_ro=
ot", 0, CONN_USDHC_0_LPCG, 16, 0, },
+	{ IMX8QXP_CONN_LPCG_SDHC0_HCLK, "sdhc0_lpcg_ahb_clk", "conn_axi_clk_root"=
, 0, CONN_USDHC_0_LPCG, 20, 0, },
+	{ IMX8QXP_CONN_LPCG_SDHC1_PER_CLK, "sdhc1_lpcg_per_clk", "sdhc1_clk", 0, =
CONN_USDHC_1_LPCG, 0, 0, },
+	{ IMX8QXP_CONN_LPCG_SDHC1_IPG_CLK, "sdhc1_lpcg_ipg_clk", "conn_ipg_clk_ro=
ot", 0, CONN_USDHC_1_LPCG, 16, 0, },
+	{ IMX8QXP_CONN_LPCG_SDHC1_HCLK, "sdhc1_lpcg_ahb_clk", "conn_axi_clk_root"=
, 0, CONN_USDHC_1_LPCG, 20, 0, },
+	{ IMX8QXP_CONN_LPCG_SDHC2_PER_CLK, "sdhc2_lpcg_per_clk", "sdhc2_clk", 0, =
CONN_USDHC_2_LPCG, 0, 0, },
+	{ IMX8QXP_CONN_LPCG_SDHC2_IPG_CLK, "sdhc2_lpcg_ipg_clk", "conn_ipg_clk_ro=
ot", 0, CONN_USDHC_2_LPCG, 16, 0, },
+	{ IMX8QXP_CONN_LPCG_SDHC2_HCLK, "sdhc2_lpcg_ahb_clk", "conn_axi_clk_root"=
, 0, CONN_USDHC_2_LPCG, 20, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET0_ROOT_CLK, "enet0_ipg_root_clk", "enet0_clk", 0,=
 CONN_ENET_0_LPCG, 0, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET0_TX_CLK, "enet0_tx_clk", "enet0_clk", 0, CONN_EN=
ET_0_LPCG, 4, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET0_AHB_CLK, "enet0_ahb_clk", "conn_axi_clk_root", =
0, CONN_ENET_0_LPCG, 8, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET0_IPG_S_CLK, "enet0_ipg_s_clk", "conn_ipg_clk_roo=
t", 0, CONN_ENET_0_LPCG, 20, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET0_IPG_CLK, "enet0_ipg_clk", "enet0_ipg_s_clk", 0,=
 CONN_ENET_0_LPCG, 16, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET1_ROOT_CLK, "enet1_ipg_root_clk", "enet1_clk", 0,=
 CONN_ENET_1_LPCG, 0, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET1_TX_CLK, "enet1_tx_clk", "enet1_clk", 0, CONN_EN=
ET_1_LPCG, 4, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET1_AHB_CLK, "enet1_ahb_clk", "conn_axi_clk_root", =
0, CONN_ENET_1_LPCG, 8, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET1_IPG_S_CLK, "enet1_ipg_s_clk", "conn_ipg_clk_roo=
t", 0, CONN_ENET_1_LPCG, 20, 0, },
+	{ IMX8QXP_CONN_LPCG_ENET1_IPG_CLK, "enet1_ipg_clk", "enet0_ipg_s_clk", 0,=
 CONN_ENET_1_LPCG, 16, 0, },
+};
+
+static const struct imx8qxp_ss_lpcg imx8qxp_ss_conn =3D {
+	.lpcg =3D imx8qxp_lpcg_conn,
+	.num_lpcg =3D ARRAY_SIZE(imx8qxp_lpcg_conn),
+	.num_max =3D IMX8QXP_CONN_LPCG_CLK_END,
+};
+
+static const struct imx8qxp_lpcg_data imx8qxp_lpcg_lsio[] =3D {
+	{ IMX8QXP_LSIO_LPCG_PWM0_IPG_CLK, "pwm0_lpcg_ipg_clk", "pwm0_clk", 0, LSI=
O_PWM_0_LPCG, 0, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM0_IPG_HF_CLK, "pwm0_lpcg_ipg_hf_clk", "pwm0_clk", =
0, LSIO_PWM_0_LPCG, 4, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM0_IPG_S_CLK, "pwm0_lpcg_ipg_s_clk", "pwm0_clk", 0,=
 LSIO_PWM_0_LPCG, 16, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM0_IPG_SLV_CLK, "pwm0_lpcg_ipg_slv_clk", "lsio_bus_=
clk_root", 0, LSIO_PWM_0_LPCG, 20, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM0_IPG_MSTR_CLK, "pwm0_lpcg_ipg_mstr_clk", "pwm0_cl=
k", 0, LSIO_PWM_0_LPCG, 24, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM1_IPG_CLK, "pwm1_lpcg_ipg_clk", "pwm1_clk", 0, LSI=
O_PWM_1_LPCG, 0, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM1_IPG_HF_CLK, "pwm1_lpcg_ipg_hf_clk", "pwm1_clk", =
0, LSIO_PWM_1_LPCG, 4, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM1_IPG_S_CLK, "pwm1_lpcg_ipg_s_clk", "pwm1_clk", 0,=
 LSIO_PWM_1_LPCG, 16, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM1_IPG_SLV_CLK, "pwm1_lpcg_ipg_slv_clk", "lsio_bus_=
clk_root", 0, LSIO_PWM_1_LPCG, 20, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM1_IPG_MSTR_CLK, "pwm1_lpcg_ipg_mstr_clk", "pwm1_cl=
k", 0, LSIO_PWM_1_LPCG, 24, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM2_IPG_CLK, "pwm2_lpcg_ipg_clk", "pwm2_clk", 0, LSI=
O_PWM_2_LPCG, 0, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM2_IPG_HF_CLK, "pwm2_lpcg_ipg_hf_clk", "pwm2_clk", =
0, LSIO_PWM_2_LPCG, 4, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM2_IPG_S_CLK, "pwm2_lpcg_ipg_s_clk", "pwm2_clk", 0,=
 LSIO_PWM_2_LPCG, 16, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM2_IPG_SLV_CLK, "pwm2_lpcg_ipg_slv_clk", "lsio_bus_=
clk_root", 0, LSIO_PWM_2_LPCG, 20, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM2_IPG_MSTR_CLK, "pwm2_lpcg_ipg_mstr_clk", "pwm2_cl=
k", 0, LSIO_PWM_2_LPCG, 24, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM3_IPG_CLK, "pwm3_lpcg_ipg_clk", "pwm3_clk", 0, LSI=
O_PWM_3_LPCG, 0, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM3_IPG_HF_CLK, "pwm3_lpcg_ipg_hf_clk", "pwm3_clk", =
0, LSIO_PWM_3_LPCG, 4, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM3_IPG_S_CLK, "pwm3_lpcg_ipg_s_clk", "pwm3_clk", 0,=
 LSIO_PWM_3_LPCG, 16, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM3_IPG_SLV_CLK, "pwm3_lpcg_ipg_slv_clk", "lsio_bus_=
clk_root", 0, LSIO_PWM_3_LPCG, 20, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM3_IPG_MSTR_CLK, "pwm3_lpcg_ipg_mstr_clk", "pwm3_cl=
k", 0, LSIO_PWM_3_LPCG, 24, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM4_IPG_CLK, "pwm4_lpcg_ipg_clk", "pwm4_clk", 0, LSI=
O_PWM_4_LPCG, 0, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM4_IPG_HF_CLK, "pwm4_lpcg_ipg_hf_clk", "pwm4_clk", =
0, LSIO_PWM_4_LPCG, 4, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM4_IPG_S_CLK, "pwm4_lpcg_ipg_s_clk", "pwm4_clk", 0,=
 LSIO_PWM_4_LPCG, 16, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM4_IPG_SLV_CLK, "pwm4_lpcg_ipg_slv_clk", "lsio_bus_=
clk_root", 0, LSIO_PWM_4_LPCG, 20, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM4_IPG_MSTR_CLK, "pwm4_lpcg_ipg_mstr_clk", "pwm4_cl=
k", 0, LSIO_PWM_4_LPCG, 24, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM5_IPG_CLK, "pwm5_lpcg_ipg_clk", "pwm5_clk", 0, LSI=
O_PWM_5_LPCG, 0, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM5_IPG_HF_CLK, "pwm5_lpcg_ipg_hf_clk", "pwm5_clk", =
0, LSIO_PWM_5_LPCG, 4, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM5_IPG_S_CLK, "pwm5_lpcg_ipg_s_clk", "pwm5_clk", 0,=
 LSIO_PWM_5_LPCG, 16, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM5_IPG_SLV_CLK, "pwm5_lpcg_ipg_slv_clk", "lsio_bus_=
clk_root", 0, LSIO_PWM_5_LPCG, 20, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM5_IPG_MSTR_CLK, "pwm5_lpcg_ipg_mstr_clk", "pwm5_cl=
k", 0, LSIO_PWM_5_LPCG, 24, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM6_IPG_CLK, "pwm6_lpcg_ipg_clk", "pwm6_clk", 0, LSI=
O_PWM_6_LPCG, 0, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM6_IPG_HF_CLK, "pwm6_lpcg_ipg_hf_clk", "pwm6_clk", =
0, LSIO_PWM_6_LPCG, 4, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM6_IPG_S_CLK, "pwm6_lpcg_ipg_s_clk", "pwm6_clk", 0,=
 LSIO_PWM_6_LPCG, 16, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM6_IPG_SLV_CLK, "pwm6_lpcg_ipg_slv_clk", "lsio_bus_=
clk_root", 0, LSIO_PWM_6_LPCG, 20, 0, },
+	{ IMX8QXP_LSIO_LPCG_PWM6_IPG_MSTR_CLK, "pwm6_lpcg_ipg_mstr_clk", "pwm6_cl=
k", 0, LSIO_PWM_6_LPCG, 24, 0, },
+};
+
+static const struct imx8qxp_ss_lpcg imx8qxp_ss_lsio =3D {
+	.lpcg =3D imx8qxp_lpcg_lsio,
+	.num_lpcg =3D ARRAY_SIZE(imx8qxp_lpcg_lsio),
+	.num_max =3D IMX8QXP_LSIO_LPCG_CLK_END,
+};
+
+static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D dev->of_node;
+	struct clk_hw_onecell_data *clk_data;
+	const struct imx8qxp_ss_lpcg *ss_lpcg;
+	const struct imx8qxp_lpcg_data *lpcg;
+	struct resource *res;
+	struct clk_hw **clks;
+	void __iomem *base;
+	int i;
+
+	ss_lpcg =3D of_device_get_match_data(dev);
+	if (!ss_lpcg)
+		return -ENODEV;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base =3D devm_ioremap(dev, res->start, resource_size(res));
+	if (!base)
+		return -ENOMEM;
+
+	clk_data =3D devm_kzalloc(&pdev->dev, struct_size(clk_data, hws,
+				ss_lpcg->num_max), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num =3D ss_lpcg->num_max;
+	clks =3D clk_data->hws;
+
+	for (i =3D 0; i < ss_lpcg->num_lpcg; i++) {
+		lpcg =3D ss_lpcg->lpcg + i;
+		clks[lpcg->id] =3D imx_clk_lpcg_scu(lpcg->name, lpcg->parent,
+						  lpcg->flags, base + lpcg->offset,
+						  lpcg->bit_idx, lpcg->hw_gate);
+	}
+
+	for (i =3D 0; i < clk_data->num; i++) {
+		if (IS_ERR(clks[i]))
+			pr_warn("i.MX clk %u: register failed with %ld\n",
+				i, PTR_ERR(clks[i]));
+	}
+
+	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+}
+
+static const struct of_device_id imx8qxp_lpcg_match[] =3D {
+	{ .compatible =3D "fsl,imx8qxp-lpcg-adma", &imx8qxp_ss_adma, },
+	{ .compatible =3D "fsl,imx8qxp-lpcg-conn", &imx8qxp_ss_conn, },
+	{ .compatible =3D "fsl,imx8qxp-lpcg-lsio", &imx8qxp_ss_lsio, },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver imx8qxp_lpcg_clk_driver =3D {
+	.driver =3D {
+		.name =3D "imx8qxp-lpcg-clk",
+		.of_match_table =3D imx8qxp_lpcg_match,
+		.suppress_bind_attrs =3D true,
+	},
+	.probe =3D imx8qxp_lpcg_clk_probe,
+};
+
+builtin_platform_driver(imx8qxp_lpcg_clk_driver);
diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.h b/drivers/clk/imx/clk-imx8q=
xp-lpcg.h
new file mode 100644
index 0000000..2a37ce5
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2018 NXP
+ *   Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#ifndef _IMX8QXP_LPCG_H
+#define _IMX8QXP_LPCG_H
+
+/*LSIO SS */
+#define LSIO_PWM_0_LPCG			0x00000
+#define LSIO_PWM_1_LPCG			0x10000
+#define LSIO_PWM_2_LPCG			0x20000
+#define LSIO_PWM_3_LPCG			0x30000
+#define LSIO_PWM_4_LPCG			0x40000
+#define LSIO_PWM_5_LPCG			0x50000
+#define LSIO_PWM_6_LPCG			0x60000
+#define LSIO_PWM_7_LPCG			0x70000
+#define LSIO_GPIO_0_LPCG		0x80000
+#define LSIO_GPIO_1_LPCG		0x90000
+#define LSIO_GPIO_2_LPCG		0xa0000
+#define LSIO_GPIO_3_LPCG		0xb0000
+#define LSIO_GPIO_4_LPCG		0xc0000
+#define LSIO_GPIO_5_LPCG		0xd0000
+#define LSIO_GPIO_6_LPCG		0xe0000
+#define LSIO_GPIO_7_LPCG		0xf0000
+#define LSIO_FSPI_0_LPCG		0x120000
+#define LSIO_FSPI_1_LPCG		0x130000
+#define LSIO_GPT_0_LPCG			0x140000
+#define LSIO_GPT_1_LPCG			0x150000
+#define LSIO_GPT_2_LPCG			0x160000
+#define LSIO_GPT_3_LPCG			0x170000
+#define LSIO_GPT_4_LPCG			0x180000
+#define LSIO_OCRAM_LPCG			0x190000
+#define LSIO_KPP_LPCG			0x1a0000
+#define LSIO_ROMCP_LPCG			0x100000
+
+/* Connectivity SS */
+#define CONN_USDHC_0_LPCG		0x00000
+#define CONN_USDHC_1_LPCG		0x10000
+#define CONN_USDHC_2_LPCG		0x20000
+#define CONN_ENET_0_LPCG		0x30000
+#define CONN_ENET_1_LPCG		0x40000
+#define CONN_DTCP_LPCG			0x50000
+#define CONN_MLB_LPCG			0x60000
+#define CONN_USB_2_LPCG			0x70000
+#define CONN_USB_3_LPCG			0x80000
+#define CONN_NAND_LPCG			0x90000
+#define CONN_EDMA_LPCG			0xa0000
+
+/* ADMA SS */
+#define ADMA_ASRC_0_LPCG		0x400000
+#define ADMA_ESAI_0_LPCG		0x410000
+#define ADMA_SPDIF_0_LPCG		0x420000
+#define ADMA_SAI_0_LPCG			0x440000
+#define ADMA_SAI_1_LPCG			0x450000
+#define ADMA_SAI_2_LPCG			0x460000
+#define ADMA_SAI_3_LPCG			0x470000
+#define ADMA_GPT_5_LPCG			0x4b0000
+#define ADMA_GPT_6_LPCG			0x4c0000
+#define ADMA_GPT_7_LPCG			0x4d0000
+#define ADMA_GPT_8_LPCG			0x4e0000
+#define ADMA_GPT_9_LPCG			0x4f0000
+#define ADMA_GPT_10_LPCG		0x500000
+#define ADMA_HIFI_LPCG			0x580000
+#define ADMA_OCRAM_LPCG			0x590000
+#define ADMA_EDMA_0_LPCG		0x5f0000
+#define ADMA_ASRC_1_LPCG		0xc00000
+#define ADMA_SAI_4_LPCG			0xc20000
+#define ADMA_SAI_5_LPCG			0xc30000
+#define ADMA_AMIX_LPCG			0xc40000
+#define ADMA_MQS_LPCG			0xc50000
+#define ADMA_ACM_LPCG			0xc60000
+#define ADMA_REC_CLK0_LPCG		0xd00000
+#define ADMA_REC_CLK1_LPCG		0xd10000
+#define ADMA_PLL_CLK0_LPCG		0xd20000
+#define ADMA_PLL_CLK1_LPCG		0xd30000
+#define ADMA_MCLKOUT0_LPCG		0xd50000
+#define ADMA_MCLKOUT1_LPCG		0xd60000
+#define ADMA_EDMA_1_LPCG		0xdf0000
+#define ADMA_LPSPI_0_LPCG		0x1400000
+#define ADMA_LPSPI_1_LPCG		0x1410000
+#define ADMA_LPSPI_2_LPCG		0x1420000
+#define ADMA_LPSPI_3_LPCG		0x1430000
+#define ADMA_LPUART_0_LPCG		0x1460000
+#define ADMA_LPUART_1_LPCG		0x1470000
+#define ADMA_LPUART_2_LPCG		0x1480000
+#define ADMA_LPUART_3_LPCG		0x1490000
+#define ADMA_LCD_LPCG			0x1580000
+#define ADMA_PWM_LPCG			0x1590000
+#define ADMA_LPI2C_0_LPCG		0x1c00000
+#define ADMA_LPI2C_1_LPCG		0x1c10000
+#define ADMA_LPI2C_2_LPCG		0x1c20000
+#define ADMA_LPI2C_3_LPCG		0x1c30000
+#define ADMA_ADC_0_LPCG			0x1c80000
+#define ADMA_FTM_0_LPCG			0x1ca0000
+#define ADMA_FTM_1_LPCG			0x1cb0000
+#define ADMA_FLEXCAN_0_LPCG		0x1cd0000
+#define ADMA_FLEXCAN_1_LPCG		0x1ce0000
+#define ADMA_FLEXCAN_2_LPCG		0x1cf0000
+
+#endif /* _IMX8QXP_LPCG_H */
--=20
2.7.4

