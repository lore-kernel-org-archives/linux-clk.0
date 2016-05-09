Return-Path: <Harvey.Hunt@imgtec.com>
From: Harvey Hunt <harvey.hunt@imgtec.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>
CC: Harvey Hunt <harvey.hunt@imgtec.com>, Paul Burton
	<paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] clk: ingenic: Allow divider value to be divided
Date: Mon, 9 May 2016 17:29:52 +0100
Message-ID: <1462811392-3112-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The JZ4780's MSC clock divider registers multiply the clock divider by 2.
This means that MMC devices run at half their expected speed. Add the
ability to divide the clock divider in order to solve this.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>

Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org> 
Cc: linux-clk@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org 
---

v1 -> v2:
    - Replace right shift with division
    - Update commit title
    - Correctly update HDMI CDR

v1 can be found here:

https://lkml.org/lkml/2015/12/24/68

 drivers/clk/ingenic/cgu.c        | 11 ++++++++++-
 drivers/clk/ingenic/cgu.h        |  6 +++++-
 drivers/clk/ingenic/jz4740-cgu.c | 24 ++++++++++++------------
 drivers/clk/ingenic/jz4780-cgu.c | 40 ++++++++++++++++++++--------------------
 4 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 7cfb7b2..e8248f9 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -325,6 +325,7 @@ ingenic_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 		div = (div_reg >> clk_info->div.shift) &
 		      GENMASK(clk_info->div.bits - 1, 0);
 		div += 1;
+		div *= clk_info->div.div;
 
 		rate /= div;
 	}
@@ -345,6 +346,14 @@ ingenic_clk_calc_div(const struct ingenic_cgu_clk_info *clk_info,
 	div = min_t(unsigned, div, 1 << clk_info->div.bits);
 	div = max_t(unsigned, div, 1);
 
+	/*
+	 * If the divider value itself must be divided before being written to
+	 * the divider register, we must ensure we don't have any bits set that
+	 * would be lost as a result of doing so.
+	 */
+	div /= clk_info->div.div;
+	div *= clk_info->div.div;
+
 	return div;
 }
 
