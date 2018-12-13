Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53687C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 15:43:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEBE420879
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 15:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OtKBQkA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEBE420879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbeLMPnH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 10:43:07 -0500
Received: from mail-eopbgr30051.outbound.protection.outlook.com ([40.107.3.51]:46007
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728111AbeLMPnG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 10:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyuKpW38P/NNlrTm/84Pbjdj5Syg63Ipw6zsadeSXlg=;
 b=OtKBQkA3YnC1qZ5W0xGJfcEb5trz5FbEp4rwZSYzzTe6E0tLHEUjsG6uXvSmV0kGPnjwvW3pKNx6mVXVG1wmBpVsxKyWj8L0eYnVwJpRzHwntk5zLdpBLUpPohkwrJNcUmDfrYGG+vJR7idaZ7C/16bWn/CtTJHakeT7mC0iSk0=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5873.eurprd04.prod.outlook.com (20.178.117.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.19; Thu, 13 Dec 2018 15:42:58 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Thu, 13 Dec 2018
 15:42:58 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V12 3/5] clk: imx: add imx8qxp clk driver
Thread-Topic: [PATCH V12 3/5] clk: imx: add imx8qxp clk driver
Thread-Index: AQHUkvqFmtangx+llEy4k0CJpc1/3Q==
Date:   Thu, 13 Dec 2018 15:42:58 +0000
Message-ID: <1544715442-8902-4-git-send-email-aisheng.dong@nxp.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5873;6:tXrG8esHEKybyp+Zgxp7Lukvpp4lBHR1ahKZItUmP9pi/YWcajnOX/SoSgU9lErCySXsTb2h1MIJ9IcnmzoHqQXKc0sL3Ua/Kyzx7YXa1Hy+KIhkjbC3cBjHDwrtNjjOhw5gv0sATRYCWkbPJueIa2vxnyXyr/vqW5WdDGPSI/4fXb1XnYKFUySAjljT94vmbCEtSeSBWrEiZpS35TL8We1KYeiOs65P7H8cDtIMjzqAbQIzWigNFuYRSayx5yfvja5ta2QXXGcpZNZz+nkwMIpWcStysKQrFqf9EOrO0BhZ/+nL8VuyTJJuRt0OJD4VVq1K4oruus0wc6tsBecwpELzxDw9RB6/m8SE9IIEAkcI2P+piCidLrVUYKgEVaQqOr19zNm49ZMIzIjlGsl5a5jWHJnhbJopq+Sg58LHJipVGDWjtHIL1f3c2lY7fO63yPUnlsiXT3/ks6OjF0TRjw==;5:9biq4QaXnYWM+EclFFRGYoUln9cBTj0Kpvfpw8P3LvMwNBzquDj3lUrIyCncRLznhAa+X8fQu1nKdG9vcIzYhyL9kv98Xkl9EAfIRE710RXGhMWBs8L8fK3CXwN8tWGqf4NhcQ/hMarNVyro7kIOXuaCtDnKgcUUqNni230/Ktc=;7:d2Uh1LomfYxdK9YOGhj6vmYFSJ8FzrjcCYez5O1MATS1pVQPwyal+FvDp3RqdKzg0GZ6ZW3o6YjJfG+BQ43/elYgcE3DGCIONXwMLDk0j5gH7lG8jofAZR4CdCnRWbuIBNlpTCzRWYRBKnnukiTa7A==
x-ms-office365-filtering-correlation-id: 3c866085-0b53-4515-5d32-08d66111a7bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5873;
x-ms-traffictypediagnostic: AM0PR04MB5873:
x-microsoft-antispam-prvs: <AM0PR04MB5873C1BF8DD4490881A4A9BB80A00@AM0PR04MB5873.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5873;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5873;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(366004)(54534003)(189003)(199004)(446003)(50226002)(8676002)(478600001)(2906002)(52116002)(6436002)(106356001)(4744004)(76176011)(53936002)(36756003)(14444005)(256004)(4326008)(68736007)(2501003)(14454004)(71190400001)(71200400001)(6512007)(3846002)(7736002)(316002)(6116002)(486006)(6486002)(6916009)(5640700003)(44832011)(86362001)(99286004)(25786009)(11346002)(102836004)(5660300001)(54906003)(2351001)(66066001)(105586002)(386003)(8936002)(2616005)(476003)(305945005)(97736004)(81166006)(81156014)(6506007)(26005)(186003)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5873;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: AvBB+wGm1QDKG2WYmYE7EBIyL5G05ZZ+2yWTLabnvdJXDYADn4e+J85T11U1Sjca7P9a2Z/YCQQMweZ/jbuwjSetNXARhE5erHvH65tL0aWGxDBN9LCs998r73izK+wbk4a+PD/0aNTyC6p2MuoQFnEap6EY6zZmmHrWzR/rZ1K4HlhSrSo9X+YaYPG2wIV02Ni2Z/l/fgf9zjj5UJW2W8vkpips6K5Mb4zHep9mdwcZneRhHrcKtyFg7OLO4C6NWieBO6orCMGGZsb2axsK1b7ZwUz+o+jMY2Vu1aLmAu0XCIVP8l5uSw7TPnzorUHo
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c866085-0b53-4515-5d32-08d66111a7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 15:42:58.0980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5873
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
v11->v12:
 * remove dependency of CONFIG_SOC_IMX8QXP which will be deleted later
v10->v11:
 * no changes
v9->v10:
 * fix a typo of SPI1 clock
v8->v9:
 * no changes
v7->v8:
 * move dt headfiles after normal linux headfiles according to
   Stephen's former suggestions
v6->v7:
 * use struct_size()
 * remove MODULE_ macros
 * add suppress_bind_attrs
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
 drivers/clk/imx/Kconfig       |   7 ++
 drivers/clk/imx/Makefile      |   2 +
 drivers/clk/imx/clk-imx8qxp.c | 153 ++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8qxp.c

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 2a3b58d..a509a8f 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -7,3 +7,10 @@ config MXC_CLK
 config MXC_CLK_SCU
 	bool
 	depends on IMX_SCU
+
+config CLK_IMX8QXP
+	bool "IMX8QXP SCU Clock"
+	depends on ARCH_MXC && IMX_SCU && ARM64
+	select MXC_CLK_SCU
+	help
+	  Build the driver for IMX8QXP SCU based clocks.
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 4abed37..31c19c5 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -39,3 +39,5 @@ obj-$(CONFIG_SOC_IMX7D)  +=3D clk-imx7d.o
 obj-$(CONFIG_SOC_IMX7ULP) +=3D clk-imx7ulp.o
 obj-$(CONFIG_SOC_IMX8MQ) +=3D clk-imx8mq.o
 obj-$(CONFIG_SOC_VF610)  +=3D clk-vf610.o
+
+obj-$(CONFIG_CLK_IMX8QXP) +=3D clk-imx8qxp.o
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
new file mode 100644
index 0000000..33c9396
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -0,0 +1,153 @@
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
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "clk-scu.h"
+
+#include <dt-bindings/clock/imx8qxp-clock.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
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
+	clk_data =3D devm_kzalloc(&pdev->dev, struct_size(clk_data, hws,
+				IMX8QXP_SCU_CLK_END), GFP_KERNEL);
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
m_clk_root", NULL, 0, 200000000);
+	clks[IMX8QXP_LSIO_BUS_CLK]		=3D clk_hw_register_fixed_rate(NULL, "lsio_bu=
s_clk_root", NULL, 0, 100000000);
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
+	clks[IMX8QXP_ADMA_SPI1_CLK]		=3D imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1,=
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
+			pr_warn("i.MX clk %u: register failed with %ld\n",
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
+		.suppress_bind_attrs =3D true,
+	},
+	.probe =3D imx8qxp_clk_probe,
+};
+builtin_platform_driver(imx8qxp_clk_driver);
--=20
2.7.4

