Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC13C432C3
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2583722C7E
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgLUPHW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:22 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57857 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgLUPHV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:21 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMlg-0007Vr-AC; Mon, 21 Dec 2020 16:06:36 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003AbL-Rc; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 08/15] soc: xilinx: vcu: implement clock provider for output clocks
Date:   Mon, 21 Dec 2020 16:06:27 +0100
Message-Id: <20201221150634.755673-9-m.tretter@pengutronix.de>
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

The VCU System-Level Control uses an internal PLL to drive the core and
MCU clock for the allegro encoder and decoder based on an external PL
clock.

In order be able to ensure that the clocks are enabled and to get their
rate from other drivers, the module must implement a clock provider and
register the clocks at the common clock framework. Other drivers are
then able to access the clock via devicetree bindings.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2:
- Fix kernel-doc for struct xvcu_device
- Fix smatch warning regarding wrong returned error pointer
- Use goto for error handling in xvcu_clk_hw_register_leaf
- Use allocated spinlocks
- Use clk_parent_data instead of parent_names
- Add decoder clocks
- Use pll_ref clock as parent in PLL bypass
---
 drivers/soc/xilinx/xlnx_vcu.c | 197 +++++++++++++++++++++++++++-------
 1 file changed, 160 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 6a733a181982..e38e9c8325a7 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -18,6 +18,8 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <dt-bindings/clock/xlnx-vcu.h>
+
 /* vcu slcr registers, bitmask and shift */
 #define VCU_PLL_CTRL			0x24
 #define VCU_PLL_CTRL_RESET_MASK		0x01
@@ -50,11 +52,6 @@
 #define VCU_ENC_MCU_CTRL		0x34
 #define VCU_DEC_CORE_CTRL		0x38
 #define VCU_DEC_MCU_CTRL		0x3c
-#define VCU_PLL_DIVISOR_MASK		0x3f
-#define VCU_PLL_DIVISOR_SHIFT		4
-#define VCU_SRCSEL_MASK			0x01
-#define VCU_SRCSEL_SHIFT		0
-#define VCU_SRCSEL_PLL			1
 
 #define VCU_PLL_STATUS			0x60
 #define VCU_PLL_STATUS_LOCK_STATUS_MASK	0x01
@@ -75,6 +72,7 @@
  * @logicore_reg_ba: logicore reg base address
  * @vcu_slcr_ba: vcu_slcr Register base address
  * @pll: handle for the VCU PLL
+ * @clk_data: clocks provided by the vcu clock provider
  */
 struct xvcu_device {
 	struct device *dev;
@@ -83,6 +81,7 @@ struct xvcu_device {
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
 	struct clk_hw *pll;
+	struct clk_hw_onecell_data *clk_data;
 };
 
 static struct regmap_config vcu_settings_regmap_config = {
@@ -404,7 +403,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	u32 refclk, coreclk, mcuclk, inte, deci;
 	u32 divisor_mcu, divisor_core, fvco;
 	u32 clkoutdiv, vcu_pll_ctrl, pll_clk;
-	u32 mod, ctrl;
+	u32 mod;
 	int i;
 	int ret;
 	const struct xvcu_pll_cfg *found = NULL;
@@ -479,37 +478,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", coreclk);
 	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
 
-	/* Set divisor for the core and mcu clock */
-	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_ENC_CORE_CTRL);
-	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
-	ctrl |= (divisor_core & VCU_PLL_DIVISOR_MASK) <<
-		 VCU_PLL_DIVISOR_SHIFT;
-	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
-	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
-	xvcu_write(xvcu->vcu_slcr_ba, VCU_ENC_CORE_CTRL, ctrl);
-
-	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_DEC_CORE_CTRL);
-	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
-	ctrl |= (divisor_core & VCU_PLL_DIVISOR_MASK) <<
-		 VCU_PLL_DIVISOR_SHIFT;
-	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
-	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
-	xvcu_write(xvcu->vcu_slcr_ba, VCU_DEC_CORE_CTRL, ctrl);
-
-	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_ENC_MCU_CTRL);
-	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
-	ctrl |= (divisor_mcu & VCU_PLL_DIVISOR_MASK) << VCU_PLL_DIVISOR_SHIFT;
-	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
-	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
-	xvcu_write(xvcu->vcu_slcr_ba, VCU_ENC_MCU_CTRL, ctrl);
-
-	ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_DEC_MCU_CTRL);
-	ctrl &= ~(VCU_PLL_DIVISOR_MASK << VCU_PLL_DIVISOR_SHIFT);
-	ctrl |= (divisor_mcu & VCU_PLL_DIVISOR_MASK) << VCU_PLL_DIVISOR_SHIFT;
-	ctrl &= ~(VCU_SRCSEL_MASK << VCU_SRCSEL_SHIFT);
-	ctrl |= (VCU_SRCSEL_PLL & VCU_SRCSEL_MASK) << VCU_SRCSEL_SHIFT;
-	xvcu_write(xvcu->vcu_slcr_ba, VCU_DEC_MCU_CTRL, ctrl);
-
 	ret = xvcu_pll_set_rate(xvcu, fvco, refclk);
 	if (ret)
 		return ret;
@@ -546,6 +514,151 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
 	return xvcu_pll_enable(xvcu);
 }
 
