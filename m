Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F10C43603
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0FF322BEA
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgLUPH1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:27 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44171 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgLUPH1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:27 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMlg-0007Vv-AC; Mon, 21 Dec 2020 16:06:36 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003AbX-TZ; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 12/15] soc: xilinx: vcu: use bitfields for register definition
Date:   Mon, 21 Dec 2020 16:06:31 +0100
Message-Id: <20201221150634.755673-13-m.tretter@pengutronix.de>
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

This makes the register accesses more readable and is closer to what is
usually used in the kernel.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
Changelog:

v2: none
---
 drivers/soc/xilinx/xlnx_vcu.c | 115 ++++++++++------------------------
 1 file changed, 34 insertions(+), 81 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index a2de1f8ca7dd..4ba9b40df983 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -6,6 +6,7 @@
  *
  * Contacts   Dhaval Shah <dshah@xilinx.com>
  */
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
@@ -20,41 +21,26 @@
 
 #include <dt-bindings/clock/xlnx-vcu.h>
 
-/* vcu slcr registers, bitmask and shift */
 #define VCU_PLL_CTRL			0x24
-#define VCU_PLL_CTRL_RESET_MASK		0x01
-#define VCU_PLL_CTRL_RESET_SHIFT	0
-#define VCU_PLL_CTRL_BYPASS_MASK	0x01
-#define VCU_PLL_CTRL_BYPASS_SHIFT	3
-#define VCU_PLL_CTRL_FBDIV_MASK		0x7f
-#define VCU_PLL_CTRL_FBDIV_SHIFT	8
-#define VCU_PLL_CTRL_POR_IN_MASK	0x01
-#define VCU_PLL_CTRL_POR_IN_SHIFT	1
-#define VCU_PLL_CTRL_PWR_POR_MASK	0x01
-#define VCU_PLL_CTRL_PWR_POR_SHIFT	2
-#define VCU_PLL_CTRL_CLKOUTDIV_MASK	0x03
-#define VCU_PLL_CTRL_CLKOUTDIV_SHIFT	16
-#define VCU_PLL_CTRL_DEFAULT		0
-#define VCU_PLL_DIV2			2
+#define VCU_PLL_CTRL_RESET		BIT(0)
+#define VCU_PLL_CTRL_POR_IN		BIT(1)
+#define VCU_PLL_CTRL_PWR_POR		BIT(2)
+#define VCU_PLL_CTRL_BYPASS		BIT(3)
+#define VCU_PLL_CTRL_FBDIV		GENMASK(14, 8)
+#define VCU_PLL_CTRL_CLKOUTDIV		GENMASK(18, 16)
 
 #define VCU_PLL_CFG			0x28
-#define VCU_PLL_CFG_RES_MASK		0x0f
-#define VCU_PLL_CFG_RES_SHIFT		0
-#define VCU_PLL_CFG_CP_MASK		0x0f
-#define VCU_PLL_CFG_CP_SHIFT		5
-#define VCU_PLL_CFG_LFHF_MASK		0x03
-#define VCU_PLL_CFG_LFHF_SHIFT		10
-#define VCU_PLL_CFG_LOCK_CNT_MASK	0x03ff
-#define VCU_PLL_CFG_LOCK_CNT_SHIFT	13
-#define VCU_PLL_CFG_LOCK_DLY_MASK	0x7f
-#define VCU_PLL_CFG_LOCK_DLY_SHIFT	25
+#define VCU_PLL_CFG_RES			GENMASK(3, 0)
+#define VCU_PLL_CFG_CP			GENMASK(8, 5)
+#define VCU_PLL_CFG_LFHF		GENMASK(12, 10)
+#define VCU_PLL_CFG_LOCK_CNT		GENMASK(22, 13)
+#define VCU_PLL_CFG_LOCK_DLY		GENMASK(31, 25)
 #define VCU_ENC_CORE_CTRL		0x30
 #define VCU_ENC_MCU_CTRL		0x34
 #define VCU_DEC_CORE_CTRL		0x38
 #define VCU_DEC_MCU_CTRL		0x3c
