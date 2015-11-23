Return-Path: <rjui@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>,
	Ray Jui <rjui@broadcom.com>
Subject: [PATCH v2 2/4] clk: iproc: Add support for Cygnus audio clocks
Date: Mon, 23 Nov 2015 09:50:25 -0800
Message-ID: <1448301027-27061-3-git-send-email-rjui@broadcom.com>
In-Reply-To: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
References: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

From: Simran Rai <ssimran@broadcom.com>

This patch adds support for Broadcom Cygnus audio PLL and leaf
clocks

Signed-off-by: Simran Rai <ssimran@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 drivers/clk/bcm/clk-cygnus.c           | 59 ++++++++++++++++++++++++++++++++++
 drivers/clk/bcm/clk-iproc-pll.c        | 41 ++++++++++++++++++++---
 drivers/clk/bcm/clk-iproc.h            | 21 ++++++++++++
 include/dt-bindings/clock/bcm-cygnus.h |  6 ++++
 4 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/bcm/clk-cygnus.c b/drivers/clk/bcm/clk-cygnus.c
index 3a228b6..464fdc4 100644
--- a/drivers/clk/bcm/clk-cygnus.c
+++ b/drivers/clk/bcm/clk-cygnus.c
@@ -268,3 +268,62 @@ static void __init cygnus_asiu_init(struct device_node *node)
 	iproc_asiu_setup(node, asiu_div, asiu_gate, ARRAY_SIZE(asiu_div));
 }
 CLK_OF_DECLARE(cygnus_asiu_clk, "brcm,cygnus-asiu-clk", cygnus_asiu_init);
+
+/*
+ * AUDIO PLL VCO frequency parameter table
+ *
+ * PLL output frequency = ((ndiv_int + ndiv_frac / 2^20) *
+ * (parent clock rate / pdiv)
+ *
+ * On Cygnus, parent is the 25MHz oscillator
+ */
+static const struct iproc_pll_vco_param audiopll_vco_params[] = {
+	/* rate (Hz) ndiv_int ndiv_frac pdiv */
+	{ 1354750204UL,  54,     199238,   1 },
+	{ 1769470191UL,  70,     816639,   1 },
+};
+
+static const struct iproc_pll_ctrl audiopll = {
+	.flags = IPROC_CLK_PLL_NEEDS_SW_CFG | IPROC_CLK_PLL_HAS_NDIV_FRAC |
+		IPROC_CLK_PLL_USER_MODE_ON | IPROC_CLK_PLL_RESET_ACTIVE_LOW,
+	.reset = RESET_VAL(0x5c, 0, 1),
+	.dig_filter = DF_VAL(0x48, 0, 3, 6, 4, 3, 3),
+	.sw_ctrl = SW_CTRL_VAL(0x4, 0),
+	.ndiv_int = REG_VAL(0x8, 0, 10),
+	.ndiv_frac = REG_VAL(0x8, 10, 20),
+	.pdiv = REG_VAL(0x44, 0, 4),
+	.vco_ctrl = VCO_CTRL_VAL(0x0c, 0x10),
+	.status = REG_VAL(0x54, 0, 1),
+	.macro_mode = REG_VAL(0x0, 0, 3),
+};
+
+static const struct iproc_clk_ctrl audiopll_clk[] = {
+	[BCM_CYGNUS_AUDIOPLL_CH0] = {
+		.channel = BCM_CYGNUS_AUDIOPLL_CH0,
+		.flags = IPROC_CLK_AON |
+				IPROC_CLK_MCLK_DIV_BY_2,
+		.enable = ENABLE_VAL(0x14, 8, 10, 9),
+		.mdiv = REG_VAL(0x14, 0, 8),
+	},
+	[BCM_CYGNUS_AUDIOPLL_CH1] = {
+		.channel = BCM_CYGNUS_AUDIOPLL_CH1,
+		.flags = IPROC_CLK_AON,
+		.enable = ENABLE_VAL(0x18, 8, 10, 9),
+		.mdiv = REG_VAL(0x18, 0, 8),
+	},
+	[BCM_CYGNUS_AUDIOPLL_CH2] = {
+		.channel = BCM_CYGNUS_AUDIOPLL_CH2,
+		.flags = IPROC_CLK_AON,
+		.enable = ENABLE_VAL(0x1c, 8, 10, 9),
+		.mdiv = REG_VAL(0x1c, 0, 8),
+	},
+};
+
+static void __init cygnus_audiopll_clk_init(struct device_node *node)
+{
+	iproc_pll_clk_setup(node, &audiopll, audiopll_vco_params,
+			    ARRAY_SIZE(audiopll_vco_params), audiopll_clk,
+			    ARRAY_SIZE(audiopll_clk));
+}
+CLK_OF_DECLARE(cygnus_audiopll, "brcm,cygnus-audiopll",
+			cygnus_audiopll_clk_init);
diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
index afd5891..fd492a5 100644
--- a/drivers/clk/bcm/clk-iproc-pll.c
+++ b/drivers/clk/bcm/clk-iproc-pll.c
@@ -25,6 +25,12 @@
 #define PLL_VCO_HIGH_SHIFT 19
 #define PLL_VCO_LOW_SHIFT  30
 
