Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F46FC43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E69520858
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="J/1YdT/d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E69520858
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbeKKBGL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 20:06:11 -0500
Received: from mail-db5eur01on0042.outbound.protection.outlook.com ([104.47.2.42]:53175
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726334AbeKKBGK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 10 Nov 2018 20:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSieGn6v2pkhktL6r/G47sRMhcxPGxQ/bADwrvqW7AA=;
 b=J/1YdT/dijQ3bzhn8qq5NEmMmRjb3I020aWeCLxoav6w8e3LXwnhEq9YmGmwr3lbtbpDc6AnwcgBsGTsVdk0DlGkID5TdltSU/6DkiyxPTxA9bk4NwS0SUtW6dSpsOYCR1Ogb8yKtpQFdSCf9bb0TVhR7cJ/J33Sj5QglpM7nDw=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4067.eurprd04.prod.outlook.com (52.134.125.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Sat, 10 Nov 2018 15:20:08 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.039; Sat, 10 Nov 2018
 15:20:08 +0000
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
Subject: [PATCH V6 6/6] clk: imx: add imx8qxp lpcg driver
Thread-Topic: [PATCH V6 6/6] clk: imx: add imx8qxp lpcg driver
Thread-Index: AQHUeQjdj127rR5nB0C+9Z8nazMcuw==
Date:   Sat, 10 Nov 2018 15:20:08 +0000
Message-ID: <1541862894-8209-7-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4067;6:qnacKUEqmIxfR14Bgk1xJJg8uMZel1PtyighsToOnE6aFIVSPqK7EyfOmvB7nAW4BJy9/ZE1gGqMppsAEvrLM1jkkPGZ+GH+UtHFEpZdyPwz0ZupLLl8xwqb36vjOBU75O4VWtwKR+CpfoPSBR9diKdMHH0zaSDIj8Jtip+JB3tQ3tKYNtB5UqDXksmSLIBpLnRqEeMEmU4qgHn365gudbzJrk6xwPUuetmIr8Rm5dUW9iJ/ZaJL7tF+MB5s3KHzYbGRy30jCYa7aju+JjKn2dLG5eVSLKR6QvtBrNMHai92BNerjZSXIpV4NV8s+HygNNkKJqHwnpbbRD3CTl4pBp+7E1z/xpZaUJom87UJGqiBGXlzVHFBTfMMcUu4WMltsqfPfOcAvN5/UiRQ6Vs03QGoNxR0kdd+DVzgVrV2v9nOdjj7Db7yYN6zcaB69UWA0BnBCjrfY5n3ljJG7A9NGw==;5:JsqqLsvbszCfpuTv3U7iCDVzawPOBtW2vmBsEebtoeRj96u3M6jBq97/q8r84kiN9vU0khSBavdDyP4FmZrfaLmqF++30wDUVxkjIhKrPGtBBjxvSIFc69nvHJCbnHWE5qP6RCAtY20WNmtxZ0143G3W2/njzi/wg2FRG1Tuerg=;7:yiwlmk9yft8LqpIqtbqU0i97NVvAM0RVVS9pUdzMflu6EAL1BV3zmGFdbMLePoUDNbjCp5s1SmBmfe26G/9RP5cE2HFhyvyBWycZplaOu0KJUodocPVB5mkcy+XrmzYYwmuDGhM5O0RzLfzUzhlboA==
x-ms-office365-filtering-correlation-id: 05e99d93-fe66-412b-8e99-08d6471fffaf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4067;
x-ms-traffictypediagnostic: AM0PR04MB4067:
x-microsoft-antispam-prvs: <AM0PR04MB406716E96055899A88E2FE4C80C70@AM0PR04MB4067.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4067;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4067;
x-forefront-prvs: 0852EB6797
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(366004)(39850400004)(136003)(54534003)(189003)(199004)(2501003)(25786009)(50226002)(71190400001)(4326008)(97736004)(2900100001)(14454004)(8676002)(99286004)(76176011)(186003)(8936002)(53936002)(53946003)(52116002)(5660300001)(102836004)(81156014)(81166006)(68736007)(446003)(386003)(11346002)(26005)(71200400001)(486006)(6512007)(6506007)(66066001)(5640700003)(2616005)(476003)(7736002)(305945005)(86362001)(575784001)(6116002)(6486002)(3846002)(36756003)(6436002)(316002)(54906003)(478600001)(105586002)(106356001)(256004)(6916009)(14444005)(2906002)(2351001)(4744004)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4067;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: lNX45WFlXw/RviHipGEh2w+f7Wwon0f0QKUl5uyZePBggGztGwBADDpn7adSHcsKgAEvzg3+j/EClRxDH1yPFN2sqhx/UCjZz8IITALPF4vWM9Ru4v1zkzS+6IzJKqtlTuddv1nLmRzrLrqIvrBTiW/6a+w8KdTDNnpBOGjMY72lXJvJ3W/ikdzst1ylWLielHR+JgedZdJYTFIvjBxvgBcz8bT7LXUCKyRiCaQh+NYb+d2qVMp9aYh0lCNyzzm4xB8v6gEFpVkvTttg3p68tz9oeK4pLSxZVnHs3TA2o9bLz0Jco/Hdv8dgJvOJrTgpPFAumUbtULFgfHMkpWfyJBgf1gthFS8/vhp+JqnJ5Ew=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e99d93-fe66-412b-8e99-08d6471fffaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2018 15:20:08.2600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4067
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
 v6: new patch, separate from scu gate driver
---
 drivers/clk/imx/Makefile           |   2 +-
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 198 +++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-imx8qxp-lpcg.h | 102 +++++++++++++++++++
 3 files changed, 301 insertions(+), 1 deletion(-)
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
index 0000000..7b318d7
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <dt-bindings/clock/imx8qxp-clock.h>
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
+	clk_data =3D devm_kzalloc(&pdev->dev, sizeof(*clk_data) +
+				sizeof(*clk_data->hws) * ss_lpcg->num_max,
+				GFP_KERNEL);
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
+			pr_err("i.MX clk %u: register failed with %ld\n",
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
+	},
+	.probe =3D imx8qxp_lpcg_clk_probe,
+};
+
+builtin_platform_driver(imx8qxp_lpcg_clk_driver);
+
+MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("IMX8QXP LPCG Clock driver");
+MODULE_LICENSE("GPL v2");
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