@@ -395,7 +404,7 @@ ingenic_clk_set_rate(struct clk_hw *hw, unsigned long req_rate,
 		/* update the divide */
 		mask = GENMASK(clk_info->div.bits - 1, 0);
 		reg &= ~(mask << clk_info->div.shift);
-		reg |= (div - 1) << clk_info->div.shift;
+		reg |= ((div / clk_info->div.div) - 1) << clk_info->div.shift;
 
 		/* clear the stop bit */
 		if (clk_info->div.stop_bit != -1)
diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index 99347e2..09700b2 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -76,8 +76,11 @@ struct ingenic_cgu_mux_info {
 /**
  * struct ingenic_cgu_div_info - information about a divider
  * @reg: offset of the divider control register within the CGU
- * @shift: number of bits to shift the divide value by (ie. the index of
+ * @shift: number of bits to left shift the divide value by (ie. the index of
  *         the lowest bit of the divide value within its control register)
+ * @div: number of bits to divide the divider value by (i.e. if the
+ *	 effective divider value is the value written to the register
+ *	 multiplied by some constant)
  * @bits: the size of the divide value in bits
  * @ce_bit: the index of the change enable bit within reg, or -1 if there
  *          isn't one
@@ -87,6 +90,7 @@ struct ingenic_cgu_mux_info {
 struct ingenic_cgu_div_info {
 	unsigned reg;
 	u8 shift;
+	u8 div;
 	u8 bits;
 	s8 ce_bit;
 	s8 busy_bit;
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index 305a26c2..510fe7e 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -90,51 +90,51 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 	[JZ4740_CLK_PLL_HALF] = {
 		"pll half", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
-		.div = { CGU_REG_CPCCR, 21, 1, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 21, 1, 1, -1, -1, -1 },
 	},
 
 	[JZ4740_CLK_CCLK] = {
 		"cclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
-		.div = { CGU_REG_CPCCR, 0, 4, 22, -1, -1 },
+		.div = { CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1 },
 	},
 
 	[JZ4740_CLK_HCLK] = {
 		"hclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
-		.div = { CGU_REG_CPCCR, 4, 4, 22, -1, -1 },
+		.div = { CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1 },
 	},
 
 	[JZ4740_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
-		.div = { CGU_REG_CPCCR, 8, 4, 22, -1, -1 },
+		.div = { CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1 },
 	},
 
 	[JZ4740_CLK_MCLK] = {
 		"mclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
-		.div = { CGU_REG_CPCCR, 12, 4, 22, -1, -1 },
+		.div = { CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1 },
 	},
 
 	[JZ4740_CLK_LCD] = {
 		"lcd", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
-		.div = { CGU_REG_CPCCR, 16, 5, 22, -1, -1 },
+		.div = { CGU_REG_CPCCR, 16, 1, 5, 22, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 10 },
 	},
 
 	[JZ4740_CLK_LCD_PCLK] = {
 		"lcd_pclk", CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
-		.div = { CGU_REG_LPCDR, 0, 11, -1, -1, -1 },
+		.div = { CGU_REG_LPCDR, 0, 1, 11, -1, -1, -1 },
 	},
 
 	[JZ4740_CLK_I2S] = {
 		"i2s", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL_HALF, -1, -1 },
 		.mux = { CGU_REG_CPCCR, 31, 1 },
-		.div = { CGU_REG_I2SCDR, 0, 8, -1, -1, -1 },
+		.div = { CGU_REG_I2SCDR, 0, 1, 8, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 6 },
 	},
 
@@ -142,21 +142,21 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"spi", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL, -1, -1 },
 		.mux = { CGU_REG_SSICDR, 31, 1 },
-		.div = { CGU_REG_SSICDR, 0, 4, -1, -1, -1 },
+		.div = { CGU_REG_SSICDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 4 },
 	},
 
 	[JZ4740_CLK_MMC] = {
 		"mmc", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
-		.div = { CGU_REG_MSCCDR, 0, 5, -1, -1, -1 },
+		.div = { CGU_REG_MSCCDR, 0, 1, 5, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 7 },
 	},
 
 	[JZ4740_CLK_UHC] = {
 		"uhc", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
-		.div = { CGU_REG_UHCCDR, 0, 4, -1, -1, -1 },
+		.div = { CGU_REG_UHCCDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 14 },
 	},
 
@@ -164,7 +164,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"udc", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL_HALF, -1, -1 },
 		.mux = { CGU_REG_CPCCR, 29, 1 },
-		.div = { CGU_REG_CPCCR, 23, 6, -1, -1, -1 },
+		.div = { CGU_REG_CPCCR, 23, 1, 6, -1, -1, -1 },
 		.gate = { CGU_REG_SCR, 6 },
 	},
 
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 431f962..b35d6d9 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -296,13 +296,13 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 	[JZ4780_CLK_CPU] = {
 		"cpu", CGU_CLK_DIV,
 		.parents = { JZ4780_CLK_CPUMUX, -1, -1, -1 },
-		.div = { CGU_REG_CLOCKCONTROL, 0, 4, 22, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 0, 1, 4, 22, -1, -1 },
 	},
 
 	[JZ4780_CLK_L2CACHE] = {
 		"l2cache", CGU_CLK_DIV,
 		.parents = { JZ4780_CLK_CPUMUX, -1, -1, -1 },
-		.div = { CGU_REG_CLOCKCONTROL, 4, 4, -1, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 4, 1, 4, -1, -1, -1 },
 	},
 
 	[JZ4780_CLK_AHB0] = {
@@ -310,7 +310,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_EPLL },
 		.mux = { CGU_REG_CLOCKCONTROL, 26, 2 },
-		.div = { CGU_REG_CLOCKCONTROL, 8, 4, 21, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 8, 1, 4, 21, -1, -1 },
 	},
 
 	[JZ4780_CLK_AHB2PMUX] = {
@@ -323,20 +323,20 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 	[JZ4780_CLK_AHB2] = {
 		"ahb2", CGU_CLK_DIV,
 		.parents = { JZ4780_CLK_AHB2PMUX, -1, -1, -1 },
-		.div = { CGU_REG_CLOCKCONTROL, 12, 4, 20, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 12, 1, 4, 20, -1, -1 },
 	},
 
 	[JZ4780_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV,
 		.parents = { JZ4780_CLK_AHB2PMUX, -1, -1, -1 },
-		.div = { CGU_REG_CLOCKCONTROL, 16, 4, 20, -1, -1 },
+		.div = { CGU_REG_CLOCKCONTROL, 16, 1, 4, 20, -1, -1 },
 	},
 
 	[JZ4780_CLK_DDR] = {
 		"ddr", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1 },
 		.mux = { CGU_REG_DDRCDR, 30, 2 },
-		.div = { CGU_REG_DDRCDR, 0, 4, 29, 28, 27 },
+		.div = { CGU_REG_DDRCDR, 0, 1, 4, 29, 28, 27 },
 	},
 
 	[JZ4780_CLK_VPU] = {
@@ -344,7 +344,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_EPLL, -1 },
 		.mux = { CGU_REG_VPUCDR, 30, 2 },
-		.div = { CGU_REG_VPUCDR, 0, 4, 29, 28, 27 },
+		.div = { CGU_REG_VPUCDR, 0, 1, 4, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR1, 2 },
 	},
 
@@ -352,7 +352,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		"i2s_pll", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_EPLL, -1, -1 },
 		.mux = { CGU_REG_I2SCDR, 30, 1 },
-		.div = { CGU_REG_I2SCDR, 0, 8, 29, 28, 27 },
+		.div = { CGU_REG_I2SCDR, 0, 1, 8, 29, 28, 27 },
 	},
 
 	[JZ4780_CLK_I2S] = {
@@ -366,7 +366,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_VPLL, -1 },
 		.mux = { CGU_REG_LP0CDR, 30, 2 },
-		.div = { CGU_REG_LP0CDR, 0, 8, 28, 27, 26 },
+		.div = { CGU_REG_LP0CDR, 0, 1, 8, 28, 27, 26 },
 	},
 
 	[JZ4780_CLK_LCD1PIXCLK] = {
@@ -374,7 +374,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_VPLL, -1 },
 		.mux = { CGU_REG_LP1CDR, 30, 2 },
-		.div = { CGU_REG_LP1CDR, 0, 8, 28, 27, 26 },
+		.div = { CGU_REG_LP1CDR, 0, 1, 8, 28, 27, 26 },
 	},
 
 	[JZ4780_CLK_MSCMUX] = {
@@ -386,21 +386,21 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 	[JZ4780_CLK_MSC0] = {
 		"msc0", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4780_CLK_MSCMUX, -1, -1, -1 },
-		.div = { CGU_REG_MSC0CDR, 0, 8, 29, 28, 27 },
+		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 3 },
 	},
 
 	[JZ4780_CLK_MSC1] = {
 		"msc1", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4780_CLK_MSCMUX, -1, -1, -1 },
-		.div = { CGU_REG_MSC1CDR, 0, 8, 29, 28, 27 },
+		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 11 },
 	},
 
 	[JZ4780_CLK_MSC2] = {
 		"msc2", CGU_CLK_DIV | CGU_CLK_GATE,
 		.parents = { JZ4780_CLK_MSCMUX, -1, -1, -1 },
-		.div = { CGU_REG_MSC2CDR, 0, 8, 29, 28, 27 },
+		.div = { CGU_REG_MSC2CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 12 },
 	},
 
@@ -409,7 +409,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_EPLL, JZ4780_CLK_OTGPHY },
 		.mux = { CGU_REG_UHCCDR, 30, 2 },
-		.div = { CGU_REG_UHCCDR, 0, 8, 29, 28, 27 },
+		.div = { CGU_REG_UHCCDR, 0, 1, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 24 },
 	},
 
@@ -417,7 +417,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1, -1 },
 		.mux = { CGU_REG_SSICDR, 30, 1 },
-		.div = { CGU_REG_SSICDR, 0, 8, 29, 28, 27 },
+		.div = { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
 	},
 
 	[JZ4780_CLK_SSI] = {
@@ -430,7 +430,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		"cim_mclk", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1, -1 },
 		.mux = { CGU_REG_CIMCDR, 31, 1 },
-		.div = { CGU_REG_CIMCDR, 0, 8, 30, 29, 28 },
+		.div = { CGU_REG_CIMCDR, 0, 1, 8, 30, 29, 28 },
 	},
 
 	[JZ4780_CLK_PCMPLL] = {
@@ -438,7 +438,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_EPLL, JZ4780_CLK_VPLL },
 		.mux = { CGU_REG_PCMCDR, 29, 2 },
-		.div = { CGU_REG_PCMCDR, 0, 8, 28, 27, 26 },
+		.div = { CGU_REG_PCMCDR, 0, 1, 8, 28, 27, 26 },
 	},
 
 	[JZ4780_CLK_PCM] = {
@@ -453,7 +453,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_EPLL },
 		.mux = { CGU_REG_GPUCDR, 30, 2 },
-		.div = { CGU_REG_GPUCDR, 0, 4, 29, 28, 27 },
+		.div = { CGU_REG_GPUCDR, 0, 1, 4, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR1, 4 },
 	},
 
@@ -462,7 +462,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_VPLL, -1 },
 		.mux = { CGU_REG_HDMICDR, 30, 2 },
-		.div = { CGU_REG_HDMICDR, 0, 8, 29, 28, 26 },
+		.div = { CGU_REG_HDMICDR, 0, 1, 8, 29, 28, 26 },
 		.gate = { CGU_REG_CLKGR1, 9 },
 	},
 
@@ -471,7 +471,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 		.parents = { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
 			     JZ4780_CLK_EPLL },
 		.mux = { CGU_REG_BCHCDR, 30, 2 },
-		.div = { CGU_REG_BCHCDR, 0, 4, 29, 28, 27 },
+		.div = { CGU_REG_BCHCDR, 0, 1, 4, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 1 },
 	},
 
-- 
2.8.0
