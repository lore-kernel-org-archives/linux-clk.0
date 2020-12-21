Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6CDC4332D
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C44C522C9C
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgLUPHW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:22 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42747 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgLUPHV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:21 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMlg-0007Vy-AE; Mon, 21 Dec 2020 16:06:36 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003Abg-VG; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 15/15] clk: xilinx: move xlnx_vcu clock driver from soc
Date:   Mon, 21 Dec 2020 16:06:34 +0100
Message-Id: <20201221150634.755673-16-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221150634.755673-1-m.tretter@pengutronix.de>
References: <20201221150634.755673-1-m.tretter@pengutronix.de>
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
---
Changelog:

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
index c715d4681a0b..f4b13e7c84de 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -383,6 +383,7 @@ source "drivers/clk/tegra/Kconfig"
 source "drivers/clk/ti/Kconfig"
 source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/x86/Kconfig"
+source "drivers/clk/xilinx/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
 
 endif
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index da8fcf147eb1..44477b84acef 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -121,6 +121,7 @@ obj-y					+= versatile/
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

