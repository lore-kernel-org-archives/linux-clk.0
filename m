Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6D2ECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:53:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC63C2086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="HNgN4Vrg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC63C2086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbeJSAzj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:55:39 -0400
Received: from mail-eopbgr20069.outbound.protection.outlook.com ([40.107.2.69]:42832
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727294AbeJSAzj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNj3VLX4jSz+P7zDKxKkqtqVf0IJGnC/SMHyGHswazY=;
 b=HNgN4VrgZ+iKtoLPtcoQsqZhfRkhrWe5Yy4hdxCnO4O7RKn4CZtMBwPs6z04FAU+EwLWV7CdZA7UaCVZWfhJV6cPC1mse8/ouGQ9yl8c2RjuJBstpN0xr4tgELHLK54yXCU87NlWpT4KemQSR6ot5GWb3pvEJCHBLAfIXEfQb6A=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:53:45 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:53:45 +0000
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
Subject: [PATCH V5 1/9] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V5 1/9] clk: imx: add configuration option for mmio clks
Thread-Index: AQHUZwMijdkFE6JeQU6iAUkDLLG/9w==
Date:   Thu, 18 Oct 2018 16:53:45 +0000
Message-ID: <1539881347-20871-2-git-send-email-aisheng.dong@nxp.com>
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
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:T5PF8kkykx6DGBKNceJz5Jbvvn4BHVQcOwIhfPvVF/Ps8xJ/arsj4N6+mFHFL8mrfJRtysPhBaiOyeb5hgSrvMqQ5EJ0psLlO85GS7Qu/BTM2c0j+Njo4UxLvj15NMw9Jc97YyEqDtkE2rJax+6YrobvddaK63+89eP1Wwe/FA5f+hF8X1c/RSkSD65Ylc/Wdgas9+BtMRPSUOeUK7vuRvhVyC7BHu8tpBuG6FVsifXAE0UUYxW7uebdx9k+h1z1tzBLWpyqI/BmIZjiuXNQe/nCP/KVdgexIIrhUhrRXojh52Ed9VAAiiCBwvDSHCiBuCrOE2rmG6e4O8XkYvnwkusACZa6zZcsgng8kWphEKXufFKG7TbQ0VMcce/w50/xlUUZcOgZYcJIix5FkUgtsMAiePr3FpADoP17UjrJvN8cwdNhUVkwbhdnPS8EEQlIi1qpmKdF9AzNuAI70vOrxA==;5:tPRTL0hWEj0TPe1LcfkA2ReKW1aWu9xdm8A+Sln+EmQBYNbHlxFVEsKOxx99f5U6dkZJzK78sxuUz+mOCVP1LwR8oRRPQbQA6N/1Rpdpde6gUGGxRl4W8XwUEAYgIKwDwvx50McUuy4bGjFOIoYzsQ2/A1XSGLJ3KbrO4bMb+Wc=;7:kDTQV/CPnu/S3fsxsDPzs3Ep00WdSTLi0NBSGbgjJ236pE0MqnbpTxvs+piXpPAmfLWEITiCnJEpYFTvxNvUCQbLIKYcPFHzq7qACnAwHXwvUsiEzYHUBoLQJQ377e+aPeGez+EgYVKwmxRzge3Apr5n2oWcwyNPmKIiLZf4YCiyu2Jnt9h/mRBDK5xCuGvAOpqsu/0Pk461XB+9UYX3EKUsVfx7fl//+8J1ahZ7SxPE7EEEL+6gv5CvsOjxiiOk
x-ms-office365-filtering-correlation-id: 79db8425-599b-4de8-a899-08d6351a4485
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB400101EFF753D501808AA07580F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(76176011)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(11346002)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(446003)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: xpRLu4cLZlk4cPZa/Hzgax9sOjQovBAN2rVVtPrr3DeAVwBArcVn4NVaVreXvJ5Yq1zAroquXAu9ZmgC9M+H/sdV1ZiRbf4ZzDxExHpjFMhbOVIFntSathXwSlW/862LA4oGcImPQ5MO13HEs7Xe1ze3GqqTWOTcIvnZXc3s2HxlynMcLj5wUbgFRytgLr2vm4JVNX2Z6LqAB2VwXL0pcqqfWuNdKJ6e4UCmA4sQQYAWfLAvoGRexx1RoiX48mLzVeWv8df0L+dqQyLWWgsnuCLEnu2ynDfBIjfAJq2igo2mXMkr3r8rqZfhGZiCtdsaSKIphJnLvDJmQWDS3MNXxtO9nFAKsfUHcesdsm1HbSA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79db8425-599b-4de8-a899-08d6351a4485
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:53:45.7748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
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

