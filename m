Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5022AC433E9
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3B60239EE
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbhAUHSu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 02:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbhAUHSZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 02:18:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31567C06179C
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 23:17:03 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDE-0006UQ-HN; Thu, 21 Jan 2021 08:17:00 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDD-00599U-CT; Thu, 21 Jan 2021 08:16:59 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 15/15] clk: xilinx: move xlnx_vcu clock driver from soc
Date:   Thu, 21 Jan 2021 08:16:59 +0100
Message-Id: <20210121071659.1226489-16-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121071659.1226489-1-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The xlnx_vcu driver is actually a clock controller driver which provides
clocks that can be used by a driver for the encoder/decoder units. There
is no reason to keep this driver in soc. Move the driver to clk.

NOTE: The register mapping actually contains registers for AXI
performance monitoring, but these are not used by the driver.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
Changelog:

v3: none

v2:
- New patch
---
 drivers/clk/Kconfig                    |  1 +
 drivers/clk/Makefile                   |  1 +
 drivers/clk/xilinx/Kconfig             | 19 +++++++++++++++++++
 drivers/clk/xilinx/Makefile            |  2 ++
 drivers/{soc => clk}/xilinx/xlnx_vcu.c |  0
 drivers/soc/xilinx/Kconfig             | 17 -----------------
 drivers/soc/xilinx/Makefile            |  1 -
 7 files changed, 23 insertions(+), 18 deletions(-)
 create mode 100644 drivers/clk/xilinx/Kconfig
 create mode 100644 drivers/clk/xilinx/Makefile
 rename drivers/{soc => clk}/xilinx/xlnx_vcu.c (100%)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 85856cff506c..7e066c25c698 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -392,6 +392,7 @@ source "drivers/clk/tegra/Kconfig"
 source "drivers/clk/ti/Kconfig"
 source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/x86/Kconfig"
+source "drivers/clk/xilinx/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
 
 endif
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dbdc590e7de3..074e2233f445 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -122,6 +122,7 @@ obj-y					+= versatile/
 ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_X86)			+= x86/
 endif
+obj-y					+= xilinx/
 obj-$(CONFIG_ARCH_ZX)			+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
diff --git a/drivers/clk/xilinx/Kconfig b/drivers/clk/xilinx/Kconfig
new file mode 100644
index 000000000000..5224114176ed
--- /dev/null
+++ b/drivers/clk/xilinx/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config XILINX_VCU
+	tristate "Xilinx VCU logicoreIP Init"
+	depends on HAS_IOMEM && COMMON_CLK
+	select REGMAP_MMIO
+	help
+	  Provides the driver to enable and disable the isolation between the
+	  processing system and programmable logic part by using the logicoreIP
+	  register set. This driver also configures the frequency based on the
+	  clock information from the logicoreIP register set.
+
+	  If you say yes here you get support for the logicoreIP.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called xlnx_vcu.
+
diff --git a/drivers/clk/xilinx/Makefile b/drivers/clk/xilinx/Makefile
new file mode 100644
index 000000000000..dee8fd51e303
--- /dev/null
+++ b/drivers/clk/xilinx/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_XILINX_VCU)	+= xlnx_vcu.o
diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
similarity index 100%
rename from drivers/soc/xilinx/xlnx_vcu.c
rename to drivers/clk/xilinx/xlnx_vcu.c
diff --git a/drivers/soc/xilinx/Kconfig b/drivers/soc/xilinx/Kconfig
index 9fe703772e5a..53af9115dc31 100644
--- a/drivers/soc/xilinx/Kconfig
+++ b/drivers/soc/xilinx/Kconfig
@@ -1,23 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 menu "Xilinx SoC drivers"
 
-config XILINX_VCU
-	tristate "Xilinx VCU logicoreIP Init"
-	depends on HAS_IOMEM && COMMON_CLK
-	select REGMAP_MMIO
-	help
-	  Provides the driver to enable and disable the isolation between the
-	  processing system and programmable logic part by using the logicoreIP
-	  register set. This driver also configures the frequency based on the
-	  clock information from the logicoreIP register set.
-
-	  If you say yes here you get support for the logicoreIP.
-
-	  If unsure, say N.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called xlnx_vcu.
-
 config ZYNQMP_POWER
 	bool "Enable Xilinx Zynq MPSoC Power Management driver"
 	depends on PM && ZYNQMP_FIRMWARE
diff --git a/drivers/soc/xilinx/Makefile b/drivers/soc/xilinx/Makefile
index f66bfea5de17..9854e6f6086b 100644
--- a/drivers/soc/xilinx/Makefile
+++ b/drivers/soc/xilinx/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_XILINX_VCU)	+= xlnx_vcu.o
 obj-$(CONFIG_ZYNQMP_POWER)	+= zynqmp_power.o
 obj-$(CONFIG_ZYNQMP_PM_DOMAINS) += zynqmp_pm_domains.o
-- 
2.20.1

