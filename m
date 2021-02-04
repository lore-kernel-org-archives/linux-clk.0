Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6419CC433DB
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C25764F45
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236443AbhBDNzD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:55:03 -0500
Received: from mail-bn8nam12on2078.outbound.protection.outlook.com ([40.107.237.78]:60256
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236426AbhBDNy7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 08:54:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4tUWWUlUaX14EB98QefkEjrZ1YUJGeHyF6OdO2B8KD5V0z3ShDEQm1ASHvetbvZcyBvBlI1ON21RnPsFbF/f4eC5rTkWjgA/4yG0k/FGmkIdr8e7hYzRQp00X7Hk7icJfyrEsJ2zhEKGirDzNUpROPwV3SiS5vh8VY42wN7KqIJ9ZeK4Tw/wUW/DEmDvvKulDd6RED7n19rJE+YiDf6a3Fv6e3FWHOdnnNZwHsl2JbD3OJDxgqAyvmqWmYsm60vUIE2YmNAlTt+BLKtX78Eam3lW2Uh4ixgj+sbjNU17PBPknOoTnqfkX/SEDMu8POHryHTJ7lJk+sCUPodqVc3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tat+zZlsyzv4IAWXkOZRNo8u3YlwiaRybnaibtajjnM=;
 b=d9rN79rWbT4xZKh8/ue4KzYZgUV/fJD4C19jgUBlUP6SbwQyRvrKG2RUhiRjPm5mOvwow/DCj7LB2REyURl/0dmzDgwJAKSb/Ap+WpC+/w1pc/ApfrQoT7lKigmwTLR3JcejQr+VyR2jWUe8bCKYTPKf5DLn8Ue5SeWVVk234yML3zIrfQZWUNFZzfxEEL0YoaBm2ygkXSAZGTcnYD6mLC0Z0FpbOLQxKlaqtC724pRH4gS9OvKPycNgSHEB7TWW8VnkSRZuUusx2mqKZ8h0wOHdrpOxX7AtxTlCnjvE3ucXNqNZT7HyUjAp70SwPUTbyaxHO3v43t8SqDereo1zXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tat+zZlsyzv4IAWXkOZRNo8u3YlwiaRybnaibtajjnM=;
 b=JOBMVeRYRPMbzE7J1xVndCYuwrrVbaAAohLt9aTgkr3+33ovv495LOe4Tge+8IURpEEDbhUjDP/wEa5nRkiSEJFzRTPOtdItpYV2z8mcpt+D5ngQXsS0dYB/i21UtzwfxeGjmKjohC41WPIy/pDQHHTZtY0A+ZEZQZBVBm4EfuE=
Received: from SA0PR11CA0170.namprd11.prod.outlook.com (2603:10b6:806:1bb::25)
 by BYAPR02MB5958.namprd02.prod.outlook.com (2603:10b6:a03:125::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 4 Feb
 2021 13:54:02 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::e8) by SA0PR11CA0170.outlook.office365.com
 (2603:10b6:806:1bb::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Thu, 4 Feb 2021 13:54:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 4 Feb 2021 13:54:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 05:53:41 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 05:53:41 -0800
Envelope-to: git-dev@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org
Received: from [10.140.6.59] (port=57876 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1l7f4l-0000Tm-Sx; Thu, 04 Feb 2021 05:53:40 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git-dev@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v8 2/7] clk: clock-wizard: Add the clockwizard to clk directory
Date:   Thu, 4 Feb 2021 19:23:25 +0530
Message-ID: <1612446810-6113-3-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dcd4a63-8475-4bc8-502e-08d8c9145435
X-MS-TrafficTypeDiagnostic: BYAPR02MB5958:
X-Microsoft-Antispam-PRVS: <BYAPR02MB59581C0A99222A5B9463C42CAAB39@BYAPR02MB5958.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4uk41TmC09EK+xZ+n3lzScEJOdNwG0m+CNh2rLzDGPb63cB7QrvlyoR0GOtZdYZmeAkP40eoSQjH4thMXiDZsz2R//pz40llyDIuzhu0gLG7Y6SvYzWtBUcZ2PUdgBf7nEsyiRURNZ7RBH09GexIaYr7qZ46IL2RO6iZrnKkDxKWQJhw9iz7cWzeHLFh8qzFRdJ6MJc2R6kKorrVSWqcDr1jyH86iHspYWulG9PoBNKWNQxKswFXDj/YlsaYVbvIa46jj1Mdz06zhcIfXDgxvRPpstZ27F9szeeH14T2RE65qfhe4bD7XkFL3naTMgoF3QlH/kl8fU7QcW2SIK6osSorVIUhW42COlCzPi67fJZkAjuebXgjIbRp/Q9HVWA0adlNlf6nqfoSS0PU5i1eTocR+OvbNG/A8eBlp4kofklZpC3iHPtXIOw7RmuWCZteyIobTd5pGUW88a+YR8kynVD+hEgnb1GHqm4FGDVmoZiSKnpovgqmtqiWoVGnAzuiQZMObMQpd3lUTGlETV8XSI1KHjnA02qezCyrYnXLa2+k0yUSnt5CRBxkKCZ6R8SahAsIfHOc5h7BeJeK7GNaVR7WLPt7k81tixsLHcGkS24RtdIsD29xr7aOI/95O+c+qRezXBNugNU8rbKUThHl7UYXdqB7Xoa83TmXtj+58cAkVMsdLHhnkxC4hTBjYjSftTAmAYS8vBxnI7tvcYfaDQSWXCK6YJM/TUpbmajOLTwPz2XZcxuieUcKr42knUqKXSnsaDdwvoj59ySs0OSm1w==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(47076005)(5660300002)(478600001)(7696005)(70206006)(36906005)(316002)(70586007)(966005)(54906003)(44832011)(4326008)(82740400003)(336012)(2616005)(7636003)(6666004)(6636002)(356005)(8676002)(82310400003)(26005)(36860700001)(186003)(426003)(83380400001)(8936002)(36756003)(9786002)(110136005)(2906002)(107886003)(66574015)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 13:54:02.1434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcd4a63-8475-4bc8-502e-08d8c9145435
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5958
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
v8:
No change

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
index c715d46..d210ed2 100644
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
index 2d03104..38a9287 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -76,8 +76,6 @@ source "drivers/staging/gs_fpgaboot/Kconfig"
 
 source "drivers/staging/unisys/Kconfig"
 
-source "drivers/staging/clocking-wizard/Kconfig"
-
 source "drivers/staging/fbtft/Kconfig"
 
 source "drivers/staging/fsl-dpaa2/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 757a892..58bceb8 100644
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

