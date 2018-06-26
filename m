Return-Path: <dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-clk@vger.kernel.org
Cc: dinguyen@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com
Subject: [PATCH 1/2] clk: socfpga: stratix10: fix the parents of mpu_free_clk
Date: Tue, 26 Jun 2018 08:28:09 -0500
Message-Id: <1530019690-32685-1-git-send-email-dinguyen@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

Add a clock mux that is used as a parent for the mpu_free_clk.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-s10.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index 7271463..a15769f 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -37,6 +37,11 @@ static const char * const s2f_usr0_mux[] = {"f2s_free_clk", "boot_clk"};
 static const char * const emac_mux[] = {"emaca_free_clk", "emacb_free_clk"};
 static const char * const noc_mux[] = {"noc_free_clk", "boot_clk"};
 
+static const char * const mpu_free_mux[] = {"main_mpu_base_clk",
+					    "peri_mpu_base_clk",
+					    "osc1", "cb_intosc_hs_div2_clk",
+					    "f2s_free_clk"};
+
 /* clocks in AO (always on) controller */
 static const struct stratix10_pll_clock s10_pll_clks[] = {
 	{ STRATIX10_BOOT_CLK, "boot_clk", boot_mux, ARRAY_SIZE(boot_mux), 0,
@@ -57,7 +62,7 @@ static const struct stratix10_perip_c_clock s10_main_perip_c_clks[] = {
 };
 
 static const struct stratix10_perip_cnt_clock s10_main_perip_cnt_clks[] = {
-	{ STRATIX10_MPU_FREE_CLK, "mpu_free_clk", NULL, cntr_mux, ARRAY_SIZE(cntr_mux),
+	{ STRATIX10_MPU_FREE_CLK, "mpu_free_clk", NULL, mpu_free_mux, ARRAY_SIZE(mpu_free_mux),
 	   0, 0x48, 0, 0, 0},
 	{ STRATIX10_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
 	  0, 0x4C, 0, 0, 0},
-- 
2.7.4