+/*
+ * PLL MACRO_SELECT modes 0 to 5 choose pre-calculated PLL output frequencies
+ * from a look-up table. Mode 7 allows user to manipulate PLL clock dividers
+ */
+#define PLL_USER_MODE 7
+
 /* number of delay loops waiting for PLL to lock */
 #define LOCK_DELAY 100
 
@@ -215,7 +221,10 @@ static void __pll_put_in_reset(struct iproc_pll *pll)
 	const struct iproc_pll_reset_ctrl *reset = &ctrl->reset;
 
 	val = readl(pll->control_base + reset->offset);
-	val &= ~(1 << reset->reset_shift | 1 << reset->p_reset_shift);
+	if (ctrl->flags & IPROC_CLK_PLL_RESET_ACTIVE_LOW)
+		val |= BIT(reset->reset_shift) | BIT(reset->p_reset_shift);
+	else
+		val &= ~(BIT(reset->reset_shift) | BIT(reset->p_reset_shift));
 	iproc_pll_write(pll, pll->control_base, reset->offset, val);
 }
 
@@ -236,7 +245,10 @@ static void __pll_bring_out_reset(struct iproc_pll *pll, unsigned int kp,
 	iproc_pll_write(pll, pll->control_base, dig_filter->offset, val);
 
 	val = readl(pll->control_base + reset->offset);
-	val |= 1 << reset->reset_shift | 1 << reset->p_reset_shift;
+	if (ctrl->flags & IPROC_CLK_PLL_RESET_ACTIVE_LOW)
+		val &= ~(BIT(reset->reset_shift) | BIT(reset->p_reset_shift));
+	else
+		val |= BIT(reset->reset_shift) | BIT(reset->p_reset_shift);
 	iproc_pll_write(pll, pll->control_base, reset->offset, val);
 }
 
