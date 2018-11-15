Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297F6C43610
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 08:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBED5223CB
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 08:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qq2FDRf8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBED5223CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388079AbeKOTDQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 14:03:16 -0500
Received: from mail-eopbgr140059.outbound.protection.outlook.com ([40.107.14.59]:2183
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728862AbeKOTDO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 14:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNj3VLX4jSz+P7zDKxKkqtqVf0IJGnC/SMHyGHswazY=;
 b=qq2FDRf89D0oX3eoNR3n5aenbt+dLSZp/CncCmck1VsY6DCxQczmEdBdX7JG1/CUrgg/5RZIqpEk7UQs9fLNZA6Tbi+QzwUNcWDqDRHoWW004iPAqE2u6+E339AebjqM4yjeLeQ7JGcn+t8ymGXaTlQhfECQ59Uu2yEs6AndzF8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4068.eurprd04.prod.outlook.com (52.134.125.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Thu, 15 Nov 2018 08:56:13 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.045; Thu, 15 Nov 2018
 08:56:13 +0000
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
Subject: [PATCH V7 1/7] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V7 1/7] clk: imx: add configuration option for mmio clks
Thread-Index: AQHUfMEP/mnZYGuA4Uu7tDPICKwLHg==
Date:   Thu, 15 Nov 2018 08:56:13 +0000
Message-ID: <1542271869-18600-2-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4068;6:qWgf7dtUJQpR2fi53fcmT9yotlE/X4OiOzDBFd8DqD5zl///fWmmM3+uiCBxLSuxHBbCoLDK19Ytn3MJBJPics6bYpUI4ZzKxcloyeXToka3nmAyupU6sokyItrY3QsnWXLBxzJFBSRlcHrPr48OARqReLTGVJG2dE1j8OU9NC68Fu/JffTebZ/veGr+JWRyyFbLdVKhORD31vLQS5EiIQYDg54GVDB7vPmrAUh73PhvZSH9Y+vrOruFp/B3oy7YhmJRvL3DnUeiYfXumaKE7U7zvWteoZAEFvo2aKadooB2CFlmeDfw8JRz3D4sDXNfth+aozSsMErRy1okx/EujBgDLfq+kiJSdHBwfE2A8c6xQYE0+nw3bt8w2JCm7uP2rb2Grgzkuve3Q3rBNXxM9IWCxMib92EoFDtF4uvVN5KjX5Q8NjeJOrHL54dGWOd7zQilxBS0Yd32cf0ItGRg+g==;5:Tw392lIEz2xLhe4wn/OAYca6RroJHbzL6Uoj0Uc7JUytCnEb11cy7tpcR7yPqyQKRilefHgQgu0l/KXT5WDA/zQCQPK9QtvB3mN/Hm+m7bHG6e2tj06BPzAu9yacfu6DQrxJqMwwUl867tBM5xZktcM3ob1acE2Uee1EW71QIcU=;7:BjlVFwA97kKeSSQW/VOWAkpcVIK5RnLq7aETx6e7oGx2yxqOigYctgoh8V7nPnbBwznYPIk0DkBpFWbyq77gq4Vu+fTTB6Nb7hKIAF2di07U3Ju0WhubfsN6Yw1YkeHtY1zzhOAaS+Iy0+C/NwfKJg==
x-ms-office365-filtering-correlation-id: fb535bcd-f80e-4c8e-ccc2-08d64ad83239
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4068;
x-ms-traffictypediagnostic: AM0PR04MB4068:
x-microsoft-antispam-prvs: <AM0PR04MB4068C06EE0057A10165A773C80DC0@AM0PR04MB4068.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4068;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4068;
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(39860400002)(366004)(136003)(199004)(189003)(102836004)(4326008)(5640700003)(316002)(54906003)(8676002)(53936002)(25786009)(81166006)(50226002)(81156014)(8936002)(106356001)(86362001)(6436002)(6512007)(186003)(6916009)(36756003)(76176011)(99286004)(97736004)(386003)(2900100001)(105586002)(26005)(2351001)(52116002)(6506007)(2906002)(256004)(2501003)(478600001)(5660300001)(3846002)(66066001)(6116002)(14444005)(68736007)(71190400001)(71200400001)(476003)(305945005)(2616005)(7736002)(6486002)(14454004)(486006)(446003)(11346002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4068;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 9vS+64F1Iuh4YMc7RZIJktAMn84Yu2xKXooDFcF1txy6xXHDqnrQZZO59te5h7LK9ljm96oyNbCjlx84ae8Kut0nLSm+XnhlKh/RI2O7Y4zfmxrIFb//3c7IKg238IBrDYLW0hPs2Sf/yQL5Zx4Zt2cT+OV2et9Z08aQ6GVW3IRCiKT9fwPRRfTiTmWt52TnWzKBsBhaWhgy4ulq8Zbi6Tl8arvdzg6GLw64Ts/vAmekl5KCQ1fCMyL4YdtAGHbhUA/07Cj73i/nKtSwLiXD/ObfUfBh01SDfElgyNlBOw0ZGZHEfKJVFJ7d475hFqRkTZkGnhgT+bu+U9SPXC8PsbQXM2ZNdO+DC+hKc5+z8/U=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb535bcd-f80e-4c8e-ccc2-08d64ad83239
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 08:56:13.8365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4068
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
index 292056b..09eba54 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -287,6 +287,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
+source "drivers/clk/imx/Kconfig"
 source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
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
index 8c3baa7..d447f8c 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
=20
-obj-y +=3D \
+obj-$(CONFIG_MXC_CLK) +=3D \
 	clk.o \
 	clk-busy.o \
 	clk-cpu.o \
--=20
2.7.4

