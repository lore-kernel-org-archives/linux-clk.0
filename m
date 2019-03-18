Return-Path: <SRS0=cbsA=RV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8362C43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 10:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B383D2070D
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 10:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfCRK2M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Mar 2019 06:28:12 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34777 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbfCRK2M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Mar 2019 06:28:12 -0400
Received: from localhost (aaubervilliers-681-1-80-102.w90-88.abo.wanadoo.fr [90.88.22.102])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 69F6C240004;
        Mon, 18 Mar 2019 10:28:08 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: sunxi: Add Kconfig options
Date:   Mon, 18 Mar 2019 11:28:05 +0100
Message-Id: <20190318102805.10145-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We used to have a clock framework that isn't really used these days, except
for a few clocks and/or SoCs. Most of the time, the new framework and
drivers (sunxi-ng) will provide everything needed for the customer devices
to operate properly.

Since we're not needing it that much, it might make sense to disable those
drivers, for example when we want to reduce the kernel size. Let's add
options in Kconfig that can be disabled if needed, but are still on by
default to keep the same features in the standard case.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/clk/Kconfig        |  1 +
 drivers/clk/sunxi/Kconfig  | 21 ++++++++++++++++
 drivers/clk/sunxi/Makefile | 49 +++++++++++++++++++++-----------------
 3 files changed, 49 insertions(+), 22 deletions(-)
 create mode 100644 drivers/clk/sunxi/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e705aab9e38b..f96c7f39ab7e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -310,6 +310,7 @@ source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/samsung/Kconfig"
 source "drivers/clk/sprd/Kconfig"
+source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sunxi-ng/Kconfig"
 source "drivers/clk/tegra/Kconfig"
 source "drivers/clk/ti/Kconfig"
diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
new file mode 100644
index 000000000000..2842d2feca0e
--- /dev/null
+++ b/drivers/clk/sunxi/Kconfig
@@ -0,0 +1,21 @@
+config CLK_SUNXI
+	bool "Legacy clock support for Allwinner SoCs"
+	depends on ARCH_SUNXI || COMPILE_TEST
+
+if CLK_SUNXI
+
+config CLK_SUNXI_CLOCKS
+	bool "Legacy clock drivers"
+
+config CLK_SUNXI_PRCM_SUN6I
+	bool "Legacy sun6i PRCM driver"
+	select MFD_SUN6I_PRCM
+
+config CLK_SUNXI_PRCM_SUN8I
+	bool "Legacy sun8i PRCM driver"
+	select MFD_SUN6I_PRCM
+
+config CLK_SUNXI_PRCM_SUN9I
+	bool "Legacy sun9i PRCM driver"
+
+endif
diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index be88368b48a1..e10824c76ae9 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -3,27 +3,32 @@
 # Makefile for sunxi specific clk
 #
 
-obj-y += clk-sunxi.o clk-factors.o
-obj-y += clk-a10-codec.o
-obj-y += clk-a10-hosc.o
-obj-y += clk-a10-mod1.o
-obj-y += clk-a10-pll2.o
-obj-y += clk-a10-ve.o
-obj-y += clk-a20-gmac.o
-obj-y += clk-mod0.o
-obj-y += clk-simple-gates.o
-obj-y += clk-sun4i-display.o
-obj-y += clk-sun4i-pll3.o
-obj-y += clk-sun4i-tcon-ch1.o
-obj-y += clk-sun8i-bus-gates.o
-obj-y += clk-sun8i-mbus.o
-obj-y += clk-sun9i-core.o
-obj-y += clk-sun9i-mmc.o
-obj-y += clk-usb.o
+obj-$(CONFIG_CLK_SUNXI) += clk-factors.o
 
-obj-$(CONFIG_MACH_SUN9I) += clk-sun8i-apb0.o
-obj-$(CONFIG_MACH_SUN9I) += clk-sun9i-cpus.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sunxi.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-a10-codec.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-a10-hosc.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-a10-mod1.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-a10-pll2.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-a10-ve.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-a20-gmac.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-mod0.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-simple-gates.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun4i-display.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun4i-pll3.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun4i-tcon-ch1.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun8i-bus-gates.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun8i-mbus.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun9i-core.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun9i-mmc.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-usb.o
 
-obj-$(CONFIG_MFD_SUN6I_PRCM) += \
-	clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
-	clk-sun8i-apb0.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun8i-apb0.o
+obj-$(CONFIG_CLK_SUNXI_CLOCKS) += clk-sun9i-cpus.o
+
+obj-$(CONFIG_CLK_SUNXI_PRCM_SUN6I)	+= clk-sun6i-apb0.o
+obj-$(CONFIG_CLK_SUNXI_PRCM_SUN6I)	+= clk-sun6i-apb0-gates.o
+obj-$(CONFIG_CLK_SUNXI_PRCM_SUN6I)	+= clk-sun6i-ar100.o
+
+obj-$(CONFIG_CLK_SUNXI_PRCM_SUN8I)	+= clk-sun8i-apb0.o
+obj-$(CONFIG_CLK_SUNXI_PRCM_SUN8I)	+= clk-sun6i-apb0-gates.o
-- 
2.20.1

