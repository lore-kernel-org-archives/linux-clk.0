Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C54C43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DED620858
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="uDQkmvAC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DED620858
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbeKKBF4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 20:05:56 -0500
Received: from mail-db5eur01on0042.outbound.protection.outlook.com ([104.47.2.42]:53175
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726188AbeKKBF4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 10 Nov 2018 20:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yxWOUznSPD3cjrS1C/527i9+q6urHWpHEVQbTpwWkI=;
 b=uDQkmvACM73Bz8W2IW99q+svAH90qkNydRiod++lhdXv/gQyHfPdgNPYYIya1C5NT/XotarKoIDxztZoM/346iRAXeMHqdhEyS1+OatyNAkGcVcR+NoZ67bXwLrLNWUjfDJN5qwUMJZOBdXGHVOmVqfLTUcTDN0HBjJ/9DjreC4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4067.eurprd04.prod.outlook.com (52.134.125.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Sat, 10 Nov 2018 15:19:57 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.039; Sat, 10 Nov 2018
 15:19:57 +0000
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
Subject: [PATCH V6 3/6] clk: imx: add imx8qxp clk driver
Thread-Topic: [PATCH V6 3/6] clk: imx: add imx8qxp clk driver
Thread-Index: AQHUeQjWqkUj1uuXJU+3+M1gdnfDIA==
Date:   Sat, 10 Nov 2018 15:19:57 +0000
Message-ID: <1541862894-8209-4-git-send-email-aisheng.dong@nxp.com>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:203:2e::36) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4067;6:bW2hNT+HRZmuYGmsCDiT3o3Rz2nnSHoLvTD+zuy02wSUZ/yMDGpBjy1q4fjgv96W4M+glDM0FhG1xoAWR/PpUmMPZO38kalksCWQXus9G267V2dhSWOAVeHDTJV4PrI+tBJGyAKBJGciRbgYuC247BbfDcuPWHuV9IchNwPQCo4eg6sVcXAPqWZTN5mNjkB9xY07YpubR17lac8dC8dDDxWGr/gDdHspDsVVuodz2w1pPPF7+ZPuks3FYTOF46qNQNHfU8tJHnEvrG1wHIP23Yei59dfoU+EU777bm2QweolmcOQakEvhTz2cdqD22J7g3DST6e00Jb9OyvtX6m1CKvZNcDIh0xt0n27rSLUAPRZyrSOeIDTZu8yN0s7oGPuchIyaDctFhDdvMb76yyUdoN+awlgxeVOWVMRNEQ2z0soGDbsFX3Gg9+Ow8lEgEQExZW/ddYtRjafBdfi5Bvu2Q==;5:mUEODQy7cXiCsAdgRkJGWeeCgtKPrsd2GBFRKSecvKK8ncmmFyYbKbzjzBD2aK3uGV/tyOFK8V/bMByKvTtZBGbNZ6uFH/zCGPO5cAav7zvZWSUqw0VS/5Cm269WNxw7hO/zz8lsEXGg3M5yWkGKxytyFduMsUjNHhhysuxTbJ0=;7:t5PFKq6Tof3ngBjfe2kbbrflpVTwsTHY3sl9D4MhaaZy37GNFUnmMVB41dMKSfBX9gmOYLnBTKkm1Ukxe9WNW05pFLpUeQv9wUKn7MfI+L8zzB4qL4lM5qd2YlWDlg98uoO2VXJaQpnKOOTZCzfBvg==
x-ms-office365-filtering-correlation-id: 77bebbc7-117c-4ef5-bc38-08d6471ff939
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4067;
x-ms-traffictypediagnostic: AM0PR04MB4067:
x-microsoft-antispam-prvs: <AM0PR04MB4067EE0123B641EB6B49CBFA80C70@AM0PR04MB4067.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4067;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4067;
x-forefront-prvs: 0852EB6797
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(366004)(39850400004)(136003)(54534003)(189003)(199004)(2501003)(25786009)(50226002)(71190400001)(4326008)(97736004)(2900100001)(14454004)(8676002)(99286004)(76176011)(186003)(8936002)(53936002)(52116002)(5660300001)(102836004)(81156014)(81166006)(68736007)(446003)(386003)(11346002)(26005)(71200400001)(486006)(6512007)(6506007)(66066001)(5640700003)(2616005)(476003)(7736002)(305945005)(86362001)(6116002)(6486002)(3846002)(36756003)(6436002)(316002)(54906003)(478600001)(105586002)(106356001)(256004)(6916009)(14444005)(2906002)(2351001)(4744004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4067;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: S5HU9/W7+ALvlXh/7Ok3w8fZNqxVaps3iJoBYtdumcJ1/3zlksokikY/DEQrFOg2L78vAH8eRoDhvqVodbfZDNqVGN3se1j13x//bFpCz3dfXlQBOGvQiknNb6p3NWoC7AxILnjXO6Dych0brbYfnhusbU1SaWo/zhmBhk3VIM/S7dRr7A2xs+LcjgVVesD6dhlsmsX4frDlTMv9cEaOOTSmXG6tOy/JhQk0WmXZjuqcSee2bT8/WKxfSdkU44QprrnpgId9ELP57Ym6OpxU01o3oI2LAxPwaTXLnKvlhHeFxFBVs97y3ItR3HoGWgZWLGz4daKemGELiXvXuTRPpvN36tQGx9yBGCpmgZ1v+e0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bebbc7-117c-4ef5-bc38-08d6471ff939
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2018 15:19:57.5426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4067
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imx8qxp clk driver which is based on SCU firmware clock service.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v5->v6:
 * changed to new scu clock type imx_clk_scu
   clk number is reduced signifcantly
 * moved lpcgs clock out into separate driver
v4->v5:
 Address all comments from Stephen
 * more unique name for clk_data
 * remove void __iomem * cast for LPCG physical address
 * move out external fixed clk definition
 * drop using of imx_clk_hw_fixed and imx_check_clk_hws wrappers
 * remove i'm alive message
 * move scu clk files into imx top directory
v3->v4:
 * scu headfile path update
v2->v3:
 * enum name update
v1->v2:
 * no changes except headfile name updated
---
 drivers/clk/imx/Makefile      |   2 +
 drivers/clk/imx/clk-imx8qxp.c | 156 ++++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 158 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8qxp.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index eec6d72..8369a34 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -30,3 +30,5 @@ obj-$(CONFIG_SOC_IMX6SX) +=3D clk-imx6sx.o
 obj-$(CONFIG_SOC_IMX6UL) +=3D clk-imx6ul.o
 obj-$(CONFIG_SOC_IMX7D)  +=3D clk-imx7d.o
 obj-$(CONFIG_SOC_VF610)  +=3D clk-vf610.o
+
+obj-$(CONFIG_SOC_IMX8QXP)	+=3D clk-imx8qxp.o
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
new file mode 100644
index 0000000..d1b288c
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <dt-bindings/clock/imx8qxp-clock.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "clk-scu.h"
+
+static int imx8qxp_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *ccm_node =3D pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clks;
+	int ret, i;
+
+	ret =3D imx_clk_scu_init();
+	if (ret)
+		return ret;
+
+	clk_data =3D devm_kzalloc(&pdev->dev, sizeof(*clk_data) +
+				sizeof(*clk_data->hws) * IMX8QXP_SCU_CLK_END,
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num =3D IMX8QXP_SCU_CLK_END;
+	clks =3D clk_data->hws;
+
+	/* Fixed clocks */
+	clks[IMX8QXP_CLK_DUMMY]			=3D clk_hw_register_fixed_rate(NULL, "dummy", N=
ULL, 0, 0);
+	clks[IMX8QXP_ADMA_IPG_CLK_ROOT] 	=3D clk_hw_register_fixed_rate(NULL, "dm=
a_ipg_clk_root", NULL, 0, 120000000);
+	clks[IMX8QXP_CONN_AXI_CLK_ROOT]		=3D clk_hw_register_fixed_rate(NULL, "co=
nn_axi_clk_root", NULL, 0, 333333333);
+	clks[IMX8QXP_CONN_AHB_CLK_ROOT]		=3D clk_hw_register_fixed_rate(NULL, "co=
nn_ahb_clk_root", NULL, 0, 166666666);
+	clks[IMX8QXP_CONN_IPG_CLK_ROOT]		=3D clk_hw_register_fixed_rate(NULL, "co=
nn_ipg_clk_root", NULL, 0, 83333333);
+	clks[IMX8QXP_DC_AXI_EXT_CLK]		=3D clk_hw_register_fixed_rate(NULL, "dc_ax=
i_ext_clk_root", NULL, 0, 800000000);
+	clks[IMX8QXP_DC_AXI_INT_CLK]		=3D clk_hw_register_fixed_rate(NULL, "dc_ax=
i_int_clk_root", NULL, 0, 400000000);
+	clks[IMX8QXP_DC_CFG_CLK]		=3D clk_hw_register_fixed_rate(NULL, "dc_cfg_cl=
k_root", NULL, 0, 100000000);
+	clks[IMX8QXP_MIPI_IPG_CLK]		=3D clk_hw_register_fixed_rate(NULL, "mipi_ip=
g_clk_root", NULL, 0, 120000000);
+	clks[IMX8QXP_IMG_AXI_CLK]		=3D clk_hw_register_fixed_rate(NULL, "img_axi_=
clk_root", NULL, 0, 400000000);
+	clks[IMX8QXP_IMG_IPG_CLK]		=3D clk_hw_register_fixed_rate(NULL, "img_ipg_=
clk_root", NULL, 0, 200000000);
+	clks[IMX8QXP_IMG_PXL_CLK]		=3D clk_hw_register_fixed_rate(NULL, "img_pxl_=
clk_root", NULL, 0, 600000000);
+	clks[IMX8QXP_HSIO_AXI_CLK]		=3D clk_hw_register_fixed_rate(NULL, "hsio_ax=
i_clk_root", NULL, 0, 400000000);
+	clks[IMX8QXP_HSIO_PER_CLK]		=3D clk_hw_register_fixed_rate(NULL, "hsio_pe=
r_clk_root", NULL, 0, 133333333);
+	clks[IMX8QXP_LSIO_MEM_CLK]		=3D clk_hw_register_fixed_rate(NULL, "lsio_me=
m_clk_root", NULL, 0, 100000000);
+	clks[IMX8QXP_LSIO_BUS_CLK]		=3D clk_hw_register_fixed_rate(NULL, "lsio_bu=
s_clk_root", NULL, 0, 200000000);
+
+	/* ARM core */
+	clks[IMX8QXP_A35_CLK]			=3D imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_P=
M_CLK_CPU);
+
+	/* LSIO SS */
+	clks[IMX8QXP_LSIO_PWM0_CLK]		=3D imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM1_CLK]		=3D imx_clk_scu("pwm1_clk", IMX_SC_R_PWM_1, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM2_CLK]		=3D imx_clk_scu("pwm2_clk", IMX_SC_R_PWM_2, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM3_CLK]		=3D imx_clk_scu("pwm3_clk", IMX_SC_R_PWM_3, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM4_CLK]		=3D imx_clk_scu("pwm4_clk", IMX_SC_R_PWM_4, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM5_CLK]		=3D imx_clk_scu("pwm5_clk", IMX_SC_R_PWM_5, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM6_CLK]		=3D imx_clk_scu("pwm6_clk", IMX_SC_R_PWM_6, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM7_CLK]		=3D imx_clk_scu("pwm7_clk", IMX_SC_R_PWM_7, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT0_CLK]		=3D imx_clk_scu("gpt0_clk", IMX_SC_R_GPT_0, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT1_CLK]		=3D imx_clk_scu("gpt1_clk", IMX_SC_R_GPT_1, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT2_CLK]		=3D imx_clk_scu("gpt2_clk", IMX_SC_R_GPT_2, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT3_CLK]		=3D imx_clk_scu("gpt3_clk", IMX_SC_R_GPT_3, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT4_CLK]		=3D imx_clk_scu("gpt4_clk", IMX_SC_R_GPT_4, =
IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_FSPI0_CLK]		=3D imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_=
0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_FSPI1_CLK]		=3D imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_=
1, IMX_SC_PM_CLK_PER);
+
+	/* ADMA SS */
+	clks[IMX8QXP_ADMA_UART0_CLK]		=3D imx_clk_scu("uart0_clk", IMX_SC_R_UART_=
0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_UART1_CLK]		=3D imx_clk_scu("uart1_clk", IMX_SC_R_UART_=
1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_UART2_CLK]		=3D imx_clk_scu("uart2_clk", IMX_SC_R_UART_=
2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_UART3_CLK]		=3D imx_clk_scu("uart3_clk", IMX_SC_R_UART_=
3, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_SPI0_CLK]		=3D imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_SPI1_CLK]		=3D imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_2,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_SPI2_CLK]		=3D imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_SPI3_CLK]		=3D imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_CAN0_CLK]		=3D imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_I2C0_CLK]		=3D imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_I2C1_CLK]		=3D imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_I2C2_CLK]		=3D imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_I2C3_CLK]		=3D imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_FTM0_CLK]		=3D imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_FTM1_CLK]		=3D imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_ADC0_CLK]		=3D imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_PWM_CLK]		=3D imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_P=
WM_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADMA_LCD_CLK]		=3D imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, =
IMX_SC_PM_CLK_PER);
+
+	/* Connectivity */
+	clks[IMX8QXP_CONN_SDHC0_CLK]		=3D imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_=
0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CONN_SDHC1_CLK]		=3D imx_clk_scu("sdhc1_clk", IMX_SC_R_SDHC_=
1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CONN_SDHC2_CLK]		=3D imx_clk_scu("sdhc2_clk", IMX_SC_R_SDHC_=
2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CONN_ENET0_ROOT_CLK]	=3D imx_clk_scu("enet0_clk", IMX_SC_R_E=
NET_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CONN_ENET0_BYPASS_CLK]	=3D imx_clk_scu("enet0_bypass_clk", I=
MX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS);
+	clks[IMX8QXP_CONN_ENET0_RGMII_CLK]	=3D imx_clk_scu("enet0_rgmii_clk", IMX=
_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0);
+	clks[IMX8QXP_CONN_ENET1_ROOT_CLK]	=3D imx_clk_scu("enet1_clk", IMX_SC_R_E=
NET_1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CONN_ENET1_BYPASS_CLK]	=3D imx_clk_scu("enet1_bypass_clk", I=
MX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS);
+	clks[IMX8QXP_CONN_ENET1_RGMII_CLK]	=3D imx_clk_scu("enet1_rgmii_clk", IMX=
_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0);
+	clks[IMX8QXP_CONN_GPMI_BCH_IO_CLK]	=3D imx_clk_scu("gpmi_io_clk", IMX_SC_=
R_NAND, IMX_SC_PM_CLK_MST_BUS);
+	clks[IMX8QXP_CONN_GPMI_BCH_CLK]		=3D imx_clk_scu("gpmi_bch_clk", IMX_SC_R=
_NAND, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CONN_USB2_ACLK]		=3D imx_clk_scu("usb3_aclk_div", IMX_SC_R_U=
SB_2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CONN_USB2_BUS_CLK]		=3D imx_clk_scu("usb3_bus_div", IMX_SC_R=
_USB_2, IMX_SC_PM_CLK_MST_BUS);
+	clks[IMX8QXP_CONN_USB2_LPM_CLK]		=3D imx_clk_scu("usb3_lpm_div", IMX_SC_R=
_USB_2, IMX_SC_PM_CLK_MISC);
+
+	/* Display controller SS */
+	clks[IMX8QXP_DC0_DISP0_CLK]		=3D imx_clk_scu("dc0_disp0_clk", IMX_SC_R_DC=
_0, IMX_SC_PM_CLK_MISC0);
+	clks[IMX8QXP_DC0_DISP1_CLK]		=3D imx_clk_scu("dc0_disp1_clk", IMX_SC_R_DC=
_0, IMX_SC_PM_CLK_MISC1);
+
+	/* MIPI-LVDS SS */
+	clks[IMX8QXP_MIPI0_I2C0_CLK]		=3D imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_=
MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2);
+	clks[IMX8QXP_MIPI0_I2C1_CLK]		=3D imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_=
MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2);
+
+	/* MIPI CSI SS */
+	clks[IMX8QXP_CSI0_CORE_CLK]		=3D imx_clk_scu("mipi_csi0_core_clk", IMX_SC=
_R_CSI_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CSI0_ESC_CLK]		=3D imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_=
R_CSI_0, IMX_SC_PM_CLK_MISC);
+	clks[IMX8QXP_CSI0_I2C0_CLK]		=3D imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC=
_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CSI0_PWM0_CLK]		=3D imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC=
_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER);
+
+	/* GPU SS */
+	clks[IMX8QXP_GPU0_CORE_CLK]		=3D imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_G=
PU_0_PID0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_GPU0_SHADER_CLK]		=3D imx_clk_scu("gpu_shader0_clk", IMX_SC_=
R_GPU_0_PID0, IMX_SC_PM_CLK_MISC);
+
+	for (i =3D 0; i < clk_data->num; i++) {
+		if (IS_ERR(clks[i]))
+			pr_err("i.MX clk %u: register failed with %ld\n",
+				i, PTR_ERR(clks[i]));
+	}
+
+	return of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
+}
+
+static const struct of_device_id imx8qxp_match[] =3D {
+	{ .compatible =3D "fsl,imx8qxp-clk", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver imx8qxp_clk_driver =3D {
+	.driver =3D {
+		.name =3D "imx8qxp-clk",
+		.of_match_table =3D imx8qxp_match,
+	},
+	.probe =3D imx8qxp_clk_probe,
+};
+builtin_platform_driver(imx8qxp_clk_driver);
+
+MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("IMX8QXP Clock driver");
+MODULE_LICENSE("GPL v2");
--=20
2.7.4

