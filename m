Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DFCECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58B122086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="NpkKQka4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58B122086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbeJSA4R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:56:17 -0400
Received: from mail-eopbgr80077.outbound.protection.outlook.com ([40.107.8.77]:64432
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728496AbeJSA4Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/xys3YUAKknqqUpmyJ30H4dFdZ3QefghCzQa+i3kJw=;
 b=NpkKQka4O6Sho0Nfx/Egkh8HUEeen/Xub8cHMRbzWkmzFm1rTOOP6KPaE+6JlfLBRdIPmOyDSFbigpKD8tdPjkoWvVx1vkKr3vZoyYfTgkPd58Y1eSgqlLCw3UWptsC4wcvUey8xKjWl8RByZTDgKqD0hpI+MOfCpbuqajhprGs=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5233.eurprd04.prod.outlook.com (20.177.42.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Thu, 18 Oct 2018 16:54:15 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:54:15 +0000
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
Subject: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Thread-Topic: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Thread-Index: AQHUZwMzoA17UBIsSkGVKzG2jHXioQ==
Date:   Thu, 18 Oct 2018 16:54:15 +0000
Message-ID: <1539881347-20871-10-git-send-email-aisheng.dong@nxp.com>
References: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0P153CA0028.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::16) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5233;6:hAp6jANzQRaJezNqvhyLVH9vFKIOljaM/DIffCj+ceyWDHWS4uu7V40v0aKU9TzWyFM8gY5WBqkpRv7a52a2S2GOzeFCRTnhPEh/cu9XXJuz3Ze74ZGWUkDO9AzsdNwBK3kMpcaSrFkj8U79oyqL175PrbiQUKecKWMVHv30ZtgrPHVWCSsCvgDP1hoZqcL2t0bPBOG5yPDXA68ReTlJtZKG6wmfd35IuHWiNDEXFM2fnZM13X9zr2aWY8z2tP2hAKQLOUlBPF5OPJuav1Wp/YpXzGUzuCpVvUinw5g1Rgxy06i9D+LJ+CaQnPKLobq92tMSEhnG5dzeUa2B6aN/OuilZTY036YhwRKGWI0ODMZ1MEbL2uER+b7YTwsM8JHsIYMhuQXMCPYDwnpukovoVn2rBDFQ1Hw56b1uy7RM6boNSoEjvuonYJrlWGk1SsQ1u1ZZw5LqHLe67PyyVrN22g==;5:B/l+ncIpSP1s0h1DW/ejBKiKDgu+2IPETYhAHaXstJep5RcTArnCMRsRN93fFnWGTELISouaHD+Ai9N9sY9lLDPiVEHbsieIDBSbtDoAnXLxbX3J5VmVnvN/P6E8IVl1MFduosOaK9acAxSF60GOpOa3/hEM3xhFSwMJbEEqJt0=;7:8tnJ+CBl+5jNlIah9+KQt6lu7X4ICtrc98GZU00MDvHvU4uMJHVohDdcgEgn8FGkcMazbH+EMdu8UZDTVgSLb4wUDQ6VgLglz2e7F5DRzLi5gPp0j0wV1zbFDSsMsi4N30LfEJc7R9tCGgn7dVVRq2Fq9lmwlFjDe+NsZOg+UnBlX4X1CXzCHG+aExbKZZtDFYu/eY9TLjjaTsiNepOZA3n59jWA8vD2XHr2wpWtU1YwgBpYJzUuNtlrkZubapkT
x-ms-office365-filtering-correlation-id: 93f35459-06b8-4b54-723a-08d6351a5603
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5233;
x-ms-traffictypediagnostic: AM0PR04MB5233:
x-microsoft-antispam-prvs: <AM0PR04MB523374EC1F9D0330E578940580F80@AM0PR04MB5233.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5233;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5233;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(346002)(376002)(396003)(189003)(199004)(54534003)(305945005)(486006)(2351001)(7736002)(6116002)(3846002)(106356001)(105586002)(6512007)(2900100001)(36756003)(5250100002)(2501003)(5640700003)(508600001)(14454004)(53946003)(16200700003)(53936002)(68736007)(71190400001)(6486002)(81166006)(8676002)(4744004)(71200400001)(8936002)(50226002)(2616005)(81156014)(6436002)(25786009)(4326008)(97736004)(14444005)(5660300001)(186003)(446003)(26005)(2906002)(66066001)(256004)(386003)(54906003)(99286004)(575784001)(6506007)(316002)(476003)(86362001)(6916009)(11346002)(102836004)(76176011)(52116002)(32563001)(579004)(559001)(569006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5233;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 7PkM6xfrDbF/WnlXaVw8no8RmOkktwTDvYNI948vQm75WHlZiknXcH7l8A0bPf59CEKiKiAj17Nk+DVmCuOVpE5Oryg0Qa8is1rVZYHzu8rmmCzln+CepUoAuaHZqssiD4c5t/4R7F09dkJRf2Bg5KSf8VSTwsUpaJkT7AcQxZIfh//ZBUH1BBZCSJvankmdc8+RmukX/noa+A4W2PNQBj9Jjh5a4jcxciN+jv2MRk++ugEqFzClhZEBlLnpS54laqzSkej04tgNWx8FTE6ErxpKf4f2c0A+6vB8dp13nM3SzkesfQWHkkRLoxBUo+yxHv+s/uoABbr2FxMB2Gp39OJPxwDSJPA48xQQqrVSU8g=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f35459-06b8-4b54-723a-08d6351a5603
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:54:15.6117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5233
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
 drivers/clk/imx/Makefile                  |   2 +
 drivers/clk/imx/clk-imx8qxp.c             | 422 ++++++++++++++++++++++++++=
++++
 include/dt-bindings/clock/imx8qxp-clock.h | 362 +++++++++++++++++++++++++
 include/soc/imx/imx8qxp/lpcg.h            | 186 +++++++++++++
 4 files changed, 972 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8qxp.c
 create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
 create mode 100644 include/soc/imx/imx8qxp/lpcg.h

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index e0d327e..916a893 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -36,3 +36,5 @@ obj-$(CONFIG_SOC_IMX6SX) +=3D clk-imx6sx.o
 obj-$(CONFIG_SOC_IMX6UL) +=3D clk-imx6ul.o
 obj-$(CONFIG_SOC_IMX7D)  +=3D clk-imx7d.o
 obj-$(CONFIG_SOC_VF610)  +=3D clk-vf610.o
+
+obj-$(CONFIG_SOC_IMX8QXP)	+=3D clk-imx8qxp.o
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
new file mode 100644
index 0000000..feddf75
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <dt-bindings/clock/imx8qxp-clock.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <soc/imx/imx8qxp/lpcg.h>
+
+#include "clk-scu.h"
+
+static struct clk_hw_onecell_data *imx8qxp_clk_data;
+
+static const char * const enet_sels[] =3D { "enet_25MHz", "enet_125MHz", }=
;
+static const char * const enet0_rmii_tx_sels[] =3D { "enet0_ref_div", "dum=
my", };
+static const char * const enet1_rmii_tx_sels[] =3D { "enet1_ref_div", "dum=
my", };
+
+static int imx8qxp_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *ccm_node =3D pdev->dev.of_node;
+	struct clk_hw **clks;
+	int ret, i;
+
+	ret =3D imx_clk_scu_init();
+	if (ret)
+		return ret;
+
+	imx8qxp_clk_data =3D devm_kzalloc(&pdev->dev, sizeof(*imx8qxp_clk_data) +
+				sizeof(*imx8qxp_clk_data->hws) * IMX8QXP_CLK_END,
+				GFP_KERNEL);
+	if (!imx8qxp_clk_data)
+		return -ENOMEM;
+
+	imx8qxp_clk_data->num =3D IMX8QXP_CLK_END;
+	clks =3D imx8qxp_clk_data->hws;
+
+	/* Fixed clocks */
+	clks[IMX8QXP_CLK_DUMMY]		=3D clk_hw_register_fixed_rate(NULL, "dummy", NU=
LL, 0, 0);
+
+	clks[IMX8QXP_IPG_DMA_CLK_ROOT]  =3D clk_hw_register_fixed_rate(NULL, "ipg=
_dma_clk_root", NULL, 0, 120000000);
+	clks[IMX8QXP_AXI_CONN_CLK_ROOT] =3D clk_hw_register_fixed_rate(NULL, "axi=
_conn_clk_root", NULL, 0, 333333333);
+	clks[IMX8QXP_AHB_CONN_CLK_ROOT] =3D clk_hw_register_fixed_rate(NULL, "ahb=
_conn_clk_root", NULL, 0, 166666666);
+	clks[IMX8QXP_IPG_CONN_CLK_ROOT] =3D clk_hw_register_fixed_rate(NULL, "ipg=
_conn_clk_root", NULL, 0, 83333333);
+	clks[IMX8QXP_DC_AXI_EXT_CLK]	=3D clk_hw_register_fixed_rate(NULL, "axi_ex=
t_dc_clk_root", NULL, 0, 800000000);
+	clks[IMX8QXP_DC_AXI_INT_CLK]	=3D clk_hw_register_fixed_rate(NULL, "axi_in=
t_dc_clk_root", NULL, 0, 400000000);
+	clks[IMX8QXP_DC_CFG_CLK]	=3D clk_hw_register_fixed_rate(NULL, "cfg_dc_clk=
_root", NULL, 0, 100000000);
+	clks[IMX8QXP_MIPI_IPG_CLK]	=3D clk_hw_register_fixed_rate(NULL, "ipg_mipi=
_clk_root", NULL, 0, 120000000);
+	clks[IMX8QXP_IMG_AXI_CLK]	=3D clk_hw_register_fixed_rate(NULL, "axi_img_c=
lk_root", NULL, 0, 400000000);
+	clks[IMX8QXP_IMG_IPG_CLK]	=3D clk_hw_register_fixed_rate(NULL, "ipg_img_c=
lk_root", NULL, 0, 200000000);
+	clks[IMX8QXP_IMG_PXL_CLK]	=3D clk_hw_register_fixed_rate(NULL, "pxl_img_c=
lk_root", NULL, 0, 600000000);
+	clks[IMX8QXP_HSIO_AXI_CLK]	=3D clk_hw_register_fixed_rate(NULL, "axi_hsio=
_clk_root", NULL, 0, 400000000);
+	clks[IMX8QXP_HSIO_PER_CLK]	=3D clk_hw_register_fixed_rate(NULL, "per_hsio=
_clk_root", NULL, 0, 133333333);
+
+	/* ARM core */
+	clks[IMX8QXP_A35_DIV]		=3D imx_clk_divider_scu("a35_div", IMX_SC_R_A35, I=
MX_SC_PM_CLK_CPU);
+
+	clks[IMX8QXP_UART0_DIV]		=3D imx_clk_divider_scu("uart0_div", IMX_SC_R_UA=
RT_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_UART0_IPG_CLK]	=3D imx_clk_gate2_scu("uart0_ipg_clk", "ipg_d=
ma_clk_root", LPUART_0_LPCG, 16, 0);
+	clks[IMX8QXP_UART0_CLK]		=3D imx_clk_gate_scu("uart0_clk", "uart0_div", I=
MX_SC_R_UART_0, IMX_SC_PM_CLK_PER, LPUART_0_LPCG, 0, 0);
+
+	clks[IMX8QXP_GPU0_CORE_DIV]	=3D imx_clk_divider_scu("gpu_core0_div", IMX_=
SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_GPU0_SHADER_DIV]	=3D imx_clk_divider_scu("gpu_shader0_div", =
IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC);
+	clks[IMX8QXP_GPU0_CORE_CLK]	=3D imx_clk_gate_scu("gpu_core0_clk", "gpu_co=
re0_div", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER, 0, 0, 0);
+	clks[IMX8QXP_GPU0_SHADER_CLK]	=3D imx_clk_gate_scu("gpu_shader0_clk", "gp=
u_shader0_div", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC, 0, 0, 0);
+
+	/* LSIO SS */
+	clks[IMX8QXP_LSIO_MEM_CLK]	=3D clk_hw_register_fixed_rate(NULL, "lsio_mem=
_clk_root", NULL, 0, 100000000);
+	clks[IMX8QXP_LSIO_BUS_CLK]	=3D clk_hw_register_fixed_rate(NULL, "lsio_bus=
_clk_root", NULL, 0, 200000000);
+
+	clks[IMX8QXP_LSIO_PWM0_DIV]		=3D imx_clk_divider_scu("pwm_0_div", IMX_SC_=
R_PWM_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM0_IPG_S_CLK]	=3D imx_clk_gate_scu("pwm_0_ipg_s_clk",=
 "pwm_0_div", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, PWM_0_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_PWM0_IPG_SLV_CLK]	=3D imx_clk_gate_scu("pwm_0_ipg_slv_c=
lk", "pwm_0_ipg_s_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, PWM_0_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_PWM0_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("pwm_0_ipg_mst=
r_clk", "lsio_bus_clk_root", PWM_0_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_PWM0_HF_CLK]		=3D imx_clk_gate_scu("pwm_0_hf_clk", "pwm=
_0_ipg_slv_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, PWM_0_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_PWM0_CLK]		=3D imx_clk_gate_scu("pwm_0_clk", "pwm_0_ipg=
_slv_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, PWM_0_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_PWM1_DIV]		=3D imx_clk_divider_scu("pwm_1_div", IMX_SC_=
R_PWM_1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM1_IPG_S_CLK]	=3D imx_clk_gate_scu("pwm_1_ipg_s_clk",=
 "pwm_1_div", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER, PWM_1_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_PWM1_IPG_SLV_CLK]	=3D imx_clk_gate_scu("pwm_1_ipg_slv_c=
lk", "pwm_1_ipg_s_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER, PWM_1_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_PWM1_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("pwm_1_ipg_mst=
r_clk", "lsio_bus_clk_root", PWM_1_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_PWM1_HF_CLK]		=3D imx_clk_gate_scu("pwm_1_hf_clk", "pwm=
_1_ipg_slv_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER, PWM_1_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_PWM1_CLK]		=3D imx_clk_gate_scu("pwm_1_clk", "pwm_1_ipg=
_slv_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER, PWM_1_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_PWM2_DIV]		=3D imx_clk_divider_scu("pwm_2_div", IMX_SC_=
R_PWM_2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM2_IPG_S_CLK]	=3D imx_clk_gate_scu("pwm_2_ipg_s_clk",=
 "pwm_2_div", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER, PWM_2_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_PWM2_IPG_SLV_CLK]	=3D imx_clk_gate_scu("pwm_2_ipg_slv_c=
lk", "pwm_2_ipg_s_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER, PWM_2_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_PWM2_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("pwm_2_ipg_mst=
r_clk", "lsio_bus_clk_root", PWM_2_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_PWM2_HF_CLK]		=3D imx_clk_gate_scu("pwm_2_hf_clk", "pwm=
_2_ipg_slv_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER, PWM_2_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_PWM2_CLK]		=3D imx_clk_gate_scu("pwm_2_clk", "pwm_2_ipg=
_slv_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER, PWM_2_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_PWM3_DIV]		=3D imx_clk_divider_scu("pwm_3_div", IMX_SC_=
R_PWM_3, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM3_IPG_S_CLK]	=3D imx_clk_gate_scu("pwm_3_ipg_s_clk",=
 "pwm_3_div", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER, PWM_3_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_PWM3_IPG_SLV_CLK]	=3D imx_clk_gate_scu("pwm_3_ipg_slv_c=
lk", "pwm_3_ipg_s_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER, PWM_3_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_PWM3_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("pwm_3_ipg_mst=
r_clk", "lsio_bus_clk_root", PWM_3_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_PWM3_HF_CLK]		=3D imx_clk_gate_scu("pwm_3_hf_clk", "pwm=
_3_ipg_slv_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER, PWM_3_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_PWM3_CLK]		=3D imx_clk_gate_scu("pwm_3_clk", "pwm_3_ipg=
_slv_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER, PWM_3_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_PWM4_DIV]		=3D imx_clk_divider_scu("pwm_4_div", IMX_SC_=
R_PWM_4, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM4_IPG_S_CLK]	=3D imx_clk_gate_scu("pwm_4_ipg_s_clk",=
 "pwm_4_div", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER, PWM_4_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_PWM4_IPG_SLV_CLK]	=3D imx_clk_gate_scu("pwm_4_ipg_slv_c=
lk", "pwm_4_ipg_s_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER, PWM_4_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_PWM4_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("pwm_4_ipg_mst=
r_clk", "lsio_bus_clk_root", PWM_4_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_PWM4_HF_CLK]		=3D imx_clk_gate_scu("pwm_4_hf_clk", "pwm=
_4_ipg_slv_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER, PWM_4_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_PWM4_CLK]		=3D imx_clk_gate_scu("pwm_4_clk", "pwm_4_ipg=
_slv_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER, PWM_4_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_PWM5_DIV]		=3D imx_clk_divider_scu("pwm_5_div", IMX_SC_=
R_PWM_5, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM5_IPG_S_CLK]	=3D imx_clk_gate_scu("pwm_5_ipg_s_clk",=
 "pwm_5_div", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER, PWM_5_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_PWM5_IPG_SLV_CLK]	=3D imx_clk_gate_scu("pwm_5_ipg_slv_c=
lk", "pwm_5_ipg_s_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER, PWM_5_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_PWM5_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("pwm_5_ipg_mst=
r_clk", "lsio_bus_clk_root", PWM_5_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_PWM5_HF_CLK]		=3D imx_clk_gate_scu("pwm_5_hf_clk", "pwm=
_5_ipg_slv_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER, PWM_5_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_PWM5_CLK]		=3D imx_clk_gate_scu("pwm_5_clk", "pwm_5_ipg=
_slv_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER, PWM_5_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_PWM6_DIV]		=3D imx_clk_divider_scu("pwm_6_div", IMX_SC_=
R_PWM_6, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM6_IPG_S_CLK]	=3D imx_clk_gate_scu("pwm_6_ipg_s_clk",=
 "pwm_6_div", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER, PWM_6_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_PWM6_IPG_SLV_CLK]	=3D imx_clk_gate_scu("pwm_6_ipg_slv_c=
lk", "pwm_6_ipg_s_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER, PWM_6_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_PWM6_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("pwm_6_ipg_mst=
r_clk", "lsio_bus_clk_root", PWM_6_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_PWM6_HF_CLK]		=3D imx_clk_gate_scu("pwm_6_hf_clk", "pwm=
_6_ipg_slv_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER, PWM_6_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_PWM6_CLK]		=3D imx_clk_gate_scu("pwm_6_clk", "pwm_6_ipg=
_slv_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER, PWM_6_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_PWM7_DIV]		=3D imx_clk_divider_scu("pwm_7_div", IMX_SC_=
R_PWM_7, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_PWM7_IPG_S_CLK]	=3D imx_clk_gate_scu("pwm_7_ipg_s_clk",=
 "pwm_7_div", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER, PWM_7_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_PWM7_IPG_SLV_CLK]	=3D imx_clk_gate_scu("pwm_7_ipg_slv_c=
lk", "pwm_7_ipg_s_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER, PWM_7_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_PWM7_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("pwm_7_ipg_mst=
r_clk", "lsio_bus_clk_root", PWM_7_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_PWM7_HF_CLK]		=3D imx_clk_gate_scu("pwm_7_hf_clk", "pwm=
_7_ipg_slv_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER, PWM_7_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_PWM7_CLK]		=3D imx_clk_gate_scu("pwm_7_clk", "pwm_7_ipg=
_slv_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER, PWM_7_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_GPT0_DIV]		=3D imx_clk_divider_scu("gpt_0_div", IMX_SC_=
R_GPT_4, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT0_IPG_S_CLK]	=3D imx_clk_gate_scu("gpt_0_ipg_s_clk",=
 "gpt_0_div", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER, GPT_0_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPT0_IPG_SLV_CLK]	=3D imx_clk_gate_scu("gpt_0_ipg_slv_c=
lk", "gpt_0_ipg_s_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER, GPT_0_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_GPT0_CLK]		=3D imx_clk_gate_scu("gpt_0_clk", "gpt_0_ipg=
_slv_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER, GPT_0_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_GPT0_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("gpt_0_ipg_mst=
r_clk", "lsio_bus_clk_root", GPT_0_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_GPT0_HF_CLK]		=3D imx_clk_gate_scu("gpt_0_hf_clk", "gpt=
_0_ipg_slv_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER, GPT_0_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_GPT1_DIV]		=3D imx_clk_divider_scu("gpt_1_div", IMX_SC_=
R_GPT_4, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT1_IPG_S_CLK]	=3D imx_clk_gate_scu("gpt_1_ipg_s_clk",=
 "gpt_1_div", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER, GPT_1_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPT1_IPG_SLV_CLK]	=3D imx_clk_gate_scu("gpt_1_ipg_slv_c=
lk", "gpt_1_ipg_s_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER, GPT_1_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_GPT1_CLK]		=3D imx_clk_gate_scu("gpt_1_clk", "gpt_1_ipg=
_slv_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER, GPT_1_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_GPT1_HF_CLK]		=3D imx_clk_gate_scu("gpt_1_hf_clk", "gpt=
_1_ipg_slv_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER, GPT_1_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_GPT1_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("gpt_1_ipg_mst=
r_clk", "lsio_bus_clk_root", GPT_1_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_GPT2_DIV]		=3D imx_clk_divider_scu("gpt_2_div", IMX_SC_=
R_GPT_4, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT2_IPG_S_CLK]	=3D imx_clk_gate_scu("gpt_2_ipg_s_clk",=
 "gpt_2_div", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER, GPT_2_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPT2_IPG_SLV_CLK]	=3D imx_clk_gate_scu("gpt_2_ipg_slv_c=
lk", "gpt_2_ipg_s_clk", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER, GPT_2_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_GPT2_CLK]		=3D imx_clk_gate_scu("gpt_2_clk", "gpt_2_ipg=
_slv_clk", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER, GPT_2_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_GPT2_HF_CLK]		=3D imx_clk_gate_scu("gpt_2_hf_clk", "gpt=
_2_div", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER, GPT_2_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_GPT2_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("gpt_2_ipg_mst=
r_clk", "lsio_bus_clk_root", GPT_2_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_GPT3_DIV]		=3D imx_clk_divider_scu("gpt_3_div", IMX_SC_=
R_GPT_4, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT3_IPG_S_CLK]	=3D imx_clk_gate_scu("gpt_3_ipg_s_clk",=
 "gpt_3_div", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER, GPT_3_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPT3_IPG_SLV_CLK]	=3D imx_clk_gate_scu("gpt_3_ipg_slv_c=
lk", "gpt_3_ipg_s_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER, GPT_3_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_GPT3_CLK]		=3D imx_clk_gate_scu("gpt_3_clk", "gpt_3_ipg=
_slv_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER, GPT_3_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_GPT3_HF_CLK]		=3D imx_clk_gate_scu("gpt_3_hf_clk", "gpt=
_3_ipg_slv_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER, GPT_3_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_GPT3_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("gpt_3_ipg_mst=
r_clk", "lsio_bus_clk_root", GPT_3_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_GPT4_DIV]		=3D imx_clk_divider_scu("gpt_4_div", IMX_SC_=
R_GPT_4, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_GPT4_IPG_S_CLK]	=3D imx_clk_gate_scu("gpt_4_ipg_s_clk",=
 "gpt_4_div", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER, GPT_4_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPT4_IPG_SLV_CLK]	=3D imx_clk_gate_scu("gpt_4_ipg_slv_c=
lk", "gpt_4_ipg_s_clk", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER, GPT_4_LPCG, 0x14=
, 0);
+	clks[IMX8QXP_LSIO_GPT4_CLK]		=3D imx_clk_gate_scu("gpt_4_clk", "gpt_4_div=
", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER, GPT_4_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_GPT4_HF_CLK]		=3D imx_clk_gate_scu("gpt_4_hf_clk", "gpt=
_4_div", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER, GPT_4_LPCG, 4, 0);
+	clks[IMX8QXP_LSIO_GPT4_IPG_MSTR_CLK]	=3D imx_clk_gate2_scu("gpt_4_ipg_mst=
r_clk", "lsio_bus_clk_root", GPT_4_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_FSPI0_DIV]		=3D imx_clk_divider_scu("fspi_0_div", IMX_S=
C_R_FSPI_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_FSPI0_HCLK]		=3D imx_clk_gate2_scu("fspi0_hclk_clk", "l=
sio_mem_clk_root", FSPI_0_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_FSPI0_IPG_S_CLK]	=3D imx_clk_gate2_scu("fspi0_ipg_s_clk=
", "lsio_bus_clk_root", FSPI_0_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_FSPI0_IPG_CLK]	=3D imx_clk_gate2_scu("fspi0_ipg_clk", "=
fspi0_ipg_s_clk", FSPI_0_LPCG, 0x14, 0);
+	clks[IMX8QXP_LSIO_FSPI0_CLK]		=3D imx_clk_gate_scu("fspi_0_clk", "fspi_0_=
div", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER, FSPI_0_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_FSPI1_DIV]		=3D imx_clk_divider_scu("fspi_1_div", IMX_S=
C_R_FSPI_1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LSIO_FSPI1_HCLK]		=3D imx_clk_gate2_scu("fspi1_hclk_clk", "l=
sio_mem_clk_root", FSPI_1_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_FSPI1_IPG_S_CLK]	=3D imx_clk_gate2_scu("fspi1_ipg_s_clk=
", "lsio_bus_clk_root", FSPI_1_LPCG, 0x18, 0);
+	clks[IMX8QXP_LSIO_FSPI1_IPG_CLK]	=3D imx_clk_gate2_scu("fspi1_ipg_clk", "=
fspi1_ipg_s_clk", FSPI_1_LPCG, 0x14, 0);
+	clks[IMX8QXP_LSIO_FSPI1_CLK]		=3D imx_clk_gate_scu("fspi_1_clk", "fspi_1_=
div", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER, FSPI_1_LPCG, 0, 0);
+	clks[IMX8QXP_LSIO_GPIO0_IPG_S_CLK]	=3D imx_clk_gate2_scu("gpio0_ipg_s_clk=
", "lsio_bus_clk_root", GPIO_0_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPIO1_IPG_S_CLK]	=3D imx_clk_gate2_scu("gpio1_ipg_s_clk=
", "lsio_bus_clk_root", GPIO_1_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPIO2_IPG_S_CLK]	=3D imx_clk_gate2_scu("gpio2_ipg_s_clk=
", "lsio_bus_clk_root", GPIO_2_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPIO3_IPG_S_CLK]	=3D imx_clk_gate2_scu("gpio3_ipg_s_clk=
", "lsio_bus_clk_root", GPIO_3_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPIO4_IPG_S_CLK]	=3D imx_clk_gate2_scu("gpio4_ipg_s_clk=
", "lsio_bus_clk_root", GPIO_4_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPIO5_IPG_S_CLK]	=3D imx_clk_gate2_scu("gpio5_ipg_s_clk=
", "lsio_bus_clk_root", GPIO_5_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPIO6_IPG_S_CLK]	=3D imx_clk_gate2_scu("gpio6_ipg_s_clk=
", "lsio_bus_clk_root", GPIO_6_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_GPIO7_IPG_S_CLK]	=3D imx_clk_gate2_scu("gpio7_ipg_s_clk=
", "lsio_bus_clk_root", GPIO_7_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_ROMCP_REG_CLK]	=3D imx_clk_gate2_scu("romcp_reg_clk", "=
lsio_bus_clk_root", ROMCP_LPCG, 0x10, 0);
+	clks[IMX8QXP_LSIO_ROMCP_CLK]		=3D imx_clk_gate2_scu("romcp_clk", "lsio_me=
m_clk_root", ROMCP_LPCG, 0x0, 0);
+	clks[IMX8QXP_LSIO_96KROM_CLK]		=3D imx_clk_gate2_scu("96krom_clk", "lsio_=
mem_clk_root", ROMCP_LPCG, 0x4, 0);
+	clks[IMX8QXP_LSIO_OCRAM_MEM_CLK]	=3D imx_clk_gate2_scu("ocram_lk", "lsio_=
mem_clk_root", OCRAM_LPCG, 0x4, 0);
+	clks[IMX8QXP_LSIO_OCRAM_CTRL_CLK]	=3D imx_clk_gate2_scu("ocram_ctrl_clk",=
 "lsio_mem_clk_root", OCRAM_LPCG, 0x0, 0);
+
+	/* ADMA SS */
+	clks[IMX8QXP_UART1_IPG_CLK]	=3D imx_clk_gate2_scu("uart1_ipg_clk", "ipg_d=
ma_clk_root", LPUART_1_LPCG, 16, 0);
+	clks[IMX8QXP_UART2_IPG_CLK]	=3D imx_clk_gate2_scu("uart2_ipg_clk", "ipg_d=
ma_clk_root", LPUART_2_LPCG, 16, 0);
+	clks[IMX8QXP_UART3_IPG_CLK]	=3D imx_clk_gate2_scu("uart3_ipg_clk", "ipg_d=
ma_clk_root", LPUART_3_LPCG, 16, 0);
+	clks[IMX8QXP_UART1_DIV]		=3D imx_clk_divider_scu("uart1_div", IMX_SC_R_UA=
RT_1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_UART2_DIV]		=3D imx_clk_divider_scu("uart2_div", IMX_SC_R_UA=
RT_2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_UART3_DIV]		=3D imx_clk_divider_scu("uart3_div", IMX_SC_R_UA=
RT_3, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_UART1_CLK]		=3D imx_clk_gate_scu("uart1_clk", "uart1_div", I=
MX_SC_R_UART_1, IMX_SC_PM_CLK_PER, LPUART_1_LPCG, 0, 0);
+	clks[IMX8QXP_UART2_CLK]		=3D imx_clk_gate_scu("uart2_clk", "uart2_div", I=
MX_SC_R_UART_2, IMX_SC_PM_CLK_PER, LPUART_2_LPCG, 0, 0);
+	clks[IMX8QXP_UART3_CLK]		=3D imx_clk_gate_scu("uart3_clk", "uart3_div", I=
MX_SC_R_UART_3, IMX_SC_PM_CLK_PER, LPUART_3_LPCG, 0, 0);
+	clks[IMX8QXP_SPI0_IPG_CLK]	=3D imx_clk_gate2_scu("spi0_ipg_clk", "ipg_dma=
_clk_root", LPSPI_0_LPCG, 16, 0);
+	clks[IMX8QXP_SPI1_IPG_CLK]	=3D imx_clk_gate2_scu("spi1_ipg_clk", "ipg_dma=
_clk_root", LPSPI_1_LPCG, 16, 0);
+	clks[IMX8QXP_SPI2_IPG_CLK]	=3D imx_clk_gate2_scu("spi2_ipg_clk", "ipg_dma=
_clk_root", LPSPI_2_LPCG, 16, 0);
+	clks[IMX8QXP_SPI3_IPG_CLK]	=3D imx_clk_gate2_scu("spi3_ipg_clk", "ipg_dma=
_clk_root", LPSPI_3_LPCG, 16, 0);
+	clks[IMX8QXP_SPI0_DIV]		=3D imx_clk_divider_scu("spi0_div", IMX_SC_R_SPI_=
0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_SPI1_DIV]		=3D imx_clk_divider_scu("spi1_div", IMX_SC_R_SPI_=
1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_SPI2_DIV]		=3D imx_clk_divider_scu("spi2_div", IMX_SC_R_SPI_=
2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_SPI3_DIV]		=3D imx_clk_divider_scu("spi3_div", IMX_SC_R_SPI_=
3, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_SPI0_CLK]		=3D imx_clk_gate_scu("spi0_clk", "spi0_div", IMX_=
SC_R_SPI_0, IMX_SC_PM_CLK_PER, LPSPI_0_LPCG, 0, 0);
+	clks[IMX8QXP_SPI1_CLK]		=3D imx_clk_gate_scu("spi1_clk", "spi1_div", IMX_=
SC_R_SPI_2, IMX_SC_PM_CLK_PER, LPSPI_1_LPCG, 0, 0);
+	clks[IMX8QXP_SPI2_CLK]		=3D imx_clk_gate_scu("spi2_clk", "spi2_div", IMX_=
SC_R_SPI_2, IMX_SC_PM_CLK_PER, LPSPI_2_LPCG, 0, 0);
+	clks[IMX8QXP_SPI3_CLK]		=3D imx_clk_gate_scu("spi3_clk", "spi3_div", IMX_=
SC_R_SPI_3, IMX_SC_PM_CLK_PER, LPSPI_3_LPCG, 0, 0);
+	clks[IMX8QXP_CAN0_IPG_CHI_CLK]	=3D imx_clk_gate2_scu("can0_ipg_chi_clk", =
"ipg_dma_clk_root", FLEX_CAN_0_LPCG, 20, 0);
+	clks[IMX8QXP_CAN0_IPG_CLK]	=3D imx_clk_gate2_scu("can0_ipg_clk", "can0_ip=
g_chi_clk", FLEX_CAN_0_LPCG, 16, 0);
+	clks[IMX8QXP_CAN1_IPG_CHI_CLK]	=3D imx_clk_gate2_scu("can1_ipg_chi_clk", =
"ipg_dma_clk_root", FLEX_CAN_1_LPCG, 20, 0);
+	clks[IMX8QXP_CAN1_IPG_CLK]	=3D imx_clk_gate2_scu("can1_ipg_clk", "can1_ip=
g_chi_clk", FLEX_CAN_1_LPCG, 16, 0);
+	clks[IMX8QXP_CAN2_IPG_CHI_CLK]	=3D imx_clk_gate2_scu("can2_ipg_chi_clk", =
"ipg_dma_clk_root", FLEX_CAN_2_LPCG, 20, 0);
+	clks[IMX8QXP_CAN2_IPG_CLK]	=3D imx_clk_gate2_scu("can2_ipg_clk", "can2_ip=
g_chi_clk", FLEX_CAN_2_LPCG, 16, 0);
+	clks[IMX8QXP_CAN0_DIV]		=3D imx_clk_divider_scu("can0_div", IMX_SC_R_CAN_=
0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CAN1_DIV]		=3D imx_clk_divider_scu("can1_div", IMX_SC_R_CAN_=
1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CAN2_DIV]		=3D imx_clk_divider_scu("can2_div", IMX_SC_R_CAN_=
2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CAN0_CLK]		=3D imx_clk_gate_scu("can0_clk", "can0_div", IMX_=
SC_R_CAN_0, IMX_SC_PM_CLK_PER, FLEX_CAN_0_LPCG, 0, 0);
+	clks[IMX8QXP_CAN1_CLK]		=3D imx_clk_gate_scu("can1_clk", "can1_div", IMX_=
SC_R_CAN_1, IMX_SC_PM_CLK_PER, FLEX_CAN_1_LPCG, 0, 0);
+	clks[IMX8QXP_CAN2_CLK]		=3D imx_clk_gate_scu("can2_clk", "can2_div", IMX_=
SC_R_CAN_2, IMX_SC_PM_CLK_PER, FLEX_CAN_2_LPCG, 0, 0);
+	clks[IMX8QXP_I2C0_IPG_CLK]	=3D imx_clk_gate2_scu("i2c0_ipg_clk", "ipg_dma=
_clk_root", LPI2C_0_LPCG, 16, 0);
+	clks[IMX8QXP_I2C1_IPG_CLK]	=3D imx_clk_gate2_scu("i2c1_ipg_clk", "ipg_dma=
_clk_root", LPI2C_1_LPCG, 16, 0);
+	clks[IMX8QXP_I2C2_IPG_CLK]	=3D imx_clk_gate2_scu("i2c2_ipg_clk", "ipg_dma=
_clk_root", LPI2C_2_LPCG, 16, 0);
+	clks[IMX8QXP_I2C3_IPG_CLK]	=3D imx_clk_gate2_scu("i2c3_ipg_clk", "ipg_dma=
_clk_root", LPI2C_3_LPCG, 16, 0);
+	clks[IMX8QXP_I2C0_DIV]		=3D imx_clk_divider_scu("i2c0_div", IMX_SC_R_I2C_=
0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_I2C1_DIV]		=3D imx_clk_divider_scu("i2c1_div", IMX_SC_R_I2C_=
1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_I2C2_DIV]		=3D imx_clk_divider_scu("i2c2_div", IMX_SC_R_I2C_=
2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_I2C3_DIV]		=3D imx_clk_divider_scu("i2c3_div", IMX_SC_R_I2C_=
3, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_I2C0_CLK]		=3D imx_clk_gate_scu("i2c0_clk", "i2c0_div", IMX_=
SC_R_I2C_0, IMX_SC_PM_CLK_PER, LPI2C_0_LPCG, 0, 0);
+	clks[IMX8QXP_I2C1_CLK]		=3D imx_clk_gate_scu("i2c1_clk", "i2c1_div", IMX_=
SC_R_I2C_1, IMX_SC_PM_CLK_PER, LPI2C_1_LPCG, 0, 0);
+	clks[IMX8QXP_I2C2_CLK]		=3D imx_clk_gate_scu("i2c2_clk", "i2c2_div", IMX_=
SC_R_I2C_2, IMX_SC_PM_CLK_PER, LPI2C_2_LPCG, 0, 0);
+	clks[IMX8QXP_I2C3_CLK]		=3D imx_clk_gate_scu("i2c3_clk", "i2c3_div", IMX_=
SC_R_I2C_3, IMX_SC_PM_CLK_PER, LPI2C_3_LPCG, 0, 0);
+	clks[IMX8QXP_FTM0_IPG_CLK]	=3D imx_clk_gate2_scu("ftm0_ipg_clk", "ipg_dma=
_clk_root", FTM_0_LPCG, 16, 0);
+	clks[IMX8QXP_FTM1_IPG_CLK]	=3D imx_clk_gate2_scu("ftm1_ipg_clk", "ipg_dma=
_clk_root", FTM_1_LPCG, 16, 0);
+	clks[IMX8QXP_FTM0_DIV]		=3D imx_clk_divider_scu("ftm0_div", IMX_SC_R_FTM_=
0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_FTM1_DIV]		=3D imx_clk_divider_scu("ftm1_div", IMX_SC_R_FTM_=
1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_FTM0_CLK]		=3D imx_clk_gate_scu("ftm0_clk", "ftm0_div", IMX_=
SC_R_FTM_0, IMX_SC_PM_CLK_PER, FTM_0_LPCG, 0, 0);
+	clks[IMX8QXP_FTM1_CLK]		=3D imx_clk_gate_scu("ftm1_clk", "ftm1_div", IMX_=
SC_R_FTM_1, IMX_SC_PM_CLK_PER, FTM_1_LPCG, 0, 0);
+	clks[IMX8QXP_ADC0_IPG_CLK]	=3D imx_clk_gate2_scu("adc0_ipg_clk", "ipg_dma=
_clk_root", ADC_0_LPCG, 16, 0);
+	clks[IMX8QXP_ADC0_DIV]		=3D imx_clk_divider_scu("adc0_div", IMX_SC_R_ADC_=
0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ADC0_CLK]		=3D imx_clk_gate_scu("adc0_clk", "adc0_div", IMX_=
SC_R_ADC_0, IMX_SC_PM_CLK_PER, ADC_0_LPCG, 0, 0);
+	clks[IMX8QXP_PWM_IPG_CLK]	=3D imx_clk_gate2_scu("pwm_ipg_clk", "ipg_dma_c=
lk_root", PWM_LPCG, 16, 0);
+	clks[IMX8QXP_PWM_DIV]		=3D imx_clk_divider_scu("pwm_div", IMX_SC_R_LCD_0_=
PWM_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_PWM_CLK]		=3D imx_clk_gate_scu("pwm_clk", "pwm_div", IMX_SC_=
R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER, PWM_LPCG, 0, 0);
+	clks[IMX8QXP_LCD_IPG_CLK]	=3D imx_clk_gate2_scu("lcd_ipg_clk", "ipg_dma_c=
lk_root", LCD_LPCG, 16, 0);
+	clks[IMX8QXP_LCD_DIV]		=3D imx_clk_divider_scu("lcd_div", IMX_SC_R_LCD_0,=
 IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_LCD_CLK]		=3D imx_clk_gate_scu("lcd_clk", "lcd_div", IMX_SC_=
R_LCD_0, IMX_SC_PM_CLK_PER, LCD_LPCG, 0, 0);
+
+	/* Connectivity */
+	clks[IMX8QXP_SDHC0_IPG_CLK]	=3D imx_clk_gate2_scu("sdhc0_ipg_clk", "ipg_c=
onn_clk_root", USDHC_0_LPCG, 16, 0);
+	clks[IMX8QXP_SDHC1_IPG_CLK]	=3D imx_clk_gate2_scu("sdhc1_ipg_clk", "ipg_c=
onn_clk_root", USDHC_1_LPCG, 16, 0);
+	clks[IMX8QXP_SDHC2_IPG_CLK]	=3D imx_clk_gate2_scu("sdhc2_ipg_clk", "ipg_c=
onn_clk_root", USDHC_2_LPCG, 16, 0);
+	clks[IMX8QXP_SDHC0_DIV]		=3D imx_clk_divider_scu("sdhc0_div", IMX_SC_R_SD=
HC_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_SDHC1_DIV]		=3D imx_clk_divider_scu("sdhc1_div", IMX_SC_R_SD=
HC_1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_SDHC2_DIV]		=3D imx_clk_divider_scu("sdhc2_div", IMX_SC_R_SD=
HC_2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_SDHC0_CLK]		=3D imx_clk_gate_scu("sdhc0_clk", "sdhc0_div", I=
MX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER, USDHC_0_LPCG, 0, 0);
+	clks[IMX8QXP_SDHC1_CLK]		=3D imx_clk_gate_scu("sdhc1_clk", "sdhc1_div", I=
MX_SC_R_SDHC_1, IMX_SC_PM_CLK_PER, USDHC_1_LPCG, 0, 0);
+	clks[IMX8QXP_SDHC2_CLK]		=3D imx_clk_gate_scu("sdhc2_clk", "sdhc1_div", I=
MX_SC_R_SDHC_2, IMX_SC_PM_CLK_PER, USDHC_2_LPCG, 0, 0);
+	clks[IMX8QXP_ENET0_ROOT_DIV]	=3D imx_clk_divider_scu("enet0_root_div", IM=
X_SC_R_ENET_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ENET0_REF_DIV]	=3D imx_clk_divider_gpr_scu("enet0_ref_div", =
"enet0_root_clk", IMX_SC_R_ENET_0, IMX_SC_C_CLKDIV);
+	clks[IMX8QXP_ENET1_REF_DIV]	=3D imx_clk_divider_gpr_scu("enet1_ref_div", =
"enet1_root_clk", IMX_SC_R_ENET_1, IMX_SC_C_CLKDIV);
+	clks[IMX8QXP_ENET0_BYPASS_DIV]	=3D imx_clk_divider_scu("enet0_bypass_div"=
, IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS);
+	clks[IMX8QXP_ENET0_RGMII_DIV]	=3D imx_clk_divider_scu("enet0_rgmii_div", =
IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0);
+	clks[IMX8QXP_ENET1_ROOT_DIV]	=3D imx_clk_divider_scu("enet1_root_div", IM=
X_SC_R_ENET_1, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_ENET1_BYPASS_DIV]	=3D imx_clk_divider_scu("enet1_bypass_div"=
, IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS);
+	clks[IMX8QXP_ENET1_RGMII_DIV]	=3D imx_clk_divider_scu("enet1_rgmii_div", =
IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0);
+	clks[IMX8QXP_ENET0_AHB_CLK]	=3D imx_clk_gate2_scu("enet0_ahb_clk", "axi_c=
onn_clk_root", ENET_0_LPCG, 8, 0);
+	clks[IMX8QXP_ENET0_IPG_S_CLK]	=3D imx_clk_gate2_scu("enet0_ipg_s_clk", "i=
pg_conn_clk_root", ENET_0_LPCG, 20, 0);
+	clks[IMX8QXP_ENET0_IPG_CLK]	=3D imx_clk_gate2_scu("enet0_ipg_clk", "enet0=
_ipg_s_clk", ENET_0_LPCG, 16, 0);
+	clks[IMX8QXP_ENET1_AHB_CLK]	=3D imx_clk_gate2_scu("enet1_ahb_clk", "axi_c=
onn_clk_root", ENET_1_LPCG, 8, 0);
+	clks[IMX8QXP_ENET1_IPG_S_CLK]	=3D imx_clk_gate2_scu("enet1_ipg_s_clk", "i=
pg_conn_clk_root", ENET_1_LPCG, 20, 0);
+	clks[IMX8QXP_ENET1_IPG_CLK]	=3D imx_clk_gate2_scu("enet1_ipg_clk", "enet1=
_ipg_s_clk", ENET_1_LPCG, 16, 0);
+	clks[IMX8QXP_ENET0_ROOT_CLK]	=3D imx_clk_gate_scu("enet0_root_clk", "enet=
0_root_div", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_PER, 0, 0, 0);
+	clks[IMX8QXP_ENET1_ROOT_CLK]	=3D imx_clk_gate_scu("enet1_root_clk", "enet=
1_root_div", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER, 0, 0, 0);
+	clks[IMX8QXP_ENET0_TX_CLK]	=3D imx_clk_gate2_scu("enet0_tx_2x_clk", "enet=
0_root_div", ENET_0_LPCG, 4, 0);
+	clks[IMX8QXP_ENET1_TX_CLK]	=3D imx_clk_gate2_scu("enet1_tx_2x_clk", "enet=
1_root_div", ENET_1_LPCG, 4, 0);
+	clks[IMX8QXP_ENET0_PTP_CLK]	=3D imx_clk_gate2_scu("enet0_ptp_clk", "enet0=
_ref_div", ENET_0_LPCG, 0, 0);
+	clks[IMX8QXP_ENET1_PTP_CLK]	=3D imx_clk_gate2_scu("enet1_ptp_clk", "enet1=
_ref_div", ENET_1_LPCG, 0, 0);
+	clks[IMX8QXP_ENET0_REF_25MHZ_125MHZ_SEL] =3D imx_clk_mux_gpr_scu("enet0_r=
ef_25_125_sel", enet_sels, ARRAY_SIZE(enet_sels), IMX_SC_R_ENET_0, IMX_SC_C=
_SEL_125);
+	clks[IMX8QXP_ENET1_REF_25MHZ_125MHZ_SEL] =3D imx_clk_mux_gpr_scu("enet1_r=
ef_25_125_sel", enet_sels, ARRAY_SIZE(enet_sels), IMX_SC_R_ENET_1, IMX_SC_C=
_SEL_125);
+	clks[IMX8QXP_ENET0_RMII_TX_SEL]	=3D imx_clk_mux_gpr_scu("enet0_rmii_tx_se=
l", enet0_rmii_tx_sels, ARRAY_SIZE(enet0_rmii_tx_sels), IMX_SC_R_ENET_0, IM=
X_SC_C_TXCLK);
+	clks[IMX8QXP_ENET1_RMII_TX_SEL]	=3D imx_clk_mux_gpr_scu("enet1_rmii_tx_se=
l", enet1_rmii_tx_sels, ARRAY_SIZE(enet1_rmii_tx_sels), IMX_SC_R_ENET_1, IM=
X_SC_C_TXCLK);
+	clks[IMX8QXP_ENET0_RGMII_TX_CLK] =3D imx_clk_gate2_scu("enet0_rgmii_tx_cl=
k", "enet0_rmii_tx_sel", ENET_0_LPCG, 12, 0);
+	clks[IMX8QXP_ENET1_RGMII_TX_CLK] =3D imx_clk_gate2_scu("enet1_rgmii_tx_cl=
k", "enet1_rmii_tx_sel", ENET_1_LPCG, 12, 0);
+	clks[IMX8QXP_ENET0_RMII_RX_CLK]	=3D imx_clk_gate2_scu("enet0_rgmii_rx_clk=
", "enet0_rgmii_div", ENET_0_LPCG + 0x4, 0, 0);
+	clks[IMX8QXP_ENET1_RMII_RX_CLK]	=3D imx_clk_gate2_scu("enet1_rgmii_rx_clk=
", "enet1_rgmii_div", ENET_1_LPCG + 0x4, 0, 0);
+	clks[IMX8QXP_ENET0_REF_25MHZ_125MHZ_CLK] =3D imx_clk_gate_gpr_scu("enet0_=
ref_25_125_clk", "enet0_ref_25_125_sel", IMX_SC_R_ENET_0, IMX_SC_C_DISABLE_=
125, true);
+	clks[IMX8QXP_ENET1_REF_25MHZ_125MHZ_CLK] =3D imx_clk_gate_gpr_scu("enet1_=
ref_25_125_clk", "enet1_ref_25_125_sel", IMX_SC_R_ENET_1, IMX_SC_C_DISABLE_=
125, true);
+	clks[IMX8QXP_ENET0_REF_50MHZ_CLK] =3D imx_clk_gate_gpr_scu("enet0_ref_50_=
clk", NULL, IMX_SC_R_ENET_0, IMX_SC_C_DISABLE_50, true);
+	clks[IMX8QXP_ENET1_REF_50MHZ_CLK] =3D imx_clk_gate_gpr_scu("enet1_ref_50_=
clk", NULL, IMX_SC_R_ENET_1, IMX_SC_C_DISABLE_50, true);
+	clks[IMX8QXP_GPMI_BCH_IO_DIV]	=3D imx_clk_divider_scu("gpmi_io_div", IMX_=
SC_R_NAND, IMX_SC_PM_CLK_MST_BUS);
+	clks[IMX8QXP_GPMI_BCH_DIV]	=3D imx_clk_divider_scu("gpmi_bch_div", IMX_SC=
_R_NAND, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_GPMI_APB_CLK]	=3D imx_clk_gate2_scu("gpmi_apb_clk", "axi_con=
n_clk_root", NAND_LPCG, 16, 0);
+	clks[IMX8QXP_GPMI_APB_BCH_CLK]	=3D imx_clk_gate2_scu("gpmi_apb_bch_clk", =
"axi_conn_clk_root", NAND_LPCG, 20, 0);
+	clks[IMX8QXP_GPMI_BCH_IO_CLK]	=3D imx_clk_gate_scu("gpmi_io_clk", "gpmi_i=
o_div", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS, NAND_LPCG, 4, 0);
+	clks[IMX8QXP_GPMI_BCH_CLK]	=3D imx_clk_gate_scu("gpmi_bch_clk", "gpmi_bch=
_div", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER, NAND_LPCG, 0, 0);
+	clks[IMX8QXP_APBHDMA_CLK]	=3D imx_clk_gate2_scu("gpmi_clk", "axi_conn_clk=
_root", NAND_LPCG + 0x4, 16, 0);
+	clks[IMX8QXP_USB3_ACLK_DIV]	=3D imx_clk_divider_scu("usb3_aclk_div", IMX_=
SC_R_USB_2, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_USB3_BUS_DIV]	=3D imx_clk_divider_scu("usb3_bus_div", IMX_SC=
_R_USB_2, IMX_SC_PM_CLK_MST_BUS);
+	clks[IMX8QXP_USB3_LPM_DIV]	=3D imx_clk_divider_scu("usb3_lpm_div", IMX_SC=
_R_USB_2, IMX_SC_PM_CLK_MISC);
+	clks[IMX8QXP_USB2_OH_AHB_CLK]	=3D imx_clk_gate2_scu("usboh3", "ahb_conn_c=
lk_root", USB_2_LPCG, 24, 0);
+	clks[IMX8QXP_USB2_OH_IPG_S_CLK]	=3D imx_clk_gate2_scu("usboh3_ipg_s", "ip=
g_conn_clk_root", USB_2_LPCG, 16, 0);
+	clks[IMX8QXP_USB2_OH_IPG_S_PL301_CLK] =3D imx_clk_gate2_scu("usboh3_ipg_p=
l301_s", "ipg_conn_clk_root", USB_2_LPCG, 20, 0);
+	clks[IMX8QXP_USB2_PHY_IPG_CLK]	=3D imx_clk_gate2_scu("usboh3_phy_clk", "i=
pg_conn_clk_root", USB_2_LPCG, 28, 0);
+	clks[IMX8QXP_USB3_IPG_CLK]	=3D imx_clk_gate2_scu("usb3_ipg_clk", "ipg_con=
n_clk_root", USB_3_LPCG, 16, 0);
+	clks[IMX8QXP_USB3_CORE_PCLK]	=3D imx_clk_gate2_scu("usb3_core_clk", "ipg_=
conn_clk_root", USB_3_LPCG, 20, 0);
+	clks[IMX8QXP_USB3_PHY_CLK]	=3D imx_clk_gate2_scu("usb3_phy_clk", "usb3_ip=
g_clk", USB_3_LPCG, 24, 0);
+	clks[IMX8QXP_USB3_ACLK]		=3D imx_clk_gate_scu("usb3_aclk", "usb3_aclk_div=
", IMX_SC_R_USB_2, IMX_SC_PM_CLK_PER, USB_3_LPCG, 28, 0);
+	clks[IMX8QXP_USB3_BUS_CLK]	=3D imx_clk_gate_scu("usb3_bus_clk", "usb3_bus=
_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MST_BUS, USB_3_LPCG, 0, 0);
+	clks[IMX8QXP_USB3_LPM_CLK]	=3D imx_clk_gate_scu("usb3_lpm_clk", "usb3_lpm=
_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MISC, USB_3_LPCG, 4, 0);
+	clks[IMX8QXP_EDMA_CLK]		=3D imx_clk_gate2_scu("edma_clk", "axi_conn_clk_r=
oot", EDMA_LPCG, 0, 0);
+	clks[IMX8QXP_EDMA_IPG_CLK]	=3D imx_clk_gate2_scu("edma_ipg_clk", "ipg_con=
n_clk_root", EDMA_LPCG, 16, 0);
+	clks[IMX8QXP_MLB_HCLK]		=3D imx_clk_gate2_scu("mlb_hclk", "axi_conn_clk_r=
oot", MLB_LPCG, 20, 0);
+	clks[IMX8QXP_MLB_CLK]		=3D imx_clk_gate2_scu("mlb_clk", "mlb_hclk", MLB_L=
PCG, 0, 0);
+	clks[IMX8QXP_MLB_IPG_CLK]	=3D imx_clk_gate2_scu("mlb_ipg_clk", "ipg_conn_=
clk_root", MLB_LPCG, 16, 0);
+
+	/* Display controller - DC0 SS */
+	clks[IMX8QXP_DC0_DISP0_CLK]	=3D imx_clk_gate_scu("dc0_disp0_clk", "dc0_di=
sp0_div", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC0, DC_0_LPCG, 0, 0);
+	clks[IMX8QXP_DC0_DISP1_CLK]	=3D imx_clk_gate_scu("dc0_disp1_clk", "dc0_di=
sp1_div", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1, DC_0_LPCG, 4, 0);
+	clks[IMX8QXP_DC0_PRG0_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg0_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x20, 0, 0);
+	clks[IMX8QXP_DC0_PRG0_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg0_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x20, 16, 0);
+	clks[IMX8QXP_DC0_PRG1_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg1_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x24, 0, 0);
+	clks[IMX8QXP_DC0_PRG1_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg1_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x24, 16, 0);
+	clks[IMX8QXP_DC0_PRG2_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg2_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x28, 0, 0);
+	clks[IMX8QXP_DC0_PRG2_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg2_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x28, 16, 0);
+	clks[IMX8QXP_DC0_PRG3_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg3_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x34, 0, 0);
+	clks[IMX8QXP_DC0_PRG3_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg3_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x34, 16, 0);
+	clks[IMX8QXP_DC0_PRG4_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg4_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x38, 0, 0);
+	clks[IMX8QXP_DC0_PRG4_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg4_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x38, 16, 0);
+	clks[IMX8QXP_DC0_PRG5_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg5_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x3c, 0, 0);
+	clks[IMX8QXP_DC0_PRG5_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg5_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x3c, 16, 0);
+	clks[IMX8QXP_DC0_PRG6_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg6_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x40, 0, 0);
+	clks[IMX8QXP_DC0_PRG6_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg6_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x40, 16, 0);
+	clks[IMX8QXP_DC0_PRG7_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg7_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x44, 0, 0);
+	clks[IMX8QXP_DC0_PRG7_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg7_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x44, 16, 0);
+	clks[IMX8QXP_DC0_PRG8_RTRAM_CLK] =3D imx_clk_gate2_scu("dc0_prg8_rtram_cl=
k", "axi_int_dc_clk_root", DC_0_LPCG + 0x48, 0, 0);
+	clks[IMX8QXP_DC0_PRG8_APB_CLK]	=3D imx_clk_gate2_scu("dc0_prg8_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x48, 16, 0);
+	clks[IMX8QXP_DC0_DPR0_APB_CLK]	=3D imx_clk_gate2_scu("dc0_dpr0_apb_clk", =
"cfg_dc_clk_root", DC_0_LPCG + 0x18, 16, 0);
+	clks[IMX8QXP_DC0_DPR0_B_CLK]	=3D imx_clk_gate2_scu("dc0_dpr0_b_clk", "axi=
_ext_dc_clk_root", DC_0_LPCG + 0x18, 20, 0);
+	clks[IMX8QXP_DC0_RTRAM0_CLK]	=3D imx_clk_gate2_scu("dc0_rtrm0_clk", "axi_=
int_dc_clk_root", DC_0_LPCG + 0x1C, 0, 0);
+	clks[IMX8QXP_DC0_RTRAM1_CLK]	=3D imx_clk_gate2_scu("dc0_rtrm1_clk", "axi_=
int_dc_clk_root", DC_0_LPCG + 0x30, 0, 0);
+
+	/* Display interface - MIPI-LVDS SS */
+	clks[IMX8QXP_MIPI0_I2C0_DIV]	=3D imx_clk_divider_scu("mipi_i2c0_div", IMX=
_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2);
+	clks[IMX8QXP_MIPI0_I2C1_DIV]	=3D imx_clk_divider_scu("mipi_i2c1_div", IMX=
_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2);
+	clks[IMX8QXP_MIPI0_I2C0_CLK]	=3D imx_clk_gate_scu("mipi_i2c0_clk", "mipi_=
i2c0_div", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2, DI_MIPI0_LPCG + 0x14=
, 0, 0);
+	clks[IMX8QXP_MIPI0_I2C1_CLK]	=3D imx_clk_gate_scu("mipi_i2c1_clk", "mipi_=
i2c1_div", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2, DI_MIPI0_LPCG + 0x14=
, 0, 0);
+	clks[IMX8QXP_MIPI0_I2C0_IPG_S_CLK] =3D imx_clk_gate2_scu("mipi_i2c0_ipg_s=
", "ipg_mipi_clk_root", DI_MIPI0_LPCG + 0x10, 0, 0);
+	clks[IMX8QXP_MIPI0_I2C0_IPG_CLK] =3D imx_clk_gate2_scu("mipi_i2c0_ipg_clk=
", "mipi_i2c0_ipg_s", DI_MIPI0_LPCG, 0, 0);
+	clks[IMX8QXP_MIPI0_I2C1_IPG_S_CLK] =3D imx_clk_gate2_scu("mipi_i2c1_ipg_s=
", "ipg_mipi_clk_root", DI_MIPI0_LPCG + 0x14, 0, 0);
+	clks[IMX8QXP_MIPI0_I2C1_IPG_CLK] =3D imx_clk_gate2_scu("mipi_i2c1_ipg_clk=
", "mipi_i2c1_ipg_s", DI_MIPI0_LPCG, 0, 0);
+	clks[IMX8QXP_MIPI0_PWM_IPG_S_CLK] =3D imx_clk_gate2_scu("mipi_pwm_ipg_s",=
 "ipg_mipi_clk_root", DI_MIPI0_LPCG + 0xC, 0, 0);
+	clks[IMX8QXP_MIPI0_PWM_IPG_CLK]	=3D imx_clk_gate2_scu("mipi_pwm_ipg_clk",=
 "mipi_pwm_ipg_s", DI_MIPI0_LPCG + 0xC, 0, 0);
+	clks[IMX8QXP_MIPI0_PWM_32K_CLK]	=3D imx_clk_gate2_scu("mipi_pwm_32K_clk",=
 "xtal_32KHz", DI_MIPI0_LPCG + 0xC, 0, 0);
+	clks[IMX8QXP_MIPI0_GPIO_IPG_CLK] =3D imx_clk_gate2_scu("mipi_gpio_ipg_clk=
", "ipg_mipi_clk_root", DI_MIPI0_LPCG + 0x8, 0, 0);
+
+	/* Imaging SS */
+	clks[IMX8QXP_IMG_JPEG_ENC_IPG_CLK]	=3D imx_clk_gate2_scu("img_jpeg_enc_ip=
g_clk", "ipg_img_clk_root", IMG_JPEG_ENC_LPCG, 16, 0);
+	clks[IMX8QXP_IMG_JPEG_ENC_CLK]		=3D imx_clk_gate2_scu("img_jpeg_enc_clk",=
 "img_jpeg_enc_ipg_clk", IMG_JPEG_ENC_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_JPEG_DEC_IPG_CLK]	=3D imx_clk_gate2_scu("img_jpeg_dec_ip=
g_clk", "ipg_img_clk_root", IMG_JPEG_DEC_LPCG, 16, 0);
+	clks[IMX8QXP_IMG_JPEG_DEC_CLK]		=3D imx_clk_gate2_scu("img_jpeg_dec_clk",=
 "img_jpeg_dec_ipg_clk", IMG_JPEG_DEC_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PXL_LINK_DC0_CLK]	=3D imx_clk_gate2_scu("img_pxl_link_dc=
0_clk", "pxl_img_clk_root", IMG_PXL_LINK_DC0_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PXL_LINK_DC1_CLK]	=3D imx_clk_gate2_scu("img_pxl_link_dc=
1_clk", "pxl_img_clk_root", IMG_PXL_LINK_DC1_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PXL_LINK_CSI0_CLK]	=3D imx_clk_gate2_scu("img_pxl_link_c=
si0_clk", "pxl_img_clk_root", IMG_PXL_LINK_CSI0_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PXL_LINK_CSI1_CLK]	=3D imx_clk_gate2_scu("img_pxl_link_c=
si1_clk", "pxl_img_clk_root", IMG_PXL_LINK_CSI1_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PXL_LINK_HDMI_IN_CLK]	=3D imx_clk_gate2_scu("img_pxl_lin=
k_hdmi_in_clk", "pxl_img_clk_root", IMG_PXL_LINK_HDMI_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PDMA_0_CLK]		=3D imx_clk_gate2_scu("img_pdma0_clk", "pxl=
_img_clk_root", IMG_PDMA_0_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PDMA_1_CLK]		=3D imx_clk_gate2_scu("img_pdma1_clk", "pxl=
_img_clk_root", IMG_PDMA_1_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PDMA_2_CLK]		=3D imx_clk_gate2_scu("img_pdma2_clk", "pxl=
_img_clk_root", IMG_PDMA_2_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PDMA_3_CLK]		=3D imx_clk_gate2_scu("img_pdma3_clk", "pxl=
_img_clk_root", IMG_PDMA_3_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PDMA_4_CLK]		=3D imx_clk_gate2_scu("img_pdma4_clk", "pxl=
_img_clk_root", IMG_PDMA_4_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PDMA_5_CLK]		=3D imx_clk_gate2_scu("img_pdma5_clk", "pxl=
_img_clk_root", IMG_PDMA_5_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PDMA_6_CLK]		=3D imx_clk_gate2_scu("img_pdma6_clk", "pxl=
_img_clk_root", IMG_PDMA_6_LPCG, 0, 0);
+	clks[IMX8QXP_IMG_PDMA_7_CLK]		=3D imx_clk_gate2_scu("img_pdma7_clk", "pxl=
_img_clk_root", IMG_PDMA_7_LPCG, 0, 0);
+
+	/* MIPI CSI SS */
+	clks[IMX8QXP_CSI0_I2C0_DIV]	=3D imx_clk_divider_scu("mipi_csi0_i2c0_div",=
 IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CSI0_PWM0_DIV]	=3D imx_clk_divider_scu("mipi_csi0_pwm0_div",=
 IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CSI0_CORE_DIV]	=3D imx_clk_divider_scu("mipi_csi0_core_div",=
 IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER);
+	clks[IMX8QXP_CSI0_ESC_DIV]	=3D imx_clk_divider_scu("mipi_csi0_esc_div", I=
MX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC);
+	clks[IMX8QXP_CSI0_IPG_CLK_S]	=3D imx_clk_gate2_scu("mipi_csi0_ipg_s", "ip=
g_mipi_csi_clk_root", MIPI_CSI_0_LPCG + 0x8, 16, 0);
+	clks[IMX8QXP_CSI0_IPG_CLK]	=3D imx_clk_gate2_scu("mipi_csi0_ipg", "mipi_c=
si0_ipg_s", MIPI_CSI_0_LPCG, 16, 0);
+	clks[IMX8QXP_CSI0_APB_CLK]	=3D imx_clk_gate2_scu("mipi_csi0_apb_clk", "ip=
g_mipi_csi_clk_root", MIPI_CSI_0_LPCG + 0x4, 16,  0);
+	clks[IMX8QXP_CSI0_I2C0_IPG_CLK]	=3D imx_clk_gate2_scu("mipi_csi0_i2c0_ipg=
_s", "ipg_mipi_csi_clk_root", MIPI_CSI_0_LPCG + 0x14, 16, 0);
+	clks[IMX8QXP_CSI0_I2C0_CLK]	=3D imx_clk_gate_scu("mipi_csi0_i2c0_clk", "m=
ipi_csi0_i2c0_div", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER, MIPI_CSI_0_LPC=
G + 0x14, 0, 0);
+	clks[IMX8QXP_CSI0_PWM0_IPG_CLK]	=3D imx_clk_gate2_scu("mipi_csi0_pwm0_ipg=
_s", "ipg_mipi_csi_clk_root", MIPI_CSI_0_LPCG + 0x10, 16, 0);
+	clks[IMX8QXP_CSI0_PWM0_CLK]	=3D imx_clk_gate_scu("mipi_csi0_pwm0_clk", "m=
ipi_csi0_pwm0_div", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER, MIPI_CSI_0_LPC=
G + 0x10, 0, 0);
+	clks[IMX8QXP_CSI0_CORE_CLK]	=3D imx_clk_gate_scu("mipi_csi0_core_clk", "m=
ipi_csi0_core_div", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER, MIPI_CSI_0_LPCG + 0x=
18, 16, 0);
+	clks[IMX8QXP_CSI0_ESC_CLK]	=3D imx_clk_gate_scu("mipi_csi0_esc_clk", "mip=
i_csi0_esc_div", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC, MIPI_CSI_0_LPCG + 0x1C=
, 16, 0);
+
+	/* HSIO SS */
+	clks[IMX8QXP_HSIO_PCIE_MSTR_AXI_CLK]	=3D imx_clk_gate2_scu("hsio_pcie_mst=
r_axi_clk", "axi_hsio_clk_root", HSIO_PCIE_X1_LPCG, 16, 0);
+	clks[IMX8QXP_HSIO_PCIE_SLV_AXI_CLK]	=3D imx_clk_gate2_scu("hsio_pcie_slv_=
axi_clk", "axi_hsio_clk_root", HSIO_PCIE_X1_LPCG, 20, 0);
+	clks[IMX8QXP_HSIO_PCIE_DBI_AXI_CLK]	=3D imx_clk_gate2_scu("hsio_pcie_dbi_=
axi_clk", "axi_hsio_clk_root", HSIO_PCIE_X1_LPCG, 24, 0);
+	clks[IMX8QXP_HSIO_PCIE_X1_PER_CLK]	=3D imx_clk_gate2_scu("hsio_pcie_x1_pe=
r_clk", "per_hsio_clk_root", HSIO_PCIE_X1_CRR3_LPCG, 16, 0);
+	clks[IMX8QXP_HSIO_PHY_X1_PER_CLK]	=3D imx_clk_gate2_scu("hsio_phy_x1_per_=
clk", "per_hsio_clk_root", HSIO_PHY_X1_CRR1_LPCG, 16, 0);
+	clks[IMX8QXP_HSIO_MISC_PER_CLK]		=3D imx_clk_gate2_scu("hsio_misc_per_clk=
", "per_hsio_clk_root", HSIO_MISC_LPCG, 16, 0);
+	clks[IMX8QXP_HSIO_PHY_X1_APB_CLK]	=3D imx_clk_gate2_scu("hsio_phy_x1_apb_=
clk", "per_hsio_clk_root", HSIO_PHY_X1_LPCG, 16, 0);
+	clks[IMX8QXP_HSIO_GPIO_CLK]		=3D imx_clk_gate2_scu("hsio_gpio_clk", "per_=
hsio_clk_root", HSIO_GPIO_LPCG, 16, 0);
+	clks[IMX8QXP_HSIO_PHY_X1_PCLK]		=3D imx_clk_gate2_scu("hsio_phy_x1_pclk",=
 "dummy", HSIO_PHY_X1_LPCG, 0, 0);
+
+	for (i =3D 0; i < imx8qxp_clk_data->num; i++) {
+		if (IS_ERR(clks[i]))
+			pr_err("i.MX clk %u: register failed with %ld\n",
+				i, PTR_ERR(clks[i]));
+	}
+
+	return of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, imx8qxp_cl=
k_data);
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
+
+static int __init imx8qxp_clk_init(void)
+{
+	return platform_driver_register(&imx8qxp_clk_driver);
+}
+core_initcall(imx8qxp_clk_init);
diff --git a/include/dt-bindings/clock/imx8qxp-clock.h b/include/dt-binding=
s/clock/imx8qxp-clock.h
new file mode 100644
index 0000000..c0b31aa
--- /dev/null
+++ b/include/dt-bindings/clock/imx8qxp-clock.h
@@ -0,0 +1,362 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_IMX8QXP_H
+#define __DT_BINDINGS_CLOCK_IMX8QXP_H
+
+#define IMX8QXP_CLK_DUMMY					0
+
+#define IMX8QXP_UART0_IPG_CLK					1
+#define IMX8QXP_UART0_DIV					2
+#define IMX8QXP_UART0_CLK					3
+
+#define IMX8QXP_IPG_DMA_CLK_ROOT				4
+
+/* GPU Clocks. */
+#define IMX8QXP_GPU0_CORE_DIV					5
+#define IMX8QXP_GPU0_CORE_CLK					6
+#define IMX8QXP_GPU0_SHADER_DIV					7
+#define IMX8QXP_GPU0_SHADER_CLK					8
+
+#define IMX8QXP_24MHZ						9
+#define IMX8QXP_GPT_3M						10
+#define IMX8QXP_32KHZ						11
+
+/* LSIO SS */
+#define IMX8QXP_LSIO_MEM_CLK					12
+#define IMX8QXP_LSIO_BUS_CLK					13
+#define IMX8QXP_LSIO_PWM0_DIV					14
+#define IMX8QXP_LSIO_PWM0_IPG_S_CLK				15
+#define IMX8QXP_LSIO_PWM0_IPG_SLV_CLK				16
+#define IMX8QXP_LSIO_PWM0_IPG_MSTR_CLK				17
+#define IMX8QXP_LSIO_PWM0_HF_CLK				18
+#define IMX8QXP_LSIO_PWM0_CLK					19
+#define IMX8QXP_LSIO_PWM1_DIV					20
+#define IMX8QXP_LSIO_PWM1_IPG_S_CLK				21
+#define IMX8QXP_LSIO_PWM1_IPG_SLV_CLK				22
+#define IMX8QXP_LSIO_PWM1_IPG_MSTR_CLK				23
+#define IMX8QXP_LSIO_PWM1_HF_CLK				24
+#define IMX8QXP_LSIO_PWM1_CLK					25
+#define IMX8QXP_LSIO_PWM2_DIV					26
+#define IMX8QXP_LSIO_PWM2_IPG_S_CLK				27
+#define IMX8QXP_LSIO_PWM2_IPG_SLV_CLK				28
+#define IMX8QXP_LSIO_PWM2_IPG_MSTR_CLK				29
+#define IMX8QXP_LSIO_PWM2_HF_CLK				30
+#define IMX8QXP_LSIO_PWM2_CLK					31
+#define IMX8QXP_LSIO_PWM3_DIV					32
+#define IMX8QXP_LSIO_PWM3_IPG_S_CLK				33
+#define IMX8QXP_LSIO_PWM3_IPG_SLV_CLK				34
+#define IMX8QXP_LSIO_PWM3_IPG_MSTR_CLK				35
+#define IMX8QXP_LSIO_PWM3_HF_CLK				36
+#define IMX8QXP_LSIO_PWM3_CLK					37
+#define IMX8QXP_LSIO_PWM4_DIV					38
+#define IMX8QXP_LSIO_PWM4_IPG_S_CLK				39
+#define IMX8QXP_LSIO_PWM4_IPG_SLV_CLK				40
+#define IMX8QXP_LSIO_PWM4_IPG_MSTR_CLK				42
+#define IMX8QXP_LSIO_PWM4_HF_CLK				43
+#define IMX8QXP_LSIO_PWM4_CLK					44
+#define IMX8QXP_LSIO_PWM5_DIV					45
+#define IMX8QXP_LSIO_PWM5_IPG_S_CLK				46
+#define IMX8QXP_LSIO_PWM5_IPG_SLV_CLK				47
+#define IMX8QXP_LSIO_PWM5_IPG_MSTR_CLK				48
+#define IMX8QXP_LSIO_PWM5_HF_CLK				49
+#define IMX8QXP_LSIO_PWM5_CLK					50
+#define IMX8QXP_LSIO_PWM6_DIV					51
+#define IMX8QXP_LSIO_PWM6_IPG_S_CLK				52
+#define IMX8QXP_LSIO_PWM6_IPG_SLV_CLK				53
+#define IMX8QXP_LSIO_PWM6_IPG_MSTR_CLK				54
+#define IMX8QXP_LSIO_PWM6_HF_CLK				55
+#define IMX8QXP_LSIO_PWM6_CLK					56
+#define IMX8QXP_LSIO_PWM7_DIV					57
+#define IMX8QXP_LSIO_PWM7_IPG_S_CLK				58
+#define IMX8QXP_LSIO_PWM7_IPG_SLV_CLK				59
+#define IMX8QXP_LSIO_PWM7_IPG_MSTR_CLK				60
+#define IMX8QXP_LSIO_PWM7_HF_CLK				61
+#define IMX8QXP_LSIO_PWM7_CLK					62
+#define IMX8QXP_LSIO_GPT0_DIV					63
+#define IMX8QXP_LSIO_GPT0_IPG_S_CLK				64
+#define IMX8QXP_LSIO_GPT0_IPG_SLV_CLK				65
+#define IMX8QXP_LSIO_GPT0_IPG_MSTR_CLK				66
+#define IMX8QXP_LSIO_GPT0_HF_CLK				67
+#define IMX8QXP_LSIO_GPT0_CLK					68
+#define IMX8QXP_LSIO_GPT1_DIV					69
+#define IMX8QXP_LSIO_GPT1_IPG_S_CLK				70
+#define IMX8QXP_LSIO_GPT1_IPG_SLV_CLK				71
+#define IMX8QXP_LSIO_GPT1_IPG_MSTR_CLK				72
+#define IMX8QXP_LSIO_GPT1_HF_CLK				73
+#define IMX8QXP_LSIO_GPT1_CLK					74
+#define IMX8QXP_LSIO_GPT2_DIV					75
+#define IMX8QXP_LSIO_GPT2_IPG_S_CLK				76
+#define IMX8QXP_LSIO_GPT2_IPG_SLV_CLK				77
+#define IMX8QXP_LSIO_GPT2_IPG_MSTR_CLK				78
+#define IMX8QXP_LSIO_GPT2_HF_CLK				79
+#define IMX8QXP_LSIO_GPT2_CLK					80
+#define IMX8QXP_LSIO_GPT3_DIV					81
+#define IMX8QXP_LSIO_GPT3_IPG_S_CLK				82
+#define IMX8QXP_LSIO_GPT3_IPG_SLV_CLK				83
+#define IMX8QXP_LSIO_GPT3_IPG_MSTR_CLK				84
+#define IMX8QXP_LSIO_GPT3_HF_CLK				85
+#define IMX8QXP_LSIO_GPT3_CLK					86
+#define IMX8QXP_LSIO_GPT4_DIV					87
+#define IMX8QXP_LSIO_GPT4_IPG_S_CLK				88
+#define IMX8QXP_LSIO_GPT4_IPG_SLV_CLK				89
+#define IMX8QXP_LSIO_GPT4_IPG_MSTR_CLK				90
+#define IMX8QXP_LSIO_GPT4_HF_CLK				91
+#define IMX8QXP_LSIO_GPT4_CLK					92
+#define IMX8QXP_LSIO_FSPI0_DIV					93
+#define IMX8QXP_LSIO_FSPI0_HCLK					94
+#define IMX8QXP_LSIO_FSPI0_IPG_S_CLK				95
+#define IMX8QXP_LSIO_FSPI0_IPG_CLK				96
+#define IMX8QXP_LSIO_FSPI0_CLK					97
+#define IMX8QXP_LSIO_FSPI1_DIV					98
+#define IMX8QXP_LSIO_FSPI1_HCLK					99
+#define IMX8QXP_LSIO_FSPI1_IPG_S_CLK				100
+#define IMX8QXP_LSIO_FSPI1_IPG_CLK				101
+#define IMX8QXP_LSIO_FSPI1_CLK					102
+#define IMX8QXP_LSIO_GPIO0_IPG_S_CLK				103
+#define IMX8QXP_LSIO_GPIO1_IPG_S_CLK				104
+#define IMX8QXP_LSIO_GPIO2_IPG_S_CLK				105
+#define IMX8QXP_LSIO_GPIO3_IPG_S_CLK				106
+#define IMX8QXP_LSIO_GPIO4_IPG_S_CLK				107
+#define IMX8QXP_LSIO_GPIO5_IPG_S_CLK				108
+#define IMX8QXP_LSIO_GPIO6_IPG_S_CLK				109
+#define IMX8QXP_LSIO_GPIO7_IPG_S_CLK				110
+#define IMX8QXP_LSIO_ROMCP_REG_CLK				111
+#define IMX8QXP_LSIO_ROMCP_CLK					112
+#define IMX8QXP_LSIO_96KROM_CLK					113
+#define IMX8QXP_LSIO_OCRAM_MEM_CLK				114
+#define IMX8QXP_LSIO_OCRAM_CTRL_CLK				115
+
+/* ADMA SS */
+#define IMX8QXP_UART1_IPG_CLK					116
+#define IMX8QXP_UART2_IPG_CLK					117
+#define IMX8QXP_UART3_IPG_CLK					118
+#define IMX8QXP_UART1_DIV					119
+#define IMX8QXP_UART2_DIV					120
+#define IMX8QXP_UART3_DIV					121
+#define IMX8QXP_UART1_CLK					122
+#define IMX8QXP_UART2_CLK					123
+#define IMX8QXP_UART3_CLK					124
+#define IMX8QXP_SPI0_IPG_CLK					125
+#define IMX8QXP_SPI1_IPG_CLK					126
+#define IMX8QXP_SPI2_IPG_CLK					127
+#define IMX8QXP_SPI3_IPG_CLK					128
+#define IMX8QXP_SPI0_DIV					129
+#define IMX8QXP_SPI1_DIV					130
+#define IMX8QXP_SPI2_DIV					131
+#define IMX8QXP_SPI3_DIV					132
+#define IMX8QXP_SPI0_CLK					133
+#define IMX8QXP_SPI1_CLK					134
+#define IMX8QXP_SPI2_CLK					135
+#define IMX8QXP_SPI3_CLK					136
+#define IMX8QXP_CAN0_IPG_CHI_CLK				137
+#define IMX8QXP_CAN1_IPG_CHI_CLK				138
+#define IMX8QXP_CAN2_IPG_CHI_CLK				139
+#define IMX8QXP_CAN0_IPG_CLK					140
+#define IMX8QXP_CAN1_IPG_CLK					141
+#define IMX8QXP_CAN2_IPG_CLK					142
+#define IMX8QXP_CAN0_DIV					143
+#define IMX8QXP_CAN1_DIV					144
+#define IMX8QXP_CAN2_DIV					145
+#define IMX8QXP_CAN0_CLK					146
+#define IMX8QXP_CAN1_CLK					147
+#define IMX8QXP_CAN2_CLK					148
+#define IMX8QXP_I2C0_IPG_CLK					149
+#define IMX8QXP_I2C1_IPG_CLK					150
+#define IMX8QXP_I2C2_IPG_CLK					151
+#define IMX8QXP_I2C3_IPG_CLK					152
+#define IMX8QXP_I2C0_DIV					153
+#define IMX8QXP_I2C1_DIV					154
+#define IMX8QXP_I2C2_DIV					155
+#define IMX8QXP_I2C3_DIV					156
+#define IMX8QXP_I2C0_CLK					157
+#define IMX8QXP_I2C1_CLK					158
+#define IMX8QXP_I2C2_CLK					159
+#define IMX8QXP_I2C3_CLK					160
+#define IMX8QXP_FTM0_IPG_CLK					161
+#define IMX8QXP_FTM1_IPG_CLK					162
+#define IMX8QXP_FTM0_DIV					163
+#define IMX8QXP_FTM1_DIV					164
+#define IMX8QXP_FTM0_CLK					165
+#define IMX8QXP_FTM1_CLK					166
+#define IMX8QXP_ADC0_IPG_CLK					167
+#define IMX8QXP_ADC0_DIV					168
+#define IMX8QXP_ADC0_CLK					169
+#define IMX8QXP_PWM_IPG_CLK					170
+#define IMX8QXP_PWM_DIV						171
+#define IMX8QXP_PWM_CLK						172
+#define IMX8QXP_LCD_IPG_CLK					173
+#define IMX8QXP_LCD_DIV						174
+#define IMX8QXP_LCD_CLK						175
+
+/* Connectivity SS */
+#define IMX8QXP_AXI_CONN_CLK_ROOT				176
+#define IMX8QXP_AHB_CONN_CLK_ROOT				177
+#define IMX8QXP_IPG_CONN_CLK_ROOT				178
+#define IMX8QXP_SDHC0_IPG_CLK					179
+#define IMX8QXP_SDHC1_IPG_CLK					180
+#define IMX8QXP_SDHC2_IPG_CLK					181
+#define IMX8QXP_SDHC0_DIV					182
+#define IMX8QXP_SDHC1_DIV					183
+#define IMX8QXP_SDHC2_DIV					184
+#define IMX8QXP_SDHC0_CLK					185
+#define IMX8QXP_SDHC1_CLK					186
+#define IMX8QXP_SDHC2_CLK					187
+#define IMX8QXP_ENET0_ROOT_DIV					188
+#define IMX8QXP_ENET0_REF_DIV					189
+#define IMX8QXP_ENET1_REF_DIV					190
+#define IMX8QXP_ENET0_BYPASS_DIV				191
+#define IMX8QXP_ENET0_RGMII_DIV					192
+#define IMX8QXP_ENET1_ROOT_DIV					193
+#define IMX8QXP_ENET1_BYPASS_DIV				194
+#define IMX8QXP_ENET1_RGMII_DIV					195
+#define IMX8QXP_ENET0_AHB_CLK					196
+#define IMX8QXP_ENET0_IPG_S_CLK					197
+#define IMX8QXP_ENET0_IPG_CLK					198
+#define IMX8QXP_ENET1_AHB_CLK					199
+#define IMX8QXP_ENET1_IPG_S_CLK					200
+#define IMX8QXP_ENET1_IPG_CLK					201
+#define IMX8QXP_ENET0_ROOT_CLK					202
+#define IMX8QXP_ENET1_ROOT_CLK					203
+#define IMX8QXP_ENET0_TX_CLK					204
+#define IMX8QXP_ENET1_TX_CLK					205
+#define IMX8QXP_ENET0_PTP_CLK					206
+#define IMX8QXP_ENET1_PTP_CLK					207
+#define IMX8QXP_ENET0_REF_25MHZ_125MHZ_SEL			208
+#define IMX8QXP_ENET1_REF_25MHZ_125MHZ_SEL			209
+#define IMX8QXP_ENET0_RMII_TX_SEL				210
+#define IMX8QXP_ENET1_RMII_TX_SEL				211
+#define IMX8QXP_ENET0_RGMII_TX_CLK				212
+#define IMX8QXP_ENET1_RGMII_TX_CLK				213
+#define IMX8QXP_ENET0_RMII_RX_CLK				214
+#define IMX8QXP_ENET1_RMII_RX_CLK				215
+#define IMX8QXP_ENET0_REF_25MHZ_125MHZ_CLK			216
+#define IMX8QXP_ENET1_REF_25MHZ_125MHZ_CLK			217
+#define IMX8QXP_ENET0_REF_50MHZ_CLK				218
+#define IMX8QXP_ENET1_REF_50MHZ_CLK				219
+#define IMX8QXP_GPMI_BCH_IO_DIV					220
+#define IMX8QXP_GPMI_BCH_DIV					221
+#define IMX8QXP_GPMI_APB_CLK					222
+#define IMX8QXP_GPMI_APB_BCH_CLK				223
+#define IMX8QXP_GPMI_BCH_IO_CLK					224
+#define IMX8QXP_GPMI_BCH_CLK					225
+#define IMX8QXP_APBHDMA_CLK					226
+#define IMX8QXP_USB3_ACLK_DIV					227
+#define IMX8QXP_USB3_BUS_DIV					228
+#define IMX8QXP_USB3_LPM_DIV					229
+#define IMX8QXP_USB3_IPG_CLK					230
+#define IMX8QXP_USB3_CORE_PCLK					231
+#define IMX8QXP_USB3_PHY_CLK					232
+#define IMX8QXP_USB3_ACLK					233
+#define IMX8QXP_USB3_BUS_CLK					234
+#define IMX8QXP_USB3_LPM_CLK					235
+#define IMX8QXP_USB2_OH_AHB_CLK					236
+#define IMX8QXP_USB2_OH_IPG_S_CLK				237
+#define IMX8QXP_USB2_OH_IPG_S_PL301_CLK				238
+#define IMX8QXP_USB2_PHY_IPG_CLK				239
+#define IMX8QXP_EDMA_CLK					240
+#define IMX8QXP_EDMA_IPG_CLK					241
+#define IMX8QXP_MLB_HCLK					242
+#define IMX8QXP_MLB_CLK						243
+#define IMX8QXP_MLB_IPG_CLK					244
+
+/* Display controller SS */
+/* DC part1 */
+#define IMX8QXP_DC_AXI_EXT_CLK					245
+#define IMX8QXP_DC_AXI_INT_CLK					246
+#define IMX8QXP_DC_CFG_CLK					247
+#define IMX8QXP_DC0_DISP0_CLK					248
+#define IMX8QXP_DC0_DISP1_CLK					249
+#define IMX8QXP_DC0_PRG0_RTRAM_CLK				250
+#define IMX8QXP_DC0_PRG0_APB_CLK				251
+#define IMX8QXP_DC0_PRG1_RTRAM_CLK				252
+#define IMX8QXP_DC0_PRG1_APB_CLK				253
+#define IMX8QXP_DC0_PRG2_RTRAM_CLK				254
+#define IMX8QXP_DC0_PRG2_APB_CLK				255
+#define IMX8QXP_DC0_PRG3_RTRAM_CLK				256
+#define IMX8QXP_DC0_PRG3_APB_CLK				257
+#define IMX8QXP_DC0_PRG4_RTRAM_CLK				258
+#define IMX8QXP_DC0_PRG4_APB_CLK				259
+#define IMX8QXP_DC0_PRG5_RTRAM_CLK				260
+#define IMX8QXP_DC0_PRG5_APB_CLK				261
+#define IMX8QXP_DC0_PRG6_RTRAM_CLK				262
+#define IMX8QXP_DC0_PRG6_APB_CLK				263
+#define IMX8QXP_DC0_PRG7_RTRAM_CLK				264
+#define IMX8QXP_DC0_PRG7_APB_CLK				265
+#define IMX8QXP_DC0_PRG8_RTRAM_CLK				266
+#define IMX8QXP_DC0_PRG8_APB_CLK				267
+#define IMX8QXP_DC0_DPR0_APB_CLK				268
+#define IMX8QXP_DC0_DPR0_B_CLK					269
+#define IMX8QXP_DC0_RTRAM0_CLK					270
+#define IMX8QXP_DC0_RTRAM1_CLK					271
+
+/* MIPI-LVDS part1 */
+#define IMX8QXP_MIPI_IPG_CLK					272
+#define IMX8QXP_MIPI0_I2C0_DIV					273
+#define IMX8QXP_MIPI0_I2C1_DIV					274
+#define IMX8QXP_MIPI0_I2C0_CLK					275
+#define IMX8QXP_MIPI0_I2C1_CLK					276
+#define IMX8QXP_MIPI0_I2C0_IPG_S_CLK				277
+#define IMX8QXP_MIPI0_I2C0_IPG_CLK				278
+#define IMX8QXP_MIPI0_I2C1_IPG_S_CLK				279
+#define IMX8QXP_MIPI0_I2C1_IPG_CLK				280
+#define IMX8QXP_MIPI0_PWM_IPG_S_CLK				281
+#define IMX8QXP_MIPI0_PWM_IPG_CLK				282
+#define IMX8QXP_MIPI0_PWM_32K_CLK				283
+#define IMX8QXP_MIPI0_GPIO_IPG_CLK				284
+
+#define IMX8QXP_IMG_JPEG_ENC_IPG_CLK				285
+#define IMX8QXP_IMG_JPEG_ENC_CLK				286
+#define IMX8QXP_IMG_JPEG_DEC_IPG_CLK				287
+#define IMX8QXP_IMG_JPEG_DEC_CLK				288
+#define IMX8QXP_IMG_PXL_LINK_DC0_CLK				289
+#define IMX8QXP_IMG_PXL_LINK_DC1_CLK				290
+#define IMX8QXP_IMG_PXL_LINK_CSI0_CLK				291
+#define IMX8QXP_IMG_PXL_LINK_CSI1_CLK				292
+#define IMX8QXP_IMG_PXL_LINK_HDMI_IN_CLK			293
+#define IMX8QXP_IMG_PDMA_0_CLK					294
+#define IMX8QXP_IMG_PDMA_1_CLK					295
+#define IMX8QXP_IMG_PDMA_2_CLK					296
+#define IMX8QXP_IMG_PDMA_3_CLK					297
+#define IMX8QXP_IMG_PDMA_4_CLK					298
+#define IMX8QXP_IMG_PDMA_5_CLK					299
+#define IMX8QXP_IMG_PDMA_6_CLK					300
+#define IMX8QXP_IMG_PDMA_7_CLK					301
+#define IMX8QXP_IMG_AXI_CLK					302
+#define IMX8QXP_IMG_IPG_CLK					303
+#define IMX8QXP_IMG_PXL_CLK					304
+
+#define IMX8QXP_CSI0_I2C0_DIV					305
+#define IMX8QXP_CSI0_PWM0_DIV					306
+#define IMX8QXP_CSI0_CORE_DIV					307
+#define IMX8QXP_CSI0_ESC_DIV					308
+#define IMX8QXP_CSI0_IPG_CLK_S					309
+#define IMX8QXP_CSI0_IPG_CLK					310
+#define IMX8QXP_CSI0_APB_CLK					311
+#define IMX8QXP_CSI0_I2C0_IPG_CLK				312
+#define IMX8QXP_CSI0_I2C0_CLK					313
+#define IMX8QXP_CSI0_PWM0_IPG_CLK				314
+#define IMX8QXP_CSI0_PWM0_CLK					315
+#define IMX8QXP_CSI0_CORE_CLK					316
+#define IMX8QXP_CSI0_ESC_CLK					317
+
+#define IMX8QXP_HSIO_AXI_CLK					318
+#define IMX8QXP_HSIO_PER_CLK					319
+#define IMX8QXP_HSIO_PCIE_MSTR_AXI_CLK				320
+#define IMX8QXP_HSIO_PCIE_SLV_AXI_CLK				321
+#define IMX8QXP_HSIO_PCIE_DBI_AXI_CLK				322
+#define IMX8QXP_HSIO_PCIE_X1_PER_CLK				323
+#define IMX8QXP_HSIO_PHY_X1_PER_CLK				324
+#define IMX8QXP_HSIO_MISC_PER_CLK				325
+#define IMX8QXP_HSIO_PHY_X1_APB_CLK				326
+#define IMX8QXP_HSIO_GPIO_CLK					327
+#define IMX8QXP_HSIO_PHY_X1_PCLK				328
+
+#define IMX8QXP_A35_DIV						329
+
+#define IMX8QXP_CLK_END						330
+
+#endif /* __DT_BINDINGS_CLOCK_IMX8QXP_H */
diff --git a/include/soc/imx/imx8qxp/lpcg.h b/include/soc/imx/imx8qxp/lpcg.=
h
new file mode 100644
index 0000000..afbb5da
--- /dev/null
+++ b/include/soc/imx/imx8qxp/lpcg.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *
+ */
+
+#ifndef _SC_LPCG_H
+#define _SC_LPCG_H
+
+/*LSIO SS */
+#define		PWM_0_LPCG		0x5D400000
+#define		PWM_1_LPCG		0x5D410000
+#define		PWM_2_LPCG		0x5D420000
+#define		PWM_3_LPCG		0x5D430000
+#define		PWM_4_LPCG		0x5D440000
+#define		PWM_5_LPCG		0x5D450000
+#define		PWM_6_LPCG		0x5D460000
+#define		PWM_7_LPCG		0x5D470000
+#define		GPIO_0_LPCG		0x5D480000
+#define		GPIO_1_LPCG		0x5D490000
+#define		GPIO_2_LPCG		0x5D4A0000
+#define		GPIO_3_LPCG		0x5D4B0000
+#define		GPIO_4_LPCG		0x5D4C0000
+#define		GPIO_5_LPCG		0x5D4D0000
+#define		GPIO_6_LPCG		0x5D4E0000
+#define		GPIO_7_LPCG		0x5D4F0000
+#define		FSPI_0_LPCG		0x5D520000
+#define		FSPI_1_LPCG		0x5D530000
+#define		GPT_0_LPCG		0x5D540000
+#define		GPT_1_LPCG		0x5D550000
+#define		GPT_2_LPCG		0x5D560000
+#define		GPT_3_LPCG		0x5D570000
+#define		GPT_4_LPCG		0x5D580000
+#define		OCRAM_LPCG		0x5D590000
+#define		KPP_LPCG		0x5D5A0000
+#define		ROMCP_LPCG		0x5D500000
+
+/* HSIO SS */
+#define		CRR_5_LPCG		0x5F0F0000
+#define		CRR_4_LPCG		0x5F0E0000
+#define		CRR_3_LPCG		0x5F0D0000
+#define		CRR_2_LPCG		0x5F0C0000
+#define		CRR_1_LPCG		0x5F0B0000
+#define		CRR_0_LPCG		0x5F0A0000
+#define		PHY_1_LPCG		0x5F090000
+#define		PHY_2_LPCG		0x5F080000
+#define		SATA_0_LPCG		0x5F070000
+#define		PCIE_B_LPCG		0x5F060000
+#define		PCIE_A_LPCG		0x5F050000
+
+/* DMA SS */
+#define		FLEX_CAN_2_LPCG		0x5ACF0000
+#define		FLEX_CAN_1_LPCG		0x5ACE0000
+#define		FLEX_CAN_0_LPCG		0x5ACD0000
+#define		FTM_1_LPCG		0x5ACB0000
+#define		FTM_0_LPCG		0x5ACA0000
+#define		ADC_0_LPCG		0x5AC80000
+#define		LPI2C_3_LPCG		0x5AC30000
+#define		LPI2C_2_LPCG		0x5AC20000
+#define		LPI2C_1_LPCG		0x5AC10000
+#define		LPI2C_0_LPCG		0x5AC00000
+#define		PWM_LPCG		0x5A590000
+#define		LCD_LPCG		0x5A580000
+#define		LPUART_3_LPCG		0x5A490000
+#define		LPUART_2_LPCG		0x5A480000
+#define		LPUART_1_LPCG		0x5A470000
+#define		LPUART_0_LPCG		0x5A460000
+#define		LPSPI_3_LPCG		0x5A430000
+#define		LPSPI_2_LPCG		0x5A420000
+#define		LPSPI_1_LPCG		0x5A410000
+#define		LPSPI_0_LPCG		0x5A400000
+
+/* Display SS */
+#define		DC_0_LPCG		0x56010000
+#define		DC_1_LPCG		0x57010000
+
+/* LVDS */
+#define		DI_LVDS_0_LPCG		0x56243000
+#define		DI_LVDS_1_LPCG		0x57243000
+
+/* DI HDMI */
+#define		DI_HDMI_LPCG		0x56263000
+
+/* RX-HDMI */
+#define		RX_HDMI_LPCG		0x58263000
+
+/* MIPI CSI SS */
+#define		MIPI_CSI_0_LPCG		0x58223000
+#define		MIPI_CSI_1_LPCG		0x58243000
+
+/* PARALLEL CSI SS */
+#define		PARALLEL_CSI_LPCG	0x58263000
+
+/* Display MIPI SS */
+#define		DI_MIPI0_LPCG		0x56223000
+#define		DI_MIPI1_LPCG		0x56243000
+
+/* Imaging SS */
+#define		IMG_JPEG_ENC_LPCG	0x585F0000
+#define		IMG_JPEG_DEC_LPCG	0x585D0000
+#define		IMG_PXL_LINK_DC1_LPCG	0x585C0000
+#define		IMG_PXL_LINK_DC0_LPCG	0x585B0000
+#define		IMG_PXL_LINK_HDMI_LPCG	0x585A0000
+#define		IMG_PXL_LINK_CSI1_LPCG	0x58590000
+#define		IMG_PXL_LINK_CSI0_LPCG	0x58580000
+#define		IMG_PDMA_7_LPCG		0x58570000
+#define		IMG_PDMA_6_LPCG		0x58560000
+#define		IMG_PDMA_5_LPCG		0x58550000
+#define		IMG_PDMA_4_LPCG		0x58540000
+#define		IMG_PDMA_3_LPCG		0x58530000
+#define		IMG_PDMA_2_LPCG		0x58520000
+#define		IMG_PDMA_1_LPCG		0x58510000
+#define		IMG_PDMA_0_LPCG		0x58500000
+
+/* HSIO SS */
+#define		HSIO_GPIO_LPCG		0x5F100000
+#define		HSIO_MISC_LPCG		0x5F0F0000
+#define		HSIO_SATA_CRR4_LPCG	0x5F0E0000
+#define		HSIO_PCIE_X1_CRR3_LPCG	0x5F0D0000
+#define		HSIO_PCIE_X2_CRR2_LPCG	0x5F0C0000
+#define		HSIO_PHY_X1_CRR1_LPCG	0x5F0B0000
+#define		HSIO_PHY_X2_CRR0_LPCG	0x5F0A0000
+#define		HSIO_PHY_X1_LPCG	0x5F090000
+#define		HSIO_PHY_X2_LPCG	0x5F080000
+#define		HSIO_SATA_LPCG		0x5F070000
+#define		HSIO_PCIE_X1_LPCG	0x5F060000
+#define		HSIO_PCIE_X2_LPCG	0x5F050000
+
+/* M4 SS */
+#define		M4_0_I2C_LPCG		0x37630000
+#define		M4_0_LPUART_LPCG	0x37620000
+#define		M4_0_LPIT_LPCG		0x37610000
+#define		M4_1_I2C_LPCG		0x3B630000
+#define		M4_1_LPUART_LPCG	0x3B620000
+#define		M4_1_LPIT_LPCG		0x3B610000
+
+/* Audio SS */
+#define		AUD_ASRC_0_LPCG		0x59400000
+#define		AUD_ESAI_0_LPCG		0x59410000
+#define		AUD_SPDIF_0_LPCG	0x59420000
+#define		AUD_SAI_0_LPCG		0x59440000
+#define		AUD_SAI_1_LPCG		0x59450000
+#define		AUD_SAI_2_LPCG		0x59460000
+#define		AUD_SAI_3_LPCG		0x59470000
+#define		AUD_GPT_5_LPCG		0x594B0000
+#define		AUD_GPT_6_LPCG		0x594C0000
+#define		AUD_GPT_7_LPCG		0x594D0000
+#define		AUD_GPT_8_LPCG		0x594E0000
+#define		AUD_GPT_9_LPCG		0x594F0000
+#define		AUD_GPT_10_LPCG		0x59500000
+#define		AUD_HIFI_LPCG		0x59580000
+#define		AUD_OCRAM_LPCG		0x59590000
+#define		AUD_EDMA_0_LPCG		0x595f0000
+#define		AUD_ASRC_1_LPCG		0x59c00000
+#define		AUD_SAI_4_LPCG		0x59c20000
+#define		AUD_SAI_5_LPCG		0x59c30000
+#define		AUD_AMIX_LPCG		0x59c40000
+#define		AUD_MQS_LPCG		0x59c50000
+#define		AUD_ACM_LPCG		0x59c60000
+#define		AUD_REC_CLK0_LPCG	0x59d00000
+#define		AUD_REC_CLK1_LPCG	0x59d10000
+#define		AUD_PLL_CLK0_LPCG	0x59d20000
+#define		AUD_PLL_CLK1_LPCG	0x59d30000
+#define		AUD_MCLKOUT0_LPCG	0x59d50000
+#define		AUD_MCLKOUT1_LPCG	0x59d60000
+#define		AUD_EDMA_1_LPCG		0x59df0000
+
+
+/* Connectivity SS */
+#define		USDHC_0_LPCG		0x5B200000
+#define		USDHC_1_LPCG		0x5B210000
+#define		USDHC_2_LPCG		0x5B220000
+#define		ENET_0_LPCG		0x5B230000
+#define		ENET_1_LPCG		0x5B240000
+#define		DTCP_LPCG		0x5B250000
+#define		MLB_LPCG		0x5B260000
+#define		USB_2_LPCG		0x5B270000
+#define		USB_3_LPCG		0x5B280000
+#define		NAND_LPCG		0x5B290000
+#define		EDMA_LPCG		0x5B2A0000
+
+/* CM40 SS */
+#define		CM40_I2C_LPCG		0x37630000
+
+#endif
--=20
2.7.4

