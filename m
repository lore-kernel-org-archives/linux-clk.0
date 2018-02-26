Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <tony@atomide.com>, <linux-omap@vger.kernel.org>, <jsarha@ti.com>
Subject: [PATCH 2/3] clk: ti: am33xx: add set-rate-parent support for display clkctrl clock
Date: Mon, 26 Feb 2018 17:10:11 +0200
Message-ID: <1519657812-15605-3-git-send-email-t-kristo@ti.com>
In-Reply-To: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Display driver assumes it can use clk_set_rate for the display clock
via set-rate-parent mechanism, so add the flag for this to it.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reported-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/clk/ti/clk-33xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
index 612491a..12e0a2d 100644
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -45,7 +45,7 @@
 
 static const struct omap_clkctrl_reg_data am3_l4_per_clkctrl_regs[] __initconst = {
 	{ AM3_CPGMAC0_CLKCTRL, NULL, CLKF_SW_SUP, "cpsw_125mhz_gclk", "cpsw_125mhz_clkdm" },
-	{ AM3_LCDC_CLKCTRL, NULL, CLKF_SW_SUP, "lcd_gclk", "lcdc_clkdm" },
+	{ AM3_LCDC_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_SET_RATE_PARENT, "lcd_gclk", "lcdc_clkdm" },
 	{ AM3_USB_OTG_HS_CLKCTRL, NULL, CLKF_SW_SUP, "usbotg_fck", "l3s_clkdm" },
 	{ AM3_TPTC0_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
 	{ AM3_EMIF_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_ddr_m2_div2_ck", "l3_clkdm" },
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
