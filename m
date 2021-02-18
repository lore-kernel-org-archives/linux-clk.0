Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30790C433E9
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFCFF60C3D
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhBREu4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:50:56 -0500
Received: from mail-eopbgr700078.outbound.protection.outlook.com ([40.107.70.78]:14753
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230233AbhBREuz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Feb 2021 23:50:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAA2mf5j24UshFXsYHXV4zScj533dDZk9PtsCmTy/p7ivF0CUmT/ZPmIVvqDakcg0Sh/jZt55xHj5L5A2J5EzYUEVOcVxMr1s9owIKI/ydQYlbOYdFBq8Q5l78JC3+OeRa3+v91HEgggeASV6DeS9wh1Qn+mEX+y8qSyTzjS4FP8bSt2WxvVER9M3DthkQNW0dE7TYYHhj5tP3oo+uG9wPBaOzQVDJxpC6lt9/HU6Q07MzpR4+/NxAEN3EL/lB5uqianGjnXAUho1cLRZ5hvpYAubcqZyNqNkiPEwq4RQJd94Jga73GdK63GH0AsHNF0OX0oOcdhAt6PczEHMHMqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9HFXu83m4J//VRK9w29Bs0VemELGZUJC8A4+caaois=;
 b=bNofYs5sYn+u1aPqxWp8XLqtMoPxmwaW0eEPitpV1TuPWIjetAkREdtsyRg2RXBjxQYBCF5mFT/V3JxPSZU18yo/L6R3Q/Ukqudjxw6RwOZ3zvuUTrmdZcvXWrJFNgGdlPP92Pd1nfnJwDPi8Yn9A4dj2tYEYdn3gWJnVJwTkr80fldeQKXf2cgdSh1Nfee9kmbaUDcu8dqLV6couu48AmcjNcGdAukRk0XvDDhwe7fa7uAlvfgY5LxZExc9YMznF3OoHDPN0MnxD5ihgidS8Y2cLV3123XowZqtEJIG2uZvWlpazhSXx1S0n4SCdDJCxTowXypuHIe8omk9hC+qJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9HFXu83m4J//VRK9w29Bs0VemELGZUJC8A4+caaois=;
 b=s/B5DwrOxa5EURCUKvsPaMeO9UXMvp8zKQ4z4wfTx9Hb7JBBz8FAT1o66zZISlY6TWvM5jLAbOSMgn+wPrEFssMsHLl3o2eX7o8nReUlfsdAHzPkpyWLa+5WaDDYdVJHDlqdW5AE+/HJFzVn8ZGzBR/hlF5CEIsR3A3FLS8f2yo=
Received: from DM5PR10CA0002.namprd10.prod.outlook.com (2603:10b6:4:2::12) by
 BYAPR02MB5941.namprd02.prod.outlook.com (2603:10b6:a03:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 04:50:06 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::94) by DM5PR10CA0002.outlook.office365.com
 (2603:10b6:4:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 04:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 04:50:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 17 Feb 2021 20:50:02 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 17 Feb 2021 20:50:02 -0800
Envelope-to: shubhrajyoti.datta@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com
Received: from [10.140.6.59] (port=35054 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lCbGM-0004qG-7d; Wed, 17 Feb 2021 20:50:02 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <miquel.raynal@bootlin.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v9 2/7] clk: clock-wizard: Add the clockwizard to clk directory
Date:   Thu, 18 Feb 2021 10:19:46 +0530
Message-ID: <1613623791-4598-3-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4792213b-f466-46c2-2630-08d8d3c8a94d
X-MS-TrafficTypeDiagnostic: BYAPR02MB5941:
X-Microsoft-Antispam-PRVS: <BYAPR02MB59416EC3D604F4C9B1966A75AA859@BYAPR02MB5941.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjwKMF6OgJF2HltZ6c4wtS11wk6PuNBBDSckIW9Xp3xGOSCTCTfAlaYdygMZ+sY35yKpDnCpYqaTQdkxEtS7vdHmw20tMwYgnaWOnX0Jd0qvl9IQFLxOB1vMM0CHWm/xWHs1AEgl5mKZ/BYzHCoje7qh9QZO98I80dCQ2lm8WbyiIUKghlEwhV8NpC7WUnBEnKGHMs8KM9ia7HYenczKRfpzizbVZPp4T7jv2Rqp/R81iwZ7J6u5pHlwLav7dr5Qlwd4MX7J50+pplReBFzHayYf0yjXUZF2jM2MNhkDS9QO2CSL5wDKEKHHGKmNAieOtJ5Ftfl4iuFYJzFe3u8Onnr1aV4LnNq0pvqDxDgKR97buL2eZqW50vdw3N1cGa2Lva2i4c8pa6DbfUUH07/Zc+zIijQI/QuE7A5q2PbDk5i9j4jQNUOsm2Sg5C/mw8ttKq1RrSnDa1elljZ9q780J+sgrGrzucSltEjwLKpS4AFeA51u+YPPtXP6C1t+NNJobZN0mFo46pUGpzXPFwe/PFZnrIRd0mnQdA63gE0hnmSJtD062BvPf/5E1TUe73zkMiEYFjZ7TEwWQFPzjXaVUg4LaXzea2UJU1QssqUglg7gUXs4esn8v27lCGAFwkNUOMpiUxKE17RfO5nsRwdsffhKPTflp5TXH/tsCNWsBTmXOVTigExgjORUgx7BSsGR1pXFHdJemb7nQvtFALpvyL/3jJPZ+tkW2OCFe+4qzNDS6urwLNbIfO7G4O4EjAiQd+GcU0FwjVXknm6aESwyrw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966006)(36840700001)(26005)(5660300002)(426003)(70586007)(70206006)(8676002)(7636003)(2616005)(356005)(186003)(7696005)(82310400003)(82740400003)(36756003)(2906002)(9786002)(478600001)(44832011)(316002)(8936002)(36906005)(6916009)(336012)(54906003)(966005)(83380400001)(66574015)(47076005)(36860700001)(107886003)(4326008)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 04:50:05.9341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4792213b-f466-46c2-2630-08d8d3c8a94d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5941
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
v9:
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

