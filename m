Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78A9C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 912D4610E6
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbhINM7q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 08:59:46 -0400
Received: from mail-bn1nam07on2083.outbound.protection.outlook.com ([40.107.212.83]:54026
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233077AbhINM7p (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 08:59:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbLh41233384Iv6VVc5/Gg4FxEa8njPV6FWIVF8B8yiw7sCHOQi6olKiPeQWqmXE2SL+XAwzXWLRMiyEniEUhU7mpjtn5+Ssx+tUIVLfwOvs+HlBBE4S+Pb+QFw+cqcpK/W7bs+mtnoBcdqFbWxKuGgwGL5LdO0L78gqzJQYKvdbNbG3cvcRuNoeWxTv4La7rjda7SrLTnDtVD8GWaGJYngHQ55rLqsbchDYdLywKDndlUdnbpygXKCa6MNN3xc5AsNRC65GS7yr2F7yzHUB2OJ+xXhlZNgt2we9BJij/gCA+EZoKVyKBwwJOme0kPoKDa3rv72se3qAGVtTXkUv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZTB/uAY6tjES6ZDF+l8GK3zsPRQz3BZZghNjxMooFNc=;
 b=c/v09LBA5PZzd4TqB0K/8GzBAclttnXrxiMHH19uoO47DO9V2Q2vYoH4ycZyFm2IRRhLqD0Z9aCKgtR5MqEC8sJG9odG/FoQuK4BON8jpJ61T2flXoPbmOsF390ofa4Itpyr/KUS4vq46VB99G9vKWGw6Y+XKqhvMmVmiz2LGISdRzW/YxsMhWXfz0q3wGrgI8ZVEHFQQpAJUAJQ2/T0XZlNyWk8NpbEC5tpXb2ijF7ZGXhx4wsQA1HbobwnaohZJQweGz35wkTlfQqb2D0kPClPawK6IGkDMwkcGiPEiASU4L7oKVatvOCbyunWomMX8WdHZwqOvxPpXYcncqecQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTB/uAY6tjES6ZDF+l8GK3zsPRQz3BZZghNjxMooFNc=;
 b=l0l7EKBsiVwFSTEzXYFO42m3gk7qE8hcMcm6TFEFOPyHwFJV0utL7ki2d1jJTnOC36TsrAMDum8yR/g67S1v2r0zOMKQ7MtzfIEFIwJ+9t9noFjNFb8BEjFiPvQ5IPCDfncuR3HLAUthG1GM2Ld7sIKVdTeib7ydDB20DLc2lng=
Received: from SN4PR0501CA0043.namprd05.prod.outlook.com
 (2603:10b6:803:41::20) by MW4PR02MB7188.namprd02.prod.outlook.com
 (2603:10b6:303:7a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 12:58:26 +0000
Received: from SN1NAM02FT0059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::44) by SN4PR0501CA0043.outlook.office365.com
 (2603:10b6:803:41::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.8 via Frontend
 Transport; Tue, 14 Sep 2021 12:58:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0059.mail.protection.outlook.com (10.97.5.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:58:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 05:58:05 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Sep 2021 05:58:05 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=36978 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mQ80i-0002I2-Ko; Tue, 14 Sep 2021 05:58:05 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v13 2/5] clk: clocking-wizard: Add the clockwizard to clk directory
Date:   Tue, 14 Sep 2021 18:27:42 +0530
Message-ID: <3059a0f043c8f92e4ca35980c89d5864acc20513.1631623906.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e41c25b6-c5fa-43d2-afdf-08d9777f5758
X-MS-TrafficTypeDiagnostic: MW4PR02MB7188:
X-Microsoft-Antispam-PRVS: <MW4PR02MB7188FF670F6B61FE093D02EAAADA9@MW4PR02MB7188.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNd/o8d8YkU/oVaS6CQ3aC4r9r6A5tr2uappMBBe/FruQRhfdiYQXKu65rwqdCglhSVeW3oVw19/qsw+Vkv7urWl3Uq3s7+x+qoYA7Qz7sbA54P3RvvSdepzAL+1iE93BS5IPkxYTLsCY92c0Qm/v0JPkHn6QtjmziWKkKIykf5TwlMAf8uZpJCFwSqG8GWnI6k4o/7zMtdlThovJn/kLknaHtlEEnQKuL5xU+vOkAuIb+19iVVWpzcoLG4TQFKdsbBghRTAAvtpD+gqxipcuJXwrBV5px9W1kXD3hX4IOKiUbqKI+5a3RPJ10l/IKo+LL+SV14rCo4oNvfAXrf5Uss42rf4PSAUEHM2dak2lO5MHwUlmVlK5lPqYEmWsT0hx6MGWNlmxAP5dQiHS+O2t8yJC712kPVKfIYiO14lfr0+flsrAofLAIK5LN+nqlX8RJVqygbohlb1oK7Ly0ubbD2c4qkabRSSO4fk3OcYOuZYjRXNtQ+lNYMgh9T82qGThpfn6Bc0JU8AcY1PyygY1DZ7HSWah9ljMGJawS2v4Btb1hNFG+e7WaYu3CwoKt9pkuHncY9kNSE42mLKOKVHBz/ZzMoB2Blx5nLa4NgMozjU1dZShCYtZJ4gRRA195NAQIqnChDRM9CMM9v3Xv2bqz4N/XXWyKb38siF0zyhpR9OYHRzUyA4B8gbalz70jyTjo+xy0JKoNe2ICOFyDO6QztXZl87UmfctERD0MDgWx+yQesdjbZG2SPsd9qaplNHf5VPNcm9dFd3eIMAQhO4nHEuslbSF4h778r44UBLlXHzh49fj9eInvrGJhW9Qa7x+GIHVLWMs5ohVlh4PkWwGSC8OEDkJqcmHVwwJfGERK0=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(36840700001)(46966006)(186003)(47076005)(356005)(44832011)(107886003)(66574015)(7636003)(5660300002)(6916009)(83380400001)(36906005)(70586007)(9786002)(36756003)(316002)(8936002)(966005)(336012)(426003)(8676002)(2616005)(54906003)(82740400003)(4326008)(2906002)(6666004)(82310400003)(36860700001)(26005)(478600001)(7696005)(70206006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:58:25.8818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41c25b6-c5fa-43d2-afdf-08d9777f5758
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7188
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocking wizard driver to clk.
And delete the driver from the staging as it is in drivers/clk.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/Kconfig                           |  9 ++++++
 drivers/clk/Makefile                          |  1 +
 .../clk-xlnx-clock-wizard.c                   |  3 +-
 drivers/staging/Kconfig                       |  2 --
 drivers/staging/Makefile                      |  1 -
 drivers/staging/clocking-wizard/Kconfig       | 10 -------
 drivers/staging/clocking-wizard/Makefile      |  2 --
 drivers/staging/clocking-wizard/TODO          | 13 --------
 .../staging/clocking-wizard/dt-binding.txt    | 30 -------------------
 9 files changed, 12 insertions(+), 59 deletions(-)
 rename drivers/{staging/clocking-wizard => clk}/clk-xlnx-clock-wizard.c (99%)
 delete mode 100644 drivers/staging/clocking-wizard/Kconfig
 delete mode 100644 drivers/staging/clocking-wizard/Makefile
 delete mode 100644 drivers/staging/clocking-wizard/TODO
 delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c5b3dc97396a..3e0bf794ee09 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -390,6 +390,15 @@ config COMMON_CLK_K210
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
 
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
index e42312121e51..e7abf6665423 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
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
index 39367712ef54..ec377f0d569b 100644
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
index e03627ad4460..7d0f49f9a847 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -72,8 +72,6 @@ source "drivers/staging/gs_fpgaboot/Kconfig"
 
 source "drivers/staging/unisys/Kconfig"
 
-source "drivers/staging/clocking-wizard/Kconfig"
-
 source "drivers/staging/fbtft/Kconfig"
 
 source "drivers/staging/most/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index c7f8d8d8dd11..9498bc973d4e 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_LTE_GDM724X)	+= gdm724x/
 obj-$(CONFIG_FIREWIRE_SERIAL)	+= fwserial/
 obj-$(CONFIG_GS_FPGABOOT)	+= gs_fpgaboot/
 obj-$(CONFIG_UNISYSSPAR)	+= unisys/
-obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clocking-wizard/
 obj-$(CONFIG_FB_TFT)		+= fbtft/
 obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_KS7010)		+= ks7010/
diff --git a/drivers/staging/clocking-wizard/Kconfig b/drivers/staging/clocking-wizard/Kconfig
deleted file mode 100644
index 2324b5d73788..000000000000
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
-	depends on COMMON_CLK && OF && HAS_IOMEM
-	help
-	  Support for the Xilinx Clocking Wizard IP core clock generator.
diff --git a/drivers/staging/clocking-wizard/Makefile b/drivers/staging/clocking-wizard/Makefile
deleted file mode 100644
index b1f915224d96..000000000000
--- a/drivers/staging/clocking-wizard/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
diff --git a/drivers/staging/clocking-wizard/TODO b/drivers/staging/clocking-wizard/TODO
deleted file mode 100644
index c7e1dc58dfba..000000000000
--- a/drivers/staging/clocking-wizard/TODO
+++ /dev/null
@@ -1,13 +0,0 @@
-TODO:
-	- support for fractional multiplier
-	- support for fractional divider (output 0 only)
-	- support for set_rate() operations (may benefit from Stephen Boyd's
-	  refactoring of the clk primitives:
-	  https://lore.kernel.org/lkml/1409957256-23729-1-git-send-email-sboyd@codeaurora.org)
-	- review arithmetic
-	  - overflow after multiplication?
-	  - maximize accuracy before divisions
-
-Patches to:
-	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-	Sören Brinkmann <soren.brinkmann@xilinx.com>
diff --git a/drivers/staging/clocking-wizard/dt-binding.txt b/drivers/staging/clocking-wizard/dt-binding.txt
deleted file mode 100644
index efb67ff9f76c..000000000000
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
2.25.1

