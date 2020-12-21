Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F75C433E9
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B50F22CA1
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgLUPHW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:22 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39283 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgLUPHV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:21 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMlg-0007Vq-AD; Mon, 21 Dec 2020 16:06:36 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003AbI-Qx; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 07/15] soc: xilinx: vcu: register PLL as fixed rate clock
Date:   Mon, 21 Dec 2020 16:06:26 +0100
Message-Id: <20201221150634.755673-8-m.tretter@pengutronix.de>
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

Currently, xvcu_pll_set_rate configures the PLL to a clock rate that is
pre-calculated when probing the driver. To still make the clock
framework aware of the PLL and to allow to configure other clocks based
on the PLL rate, register the PLL as a fixed rate clock.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2:
- Fix kernel-doc of struct xvcu_device
- Add missing clk_hw_unregister_fixed_rate
---
 drivers/soc/xilinx/Kconfig    |  2 +-
 drivers/soc/xilinx/xlnx_vcu.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/xilinx/Kconfig b/drivers/soc/xilinx/Kconfig
index 0b1708dae361..9fe703772e5a 100644
--- a/drivers/soc/xilinx/Kconfig
+++ b/drivers/soc/xilinx/Kconfig
@@ -3,7 +3,7 @@ menu "Xilinx SoC drivers"
 
 config XILINX_VCU
 	tristate "Xilinx VCU logicoreIP Init"
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && COMMON_CLK
 	select REGMAP_MMIO
 	help
 	  Provides the driver to enable and disable the isolation between the
diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 34f3299afc0d..6a733a181982 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -7,6 +7,7 @@
  * Contacts   Dhaval Shah <dshah@xilinx.com>
  */
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/io.h>
@@ -73,6 +74,7 @@
  * @aclk: axi clock source
  * @logicore_reg_ba: logicore reg base address
  * @vcu_slcr_ba: vcu_slcr Register base address
+ * @pll: handle for the VCU PLL
  */
 struct xvcu_device {
 	struct device *dev;
@@ -80,6 +82,7 @@ struct xvcu_device {
 	struct clk *aclk;
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
+	struct clk_hw *pll;
 };
 
 static struct regmap_config vcu_settings_regmap_config = {
@@ -403,7 +406,9 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	u32 clkoutdiv, vcu_pll_ctrl, pll_clk;
 	u32 mod, ctrl;
 	int i;
+	int ret;
 	const struct xvcu_pll_cfg *found = NULL;
+	struct clk_hw *hw;
 
 	regmap_read(xvcu->logicore_reg_ba, VCU_PLL_CLK, &inte);
 	regmap_read(xvcu->logicore_reg_ba, VCU_PLL_CLK_DEC, &deci);
@@ -505,7 +510,18 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
 	xvcu_write(xvcu->vcu_slcr_ba, VCU_DEC_MCU_CTRL, ctrl);
 
-	return xvcu_pll_set_rate(xvcu, fvco, refclk);
+	ret = xvcu_pll_set_rate(xvcu, fvco, refclk);
+	if (ret)
+		return ret;
+
+	hw = clk_hw_register_fixed_rate(xvcu->dev, "vcu_pll",
+					__clk_get_name(xvcu->pll_ref),
+					0, pll_clk);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	xvcu->pll = hw;
+
+	return 0;
 }
 
 /**
@@ -652,6 +668,7 @@ static int xvcu_remove(struct platform_device *pdev)
 	/* Add the the Gasket isolation and put the VCU in reset. */
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
+	clk_hw_unregister_fixed_rate(xvcu->pll);
 	xvcu_pll_disable(xvcu);
 	clk_disable_unprepare(xvcu->aclk);
 
-- 
2.20.1