+static struct clk_hw *xvcu_clk_hw_register_leaf(struct device *dev,
+						const char *name,
+						const struct clk_parent_data *parent_data,
+						u8 num_parents,
+						void __iomem *reg)
+{
+	u8 mux_flags = CLK_MUX_ROUND_CLOSEST;
+	u8 divider_flags = CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO |
+			   CLK_DIVIDER_ROUND_CLOSEST;
+	struct clk_hw *mux = NULL;
+	struct clk_hw *divider = NULL;
+	struct clk_hw *gate = NULL;
+	char *name_mux;
+	char *name_div;
+	int err;
+	/* Protect register shared by clocks */
+	spinlock_t *lock;
+
+	lock = devm_kzalloc(dev, sizeof(*lock), GFP_KERNEL);
+	if (!lock)
+		return ERR_PTR(-ENOMEM);
+	spin_lock_init(lock);
+
+	name_mux = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_mux");
+	if (!name_mux)
+		return ERR_PTR(-ENOMEM);
+	mux = clk_hw_register_mux_parent_data(dev, name_mux,
+					      parent_data, num_parents,
+					      CLK_SET_RATE_PARENT,
+					      reg, 0, 1, mux_flags, lock);
+	if (IS_ERR(mux))
+		return mux;
+
+	name_div = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_div");
+	if (!name_div) {
+		err = -ENOMEM;
+		goto unregister_mux;
+	}
+	divider = clk_hw_register_divider_parent_hw(dev, name_div, mux,
+						    CLK_SET_RATE_PARENT,
+						    reg, 4, 6, divider_flags,
+						    lock);
+	if (IS_ERR(divider)) {
+		err = PTR_ERR(divider);
+		goto unregister_mux;
+	}
+
+	gate = clk_hw_register_gate_parent_hw(dev, name, divider,
+					      CLK_SET_RATE_PARENT, reg, 12, 0,
+					      lock);
+	if (IS_ERR(gate)) {
+		err = PTR_ERR(gate);
+		goto unregister_divider;
+	}
+
+	return gate;
+
+unregister_divider:
+	clk_hw_unregister_divider(divider);
+unregister_mux:
+	clk_hw_unregister_mux(mux);
+
+	return ERR_PTR(err);
+}
+
+static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
+{
+	struct clk_hw *gate = hw;
+	struct clk_hw *divider;
+	struct clk_hw *mux;
+
+	if (!gate)
+		return;
+
+	divider = clk_hw_get_parent(gate);
+	clk_hw_unregister_gate(gate);
+	if (!divider)
+		return;
+
+	mux = clk_hw_get_parent(divider);
+	clk_hw_unregister_mux(mux);
+	if (!divider)
+		return;
+
+	clk_hw_unregister_divider(divider);
+}
+
+static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
+{
+	struct device *dev = xvcu->dev;
+	struct clk_parent_data parent_data[2] = { 0 };
+	struct clk_hw_onecell_data *data;
+	struct clk_hw **hws;
+	void __iomem *reg_base = xvcu->vcu_slcr_ba;
+
+	data = devm_kzalloc(dev, struct_size(data, hws, CLK_XVCU_NUM_CLOCKS), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->num = CLK_XVCU_NUM_CLOCKS;
+	hws = data->hws;
+
+	xvcu->clk_data = data;
+
+	parent_data[0].fw_name = "pll_ref";
+	parent_data[1].hw = xvcu->pll;
+
+	hws[CLK_XVCU_ENC_CORE] =
+		xvcu_clk_hw_register_leaf(dev, "venc_core_clk",
+					  parent_data,
+					  ARRAY_SIZE(parent_data),
+					  reg_base + VCU_ENC_CORE_CTRL);
+	hws[CLK_XVCU_ENC_MCU] =
+		xvcu_clk_hw_register_leaf(dev, "venc_mcu_clk",
+					  parent_data,
+					  ARRAY_SIZE(parent_data),
+					  reg_base + VCU_ENC_MCU_CTRL);
+	hws[CLK_XVCU_DEC_CORE] =
+		xvcu_clk_hw_register_leaf(dev, "vdec_core_clk",
+					  parent_data,
+					  ARRAY_SIZE(parent_data),
+					  reg_base + VCU_DEC_CORE_CTRL);
+	hws[CLK_XVCU_DEC_MCU] =
+		xvcu_clk_hw_register_leaf(dev, "vdec_mcu_clk",
+					  parent_data,
+					  ARRAY_SIZE(parent_data),
+					  reg_base + VCU_DEC_MCU_CTRL);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
+}
+
+static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
+{
+	struct clk_hw_onecell_data *data = xvcu->clk_data;
+	struct clk_hw **hws = data->hws;
+
+	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_DEC_MCU]))
+		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_DEC_MCU]);
+	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_DEC_CORE]))
+		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_DEC_CORE]);
+	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_MCU]))
+		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_MCU]);
+	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_CORE]))
+		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_CORE]);
+}
+
 /**
  * xvcu_probe - Probe existence of the logicoreIP
  *			and initialize PLL
@@ -640,10 +753,18 @@ static int xvcu_probe(struct platform_device *pdev)
 		goto error_pll_ref;
 	}
 
+	ret = xvcu_register_clock_provider(xvcu);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register clock provider\n");
+		goto error_clk_provider;
+	}
+
 	dev_set_drvdata(&pdev->dev, xvcu);
 
 	return 0;
 
+error_clk_provider:
+	xvcu_unregister_clock_provider(xvcu);
 error_pll_ref:
 	clk_disable_unprepare(xvcu->aclk);
 	return ret;
@@ -665,6 +786,8 @@ static int xvcu_remove(struct platform_device *pdev)
 	if (!xvcu)
 		return -ENODEV;
 
+	xvcu_unregister_clock_provider(xvcu);
+
 	/* Add the the Gasket isolation and put the VCU in reset. */
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
-- 
2.20.1

