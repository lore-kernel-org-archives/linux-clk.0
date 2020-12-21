Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAEBC4332B
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8518922C9C
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgLUPHW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:22 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37047 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgLUPHV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:21 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMlg-0007Vs-AC; Mon, 21 Dec 2020 16:06:36 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003AbO-S1; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 09/15] soc: xilinx: vcu: make pll post divider explicit
Date:   Mon, 21 Dec 2020 16:06:28 +0100
Message-Id: <20201221150634.755673-10-m.tretter@pengutronix.de>
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

According to the downstream driver documentation due to timing
constraints the output divider of the PLL has to be set to 1/2. Add a
helper function for that check instead of burying the code in one large
setup function.

The bit is undocumented and marked as reserved in the register
reference.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2:
- Use clk_hw instead of name in xvcu_register_pll_post
---
 drivers/soc/xilinx/xlnx_vcu.c | 51 ++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index e38e9c8325a7..6dc58cf58d77 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -81,6 +81,7 @@ struct xvcu_device {
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
 	struct clk_hw *pll;
+	struct clk_hw *pll_post;
 	struct clk_hw_onecell_data *clk_data;
 };
 
@@ -274,6 +275,29 @@ static int xvcu_pll_wait_for_lock(struct xvcu_device *xvcu)
 	return -ETIMEDOUT;
 }
 
+static struct clk_hw *xvcu_register_pll_post(struct device *dev,
+					     const char *name,
+					     const struct clk_hw *parent_hw,
+					     void __iomem *reg_base)
+{
+	u32 div;
+	u32 vcu_pll_ctrl;
+
+	/*
+	 * The output divider of the PLL must be set to 1/2 to meet the
+	 * timing in the design.
+	 */
+	vcu_pll_ctrl = xvcu_read(reg_base, VCU_PLL_CTRL);
+	div = vcu_pll_ctrl >> VCU_PLL_CTRL_CLKOUTDIV_SHIFT;
+	div = div & VCU_PLL_CTRL_CLKOUTDIV_MASK;
+	if (div != 1)
+		return ERR_PTR(-EINVAL);
+
+	return clk_hw_register_fixed_factor(dev, "vcu_pll_post",
+					    clk_hw_get_name(parent_hw),
+					    CLK_SET_RATE_PARENT, 1, 2);
+}
+
 static const struct xvcu_pll_cfg *xvcu_find_cfg(int div)
 {
 	const struct xvcu_pll_cfg *cfg = NULL;
@@ -402,7 +426,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 {
 	u32 refclk, coreclk, mcuclk, inte, deci;
 	u32 divisor_mcu, divisor_core, fvco;
-	u32 clkoutdiv, vcu_pll_ctrl, pll_clk;
+	u32 pll_clk;
 	u32 mod;
 	int i;
 	int ret;
@@ -425,19 +449,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	dev_dbg(xvcu->dev, "Core clock from logicoreIP is %uHz\n", coreclk);
 	dev_dbg(xvcu->dev, "Mcu clock from logicoreIP is %uHz\n", mcuclk);
 
-	/*
-	 * The divide-by-2 should be always enabled (==1)
-	 * to meet the timing in the design.
-	 * Otherwise, it's an error
-	 */
-	vcu_pll_ctrl = xvcu_read(xvcu->vcu_slcr_ba, VCU_PLL_CTRL);
-	clkoutdiv = vcu_pll_ctrl >> VCU_PLL_CTRL_CLKOUTDIV_SHIFT;
-	clkoutdiv = clkoutdiv & VCU_PLL_CTRL_CLKOUTDIV_MASK;
-	if (clkoutdiv != 1) {
-		dev_err(xvcu->dev, "clkoutdiv value is invalid\n");
-		return -EINVAL;
-	}
-
 	for (i = ARRAY_SIZE(xvcu_pll_cfg) - 1; i >= 0; i--) {
 		const struct xvcu_pll_cfg *cfg = &xvcu_pll_cfg[i];
 
@@ -484,7 +495,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 
 	hw = clk_hw_register_fixed_rate(xvcu->dev, "vcu_pll",
 					__clk_get_name(xvcu->pll_ref),
-					0, pll_clk);
+					0, fvco);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	xvcu->pll = hw;
@@ -607,6 +618,7 @@ static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
 	struct clk_parent_data parent_data[2] = { 0 };
 	struct clk_hw_onecell_data *data;
 	struct clk_hw **hws;
+	struct clk_hw *hw;
 	void __iomem *reg_base = xvcu->vcu_slcr_ba;
 
 	data = devm_kzalloc(dev, struct_size(data, hws, CLK_XVCU_NUM_CLOCKS), GFP_KERNEL);
@@ -617,8 +629,13 @@ static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
 
 	xvcu->clk_data = data;
 
+	hw = xvcu_register_pll_post(dev, "vcu_pll_post", xvcu->pll, reg_base);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	xvcu->pll_post = hw;
+
 	parent_data[0].fw_name = "pll_ref";
-	parent_data[1].hw = xvcu->pll;
+	parent_data[1].hw = xvcu->pll_post;
 
 	hws[CLK_XVCU_ENC_CORE] =
 		xvcu_clk_hw_register_leaf(dev, "venc_core_clk",
@@ -657,6 +674,8 @@ static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
 		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_MCU]);
 	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_CORE]))
 		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_CORE]);
+
+	clk_hw_unregister_fixed_factor(xvcu->pll_post);
 }
 
 /**
-- 
2.20.1

