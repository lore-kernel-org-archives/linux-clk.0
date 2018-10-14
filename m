Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408CBC6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D66EF20843
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OVDrN+Td"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D66EF20843
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbeJNPsQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:16 -0400
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:63156
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726124AbeJNPsQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNj3VLX4jSz+P7zDKxKkqtqVf0IJGnC/SMHyGHswazY=;
 b=OVDrN+TdkeNAmFY+QE9D7AlKQCfD8Iu6ZxN6rSBQMVuvXq2looahsL+gel1q92zJo4QwV4XmOwzEQJy2QPFqoBrNyxHnY9NtrDKJLQG/+2YG8HNlBzHZxvewDHUl4Jjei5A1hH7LOJScPLRpeHCuP8rxn6tb1owzQ0kpv3XZtLw=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4435.eurprd04.prod.outlook.com (52.135.148.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Sun, 14 Oct 2018 08:07:42 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:07:42 +0000
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
Subject: [PATCH V4 01/11] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V4 01/11] clk: imx: add configuration option for mmio
 clks
Thread-Index: AQHUY5T7mPr8gx4s9kG4wuXXuyqz8g==
Date:   Sun, 14 Oct 2018 08:07:42 +0000
Message-ID: <1539504194-28289-2-git-send-email-aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:203:52::20) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4435;6:xaLbv6TQSVBJzH+vopSh9rGe7KrfRNEw/AlxHLXV7lRnCTICz2/XhpTlup1hkUf6pjZ0eDDuS3VVQlgjNiESk4GDXuT4C9PkwuTw4TGHJ7Rht4P6cgpXdtddZXpWZgwoMee0nUH61SYMPRsYmdbQBrcCrlwzN9/xKpvVNN6PNWCuuBwpIqLwMprrmpvOLqSSs1lCYaesl/pwGP0+nG8+z4f6mGd49jQpY1V8COR69QmO2XfOcUCHcQ/WfoEpwjfm+2XKSSE60jIpWMx7YEgDoGj4qQfaApAtvG/zULCrLjYmZENdArnZxtORDL51L3E0o72nJuwhoDxUThWdKHeYCjjxUIGbmK0pkFOZ8zYecRXovTczRiIyHpIbuhBU+55JseeJx8zjqk9B64SFtM/B6JZ5lqqOKGcygXINP2sqeMcf9L8U3Rvd1Y23Qxm7IXnT90YPauzkxcmiiI3r2VciZw==;5:yFSpqfWw7NNYHssOJFaFNNznVpheGeLkrS/oq2BdK8Tf1dz7u/dThgFcMN7RMCBN3C8cfxh05CBQBO9kb1IkAnsUNoBeSxqGLj28bHWwyyj88KdECmMkNXsDe+w0dkOC7UOpQnD3RheLmi801shMX6ppXsIT0pviF7pFkmz8ux8=;7:AmVPJCFzTOfVdEKWJ4qKDl7Ma+fBxUNMpZuJz+V7GLwTPBnFU3LkQbIb2Bt2pr4fNoeueu6IsLh1dxux8LZigQP9q+Q9EJHt3WKra4tw9BX1c/QvSu2jsgrvME6qJEY3xtoUvcRUqN+BO0epXC50OrgO/PKd+51UsnLqBoKdX0ZyhyCpZyz+vmHikUcmNonGSGQxQTDud5glOgN8VgsRD70zs+MX1QLv14aLKVaBiJtwV4R/GmJu+ujhzKZZXYQX
x-ms-office365-filtering-correlation-id: be8add4f-9df7-4111-d503-08d631ac1d99
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4435;
x-ms-traffictypediagnostic: AM0PR04MB4435:
x-microsoft-antispam-prvs: <AM0PR04MB443535F1F8FD29234121CBA680FC0@AM0PR04MB4435.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4435;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4435;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(199004)(189003)(6436002)(186003)(76176011)(5640700003)(386003)(6506007)(316002)(36756003)(52116002)(2351001)(99286004)(6512007)(106356001)(6486002)(446003)(26005)(8936002)(11346002)(86362001)(476003)(2616005)(8676002)(5660300001)(102836004)(486006)(81166006)(81156014)(6916009)(4326008)(54906003)(2906002)(66066001)(14444005)(71190400001)(71200400001)(256004)(305945005)(5250100002)(25786009)(2900100001)(97736004)(7736002)(50226002)(68736007)(478600001)(105586002)(3846002)(6116002)(53936002)(2501003)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4435;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 8jkJIVF1MOi6qJ56AOFBlNErhnAm0E81l5oQA7veal+/zQYwe+XVRorecaYnJLPmJD9XpKx2itxoXKSUQpTWvHdf6RzpIbxTrtt1rOMUqorzd7SZL2Z0q8uo+/7iO+blxvA19aD/pE0c5dPUDS0bN+zdVa0ddaXtHxVBxnhtei5TDszmBd0fzIYqc3WsGtbBr8RR7eQZgxnILezAZ5MLyrzePIQgjq4D/zC9RoieVCxhBG+d6anPAuE8fpdtac6UZBVlTHReJ9FPaqF/cuiRJL6oRKbWPYQObKafMWhPuW0bFx7eWwwnGJVd29j7BHb9sHxiOw7ZK28HdlbNw2Q/uMTYtESp5CZ6zZtG7iFaDZ8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8add4f-9df7-4111-d503-08d631ac1d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:07:42.3392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
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

