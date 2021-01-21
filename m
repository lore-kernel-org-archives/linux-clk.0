Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5220BC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 130162396D
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbhAUHSx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 02:18:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbhAUHSe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 02:18:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5FAC061794
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 23:17:02 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDE-0006UK-CC; Thu, 21 Jan 2021 08:17:00 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDD-00598T-9Y; Thu, 21 Jan 2021 08:16:59 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 09/15] soc: xilinx: vcu: make pll post divider explicit
Date:   Thu, 21 Jan 2021 08:16:53 +0100
Message-Id: <20210121071659.1226489-10-m.tretter@pengutronix.de>
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

According to the downstream driver documentation due to timing
constraints the output divider of the PLL has to be set to 1/2. Add a
helper function for that check instead of burying the code in one large
setup function.

The bit is undocumented and marked as reserved in the register
reference.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
Changelog:

v3:
- Add kernel doc for pll_post

v2:
- Use clk_hw instead of name in xvcu_register_pll_post
---
 drivers/soc/xilinx/xlnx_vcu.c | 52 ++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index e38e9c8325a7..9e410d7ffd08 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -72,6 +72,7 @@
  * @logicore_reg_ba: logicore reg base address
  * @vcu_slcr_ba: vcu_slcr Register base address
  * @pll: handle for the VCU PLL
+ * @pll_post: handle for the VCU PLL post divider
  * @clk_data: clocks provided by the vcu clock provider
  */
 struct xvcu_device {
@@ -81,6 +82,7 @@ struct xvcu_device {
 	struct regmap *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
 	struct clk_hw *pll;
+	struct clk_hw *pll_post;
 	struct clk_hw_onecell_data *clk_data;
 };
 
@@ -274,6 +276,29 @@ static int xvcu_pll_wait_for_lock(struct xvcu_device *xvcu)
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
@@ -402,7 +427,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 {
 	u32 refclk, coreclk, mcuclk, inte, deci;
 	u32 divisor_mcu, divisor_core, fvco;
-	u32 clkoutdiv, vcu_pll_ctrl, pll_clk;
+	u32 pll_clk;
 	u32 mod;
 	int i;
 	int ret;
@@ -425,19 +450,6 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
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
 
@@ -484,7 +496,7 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 
 	hw = clk_hw_register_fixed_rate(xvcu->dev, "vcu_pll",
 					__clk_get_name(xvcu->pll_ref),
-					0, pll_clk);
+					0, fvco);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	xvcu->pll = hw;
@@ -607,6 +619,7 @@ static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
 	struct clk_parent_data parent_data[2] = { 0 };
 	struct clk_hw_onecell_data *data;
 	struct clk_hw **hws;
+	struct clk_hw *hw;
 	void __iomem *reg_base = xvcu->vcu_slcr_ba;
 
 	data = devm_kzalloc(dev, struct_size(data, hws, CLK_XVCU_NUM_CLOCKS), GFP_KERNEL);
@@ -617,8 +630,13 @@ static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
 
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
@@ -657,6 +675,8 @@ static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
 		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_MCU]);
 	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_CORE]))
 		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_CORE]);
+
+	clk_hw_unregister_fixed_factor(xvcu->pll_post);
 }
 
 /**
-- 
2.20.1

