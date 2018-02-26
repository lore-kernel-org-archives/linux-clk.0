Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <tony@atomide.com>, <linux-omap@vger.kernel.org>, <jsarha@ti.com>
Subject: [PATCH 3/3] clk: ti: am43xx: add set-rate-parent support for display clkctrl clock
Date: Mon, 26 Feb 2018 17:10:12 +0200
Message-ID: <1519657812-15605-4-git-send-email-t-kristo@ti.com>
In-Reply-To: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Display driver assumes it can use clk_set_rate for the display clock
via set-rate-parent mechanism, so add the flag for this to id.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-43xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
index 2b7c2e0..63c5ddb 100644
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -187,7 +187,7 @@
 	{ AM4_OCP2SCP0_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_OCP2SCP1_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
 	{ AM4_EMIF_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_ddr_m2_ck", "emif_clkdm" },
-	{ AM4_DSS_CORE_CLKCTRL, NULL, CLKF_SW_SUP, "disp_clk", "dss_clkdm" },
+	{ AM4_DSS_CORE_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_SET_RATE_PARENT, "disp_clk", "dss_clkdm" },
 	{ AM4_CPGMAC0_CLKCTRL, NULL, CLKF_SW_SUP, "cpsw_125mhz_gclk", "cpsw_125mhz_clkdm" },
 	{ 0 },
 };
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
