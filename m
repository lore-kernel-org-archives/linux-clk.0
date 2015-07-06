Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Boris BREZILLON <boris.brezillon@free-electrons.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] clk: at91: Silence warnings and cleanup __init usage
Date: Mon,  6 Jul 2015 12:31:45 -0700
Message-Id: <1436211105-10491-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Remove useless ifdefs around function prototypes to silence the
following sparse warnings when the configs aren't enabled.

drivers/clk/at91/clk-h32mx.c:95:13: warning: symbol
'of_sama5d4_clk_h32mx_setup' was not declared. Should it be
static?
drivers/clk/at91/clk-utmi.c:159:13: warning: symbol
'of_at91sam9x5_clk_utmi_setup' was not declared. Should it be
static?

Plus, using __init in function prototypes doesn't do anything, so
just drop it throughout this file.

Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/at91/pmc.h | 56 ++++++++++++++++++++++----------------------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 69abb08cf146..0caad646583d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -59,71 +59,63 @@ static inline void pmc_write(struct at91_pmc *pmc, int offset, u32 value)
 int of_at91_get_clk_range(struct device_node *np, const char *propname,
 			  struct clk_range *range);
 
-extern void __init of_at91sam9260_clk_slow_setup(struct device_node *np,
+extern void of_at91sam9260_clk_slow_setup(struct device_node *np,
 						 struct at91_pmc *pmc);
 
-extern void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np,
+extern void of_at91rm9200_clk_main_osc_setup(struct device_node *np,
 						    struct at91_pmc *pmc);
-extern void __init of_at91sam9x5_clk_main_rc_osc_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_main_rc_osc_setup(struct device_node *np,
 						       struct at91_pmc *pmc);
-extern void __init of_at91rm9200_clk_main_setup(struct device_node *np,
+extern void of_at91rm9200_clk_main_setup(struct device_node *np,
 						struct at91_pmc *pmc);
-extern void __init of_at91sam9x5_clk_main_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_main_setup(struct device_node *np,
 						struct at91_pmc *pmc);
 
-extern void __init of_at91rm9200_clk_pll_setup(struct device_node *np,
+extern void of_at91rm9200_clk_pll_setup(struct device_node *np,
 					       struct at91_pmc *pmc);
-extern void __init of_at91sam9g45_clk_pll_setup(struct device_node *np,
+extern void of_at91sam9g45_clk_pll_setup(struct device_node *np,
 						struct at91_pmc *pmc);
-extern void __init of_at91sam9g20_clk_pllb_setup(struct device_node *np,
+extern void of_at91sam9g20_clk_pllb_setup(struct device_node *np,
 						 struct at91_pmc *pmc);
-extern void __init of_sama5d3_clk_pll_setup(struct device_node *np,
+extern void of_sama5d3_clk_pll_setup(struct device_node *np,
 					    struct at91_pmc *pmc);
-extern void __init of_at91sam9x5_clk_plldiv_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_plldiv_setup(struct device_node *np,
 						  struct at91_pmc *pmc);
 
-extern void __init of_at91rm9200_clk_master_setup(struct device_node *np,
+extern void of_at91rm9200_clk_master_setup(struct device_node *np,
 						  struct at91_pmc *pmc);
-extern void __init of_at91sam9x5_clk_master_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_master_setup(struct device_node *np,
 						  struct at91_pmc *pmc);
 
-extern void __init of_at91rm9200_clk_sys_setup(struct device_node *np,
+extern void of_at91rm9200_clk_sys_setup(struct device_node *np,
 					       struct at91_pmc *pmc);
 
-extern void __init of_at91rm9200_clk_periph_setup(struct device_node *np,
+extern void of_at91rm9200_clk_periph_setup(struct device_node *np,
 						  struct at91_pmc *pmc);
-extern void __init of_at91sam9x5_clk_periph_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_periph_setup(struct device_node *np,
 						  struct at91_pmc *pmc);
 
-extern void __init of_at91rm9200_clk_prog_setup(struct device_node *np,
+extern void of_at91rm9200_clk_prog_setup(struct device_node *np,
 						struct at91_pmc *pmc);
-extern void __init of_at91sam9g45_clk_prog_setup(struct device_node *np,
+extern void of_at91sam9g45_clk_prog_setup(struct device_node *np,
 						 struct at91_pmc *pmc);
-extern void __init of_at91sam9x5_clk_prog_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_prog_setup(struct device_node *np,
 						struct at91_pmc *pmc);
 
-#if defined(CONFIG_HAVE_AT91_UTMI)
-extern void __init of_at91sam9x5_clk_utmi_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_utmi_setup(struct device_node *np,
 						struct at91_pmc *pmc);
-#endif
 
-#if defined(CONFIG_HAVE_AT91_USB_CLK)
-extern void __init of_at91rm9200_clk_usb_setup(struct device_node *np,
+extern void of_at91rm9200_clk_usb_setup(struct device_node *np,
 					       struct at91_pmc *pmc);
-extern void __init of_at91sam9x5_clk_usb_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_usb_setup(struct device_node *np,
 					       struct at91_pmc *pmc);
-extern void __init of_at91sam9n12_clk_usb_setup(struct device_node *np,
+extern void of_at91sam9n12_clk_usb_setup(struct device_node *np,
 						struct at91_pmc *pmc);
-#endif
 
-#if defined(CONFIG_HAVE_AT91_SMD)
-extern void __init of_at91sam9x5_clk_smd_setup(struct device_node *np,
+extern void of_at91sam9x5_clk_smd_setup(struct device_node *np,
 					       struct at91_pmc *pmc);
-#endif
 
-#if defined(CONFIG_HAVE_AT91_SMD)
-extern void __init of_sama5d4_clk_h32mx_setup(struct device_node *np,
+extern void of_sama5d4_clk_h32mx_setup(struct device_node *np,
 					      struct at91_pmc *pmc);
-#endif
 
 #endif /* __PMC_H_ */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