-
 #define VCU_PLL_STATUS			0x60
-#define VCU_PLL_STATUS_LOCK_STATUS_MASK	0x01
+#define VCU_PLL_STATUS_LOCK_STATUS	BIT(0)
 
 #define MHZ				1000000
 #define FVCO_MIN			(1500U * MHZ)
@@ -236,25 +222,6 @@ static inline void xvcu_write(void __iomem *iomem, u32 offset, u32 value)
 	iowrite32(value, iomem + offset);
 }
 
-/**
- * xvcu_write_field_reg - Write to the vcu reg field
- * @iomem:	vcu reg space base address
- * @offset:	vcu reg offset from base
- * @field:	vcu reg field to write to
- * @mask:	vcu reg mask
- * @shift:	vcu reg number of bits to shift the bitfield
- */
-static void xvcu_write_field_reg(void __iomem *iomem, int offset,
-				 u32 field, u32 mask, int shift)
-{
-	u32 val = xvcu_read(iomem, offset);
-
-	val &= ~(mask << shift);
-	val |= (field & mask) << shift;
-
-	xvcu_write(iomem, offset, val);
-}
-
 #define to_vcu_pll(_hw) container_of(_hw, struct vcu_pll, hw)
 
 struct vcu_pll {
@@ -273,7 +240,7 @@ static int xvcu_pll_wait_for_lock(struct vcu_pll *pll)
 	timeout = jiffies + msecs_to_jiffies(2000);
 	do {
 		lock_status = xvcu_read(base, VCU_PLL_STATUS);
-		if (lock_status & VCU_PLL_STATUS_LOCK_STATUS_MASK)
+		if (lock_status & VCU_PLL_STATUS_LOCK_STATUS)
 			return 0;
 	} while (!time_after(jiffies, timeout));
 
@@ -293,8 +260,7 @@ static struct clk_hw *xvcu_register_pll_post(struct device *dev,
 	 * timing in the design.
 	 */
 	vcu_pll_ctrl = xvcu_read(reg_base, VCU_PLL_CTRL);
-	div = vcu_pll_ctrl >> VCU_PLL_CTRL_CLKOUTDIV_SHIFT;
-	div = div & VCU_PLL_CTRL_CLKOUTDIV_MASK;
+	div = FIELD_GET(VCU_PLL_CTRL_CLKOUTDIV, vcu_pll_ctrl);
 	if (div != 1)
 		return ERR_PTR(-EINVAL);
 
@@ -327,16 +293,15 @@ static int xvcu_pll_set_div(struct vcu_pll *pll, int div)
 		return -EINVAL;
 
 	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_FBDIV_MASK << VCU_PLL_CTRL_FBDIV_SHIFT);
-	vcu_pll_ctrl |= (cfg->fbdiv & VCU_PLL_CTRL_FBDIV_MASK) <<
-			 VCU_PLL_CTRL_FBDIV_SHIFT;
+	vcu_pll_ctrl &= ~VCU_PLL_CTRL_FBDIV;
+	vcu_pll_ctrl |= FIELD_PREP(VCU_PLL_CTRL_FBDIV, cfg->fbdiv);
 	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
-	cfg_val = (cfg->res << VCU_PLL_CFG_RES_SHIFT) |
-		   (cfg->cp << VCU_PLL_CFG_CP_SHIFT) |
-		   (cfg->lfhf << VCU_PLL_CFG_LFHF_SHIFT) |
-		   (cfg->lock_cnt << VCU_PLL_CFG_LOCK_CNT_SHIFT) |
-		   (cfg->lock_dly << VCU_PLL_CFG_LOCK_DLY_SHIFT);
+	cfg_val = FIELD_PREP(VCU_PLL_CFG_RES, cfg->res) |
+		  FIELD_PREP(VCU_PLL_CFG_CP, cfg->cp) |
+		  FIELD_PREP(VCU_PLL_CFG_LFHF, cfg->lfhf) |
+		  FIELD_PREP(VCU_PLL_CFG_LOCK_CNT, cfg->lock_cnt) |
+		  FIELD_PREP(VCU_PLL_CFG_LOCK_DLY, cfg->lock_dly);
 	xvcu_write(base, VCU_PLL_CFG, cfg_val);
 
 	return 0;
@@ -365,7 +330,7 @@ static unsigned long xvcu_pll_recalc_rate(struct clk_hw *hw,
 	u32 vcu_pll_ctrl;
 
 	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
-	div = (vcu_pll_ctrl >> VCU_PLL_CTRL_FBDIV_SHIFT) & VCU_PLL_CTRL_FBDIV_MASK;
+	div = FIELD_GET(VCU_PLL_CTRL_FBDIV, vcu_pll_ctrl);
 
 	return div * parent_rate;
 }
@@ -385,23 +350,14 @@ static int xvcu_pll_enable(struct clk_hw *hw)
 	u32 vcu_pll_ctrl;
 	int ret;
 
-	xvcu_write_field_reg(base, VCU_PLL_CTRL,
-			     1, VCU_PLL_CTRL_BYPASS_MASK,
-			     VCU_PLL_CTRL_BYPASS_SHIFT);
-
 	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK <<
-			  VCU_PLL_CTRL_POR_IN_SHIFT);
-	vcu_pll_ctrl |= (VCU_PLL_CTRL_DEFAULT & VCU_PLL_CTRL_POR_IN_MASK) <<
-			 VCU_PLL_CTRL_POR_IN_SHIFT;
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_PWR_POR_MASK <<
-			  VCU_PLL_CTRL_PWR_POR_SHIFT);
-	vcu_pll_ctrl |= (VCU_PLL_CTRL_DEFAULT & VCU_PLL_CTRL_PWR_POR_MASK) <<
-			 VCU_PLL_CTRL_PWR_POR_SHIFT;
+	vcu_pll_ctrl |= VCU_PLL_CTRL_BYPASS;
 	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_RESET_MASK << VCU_PLL_CTRL_RESET_SHIFT);
