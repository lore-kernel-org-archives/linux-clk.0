Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Allow compile-testing of all (sub)drivers
Date: Mon, 17 Jul 2017 14:04:03 +0200
Message-Id: <1500293043-14654-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Enable compile-testing of the remaining clock drivers and subdrivers,
now dummies are available for of_clk_get_from_provider(),
of_device_compatible_match(), and rcar_rst_read_mode_pins(), and the
CPG/MSSR driver core has been converted from of_match_node() to
of_device_get_match_data().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.14.

 drivers/clk/renesas/Kconfig | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 78d1df9112ba3932..85526ca3920229c8 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -34,94 +34,94 @@ config CLK_EMEV2
 	bool "Emma Mobile EV2 clock support" if COMPILE_TEST
 
 config CLK_RZA1
-	bool
+	bool "RZ/A1H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 
 config CLK_R8A73A4
-	bool
+	bool "R-Mobile APE6 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 	select CLK_RENESAS_DIV6
 
 config CLK_R8A7740
-	bool
+	bool "R-Mobile A1 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 	select CLK_RENESAS_DIV6
 
 config CLK_R8A7743
-	bool
+	bool "RZ/G1M clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2_CPG
 
 config CLK_R8A7745
-	bool
+	bool "RZ/G1E clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2_CPG
 
 config CLK_R8A7778
-	bool
+	bool "R-Car M1A clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 
 config CLK_R8A7779
-	bool
+	bool "R-Car H1 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 
 config CLK_R8A7790
-	bool
+	bool "R-Car H2 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2 if CLK_RENESAS_LEGACY
 	select CLK_RCAR_GEN2_CPG
 	select CLK_RENESAS_DIV6
 
 config CLK_R8A7791
-	bool
+	bool "R-Car M2-W/N clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2 if CLK_RENESAS_LEGACY
 	select CLK_RCAR_GEN2_CPG
 	select CLK_RENESAS_DIV6
 
 config CLK_R8A7792
-	bool
+	bool "R-Car V2H clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2 if CLK_RENESAS_LEGACY
 	select CLK_RCAR_GEN2_CPG
 
 config CLK_R8A7794
-	bool
+	bool "R-Car E2 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN2 if CLK_RENESAS_LEGACY
 	select CLK_RCAR_GEN2_CPG
 	select CLK_RENESAS_DIV6
 
 config CLK_R8A7795
-	bool
+	bool "R-Car H3 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
 config CLK_R8A7796
-	bool
+	bool "R-Car M3-W clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
 config CLK_SH73A0
-	bool
+	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 	select CLK_RENESAS_DIV6
 
 
 # Family
 config CLK_RCAR_GEN2
-	bool
+	bool "R-Car Gen2 legacy clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
 	select CLK_RENESAS_DIV6
 
 config CLK_RCAR_GEN2_CPG
-	bool
+	bool "R-Car Gen2 CPG clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 
 config CLK_RCAR_GEN3_CPG
-	bool
+	bool "R-Car Gen3 CPG clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 
 
 # Generic
 config CLK_RENESAS_CPG_MSSR
-	bool
+	bool "CPG/MSSR clock support" if COMPILE_TEST
 	select CLK_RENESAS_DIV6
 
 config CLK_RENESAS_CPG_MSTP
-	bool
+	bool "MSTP clock support" if COMPILE_TEST
 
 config CLK_RENESAS_DIV6
 	bool "DIV6 clock support" if COMPILE_TEST
-- 
2.7.4
