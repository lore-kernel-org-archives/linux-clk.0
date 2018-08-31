Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 09/11] clk: ti: am43xx: add new clkctrl data for am43xx
Date: Fri, 31 Aug 2018 18:07:05 +0300
Message-ID: <1535728027-24573-10-git-send-email-t-kristo@ti.com>
In-Reply-To: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The new clkctrl data layout for am43xx is split based on clockdomain
boundaries. Previously the split was based on CM boundaries. This patch
adds the new data as separate data entity, retaining the compatibility
data also for now. The compatibility data can be removed once no longer
needed.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-43xx.c | 254 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/ti/clkctrl.c  |  17 +++-
 drivers/clk/ti/clock.h    |   2 +
 3 files changed, 268 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
index dc3ccdc..2782d91 100644
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -23,11 +23,263 @@
 
 #include "clock.h"
 
+static const struct omap_clkctrl_reg_data am4_l3s_tsc_clkctrl_regs[] __initconst = {
+	{ AM4_L3S_TSC_ADC_TSC_CLKCTRL, NULL, CLKF_SW_SUP, "adc_tsc_fck" },
+	{ 0 },
+};
+
+static const char * const am4_synctimer_32kclk_parents[] __initconst = {
+	"mux_synctimer32k_ck",
+	NULL,
+};
+
+static const struct omap_clkctrl_bit_data am4_counter_32k_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_synctimer_32kclk_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_l4_wkup_aon_clkctrl_regs[] __initconst = {
+	{ AM4_L4_WKUP_AON_WKUP_M3_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "sys_clkin_ck" },
+	{ AM4_L4_WKUP_AON_COUNTER_32K_CLKCTRL, am4_counter_32k_bit_data, CLKF_SW_SUP, "l4-wkup-aon-clkctrl:0008:8" },
+	{ 0 },
+};
+
+static const char * const am4_gpio0_dbclk_parents[] __initconst = {
+	"gpio0_dbclk_mux_ck",
+	NULL,
+};
+
+static const struct omap_clkctrl_bit_data am4_gpio1_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_gpio0_dbclk_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_l4_wkup_clkctrl_regs[] __initconst = {
+	{ AM4_L4_WKUP_L4_WKUP_CLKCTRL, NULL, CLKF_SW_SUP, "sys_clkin_ck" },
+	{ AM4_L4_WKUP_TIMER1_CLKCTRL, NULL, CLKF_SW_SUP, "timer1_fck" },
+	{ AM4_L4_WKUP_WD_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "wdt1_fck" },
+	{ AM4_L4_WKUP_I2C1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck" },
+	{ AM4_L4_WKUP_UART1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck" },
+	{ AM4_L4_WKUP_SMARTREFLEX0_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex0_fck" },
+	{ AM4_L4_WKUP_SMARTREFLEX1_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex1_fck" },
+	{ AM4_L4_WKUP_CONTROL_CLKCTRL, NULL, CLKF_SW_SUP, "sys_clkin_ck" },
+	{ AM4_L4_WKUP_GPIO1_CLKCTRL, am4_gpio1_bit_data, CLKF_SW_SUP, "sys_clkin_ck" },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_mpu_clkctrl_regs[] __initconst = {
+	{ AM4_MPU_MPU_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_mpu_m2_ck" },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_gfx_l3_clkctrl_regs[] __initconst = {
+	{ AM4_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_l4_rtc_clkctrl_regs[] __initconst = {
+	{ AM4_L4_RTC_RTC_CLKCTRL, NULL, CLKF_SW_SUP, "clk_32768_ck" },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_l3_clkctrl_regs[] __initconst = {
+	{ AM4_L3_L3_MAIN_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_AES_CLKCTRL, NULL, CLKF_SW_SUP, "aes0_fck" },
+	{ AM4_L3_DES_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_L3_INSTR_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_OCMCRAM_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_SHAM_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_TPCC_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_TPTC0_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_TPTC1_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_TPTC2_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3_L4_HS_CLKCTRL, NULL, CLKF_SW_SUP, "l4hs_gclk" },
+	{ 0 },
+};
+
+static const char * const am4_usb_otg_ss0_refclk960m_parents[] __initconst = {
+	"dpll_per_clkdcoldo",
+	NULL,
+};
+
+static const struct omap_clkctrl_bit_data am4_usb_otg_ss0_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_usb_otg_ss0_refclk960m_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_bit_data am4_usb_otg_ss1_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_usb_otg_ss0_refclk960m_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_l3s_clkctrl_regs[] __initconst = {
+	{ AM4_L3S_VPFE0_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3S_VPFE1_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk" },
+	{ AM4_L3S_GPMC_CLKCTRL, NULL, CLKF_SW_SUP, "l3s_gclk" },
+	{ AM4_L3S_MCASP0_CLKCTRL, NULL, CLKF_SW_SUP, "mcasp0_fck" },
+	{ AM4_L3S_MCASP1_CLKCTRL, NULL, CLKF_SW_SUP, "mcasp1_fck" },
+	{ AM4_L3S_MMC3_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk" },
+	{ AM4_L3S_QSPI_CLKCTRL, NULL, CLKF_SW_SUP, "l3s_gclk" },
+	{ AM4_L3S_USB_OTG_SS0_CLKCTRL, am4_usb_otg_ss0_bit_data, CLKF_SW_SUP, "l3s_gclk" },
+	{ AM4_L3S_USB_OTG_SS1_CLKCTRL, am4_usb_otg_ss1_bit_data, CLKF_SW_SUP, "l3s_gclk" },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_pruss_ocp_clkctrl_regs[] __initconst = {
+	{ AM4_PRUSS_OCP_PRUSS_CLKCTRL, NULL, CLKF_SW_SUP, "pruss_ocp_gclk" },
+	{ 0 },
+};
+
+static const char * const am4_gpio1_dbclk_parents[] __initconst = {
+	"clkdiv32k_ick",
+	NULL,
+};
+
+static const struct omap_clkctrl_bit_data am4_gpio2_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_bit_data am4_gpio3_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_bit_data am4_gpio4_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_bit_data am4_gpio5_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_bit_data am4_gpio6_bit_data[] __initconst = {
+	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_l4ls_clkctrl_regs[] __initconst = {
+	{ AM4_L4LS_L4_LS_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_D_CAN0_CLKCTRL, NULL, CLKF_SW_SUP, "dcan0_fck" },
+	{ AM4_L4LS_D_CAN1_CLKCTRL, NULL, CLKF_SW_SUP, "dcan1_fck" },
+	{ AM4_L4LS_EPWMSS0_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_EPWMSS1_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_EPWMSS2_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_EPWMSS3_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_EPWMSS4_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_EPWMSS5_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_ELM_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_GPIO2_CLKCTRL, am4_gpio2_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_GPIO3_CLKCTRL, am4_gpio3_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_GPIO4_CLKCTRL, am4_gpio4_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_GPIO5_CLKCTRL, am4_gpio5_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_GPIO6_CLKCTRL, am4_gpio6_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_HDQ1W_CLKCTRL, NULL, CLKF_SW_SUP, "func_12m_clk" },
+	{ AM4_L4LS_I2C2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_I2C3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_MAILBOX_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_MMC1_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk" },
+	{ AM4_L4LS_MMC2_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk" },
+	{ AM4_L4LS_RNG_CLKCTRL, NULL, CLKF_SW_SUP, "rng_fck" },
+	{ AM4_L4LS_SPI0_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_SPI1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_SPI2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_SPI3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_SPI4_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_SPINLOCK_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "timer2_fck" },
+	{ AM4_L4LS_TIMER3_CLKCTRL, NULL, CLKF_SW_SUP, "timer3_fck" },
+	{ AM4_L4LS_TIMER4_CLKCTRL, NULL, CLKF_SW_SUP, "timer4_fck" },
+	{ AM4_L4LS_TIMER5_CLKCTRL, NULL, CLKF_SW_SUP, "timer5_fck" },
+	{ AM4_L4LS_TIMER6_CLKCTRL, NULL, CLKF_SW_SUP, "timer6_fck" },
+	{ AM4_L4LS_TIMER7_CLKCTRL, NULL, CLKF_SW_SUP, "timer7_fck" },
+	{ AM4_L4LS_TIMER8_CLKCTRL, NULL, CLKF_SW_SUP, "timer8_fck" },
+	{ AM4_L4LS_TIMER9_CLKCTRL, NULL, CLKF_SW_SUP, "timer9_fck" },
+	{ AM4_L4LS_TIMER10_CLKCTRL, NULL, CLKF_SW_SUP, "timer10_fck" },
+	{ AM4_L4LS_TIMER11_CLKCTRL, NULL, CLKF_SW_SUP, "timer11_fck" },
+	{ AM4_L4LS_UART2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_UART3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_UART4_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_UART5_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_UART6_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
+	{ AM4_L4LS_OCP2SCP0_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ AM4_L4LS_OCP2SCP1_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_emif_clkctrl_regs[] __initconst = {
+	{ AM4_EMIF_EMIF_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_ddr_m2_ck" },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_dss_clkctrl_regs[] __initconst = {
+	{ AM4_DSS_DSS_CORE_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_SET_RATE_PARENT, "disp_clk" },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data am4_cpsw_125mhz_clkctrl_regs[] __initconst = {
+	{ AM4_CPSW_125MHZ_CPGMAC0_CLKCTRL, NULL, CLKF_SW_SUP, "cpsw_125mhz_gclk" },
+	{ 0 },
+};
+
+const struct omap_clkctrl_data am4_clkctrl_data[] __initconst = {
+	{ 0x44df2920, am4_l3s_tsc_clkctrl_regs },
+	{ 0x44df2a28, am4_l4_wkup_aon_clkctrl_regs },
+	{ 0x44df2a20, am4_l4_wkup_clkctrl_regs },
+	{ 0x44df8320, am4_mpu_clkctrl_regs },
+	{ 0x44df8420, am4_gfx_l3_clkctrl_regs },
+	{ 0x44df8520, am4_l4_rtc_clkctrl_regs },
+	{ 0x44df8820, am4_l3_clkctrl_regs },
+	{ 0x44df8868, am4_l3s_clkctrl_regs },
+	{ 0x44df8b20, am4_pruss_ocp_clkctrl_regs },
+	{ 0x44df8c20, am4_l4ls_clkctrl_regs },
+	{ 0x44df8f20, am4_emif_clkctrl_regs },
+	{ 0x44df9220, am4_dss_clkctrl_regs },
+	{ 0x44df9320, am4_cpsw_125mhz_clkctrl_regs },
+	{ 0 },
+};
+
+const struct omap_clkctrl_data am438x_clkctrl_data[] __initconst = {
+	{ 0x44df2920, am4_l3s_tsc_clkctrl_regs },
+	{ 0x44df2a28, am4_l4_wkup_aon_clkctrl_regs },
+	{ 0x44df2a20, am4_l4_wkup_clkctrl_regs },
+	{ 0x44df8320, am4_mpu_clkctrl_regs },
+	{ 0x44df8420, am4_gfx_l3_clkctrl_regs },
+	{ 0x44df8820, am4_l3_clkctrl_regs },
+	{ 0x44df8868, am4_l3s_clkctrl_regs },
+	{ 0x44df8b20, am4_pruss_ocp_clkctrl_regs },
+	{ 0x44df8c20, am4_l4ls_clkctrl_regs },
+	{ 0x44df8f20, am4_emif_clkctrl_regs },
+	{ 0x44df9220, am4_dss_clkctrl_regs },
+	{ 0x44df9320, am4_cpsw_125mhz_clkctrl_regs },
+	{ 0 },
+};
+
+static struct ti_dt_clk am43xx_clks[] = {
+	DT_CLK(NULL, "timer_32k_ck", "clkdiv32k_ick"),
+	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
+	DT_CLK(NULL, "gpio0_dbclk", "l4-wkup-clkctrl:0148:8"),
+	DT_CLK(NULL, "gpio1_dbclk", "l4ls-clkctrl:0058:8"),
+	DT_CLK(NULL, "gpio2_dbclk", "l4ls-clkctrl:0060:8"),
+	DT_CLK(NULL, "gpio3_dbclk", "l4ls-clkctrl:0068:8"),
+	DT_CLK(NULL, "gpio4_dbclk", "l4ls-clkctrl:0070:8"),
+	DT_CLK(NULL, "gpio5_dbclk", "l4ls-clkctrl:0078:8"),
+	DT_CLK(NULL, "synctimer_32kclk", "l4-wkup-aon-clkctrl:0008:8"),
+	DT_CLK(NULL, "usb_otg_ss0_refclk960m", "l3s-clkctrl:01f8:8"),
+	DT_CLK(NULL, "usb_otg_ss1_refclk960m", "l3s-clkctrl:0200:8"),
+	{ .node_name = NULL },
+};
+
 int __init am43xx_dt_clk_init(void)
 {
 	struct clk *clk1, *clk2;
 
-	ti_dt_clocks_register(am43xx_compat_clks);
+	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
+		ti_dt_clocks_register(am43xx_compat_clks);
+	else
+		ti_dt_clocks_register(am43xx_clks);
 
 	omap2_clk_disable_autoidle_all();
 
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index e3423ca..f41542a 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -475,10 +475,19 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 	}
 #endif
 #ifdef CONFIG_SOC_AM43XX
-	if (of_machine_is_compatible("ti,am4372"))
-		data = am4_clkctrl_compat_data;
-	if (of_machine_is_compatible("ti,am438x"))
-		data = am438x_clkctrl_compat_data;
+	if (of_machine_is_compatible("ti,am4372")) {
+		if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
+			data = am4_clkctrl_compat_data;
+		else
+			data = am4_clkctrl_data;
+	}
+
+	if (of_machine_is_compatible("ti,am438x")) {
+		if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
+			data = am438x_clkctrl_compat_data;
+		else
+			data = am438x_clkctrl_data;
+	}
 #endif
 #ifdef CONFIG_SOC_TI81XX
 	if (of_machine_is_compatible("ti,dm814"))
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 01b3c4e..11348de5 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -187,8 +187,10 @@ struct omap_clkctrl_data {
 extern const struct omap_clkctrl_data am3_clkctrl_data[];
 extern const struct omap_clkctrl_data am3_clkctrl_compat_data[];
 extern struct ti_dt_clk am33xx_compat_clks[];
+extern const struct omap_clkctrl_data am4_clkctrl_data[];
 extern const struct omap_clkctrl_data am4_clkctrl_compat_data[];
 extern struct ti_dt_clk am43xx_compat_clks[];
+extern const struct omap_clkctrl_data am438x_clkctrl_data[];
 extern const struct omap_clkctrl_data am438x_clkctrl_compat_data[];
 extern const struct omap_clkctrl_data dm814_clkctrl_data[];
 extern const struct omap_clkctrl_data dm816_clkctrl_data[];
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