-	vcu_pll_ctrl |= (0 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
+	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
+	vcu_pll_ctrl &= ~VCU_PLL_CTRL_POR_IN;
+	vcu_pll_ctrl &= ~VCU_PLL_CTRL_PWR_POR;
+	vcu_pll_ctrl &= ~VCU_PLL_CTRL_RESET;
 	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
 	ret = xvcu_pll_wait_for_lock(pll);
@@ -410,9 +366,9 @@ static int xvcu_pll_enable(struct clk_hw *hw)
 		goto err;
 	}
 
-	xvcu_write_field_reg(base, VCU_PLL_CTRL,
-			     0, VCU_PLL_CTRL_BYPASS_MASK,
-			     VCU_PLL_CTRL_BYPASS_SHIFT);
+	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
+	vcu_pll_ctrl &= ~VCU_PLL_CTRL_BYPASS;
+	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 
 err:
 	return ret;
@@ -425,12 +381,9 @@ static void xvcu_pll_disable(struct clk_hw *hw)
 	u32 vcu_pll_ctrl;
 
 	vcu_pll_ctrl = xvcu_read(base, VCU_PLL_CTRL);
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_POR_IN_MASK << VCU_PLL_CTRL_POR_IN_SHIFT);
-	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_POR_IN_MASK) << VCU_PLL_CTRL_POR_IN_SHIFT;
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_PWR_POR_MASK << VCU_PLL_CTRL_PWR_POR_SHIFT);
-	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_PWR_POR_MASK) << VCU_PLL_CTRL_PWR_POR_SHIFT;
-	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_RESET_MASK << VCU_PLL_CTRL_RESET_SHIFT);
-	vcu_pll_ctrl |= (1 & VCU_PLL_CTRL_RESET_MASK) << VCU_PLL_CTRL_RESET_SHIFT;
+	vcu_pll_ctrl |= VCU_PLL_CTRL_POR_IN;
+	vcu_pll_ctrl |= VCU_PLL_CTRL_PWR_POR;
+	vcu_pll_ctrl |= VCU_PLL_CTRL_RESET;
 	xvcu_write(base, VCU_PLL_CTRL, vcu_pll_ctrl);
 }
 
-- 
2.20.1

