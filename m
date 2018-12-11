Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24D0C07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 15:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78BE92081B
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 15:13:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VMwkSfd9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78BE92081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbeLKPNW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 10:13:22 -0500
Received: from mail-eopbgr60067.outbound.protection.outlook.com ([40.107.6.67]:5968
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726402AbeLKPNV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Dec 2018 10:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xh6hiClCiolwTSRK1RtUPgG1KAEX8e65iQ6zkNL0c6E=;
 b=VMwkSfd9qPullm/nml8B/4TcDWeyktfqfwrDx1BPRSZhWprMpT6kwOrslYEnpvZNtUeCYTKp4XWz96dfe/RJg5LhdYbxZWJgERwYtFFng0lCq7XhYrI+b1bWY/DZY1fn5otdgZInAI0uUJ870bdw9RMEXLoFBHqYheHbEgDzpvA=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4291.eurprd04.prod.outlook.com (52.134.126.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.18; Tue, 11 Dec 2018 15:13:17 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Tue, 11 Dec 2018
 15:13:17 +0000
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
Subject: [PATCH V10 1/7] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V10 1/7] clk: imx: add configuration option for mmio clks
Thread-Index: AQHUkWQLbGd8McQJ50K05Ro1RXHVEg==
Date:   Tue, 11 Dec 2018 15:13:16 +0000
Message-ID: <1544540867-6342-2-git-send-email-aisheng.dong@nxp.com>
References: <1544540867-6342-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1544540867-6342-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0081.apcprd03.prod.outlook.com
 (2603:1096:203:72::21) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4291;6:Z/VcYmHvCsEulfa4vMdFrCDuF9NedbzfWT76Kc9ATTAXSBsGtD5eM0jHZFDdG9m6NC3Nu8h83aFBEpH9Ds5iDahAD6mfz2AmQBMWGJ/OropBbDdhV1T7jIgkCuQQVe3OnOcBV+U2M/iLV7fU8tep7GjSDLB622jm0MuqBaifa8VVO3y357tEI8m/pmrn3cLi5mEQiKbS9Z+nUQ700MAFwpwluFnU8nBdZV6Wvizwh1V0w4iJJVxWYRx27UoyVP2mxVyc3pF449OUzYEG/BnFpT0yFbAjyFNHIBceeDURbbORwR0hESthAUVXUBdvkwxcU42poF2CUA0OuPDu91YTkAbrsg31bkx7JfLK5p5V2K8x56LcjvU1NGdMNXj4Mkr5GIHis0JMPrM6LnZln5cmHQKo9a0GCMpYQTX83eXAE22KJ4mP1QwOE1o339Giq+kscctt7m0yGuNcXDsntwAqHg==;5:YfVXP90oABGMC1YA7Ttyqt8HDG0Dhe+b0zLAcNUaIqmh3qg/eNyZEXCj4s2B8WM7ERFnGYN7MqvbgVNbLp8zCIUiJcW0TYqQ0iRBWBPoUXmfq8KijyTFwUYL9Oxbo6QHsvKyqUoK0R3CgW5dO0McUEWqFUt1f6uOQx5B2GxhdFE=;7:AAezWUgrEvSlaLJH5UK0AJl54TzUMwxGcng9WwYanrQ20+hRmT2MgHseZkAymoPXfdZRav+hjIGia44H5HKaGiRPHAhqbp1pchME4VSQ6QB/Y2Ebc6BacwCV4eM1hM7WlA55rdK2Ga+MLmYsDAVqkg==
x-ms-office365-filtering-correlation-id: dca838c9-84f2-497b-effb-08d65f7b2d6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4291;
x-ms-traffictypediagnostic: AM0PR04MB4291:
x-microsoft-antispam-prvs: <AM0PR04MB42919CEC5CD2D388162EFFBD80A60@AM0PR04MB4291.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3231472)(944501520)(52105112)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4291;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4291;
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(39860400002)(366004)(346002)(136003)(199004)(189003)(102836004)(3846002)(386003)(6506007)(66066001)(486006)(26005)(6512007)(8676002)(186003)(6116002)(4326008)(476003)(2616005)(446003)(97736004)(11346002)(54906003)(316002)(25786009)(36756003)(76176011)(53936002)(6486002)(99286004)(6436002)(106356001)(44832011)(105586002)(5640700003)(5660300001)(2351001)(52116002)(7736002)(6916009)(575784001)(68736007)(71200400001)(71190400001)(86362001)(50226002)(305945005)(2906002)(14444005)(2501003)(8936002)(478600001)(81156014)(256004)(81166006)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4291;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: XSQ2hSGcZJo/rBfGYofzSpNDqmgY6pPeNr1K066sDQTpNr7Hbn9XzTB9wRhEos8VqaU1c2Dl1ugqL9/bUB6AEzwrf/4ivD49UUQxXr369/bQaHoFhNcQYgFPZJQapVaTjk7TZ++gFI5//FR1TDeXB/l+HuAnE5nu+nj349QcGWlO8DbeADVYGkgqdZebvUK7dz9exdu60P6OFI3IMd3/x8m2FkZKcLlRQkEmzj7Tw2e1VxvIPQlIqxr6TRA0rS+DXbONRR0ab4S0zsBXPZ+XrTva1Y5odiWhuZ9miUT/Ao96NeGLte3CxEEVi4tJinXp
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca838c9-84f2-497b-effb-08d65f7b2d6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:13:16.9881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4291
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patch introduces CONFIG_MXC_CLK option for legacy MMIO clocks,
this is required to compile legacy MMIO clock conditionally when adding
SCU based clocks for MX8 platforms later.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v10: no changes
---
 arch/arm/mach-imx/Kconfig | 11 +++++++++++
 drivers/clk/Kconfig       |  1 +
 drivers/clk/imx/Kconfig   |  5 +++++
 drivers/clk/imx/Makefile  |  2 +-
 4 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/Kconfig

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index abc3371..11a9661 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -57,23 +57,27 @@ config SOC_IMX21
 	select CPU_ARM926T
 	select IMX_HAVE_IOMUX_V1
 	select MXC_AVIC