@@ -292,6 +304,16 @@ static int pll_set_rate(struct iproc_clk *clk, unsigned int rate_index,
 	/* put PLL in reset */
 	__pll_put_in_reset(pll);
 
+	/* set PLL in user mode before modifying PLL controls */
+	if (ctrl->flags & IPROC_CLK_PLL_USER_MODE_ON) {
+		val = readl(pll->control_base + ctrl->macro_mode.offset);
+		val &= ~(bit_mask(ctrl->macro_mode.width) <<
+			ctrl->macro_mode.shift);
+		val |= PLL_USER_MODE << ctrl->macro_mode.shift;
+		iproc_pll_write(pll, pll->control_base,
+			ctrl->macro_mode.offset, val);
+	}
+
 	iproc_pll_write(pll, pll->control_base, ctrl->vco_ctrl.u_offset, 0);
 
 	val = readl(pll->control_base + ctrl->vco_ctrl.l_offset);
@@ -505,7 +527,10 @@ static unsigned long iproc_clk_recalc_rate(struct clk_hw *hw,
 	if (mdiv == 0)
 		mdiv = 256;
 
-	clk->rate = parent_rate / mdiv;
+	if (ctrl->flags & IPROC_CLK_MCLK_DIV_BY_2)
+		clk->rate = parent_rate / (mdiv * 2);
+	else
+		clk->rate = parent_rate / mdiv;
 
 	return clk->rate;
 }
@@ -543,7 +568,10 @@ static int iproc_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (rate == 0 || parent_rate == 0)
 		return -EINVAL;
 
-	div = DIV_ROUND_UP(parent_rate, rate);
+	if (ctrl->flags & IPROC_CLK_MCLK_DIV_BY_2)
+		div = DIV_ROUND_UP(parent_rate, rate * 2);
+	else
+		div = DIV_ROUND_UP(parent_rate, rate);
 	if (div > 256)
 		return -EINVAL;
 
@@ -555,7 +583,10 @@ static int iproc_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 		val |= div << ctrl->mdiv.shift;
 	}
 	iproc_pll_write(pll, pll->control_base, ctrl->mdiv.offset, val);
-	clk->rate = parent_rate / div;
+	if (ctrl->flags & IPROC_CLK_MCLK_DIV_BY_2)
+		clk->rate = parent_rate / (div * 2);
+	else
+		clk->rate = parent_rate / div;
 
 	return 0;
 }
diff --git a/drivers/clk/bcm/clk-iproc.h b/drivers/clk/bcm/clk-iproc.h
index 8988de7..febae11 100644
--- a/drivers/clk/bcm/clk-iproc.h
+++ b/drivers/clk/bcm/clk-iproc.h
@@ -61,6 +61,26 @@
 #define IPROC_CLK_PLL_SPLIT_STAT_CTRL BIT(6)
 
 /*
+ * Some PLLs have an additional divide by 2 in master clock calculation;
+ * MCLK = VCO_freq / (Mdiv * 2). Identify this to let the driver know
+ * of modified calculations
+ */
+#define IPROC_CLK_MCLK_DIV_BY_2 BIT(7)
+
+/*
+ * Some PLLs provide a look up table for the leaf clock frequencies and
+ * auto calculates VCO frequency parameters based on the provided leaf
+ * clock frequencies. They have a user mode that allows the divider
+ * controls to be determined by the user
+ */
+#define IPROC_CLK_PLL_USER_MODE_ON BIT(8)
+
+/*
+ * Some PLLs have an active low reset
+ */
+#define IPROC_CLK_PLL_RESET_ACTIVE_LOW BIT(9)
+
+/*
  * Parameters for VCO frequency configuration
  *
  * VCO frequency =
@@ -149,6 +169,7 @@ struct iproc_pll_ctrl {
 	struct iproc_clk_reg_op pdiv;
 	struct iproc_pll_vco_ctrl vco_ctrl;
 	struct iproc_clk_reg_op status;
+	struct iproc_clk_reg_op macro_mode;
 };
 
 /*
diff --git a/include/dt-bindings/clock/bcm-cygnus.h b/include/dt-bindings/clock/bcm-cygnus.h
index 32fbc47..62ac5d7 100644
--- a/include/dt-bindings/clock/bcm-cygnus.h
+++ b/include/dt-bindings/clock/bcm-cygnus.h
@@ -65,4 +65,10 @@
 #define BCM_CYGNUS_ASIU_ADC_CLK       1
 #define BCM_CYGNUS_ASIU_PWM_CLK       2
 
+/* AUDIO clock ID */
+#define BCM_CYGNUS_AUDIOPLL           0
+#define BCM_CYGNUS_AUDIOPLL_CH0       1
+#define BCM_CYGNUS_AUDIOPLL_CH1       2
+#define BCM_CYGNUS_AUDIOPLL_CH2       3
+
 #endif /* _CLOCK_BCM_CYGNUS_H */
-- 
1.9.1
