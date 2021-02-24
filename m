Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2304CC433E0
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B63CC64F11
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbhBXOgV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:36:21 -0500
Received: from mail-co1nam11on2078.outbound.protection.outlook.com ([40.107.220.78]:10593
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236105AbhBXNNq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Feb 2021 08:13:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJvndYSDriTmiNWm90ULEqqncTx51V1Tyqa+qreYAhLFeXEuIHL/6dRKOSbJr2ou3/8MhlB7+WO6ivM4y500yZxgX/jOYM2wu7DQDKoh0elJsZtKZ4dzY8nP+Hp0pOXsZrmElhG78vRhGHEQWatJimtcln2M9zKsk5Q61rRd2a2ZE5ZYgQ+NwdYPz509BH5eHtdWKcMV33DuIDObJAivP1e/nQlrQlawGi/yfV46N3RZokwbelsxLjMu+r3ZVeFy7Zo6/0gCrVuxDCe/RyIEMy+fNnWC4juRh5eDmF601fseCOehnOs4jNz06tXzgGwSa2d8m5qB3v1N4/qrW/LlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi4LM2CeSHuw8rZ/JRFntUEOkMFyB14PqZxVi3t2WOU=;
 b=VcaEYD7iQkkGdeb6QyOm0S8IRrBUP0/bst0DVXzKjsCl30lT9uK4kCDFaDdqEFh0xvQqqmFq90rNuZXiliHf6sYQb0EyQA/lXE3AlA1ylDAYRJ9R7i4md+x2g49cIT/u4b/dteCmSKDLQy/ItfQ0CRKKO7H/kbQ388621NiO7eC9NwI7G9a8o20DopJDAYCIOFW2hM0jomA4d0n2EsZiSqiZeatHrpgMsnrrBU94MwWc6rACK/KFpR+KrUCi8smFqOd2fAIaJLplIl1LhGFORqZBwX2I+g1yypyPwdywIf8VEX84eEWIHlI6lz0cLKpV+8b2PFWf2e8aGu/rzqrpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi4LM2CeSHuw8rZ/JRFntUEOkMFyB14PqZxVi3t2WOU=;
 b=l9xU3ISqEh0Gv9BnNT7UrTlQVyCFnRCaFbzP8kIwd8dOSj1rZkarq1rMnmkiKXQlvwLoIR4vIMfxnyNzZEmnFrjIRAYhi0GE5Yvhz7kvjSB5adT+J1YSJTRf7hR39JqI51TzX7fOuKw61mXqearkQg9tlS5ePJV7SSXBrgGHKnY=
Received: from CY4PR22CA0059.namprd22.prod.outlook.com (2603:10b6:903:ae::21)
 by CH2PR02MB6952.namprd02.prod.outlook.com (2603:10b6:610:82::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 13:12:06 +0000
Received: from CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ae:cafe::c2) by CY4PR22CA0059.outlook.office365.com
 (2603:10b6:903:ae::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Wed, 24 Feb 2021 13:12:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT052.mail.protection.outlook.com (10.152.74.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 13:12:06 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 24 Feb 2021 05:11:28 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 24 Feb 2021 05:11:28 -0800
Envelope-to: git@xilinx.com,
 devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,
 gregkh@linuxfoundation.org,
 robh+dt@kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com,
 devel@driverdev.osuosl.org
Received: from [10.140.6.59] (port=34848 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lEtwt-0001ry-Rn; Wed, 24 Feb 2021 05:11:28 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>, <miquel.raynal@bootlin.com>,
        <devel@driverdev.osuosl.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v10 9/9] clk: clock-wizard: Add the clockwizard to clk directory
Date:   Wed, 24 Feb 2021 18:40:41 +0530
Message-ID: <1614172241-17326-10-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f15f33f6-4391-446e-7947-08d8d8c5c8bc
X-MS-TrafficTypeDiagnostic: CH2PR02MB6952:
X-Microsoft-Antispam-PRVS: <CH2PR02MB695267B5C1C715706CD351CDAA9F9@CH2PR02MB6952.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQcpWvphMi8Q7ZTH4+wuhsLtJ4FvmZzPMUZWtvsurLQTOr5pxrMqYqykaE8hWrZ8UkyIcnciWmfJTRw0aGiTX0wQcHL0OtpXmJw/aBZ3EH8w4jBuUGNjyz3A8CwTEO5ekL6vK26k9cwWJTeCFv007oEsVsM2cxGSVz0gElNNMw5guY0/Pfywt2bGpKrE2a+VdrYf9cA3tbedyT9YaArv/IPIKvY9aiTLTZtghE8/Jwvoe+YWTyJSSKZU1ciEnWN7pVTRoMf7zKniAnyHa/IsY5wugb0Su2EVEQ3aiD0ddITxRkWZWj6h0DGTS5OPpVlwmOv/GuegcuT8VjF+coTxXJ2mcHfsjoksaCzgWX1lt9QBln9SLXepyfa708v4OFxRkFOVOAPhojx/4o+IYQ6RejPta2TbvzE142Rz/Cmn3sctlPq2Ei21WcEY56Lji89ERGMihNLYxbiPjON76pXLiBicfbhDXbhy9gjKxuRgauz3mLYUdpJFVgHImgOAlTq/pU3XqDGRUB8NA/4FwP9YRyAXnR3IOECMxv6OH41XSMSzOK/SGwO1nuIskbpIi64SHBpk0YrZXRlUWAlUveAfMLljW9Yo858cyhc7jpwHFI1LWJEbIPY0QQ0CT7bZHyVyYNYoEuKJH5aQYuPj2KoVjSoC9zbXn3F251GmPOHLkgUdvcANlv+oRkKy/PRJd5v8HUud97K8S9IwXgjolcg11fWDeH7LM+uLM5fOhixPZ5cpeJzXCiLnNGODUP/BfmR8a7Lvt5VTUEEx+YpW7bVnEA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(966005)(36756003)(6916009)(107886003)(426003)(9786002)(478600001)(47076005)(8936002)(186003)(4326008)(82310400003)(8676002)(2616005)(36906005)(70586007)(70206006)(336012)(7636003)(44832011)(54906003)(356005)(82740400003)(66574015)(6666004)(26005)(316002)(83380400001)(5660300002)(2906002)(36860700001)(7696005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 13:12:06.0197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f15f33f6-4391-446e-7947-08d8d8c5c8bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6952
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocking wizard driver to clk.
And delete the driver from the staging as it is in drivers/clk.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/Kconfig                                |  9 +++++++
 drivers/clk/Makefile                               |  1 +
 .../clk-xlnx-clock-wizard.c                        |  3 ++-
 drivers/staging/Kconfig                            |  2 --
 drivers/staging/Makefile                           |  1 -
 drivers/staging/clocking-wizard/Kconfig            | 10 --------
 drivers/staging/clocking-wizard/Makefile           |  2 --
 drivers/staging/clocking-wizard/TODO               | 12 ---------
 drivers/staging/clocking-wizard/dt-binding.txt     | 30 ----------------------
 9 files changed, 12 insertions(+), 58 deletions(-)
 rename drivers/{staging/clocking-wizard => clk}/clk-xlnx-clock-wizard.c (99%)
 delete mode 100644 drivers/staging/clocking-wizard/Kconfig
 delete mode 100644 drivers/staging/clocking-wizard/Makefile
 delete mode 100644 drivers/staging/clocking-wizard/TODO
 delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 85856cff..03ccd77 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -368,6 +368,15 @@ config COMMON_CLK_FIXED_MMIO
 	help
 	  Support for Memory Mapped IO Fixed clocks
 
+config COMMON_CLK_XLNX_CLKWZRD
+	tristate "Xilinx Clocking Wizard"
+	depends on COMMON_CLK && OF
+	help
+	  Support for the Xilinx Clocking Wizard IP core clock generator.
+	  Adds support for clocking wizard and compatible.
+	  This driver supports the Xilinx clocking wizard programmable clock
+	  synthesizer. The number of output is configurable in the design.
+
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dbdc590..b1cc447 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
+obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
 
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
similarity index 99%
rename from drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
rename to drivers/clk/clk-xlnx-clock-wizard.c
index b0ced42..6cb8b79 100644
--- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -2,9 +2,10 @@
 /*
  * Xilinx 'Clocking Wizard' driver
  *
- *  Copyright (C) 2013 - 2014 Xilinx
+ *  Copyright (C) 2013 - 2021 Xilinx
  *
  *  Sören Brinkmann <soren.brinkmann@xilinx.com>
+ *
  */
 
 #include <linux/platform_device.h>
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index b22f73d..d032fb5 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -74,8 +74,6 @@ source "drivers/staging/gs_fpgaboot/Kconfig"
 
 source "drivers/staging/unisys/Kconfig"
 
-source "drivers/staging/clocking-wizard/Kconfig"
-
 source "drivers/staging/fbtft/Kconfig"
 
 source "drivers/staging/fsl-dpaa2/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 2245059..2327185 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -27,7 +27,6 @@ obj-$(CONFIG_LTE_GDM724X)	+= gdm724x/
 obj-$(CONFIG_FIREWIRE_SERIAL)	+= fwserial/
 obj-$(CONFIG_GS_FPGABOOT)	+= gs_fpgaboot/
 obj-$(CONFIG_UNISYSSPAR)	+= unisys/
-obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clocking-wizard/
 obj-$(CONFIG_FB_TFT)		+= fbtft/
 obj-$(CONFIG_FSL_DPAA2)		+= fsl-dpaa2/
 obj-$(CONFIG_MOST)		+= most/
diff --git a/drivers/staging/clocking-wizard/Kconfig b/drivers/staging/clocking-wizard/Kconfig
deleted file mode 100644
index 69cf514..0000000
--- a/drivers/staging/clocking-wizard/Kconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Xilinx Clocking Wizard Driver
-#
-
-config COMMON_CLK_XLNX_CLKWZRD
-	tristate "Xilinx Clocking Wizard"
-	depends on COMMON_CLK && OF && IOMEM
-	help
-	  Support for the Xilinx Clocking Wizard IP core clock generator.
diff --git a/drivers/staging/clocking-wizard/Makefile b/drivers/staging/clocking-wizard/Makefile
deleted file mode 100644
index b1f9152..0000000
--- a/drivers/staging/clocking-wizard/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
diff --git a/drivers/staging/clocking-wizard/TODO b/drivers/staging/clocking-wizard/TODO
deleted file mode 100644
index ebe99db..0000000
--- a/drivers/staging/clocking-wizard/TODO
+++ /dev/null
@@ -1,12 +0,0 @@
-TODO:
-	- support for fractional multiplier
-	- support for fractional divider (output 0 only)
-	- support for set_rate() operations (may benefit from Stephen Boyd's
-	  refactoring of the clk primitives: https://lkml.org/lkml/2014/9/5/766)
-	- review arithmetic
-	  - overflow after multiplication?
-	  - maximize accuracy before divisions
-
-Patches to:
-	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-	Sören Brinkmann <soren.brinkmann@xilinx.com>
diff --git a/drivers/staging/clocking-wizard/dt-binding.txt b/drivers/staging/clocking-wizard/dt-binding.txt
deleted file mode 100644
index efb67ff..0000000
--- a/drivers/staging/clocking-wizard/dt-binding.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Binding for Xilinx Clocking Wizard IP Core
-
-This binding uses the common clock binding[1]. Details about the devices can be
-found in the product guide[2].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Clocking Wizard Product Guide
-https://www.xilinx.com/support/documentation/ip_documentation/clk_wiz/v5_1/pg065-clk-wiz.pdf
-
-Required properties:
- - compatible: Must be 'xlnx,clocking-wizard'
- - reg: Base and size of the cores register space
- - clocks: Handle to input clock
- - clock-names: Tuple containing 'clk_in1' and 's_axi_aclk'
- - clock-output-names: Names for the output clocks
-
-Optional properties:
- - speed-grade: Speed grade of the device (valid values are 1..3)
-
-Example:
-	clock-generator@40040000 {
-		reg = <0x40040000 0x1000>;
-		compatible = "xlnx,clocking-wizard";
-		speed-grade = <1>;
-		clock-names = "clk_in1", "s_axi_aclk";
-		clocks = <&clkc 15>, <&clkc 15>;
-		clock-output-names = "clk_out0", "clk_out1", "clk_out2",
-				     "clk_out3", "clk_out4", "clk_out5",
-				     "clk_out6", "clk_out7";
-	};
-- 
2.1.1

