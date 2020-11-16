Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB527C4742C
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 08:09:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E23C2225B
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 08:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgKPHzo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728073AbgKPHzm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Nov 2020 02:55:42 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD1AC061A04
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2020 23:55:42 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1keZMO-0007YV-4J; Mon, 16 Nov 2020 08:55:40 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1keZMN-00Grbi-1H; Mon, 16 Nov 2020 08:55:35 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Mon, 16 Nov 2020 08:55:28 +0100
Message-Id: <20201116075532.4019252-9-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116075532.4019252-1-m.tretter@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 08/12] soc: xilinx: vcu: implement clock provider for output clocks
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
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
 drivers/soc/xilinx/xlnx_vcu.c | 191 +++++++++++++++++++++++++++-------
 1 file changed, 154 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 725e646aa726..cedc8b7859f7 100644
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
@@ -82,6 +79,7 @@ struct xvcu_device {
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
 	struct clk_hw *pll;
+	struct clk_hw_onecell_data *clk_data;
 };
 
 static struct regmap_config vcu_settings_regmap_config = {
@@ -403,7 +401,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	u32 refclk, coreclk, mcuclk, inte, deci;
 	u32 divisor_mcu, divisor_core, fvco;
 	u32 clkoutdiv, vcu_pll_ctrl, pll_clk;
-	u32 mod, ctrl;
+	u32 mod;
 	int i;
 	int ret;
 	const struct xvcu_pll_cfg *found = NULL;
@@ -478,37 +476,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
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
@@ -545,6 +512,146 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
 	return xvcu_pll_enable(xvcu);
 }
 
+static struct clk_hw *xvcu_clk_hw_register_leaf(struct device *dev,
+						const char *name,
+						const char * const *parent_names,
+						u8 num_parents,
+						struct clk_hw *parent_default,
+						void __iomem *reg,
+						spinlock_t *lock)
+{
+	unsigned long flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT;
+	u8 divider_flags = CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO |
+			   CLK_DIVIDER_ROUND_CLOSEST;
+	struct clk_hw *mux = NULL;
+	struct clk_hw *divider = NULL;
+	struct clk_hw *gate = NULL;
+	char *name_mux;
+	char *name_div;
+	int err;
+
+	name_mux = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_mux");
+	if (!name_mux) {
+		err = -ENOMEM;
+		goto err;
+	}
+	mux = clk_hw_register_mux(dev, name_mux, parent_names, num_parents,
+				  flags, reg, 0, 1, 0, lock);
+	if (IS_ERR(mux)) {
+		err = PTR_ERR(divider);
+		goto err;
+	}
+	clk_hw_set_parent(mux, parent_default);
+
+	name_div = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_div");
+	if (!name_div) {
+		err = -ENOMEM;
+		goto err;
+	}
+	divider = clk_hw_register_divider_parent_hw(dev, name_div, mux, flags,
+						    reg, 4, 6, divider_flags,
+						    lock);
+	if (IS_ERR(divider)) {
+		err = PTR_ERR(divider);
+		goto err;
+	}
+
+	gate = clk_hw_register_gate_parent_hw(dev, name, divider,
+					      CLK_SET_RATE_PARENT, reg, 12, 0,
+					      lock);
+	if (IS_ERR(gate)) {
+		err = PTR_ERR(gate);
+		goto err;
+	}
+
+	return gate;
+
+err:
+	if (!IS_ERR_OR_NULL(gate))
+		clk_hw_unregister_gate(gate);
+	if (!IS_ERR_OR_NULL(divider))
+		clk_hw_unregister_divider(divider);
+	if (!IS_ERR_OR_NULL(mux))
+		clk_hw_unregister_divider(mux);
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
+static DEFINE_SPINLOCK(venc_core_lock);
+static DEFINE_SPINLOCK(venc_mcu_lock);
+
+static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
+{
+	struct device *dev = xvcu->dev;
+	const char *parent_names[2];
+	struct clk_hw *parent_default;
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
+	parent_default = xvcu->pll;
+	parent_names[0] = "dummy";
+	parent_names[1] = clk_hw_get_name(parent_default);
+
+	hws[CLK_XVCU_ENC_CORE] =
+		xvcu_clk_hw_register_leaf(dev, "venc_core_clk",
+					  parent_names,
+					  ARRAY_SIZE(parent_names),
+					  parent_default,
+					  reg_base + VCU_ENC_CORE_CTRL,
+					  &venc_core_lock);
+	hws[CLK_XVCU_ENC_MCU] =
+		xvcu_clk_hw_register_leaf(dev, "venc_mcu_clk",
+					  parent_names,
+					  ARRAY_SIZE(parent_names),
+					  parent_default,
+					  reg_base + VCU_ENC_MCU_CTRL,
+					  &venc_mcu_lock);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
+}
+
+static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
+{
+	struct clk_hw_onecell_data *data = xvcu->clk_data;
+	struct clk_hw **hws = data->hws;
+
+	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_MCU]))
+		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_MCU]);
+	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_CORE]))
+		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_CORE]);
+}
+
 /**
  * xvcu_probe - Probe existence of the logicoreIP
  *			and initialize PLL
@@ -639,10 +746,18 @@ static int xvcu_probe(struct platform_device *pdev)
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
@@ -664,6 +779,8 @@ static int xvcu_remove(struct platform_device *pdev)
 	if (!xvcu)
 		return -ENODEV;
 
+	xvcu_unregister_clock_provider(xvcu);
+
 	/* Add the the Gasket isolation and put the VCU in reset. */
 	regmap_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
-- 
2.20.1