+	select MXC_CLK
=20
 config SOC_IMX27
 	bool
 	select CPU_ARM926T
 	select IMX_HAVE_IOMUX_V1
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX27
=20
 config SOC_IMX31
 	bool
 	select CPU_V6
 	select MXC_AVIC
+	select MXC_CLK
=20
 config SOC_IMX35
 	bool
 	select ARCH_MXC_IOMUX_V3
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX35
=20
 if ARCH_MULTI_V5
@@ -417,6 +421,7 @@ config SOC_IMX1
 	bool "i.MX1 support"
 	select CPU_ARM920T
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX1
 	help
 	  This enables support for Freescale i.MX1 processor
@@ -430,6 +435,7 @@ config SOC_IMX25
 	select ARCH_MXC_IOMUX_V3
 	select CPU_ARM926T
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX25
 	help
 	  This enables support for Freescale i.MX25 processor
@@ -442,6 +448,7 @@ comment "Cortex-A platforms"
 config SOC_IMX5
 	bool
 	select HAVE_IMX_SRC
+	select MXC_CLK
 	select MXC_TZIC
=20
 config	SOC_IMX50
@@ -478,6 +485,7 @@ config SOC_IMX6
 	select HAVE_IMX_MMDC
 	select HAVE_IMX_SRC
 	select MFD_SYSCON
+	select MXC_CLK
 	select PL310_ERRATA_769419 if CACHE_L2X0
=20
 config SOC_IMX6Q
@@ -545,10 +553,12 @@ config SOC_IMX7D_CA7
 	select HAVE_IMX_MMDC
 	select HAVE_IMX_SRC
 	select IMX_GPCV2
+	select MXC_CLK
=20
 config SOC_IMX7D_CM4
 	bool
 	select ARMV7M_SYSTICK
+	select MXC_CLK
=20
 config SOC_IMX7D
 	bool "i.MX7 Dual support"
@@ -561,6 +571,7 @@ config SOC_IMX7D
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
+	select MXC_CLK
 	select PINCTRL_VF610
=20
 	help
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 2dc12bf..d2f0bb5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -294,6 +294,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
+source "drivers/clk/imx/Kconfig"
 source "drivers/clk/ingenic/Kconfig"
 source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
new file mode 100644
index 0000000..43a3ecc
--- /dev/null
+++ b/drivers/clk/imx/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+# common clock support for NXP i.MX SoC family.
+config MXC_CLK
+	bool
+	depends on ARCH_MXC
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 5c0b11e..f850424 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
=20
-obj-y +=3D \
+obj-$(CONFIG_MXC_CLK) +=3D \
 	clk.o \
 	clk-busy.o \
 	clk-composite-8m.o \
--=20
2.7.4

