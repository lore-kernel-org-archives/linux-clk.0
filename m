Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF93C43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 14:12:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C5DF2147D
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 14:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="jTG7edkL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C5DF2147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730915AbeKVAq6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 19:46:58 -0500
Received: from mail-eopbgr00060.outbound.protection.outlook.com ([40.107.0.60]:17024
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726004AbeKVAq6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 19:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c070GikEio1iNb+8SkLQXLkoa0GMY/ebCxWMHJttxI=;
 b=jTG7edkLBEDywYeA/PdMnxq0pagNAQAZATEOk/GNM+BIiPMmjzjB+AStXLbnDXuSozgdVI/H/UqGEGX28e+iWNCsipCnU3at+4kjPTHghCrJLSw3wWXmq6jwT32Yzr2AC5fKXYw6BCBYaQztUnvIaN2fHN2FFmJ7zxSkbPEiX6A=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4081.eurprd04.prod.outlook.com (52.134.125.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.23; Wed, 21 Nov 2018 14:12:19 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1339.027; Wed, 21 Nov 2018
 14:12:19 +0000
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
        Aisheng DONG <aisheng.dong@nxp.com>
Subject: [PATCH V8 1/7] clk: imx: add configuration option for mmio clks
Thread-Topic: [PATCH V8 1/7] clk: imx: add configuration option for mmio clks
Thread-Index: AQHUgaQ2nfeOEC51j024OUxbOU/p9Q==
Date:   Wed, 21 Nov 2018 14:12:19 +0000
Message-ID: <1542809234-539-2-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4081;6:LDk8BIXzYoEXmlShWiYVePvkOGgweQDHfqD+ysosExr7oV6b+jnkUd8UE6pjgI6+CdAfThkzSX/kS4dz4yQ2esQbfYroIUj1GqUXWtUPQazphRSmx7wZLlDyjbTOiyXVkJFfP7KepoRMUUX4ErRukByKny/ghBgtuPoCNHF7TJ7k5fnua+9bKJkRPYKxcp1kGjOv0GiW3fhd2ejwUVFpu9S064WLU57c7eoYSdE3e1eqh65GyU3B0T6twwBSS1xcdas0GxcMQ1uRe3XljeNMd//Gy6vH4IK7y8oN+Sh7dZ0WfeT9CYb26+79pVIFOS9GxbqnAD0sYAzFmX4scN/nKfPOFtKQyJRn8ip9YtspK7x7pZ88H8ejxpoi+DxoRE8vujZH09N1SqFYXppGvABrRuxqIrzGXM4lsn3VKrKkQXt0bMnMxATz9ZtVMq2wvmU7aZKEISnMGBmww3N2hG1C7g==;5:ninqqGNkFJkJ+rM0m+jj6jpgYvKkLRks8sTG0tgoqSWd93AdPUPcPf4YXSHCUcQd7uMFNNd2xxKufeLPXCmfmz54lG+m3SMD4KGcLPC6nte5upsDvW9oAPJDTHfQ66Lh42CYFDTA7DYzGUYrU3wfqJ4M0Z4gU8x+uDw5IlJJUzU=;7:1HLWgVoBwiUKxa33X6fXparn2b+5XOWp3I95DN3b2v3TLDbx0VKZsajMZqTl72Om6yT/mx8pZvk4xdaujloRm/BPFPMfjG9dDc4gPnWfyXuR5BYhSd3RlxqxYkwo26a7/D0img9otytwcwk52JtGEA==
x-ms-office365-filtering-correlation-id: 4cb68fd7-e42f-47a1-5696-08d64fbb5931
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4081;
x-ms-traffictypediagnostic: AM0PR04MB4081:
x-microsoft-antispam-prvs: <AM0PR04MB4081BCEFC2A47A251269C56280DA0@AM0PR04MB4081.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231442)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4081;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4081;
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(396003)(376002)(39860400002)(366004)(199004)(189003)(6506007)(386003)(54906003)(2900100001)(76176011)(105586002)(66066001)(50226002)(26005)(3846002)(102836004)(2501003)(186003)(6486002)(305945005)(7736002)(4326008)(8676002)(478600001)(68736007)(52116002)(106356001)(2351001)(5660300001)(316002)(14454004)(446003)(6916009)(5640700003)(81156014)(25786009)(2906002)(81166006)(2616005)(476003)(486006)(86362001)(6436002)(6116002)(97736004)(71190400001)(14444005)(11346002)(99286004)(53936002)(6512007)(256004)(8936002)(71200400001)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4081;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: cM5QEWFJjINHA6mNJBm1nC/Nfi/w749SDeK0yaFpUMCLjic6I2E638mJn/1/9ddzYPmGrAm8pR/oUjqcSI5qOLKiZA6y4s9o6ldTD/MIACuHKkGXB99ftVxHzCXKlLTrv9QluubJFypUOLaLebnK1nOkQd9Xc1hIOWO9SRSzuyDLoo1xTZat7ZSA/xbhOyJfsqDY/7TJ6XulPSqlth4ysVJIVVcLouRUN+SEGF7MbnMkAlBLJe2x3q4DNRX9BxI8/prLnGvs+kFhc9JOjUEfQ7Bghah0UCC61rrNFwLJ5LWBVK+i7l1lT1wa3sfKyL/vzRkuu68Ee909E38U/G3Wss1WDOA/9zeBZp5EK8RbyJw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb68fd7-e42f-47a1-5696-08d64fbb5931
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 14:12:19.5888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4081
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
v1->v8: no changes
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

