Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C154C2D0A3
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 15:07:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 190E62074F
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 15:07:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="F1vTDEWL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730238AbgKDPHq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 10:07:46 -0500
Received: from mail-bn7nam10on2052.outbound.protection.outlook.com ([40.107.92.52]:2144
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726801AbgKDPHq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 10:07:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtOuPVidueo3hajOTaMUeACCxrkoJ5M0L9+H3iJ44kC523sR26jDyEuN3kiB2lzktpyHFChwjgNbmPaj0Kc/pL0FRS0nn2MyjuImZovvWo+0LCrn+5K1W2Tcr3EQNhHm4+m/HiChDXPnRwEUpVEJN5qYJDWG+iCczt+S0GXGMhW1qW1sBnCBDmsC67q21Z+L1qlpqb0OV3WRgFAxKhcBCEdk/nsciGrwLy/NzNLIwUxGIcR7pcLtfZ2AowGzGkj7TNedDRtgBigAfSdC7tBA3jFoFPe+rgyZRmZKS/uV3+gmQ0W7kkx3n2sswAbyxg7sVNw7UosWcTWM0dBSEhul9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6ExqYpSM+XVTxhs8SaypZlIfoWWbhDxuVY0IQocem0=;
 b=EC3OfvG5v9v/Soelfmy4am+syW1FK3db1y3PMVVses43RzKVFhcxSEEM7p7UuBuQJlu9lcLiSawm9iq/AfWgH2ZT1/SB8DEQOeSJ7oSFyQKILkccD5+sKaScjgJQ44I9tdwb8h4tJ+U0NehjXbDIaqPPVX9foCrNkNZQaUcy/a0TOLBwvGP5HI2lZyCEBqEBIVg5muHHPXVkK/ww+3yygqfwgJIXexHh4d0KCDW4vMbYDJA77OfegxvDrmgIlK/CfFdm6fwxWziwzgEKVg73HhUFfnHcj8FGjW5nM4osSZ5syKiHcukFgLgg+oMQ4PYthC5SN7pZiDT6v0RD6ZLB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6ExqYpSM+XVTxhs8SaypZlIfoWWbhDxuVY0IQocem0=;
 b=F1vTDEWLZ+lOlSQvfrwyE6EoOqPq+fsch7A08npBC6Kn+eXwlAnsFi/xISDiyY4bRQ7zLvj7+kvzqLqfFKM94Kl1aHObXTgEPAMLJFox0OmPPiINNKaAiMlk5x+T/LDJAcKi3EAiXzW/Vu043Q5SY3b5X1CF490h4/Za1CTwBKU=
Received: from BL1PR13CA0241.namprd13.prod.outlook.com (2603:10b6:208:2ba::6)
 by SN6PR02MB5040.namprd02.prod.outlook.com (2603:10b6:805:73::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 15:07:41 +0000
Received: from BL2NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2ba:cafe::f0) by BL1PR13CA0241.outlook.office365.com
 (2603:10b6:208:2ba::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Wed, 4 Nov 2020 15:07:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT031.mail.protection.outlook.com (10.152.77.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 15:07:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 4 Nov 2020 07:06:58 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 4 Nov 2020 07:06:58 -0800
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 devel@driverdev.osuosl.org
Received: from [10.140.6.59] (port=49678 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1kaKNE-0007UB-Un; Wed, 04 Nov 2020 07:06:57 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@xilinx.com>, <devicetree@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <devel@driverdev.osuosl.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v7 2/7] clk: clock-wizard: Add the clockwizard to clk directory
Date:   Wed, 4 Nov 2020 20:36:42 +0530
Message-ID: <1604502407-14352-3-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6fd4eee-db45-4c26-97a9-08d880d3602f
X-MS-TrafficTypeDiagnostic: SN6PR02MB5040:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5040E2ED9B830891EB631ECBAAEF0@SN6PR02MB5040.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71Ip4CVy6NaoUoowV+mLyDR8mHA1ukfSzPtm8UJxM9b46qq4Atm0uHoCNz1hIsuE5f8mW2WarUxo80pI1jlrkGudG8w8LyUH5jueCTdcDtjOKhDxDcqhO6pa0PwNecoTFWQYET/tOKr1yO1647azLVvcyn39SwpjfNLSSTMBD16ZPgoMQdDDkJG6QZeprUVBhQW9MrjFam7azn6uV8chT+ULOL1ePWLbVPdhGHxrZQUnA1FVREA82aRvGOGa5yqCp/LkFE2Z0FqW2eG/K2QHhmAAiC5l28ck1xLvWq6Ap4uCyMOTXD8k0rfT4dKXafKXeOAol5tySs7jEVw66wzRLwMD7AxoM6+p2OMqkbuF8KBkjZiszFlZ1XdeFVLJISoOFuBlqdjn1DViyPS+MpujBZwbHcgveMcPFuvXOLSazENkUgF09vV9NVbvuFccdlmX1iz8fF5o1FqOq56C7z2G+JKKzVbf8V11uEBclfBEnpOoyNpjMcoCQa9IfqNZd7PX
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(186003)(7696005)(26005)(6666004)(426003)(36906005)(478600001)(2906002)(336012)(316002)(47076004)(4326008)(70586007)(70206006)(44832011)(36756003)(2616005)(356005)(6916009)(8676002)(82740400003)(5660300002)(66574015)(9786002)(54906003)(8936002)(966005)(83380400001)(7636003)(107886003)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 15:07:40.0567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fd4eee-db45-4c26-97a9-08d880d3602f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5040
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocking wizard driver to clk.
And delete the driver from the staging as it is in drivers/clk.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v7:
Combined the patch for deletion and add of the driver
dropping the ack from Greg for the staging as it is a combined patch.
Add vendor prefix to speedgrade

 drivers/clk/Kconfig                                |  9 +++++++
 drivers/clk/Makefile                               |  1 +
 .../clk-xlnx-clock-wizard.c                        |  6 +++--
 drivers/staging/Kconfig                            |  2 --
 drivers/staging/Makefile                           |  1 -
 drivers/staging/clocking-wizard/Kconfig            | 10 --------
 drivers/staging/clocking-wizard/Makefile           |  2 --
 drivers/staging/clocking-wizard/TODO               | 12 ---------
 drivers/staging/clocking-wizard/dt-binding.txt     | 30 ----------------------
 9 files changed, 14 insertions(+), 59 deletions(-)
 rename drivers/{staging/clocking-wizard => clk}/clk-xlnx-clock-wizard.c (98%)
 delete mode 100644 drivers/staging/clocking-wizard/Kconfig
 delete mode 100644 drivers/staging/clocking-wizard/Makefile
 delete mode 100644 drivers/staging/clocking-wizard/TODO
 delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 4026fac..a0e29dd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -359,6 +359,15 @@ config COMMON_CLK_FIXED_MMIO
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
index da8fcf1..1ad6414 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
+obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
 
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
similarity index 98%
rename from drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
rename to drivers/clk/clk-xlnx-clock-wizard.c
index e52a64b..1bab68e 100644
--- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -2,9 +2,11 @@
 /*
  * Xilinx 'Clocking Wizard' driver
  *
- *  Copyright (C) 2013 - 2014 Xilinx
+ *  Copyright (C) 2013 - 2020 Xilinx
  *
  *  Sören Brinkmann <soren.brinkmann@xilinx.com>
+ *  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
+ *
  */
 
 #include <linux/platform_device.h>
@@ -146,7 +148,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	if (IS_ERR(clk_wzrd->base))
 		return PTR_ERR(clk_wzrd->base);
 
-	ret = of_property_read_u32(np, "speed-grade", &clk_wzrd->speed_grade);
+	ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 	if (!ret) {
 		if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
 			dev_warn(&pdev->dev, "invalid speed grade '%d'\n",
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index e6c831c..bae49c6 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -76,8 +76,6 @@ source "drivers/staging/gs_fpgaboot/Kconfig"
 
 source "drivers/staging/unisys/Kconfig"
 
-source "drivers/staging/clocking-wizard/Kconfig"
-
 source "drivers/staging/fbtft/Kconfig"
 
 source "drivers/staging/fsl-dpaa2/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index a3b1fd0..f5a3e57 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -28,7 +28,6 @@ obj-$(CONFIG_FIREWIRE_SERIAL)	+= fwserial/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
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

