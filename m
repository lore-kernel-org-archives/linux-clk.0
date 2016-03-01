Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 13/41] clk: samsung: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:58 -0800
Message-Id: <1456858826-28541-14-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/samsung/clk-exynos4.c    | 12 +++---
 drivers/clk/samsung/clk-exynos4415.c |  2 +-
 drivers/clk/samsung/clk-exynos5250.c | 10 ++---
 drivers/clk/samsung/clk-exynos5260.c | 36 ++++++++----------
 drivers/clk/samsung/clk-exynos5420.c | 12 +++---
 drivers/clk/samsung/clk-exynos5433.c | 74 +++++++++++++++++-------------------
 drivers/clk/samsung/clk-exynos5440.c | 12 +++---
 drivers/clk/samsung/clk-exynos7.c    | 12 +++---
 drivers/clk/samsung/clk-s3c2410.c    |  2 +-
 drivers/clk/samsung/clk-s3c2412.c    |  4 +-
 drivers/clk/samsung/clk-s3c2443.c    |  8 ++--
 drivers/clk/samsung/clk-s3c64xx.c    |  8 ++--
 drivers/clk/samsung/clk-s5pv210.c    | 10 ++---
 13 files changed, 95 insertions(+), 107 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index ac03e4fe2871..7b3d0f975987 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -500,19 +500,19 @@ PNAME(clkout_cpu_p4x12) = { "fout_apll_div_2", "none", "none", "none",
 
 /* fixed rate clocks generated outside the soc */
 static struct samsung_fixed_rate_clock exynos4_fixed_rate_ext_clks[] __initdata = {
-	FRATE(CLK_XXTI, "xxti", NULL, CLK_IS_ROOT, 0),
-	FRATE(CLK_XUSBXTI, "xusbxti", NULL, CLK_IS_ROOT, 0),
+	FRATE(CLK_XXTI, "xxti", NULL, 0, 0),
+	FRATE(CLK_XUSBXTI, "xusbxti", NULL, 0, 0),
 };
 
 /* fixed rate clocks generated inside the soc */
 static struct samsung_fixed_rate_clock exynos4_fixed_rate_clks[] __initdata = {
-	FRATE(0, "sclk_hdmi24m", NULL, CLK_IS_ROOT, 24000000),
+	FRATE(0, "sclk_hdmi24m", NULL, 0, 24000000),
 	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", "hdmi", 0, 27000000),
-	FRATE(0, "sclk_usbphy0", NULL, CLK_IS_ROOT, 48000000),
+	FRATE(0, "sclk_usbphy0", NULL, 0, 48000000),
 };
 
 static struct samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata = {
-	FRATE(0, "sclk_usbphy1", NULL, CLK_IS_ROOT, 48000000),
+	FRATE(0, "sclk_usbphy1", NULL, 0, 48000000),
 };
 
 static struct samsung_fixed_factor_clock exynos4_fixed_factor_clks[] __initdata = {
@@ -1251,7 +1251,7 @@ static void __init exynos4_clk_register_finpll(struct samsung_clk_provider *ctx)
 	fclk.id = CLK_FIN_PLL;
 	fclk.name = "fin_pll";
 	fclk.parent_name = NULL;
-	fclk.flags = CLK_IS_ROOT;
+	fclk.flags = 0;
 	fclk.fixed_rate = finpll_f;
 	samsung_clk_register_fixed_rate(ctx, &fclk, 1);
 
diff --git a/drivers/clk/samsung/clk-exynos4415.c b/drivers/clk/samsung/clk-exynos4415.c
index 92c39f6efec8..86ee06b226bd 100644
--- a/drivers/clk/samsung/clk-exynos4415.c
+++ b/drivers/clk/samsung/clk-exynos4415.c
@@ -274,7 +274,7 @@ static struct samsung_fixed_factor_clock exynos4415_fixed_factor_clks[] __initda
 };
 
 static struct samsung_fixed_rate_clock exynos4415_fixed_rate_clks[] __initdata = {
-	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 27000000),
+	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, 0, 27000000),
 };
 
 static struct samsung_mux_clock exynos4415_mux_clks[] __initdata = {
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 5bebf8cb0d70..837197db4ffb 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -262,15 +262,15 @@ PNAME(mout_spdif_p)	= { "sclk_audio0", "sclk_audio1", "sclk_audio2",
 
 /* fixed rate clocks generated outside the soc */
 static struct samsung_fixed_rate_clock exynos5250_fixed_rate_ext_clks[] __initdata = {
-	FRATE(CLK_FIN_PLL, "fin_pll", NULL, CLK_IS_ROOT, 0),
+	FRATE(CLK_FIN_PLL, "fin_pll", NULL, 0, 0),
 };
 
 /* fixed rate clocks generated inside the soc */
 static struct samsung_fixed_rate_clock exynos5250_fixed_rate_clks[] __initdata = {
-	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
-	FRATE(0, "sclk_hdmi27m", NULL, CLK_IS_ROOT, 27000000),
-	FRATE(0, "sclk_dptxphy", NULL, CLK_IS_ROOT, 24000000),
-	FRATE(0, "sclk_uhostphy", NULL, CLK_IS_ROOT, 48000000),
+	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, 0, 24000000),
+	FRATE(0, "sclk_hdmi27m", NULL, 0, 27000000),
+	FRATE(0, "sclk_dptxphy", NULL, 0, 24000000),
+	FRATE(0, "sclk_uhostphy", NULL, 0, 48000000),
 };
 
 static struct samsung_fixed_factor_clock exynos5250_fixed_factor_clks[] __initdata = {
diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index d1a29f6c1084..7a7ed075a573 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -1432,42 +1432,38 @@ static unsigned long top_clk_regs[] __initdata = {
 /* fixed rate clocks generated inside the soc */
 static struct samsung_fixed_rate_clock fixed_rate_clks[] __initdata = {
 	FRATE(PHYCLK_DPTX_PHY_CH3_TXD_CLK, "phyclk_dptx_phy_ch3_txd_clk", NULL,
-			CLK_IS_ROOT, 270000000),
+			0, 270000000),
 	FRATE(PHYCLK_DPTX_PHY_CH2_TXD_CLK, "phyclk_dptx_phy_ch2_txd_clk", NULL,
-			CLK_IS_ROOT, 270000000),
+			0, 270000000),
 	FRATE(PHYCLK_DPTX_PHY_CH1_TXD_CLK, "phyclk_dptx_phy_ch1_txd_clk", NULL,
-			CLK_IS_ROOT, 270000000),
+			0, 270000000),
 	FRATE(PHYCLK_DPTX_PHY_CH0_TXD_CLK, "phyclk_dptx_phy_ch0_txd_clk", NULL,
-			CLK_IS_ROOT, 270000000),
+			0, 270000000),
 	FRATE(phyclk_hdmi_phy_tmds_clko, "phyclk_hdmi_phy_tmds_clko", NULL,
-			CLK_IS_ROOT, 250000000),
+			0, 250000000),
 	FRATE(PHYCLK_HDMI_PHY_PIXEL_CLKO, "phyclk_hdmi_phy_pixel_clko", NULL,
-			CLK_IS_ROOT, 1660000000),
+			0, 1660000000),
 	FRATE(PHYCLK_HDMI_LINK_O_TMDS_CLKHI, "phyclk_hdmi_link_o_tmds_clkhi",
-			NULL, CLK_IS_ROOT, 125000000),
+			NULL, 0, 125000000),
 	FRATE(PHYCLK_MIPI_DPHY_4L_M_TXBYTECLKHS,
 			"phyclk_mipi_dphy_4l_m_txbyte_clkhs" , NULL,
-			CLK_IS_ROOT, 187500000),
+			0, 187500000),
 	FRATE(PHYCLK_DPTX_PHY_O_REF_CLK_24M, "phyclk_dptx_phy_o_ref_clk_24m",
-			NULL, CLK_IS_ROOT, 24000000),
+			NULL, 0, 24000000),
 	FRATE(PHYCLK_DPTX_PHY_CLK_DIV2, "phyclk_dptx_phy_clk_div2", NULL,
-			CLK_IS_ROOT, 135000000),
+			0, 135000000),
 	FRATE(PHYCLK_MIPI_DPHY_4L_M_RXCLKESC0,
-			"phyclk_mipi_dphy_4l_m_rxclkesc0", NULL,
-			CLK_IS_ROOT, 20000000),
+			"phyclk_mipi_dphy_4l_m_rxclkesc0", NULL, 0, 20000000),
 	FRATE(PHYCLK_USBHOST20_PHY_PHYCLOCK, "phyclk_usbhost20_phy_phyclock",
-			NULL, CLK_IS_ROOT, 60000000),
+			NULL, 0, 60000000),
 	FRATE(PHYCLK_USBHOST20_PHY_FREECLK, "phyclk_usbhost20_phy_freeclk",
-			NULL, CLK_IS_ROOT, 60000000),
+			NULL, 0, 60000000),
 	FRATE(PHYCLK_USBHOST20_PHY_CLK48MOHCI,
-			"phyclk_usbhost20_phy_clk48mohci",
-			NULL, CLK_IS_ROOT, 48000000),
+			"phyclk_usbhost20_phy_clk48mohci", NULL, 0, 48000000),
 	FRATE(PHYCLK_USBDRD30_UDRD30_PIPE_PCLK,
-			"phyclk_usbdrd30_udrd30_pipe_pclk", NULL,
-			CLK_IS_ROOT, 125000000),
+			"phyclk_usbdrd30_udrd30_pipe_pclk", NULL, 0, 125000000),
 	FRATE(PHYCLK_USBDRD30_UDRD30_PHYCLOCK,
-			"phyclk_usbdrd30_udrd30_phyclock", NULL,
-			CLK_IS_ROOT, 60000000),
+			"phyclk_usbdrd30_udrd30_phyclock", NULL, 0, 60000000),
 };
 
 PNAME(mout_memtop_pll_user_p) = {"fin_pll", "dout_mem_pll"};
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index d048dedd8b72..be03ed0fcb6b 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -480,16 +480,16 @@ PNAME(mout_group15_5800_p)	= { "dout_osc_div", "mout_sw_aclk550_cam" };
 /* fixed rate clocks generated outside the soc */
 static struct samsung_fixed_rate_clock
 		exynos5x_fixed_rate_ext_clks[] __initdata = {
-	FRATE(CLK_FIN_PLL, "fin_pll", NULL, CLK_IS_ROOT, 0),
+	FRATE(CLK_FIN_PLL, "fin_pll", NULL, 0, 0),
 };
 
 /* fixed rate clocks generated inside the soc */
 static struct samsung_fixed_rate_clock exynos5x_fixed_rate_clks[] __initdata = {
-	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
-	FRATE(0, "sclk_pwi", NULL, CLK_IS_ROOT, 24000000),
-	FRATE(0, "sclk_usbh20", NULL, CLK_IS_ROOT, 48000000),
-	FRATE(0, "mphy_refclk_ixtal24", NULL, CLK_IS_ROOT, 48000000),
-	FRATE(0, "sclk_usbh20_scan_clk", NULL, CLK_IS_ROOT, 480000000),
+	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, 0, 24000000),
+	FRATE(0, "sclk_pwi", NULL, 0, 24000000),
+	FRATE(0, "sclk_usbh20", NULL, 0, 48000000),
+	FRATE(0, "mphy_refclk_ixtal24", NULL, 0, 48000000),
+	FRATE(0, "sclk_usbh20_scan_clk", NULL, 0, 480000000),
 };
 
 static struct samsung_fixed_factor_clock
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 707a814dd6e1..128527b8fbeb 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -224,18 +224,18 @@ static struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initdata = {
 
 static struct samsung_fixed_rate_clock top_fixed_clks[] __initdata = {
 	/* Xi2s{0|1}CDCLK input clock for I2S/PCM */
-	FRATE(0, "ioclk_audiocdclk1", NULL, CLK_IS_ROOT, 100000000),
-	FRATE(0, "ioclk_audiocdclk0", NULL, CLK_IS_ROOT, 100000000),
+	FRATE(0, "ioclk_audiocdclk1", NULL, 0, 100000000),
+	FRATE(0, "ioclk_audiocdclk0", NULL, 0, 100000000),
 	/* Xi2s1SDI input clock for SPDIF */
-	FRATE(0, "ioclk_spdif_extclk", NULL, CLK_IS_ROOT, 100000000),
+	FRATE(0, "ioclk_spdif_extclk", NULL, 0, 100000000),
 	/* XspiCLK[4:0] input clock for SPI */
-	FRATE(0, "ioclk_spi4_clk_in", NULL, CLK_IS_ROOT, 50000000),
-	FRATE(0, "ioclk_spi3_clk_in", NULL, CLK_IS_ROOT, 50000000),
-	FRATE(0, "ioclk_spi2_clk_in", NULL, CLK_IS_ROOT, 50000000),
-	FRATE(0, "ioclk_spi1_clk_in", NULL, CLK_IS_ROOT, 50000000),
-	FRATE(0, "ioclk_spi0_clk_in", NULL, CLK_IS_ROOT, 50000000),
+	FRATE(0, "ioclk_spi4_clk_in", NULL, 0, 50000000),
+	FRATE(0, "ioclk_spi3_clk_in", NULL, 0, 50000000),
+	FRATE(0, "ioclk_spi2_clk_in", NULL, 0, 50000000),
+	FRATE(0, "ioclk_spi1_clk_in", NULL, 0, 50000000),
+	FRATE(0, "ioclk_spi0_clk_in", NULL, 0, 50000000),
 	/* Xi2s1SCLK input clock for I2S1_BCLK */
-	FRATE(0, "ioclk_i2s1_bclk_in", NULL, CLK_IS_ROOT, 12288000),
+	FRATE(0, "ioclk_i2s1_bclk_in", NULL, 0, 12288000),
 };
 
 static struct samsung_mux_clock top_mux_clks[] __initdata = {
@@ -1984,42 +1984,40 @@ static struct samsung_fixed_rate_clock fsys_fixed_clks[] __initdata = {
 	/* PHY clocks from USBDRD30_PHY */
 	FRATE(CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY,
 			"phyclk_usbdrd30_udrd30_phyclock_phy", NULL,
-			CLK_IS_ROOT, 60000000),
+			0, 60000000),
 	FRATE(CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY,
 			"phyclk_usbdrd30_udrd30_pipe_pclk_phy", NULL,
-			CLK_IS_ROOT, 125000000),
+			0, 125000000),
 	/* PHY clocks from USBHOST30_PHY */
 	FRATE(CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK_PHY,
 			"phyclk_usbhost30_uhost30_phyclock_phy", NULL,
-			CLK_IS_ROOT, 60000000),
+			0, 60000000),
 	FRATE(CLK_PHYCLK_USBHOST30_UHOST30_PIPE_PCLK_PHY,
 			"phyclk_usbhost30_uhost30_pipe_pclk_phy", NULL,
-			CLK_IS_ROOT, 125000000),
+			0, 125000000),
 	/* PHY clocks from USBHOST20_PHY */
 	FRATE(CLK_PHYCLK_USBHOST20_PHY_FREECLK_PHY,
-			"phyclk_usbhost20_phy_freeclk_phy", NULL, CLK_IS_ROOT,
-			60000000),
+			"phyclk_usbhost20_phy_freeclk_phy", NULL, 0, 60000000),
 	FRATE(CLK_PHYCLK_USBHOST20_PHY_PHYCLOCK_PHY,
-			"phyclk_usbhost20_phy_phyclock_phy", NULL, CLK_IS_ROOT,
-			60000000),
+			"phyclk_usbhost20_phy_phyclock_phy", NULL, 0, 60000000),
 	FRATE(CLK_PHYCLK_USBHOST20_PHY_CLK48MOHCI_PHY,
 			"phyclk_usbhost20_phy_clk48mohci_phy", NULL,
-			CLK_IS_ROOT, 48000000),
+			0, 48000000),
 	FRATE(CLK_PHYCLK_USBHOST20_PHY_HSIC1_PHY,
-			"phyclk_usbhost20_phy_hsic1_phy", NULL, CLK_IS_ROOT,
+			"phyclk_usbhost20_phy_hsic1_phy", NULL, 0,
 			60000000),
 	/* PHY clocks from UFS_PHY */
 	FRATE(CLK_PHYCLK_UFS_TX0_SYMBOL_PHY, "phyclk_ufs_tx0_symbol_phy",
-			NULL, CLK_IS_ROOT, 300000000),
+			NULL, 0, 300000000),
 	FRATE(CLK_PHYCLK_UFS_RX0_SYMBOL_PHY, "phyclk_ufs_rx0_symbol_phy",
-			NULL, CLK_IS_ROOT, 300000000),
+			NULL, 0, 300000000),
 	FRATE(CLK_PHYCLK_UFS_TX1_SYMBOL_PHY, "phyclk_ufs_tx1_symbol_phy",
-			NULL, CLK_IS_ROOT, 300000000),
+			NULL, 0, 300000000),
 	FRATE(CLK_PHYCLK_UFS_RX1_SYMBOL_PHY, "phyclk_ufs_rx1_symbol_phy",
-			NULL, CLK_IS_ROOT, 300000000),
+			NULL, 0, 300000000),
 	/* PHY clocks from LLI_PHY */
 	FRATE(CLK_PHYCLK_LLI_MPHY_TO_UFS_PHY, "phyclk_lli_mphy_to_ufs_phy",
-			NULL, CLK_IS_ROOT, 26000000),
+			NULL, 0, 26000000),
 };
 
 static struct samsung_mux_clock fsys_mux_clks[] __initdata = {
@@ -2548,20 +2546,16 @@ static struct samsung_fixed_factor_clock disp_fixed_factor_clks[] __initdata = {
 
 static struct samsung_fixed_rate_clock disp_fixed_clks[] __initdata = {
 	/* PHY clocks from MIPI_DPHY1 */
-	FRATE(0, "phyclk_mipidphy1_bitclkdiv8_phy", NULL, CLK_IS_ROOT,
-			188000000),
-	FRATE(0, "phyclk_mipidphy1_rxclkesc0_phy", NULL, CLK_IS_ROOT,
-			100000000),
+	FRATE(0, "phyclk_mipidphy1_bitclkdiv8_phy", NULL, 0, 188000000),
+	FRATE(0, "phyclk_mipidphy1_rxclkesc0_phy", NULL, 0, 100000000),
 	/* PHY clocks from MIPI_DPHY0 */
-	FRATE(0, "phyclk_mipidphy0_bitclkdiv8_phy", NULL, CLK_IS_ROOT,
-			188000000),
-	FRATE(0, "phyclk_mipidphy0_rxclkesc0_phy", NULL, CLK_IS_ROOT,
-			100000000),
+	FRATE(0, "phyclk_mipidphy0_bitclkdiv8_phy", NULL, 0, 188000000),
+	FRATE(0, "phyclk_mipidphy0_rxclkesc0_phy", NULL, 0, 100000000),
 	/* PHY clocks from HDMI_PHY */
 	FRATE(CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY, "phyclk_hdmiphy_tmds_clko_phy",
-			NULL, CLK_IS_ROOT, 300000000),
+			NULL, 0, 300000000),
 	FRATE(CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY, "phyclk_hdmiphy_pixel_clko_phy",
-			NULL, CLK_IS_ROOT, 166000000),
+			NULL, 0, 166000000),
 };
 
 static struct samsung_mux_clock disp_mux_clks[] __initdata = {
@@ -2882,9 +2876,9 @@ PNAME(mout_aud_pll_user_aud_p)	= { "oscclk", "fout_aud_pll", };
 PNAME(mout_sclk_aud_pcm_p)	= { "mout_aud_pll_user", "ioclk_audiocdclk0",};
 
 static struct samsung_fixed_rate_clock aud_fixed_clks[] __initdata = {
-	FRATE(0, "ioclk_jtag_tclk", NULL, CLK_IS_ROOT, 33000000),
-	FRATE(0, "ioclk_slimbus_clk", NULL, CLK_IS_ROOT, 25000000),
-	FRATE(0, "ioclk_i2s_bclk", NULL, CLK_IS_ROOT, 50000000),
+	FRATE(0, "ioclk_jtag_tclk", NULL, 0, 33000000),
+	FRATE(0, "ioclk_slimbus_clk", NULL, 0, 25000000),
+	FRATE(0, "ioclk_i2s_bclk", NULL, 0, 50000000),
 };
 
 static struct samsung_mux_clock aud_mux_clks[] __initdata = {
@@ -4596,9 +4590,9 @@ PNAME(mout_sclk_pixelasync_lite_c_init_a_p) = {
 
 static struct samsung_fixed_rate_clock cam0_fixed_clks[] __initdata = {
 	FRATE(CLK_PHYCLK_RXBYTEECLKHS0_S4_PHY, "phyclk_rxbyteclkhs0_s4_phy",
-			NULL, CLK_IS_ROOT, 100000000),
+			NULL, 0, 100000000),
 	FRATE(CLK_PHYCLK_RXBYTEECLKHS0_S2A_PHY, "phyclk_rxbyteclkhs0_s2a_phy",
-			NULL, CLK_IS_ROOT, 100000000),
+			NULL, 0, 100000000),
 };
 
 static struct samsung_mux_clock cam0_mux_clks[] __initdata = {
@@ -5024,7 +5018,7 @@ PNAME(mout_aclk_lite_c_a_p)		= { "mout_aclk_cam1_552_user",
 
 static struct samsung_fixed_rate_clock cam1_fixed_clks[] __initdata = {
 	FRATE(CLK_PHYCLK_RXBYTEECLKHS0_S2B, "phyclk_rxbyteclkhs0_s2b_phy", NULL,
-			CLK_IS_ROOT, 100000000),
+			0, 100000000),
 };
 
 static struct samsung_mux_clock cam1_mux_clks[] __initdata = {
diff --git a/drivers/clk/samsung/clk-exynos5440.c b/drivers/clk/samsung/clk-exynos5440.c
index 590813871ffe..c57cff1e1798 100644
--- a/drivers/clk/samsung/clk-exynos5440.c
+++ b/drivers/clk/samsung/clk-exynos5440.c
@@ -31,16 +31,16 @@ PNAME(mout_spi_p)	= { "div125", "div200" };
 
 /* fixed rate clocks generated outside the soc */
 static struct samsung_fixed_rate_clock exynos5440_fixed_rate_ext_clks[] __initdata = {
-	FRATE(0, "xtal", NULL, CLK_IS_ROOT, 0),
+	FRATE(0, "xtal", NULL, 0, 0),
 };
 
 /* fixed rate clocks */
 static struct samsung_fixed_rate_clock exynos5440_fixed_rate_clks[] __initdata = {
-	FRATE(0, "ppll", NULL, CLK_IS_ROOT, 1000000000),
-	FRATE(0, "usb_phy0", NULL, CLK_IS_ROOT, 60000000),
-	FRATE(0, "usb_phy1", NULL, CLK_IS_ROOT, 60000000),
-	FRATE(0, "usb_ohci12", NULL, CLK_IS_ROOT, 12000000),
-	FRATE(0, "usb_ohci48", NULL, CLK_IS_ROOT, 48000000),
+	FRATE(0, "ppll", NULL, 0, 1000000000),
+	FRATE(0, "usb_phy0", NULL, 0, 60000000),
+	FRATE(0, "usb_phy1", NULL, 0, 60000000),
+	FRATE(0, "usb_ohci12", NULL, 0, 12000000),
+	FRATE(0, "usb_ohci48", NULL, 0, 48000000),
 };
 
 /* fixed factor clocks */
diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 55f8e2e24ab8..ad68d463b12c 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -894,10 +894,8 @@ PNAME(mout_phyclk_usbdrd300_udrd30_pipe_pclk_user_p)	= { "fin_pll",
 
 /* fixed rate clocks used in the FSYS0 block */
 static struct samsung_fixed_rate_clock fixed_rate_clks_fsys0[] __initdata = {
-	FRATE(0, "phyclk_usbdrd300_udrd30_phyclock", NULL,
-		CLK_IS_ROOT, 60000000),
-	FRATE(0, "phyclk_usbdrd300_udrd30_pipe_pclk", NULL,
-		CLK_IS_ROOT, 125000000),
+	FRATE(0, "phyclk_usbdrd300_udrd30_phyclock", NULL, 0, 60000000),
+	FRATE(0, "phyclk_usbdrd300_udrd30_pipe_pclk", NULL, 0, 125000000),
 };
 
 static unsigned long fsys0_clk_regs[] __initdata = {
@@ -1009,11 +1007,11 @@ PNAME(mout_phyclk_ufs20_rx1_user_p) = { "fin_pll", "phyclk_ufs20_rx1_symbol" };
 /* fixed rate clocks used in the FSYS1 block */
 static struct samsung_fixed_rate_clock fixed_rate_clks_fsys1[] __initdata = {
 	FRATE(PHYCLK_UFS20_TX0_SYMBOL, "phyclk_ufs20_tx0_symbol", NULL,
-			CLK_IS_ROOT, 300000000),
+			0, 300000000),
 	FRATE(PHYCLK_UFS20_RX0_SYMBOL, "phyclk_ufs20_rx0_symbol", NULL,
-			CLK_IS_ROOT, 300000000),
+			0, 300000000),
 	FRATE(PHYCLK_UFS20_RX1_SYMBOL, "phyclk_ufs20_rx1_symbol", NULL,
-			CLK_IS_ROOT, 300000000),
+			0, 300000000),
 };
 
 static unsigned long fsys1_clk_regs[] __initdata = {
diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index 0945a8852299..d7b011c1fcf8 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -344,7 +344,7 @@ struct samsung_mux_clock s3c2442_muxes[] __initdata = {
  */
 #define XTI	1
 struct samsung_fixed_rate_clock s3c2410_common_frate_clks[] __initdata = {
-	FRATE(XTI, "xti", NULL, CLK_IS_ROOT, 0),
+	FRATE(XTI, "xti", NULL, 0, 0),
 };
 
 static void __init s3c2410_common_clk_register_fixed_ext(
diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
index 44d6a9f4f5b2..effe3736ec6b 100644
--- a/drivers/clk/samsung/clk-s3c2412.c
+++ b/drivers/clk/samsung/clk-s3c2412.c
@@ -232,8 +232,8 @@ static struct notifier_block s3c2412_restart_handler = {
  */
 #define XTI	1
 struct samsung_fixed_rate_clock s3c2412_common_frate_clks[] __initdata = {
-	FRATE(XTI, "xti", NULL, CLK_IS_ROOT, 0),
-	FRATE(0, "ext", NULL, CLK_IS_ROOT, 0),
+	FRATE(XTI, "xti", NULL, 0, 0),
+	FRATE(0, "ext", NULL, 0, 0),
 };
 
 static void __init s3c2412_common_clk_register_fixed_ext(
diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
index 2c0a1ea3c80c..37562783b25e 100644
--- a/drivers/clk/samsung/clk-s3c2443.c
+++ b/drivers/clk/samsung/clk-s3c2443.c
@@ -371,10 +371,10 @@ static struct notifier_block s3c2443_restart_handler = {
  * Only necessary until the devicetree-move is complete
  */
 struct samsung_fixed_rate_clock s3c2443_common_frate_clks[] __initdata = {
-	FRATE(0, "xti", NULL, CLK_IS_ROOT, 0),
-	FRATE(0, "ext", NULL, CLK_IS_ROOT, 0),
-	FRATE(0, "ext_i2s", NULL, CLK_IS_ROOT, 0),
-	FRATE(0, "ext_uart", NULL, CLK_IS_ROOT, 0),
+	FRATE(0, "xti", NULL, 0, 0),
+	FRATE(0, "ext", NULL, 0, 0),
+	FRATE(0, "ext_i2s", NULL, 0, 0),
+	FRATE(0, "ext_uart", NULL, 0, 0),
 };
 
 static void __init s3c2443_common_clk_register_fixed_ext(
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index d325ed1e196b..60aa775bd374 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -176,14 +176,14 @@ PNAME(audio2_p6410)	= { "mout_epll", "dout_mpll", "fin_pll", "iiscdclk2",
 
 /* Fixed rate clocks generated outside the SoC. */
 FIXED_RATE_CLOCKS(s3c64xx_fixed_rate_ext_clks) __initdata = {
-	FRATE(0, "fin_pll", NULL, CLK_IS_ROOT, 0),
-	FRATE(0, "xusbxti", NULL, CLK_IS_ROOT, 0),
+	FRATE(0, "fin_pll", NULL, 0, 0),
+	FRATE(0, "xusbxti", NULL, 0, 0),
 };
 
 /* Fixed rate clocks generated inside the SoC. */
 FIXED_RATE_CLOCKS(s3c64xx_fixed_rate_clks) __initdata = {
-	FRATE(CLK27M, "clk27m", NULL, CLK_IS_ROOT, 27000000),
-	FRATE(CLK48M, "clk48m", NULL, CLK_IS_ROOT, 48000000),
+	FRATE(CLK27M, "clk27m", NULL, 0, 27000000),
+	FRATE(CLK48M, "clk48m", NULL, 0, 48000000),
 };
 
 /* List of clock muxes present on all S3C64xx SoCs. */
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index 759aaf342bea..52302262045d 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -503,15 +503,15 @@ static const struct samsung_mux_clock s5p6442_mux_clks[] __initconst = {
 
 /* S5PV210-specific fixed rate clocks generated inside the SoC. */
 static const struct samsung_fixed_rate_clock s5pv210_frate_clks[] __initconst = {
-	FRATE(SCLK_HDMI27M, "sclk_hdmi27m", NULL, CLK_IS_ROOT, 27000000),
-	FRATE(SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 27000000),
-	FRATE(SCLK_USBPHY0, "sclk_usbphy0", NULL, CLK_IS_ROOT, 48000000),
-	FRATE(SCLK_USBPHY1, "sclk_usbphy1", NULL, CLK_IS_ROOT, 48000000),
+	FRATE(SCLK_HDMI27M, "sclk_hdmi27m", NULL, 0, 27000000),
+	FRATE(SCLK_HDMIPHY, "sclk_hdmiphy", NULL, 0, 27000000),
+	FRATE(SCLK_USBPHY0, "sclk_usbphy0", NULL, 0, 48000000),
+	FRATE(SCLK_USBPHY1, "sclk_usbphy1", NULL, 0, 48000000),
 };
 
 /* S5P6442-specific fixed rate clocks generated inside the SoC. */
 static const struct samsung_fixed_rate_clock s5p6442_frate_clks[] __initconst = {
-	FRATE(SCLK_USBPHY0, "sclk_usbphy0", NULL, CLK_IS_ROOT, 30000000),
+	FRATE(SCLK_USBPHY0, "sclk_usbphy0", NULL, 0, 30000000),
 };
 
 /* Common clock dividers. */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
