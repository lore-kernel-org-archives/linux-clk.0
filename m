Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 06/10] clk: meson8b: remove mali clk
Date: Thu,  9 Jun 2016 17:27:43 -0700
Message-Id: <1465518467-23939-7-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This clock is undocumented and always orphaned. Get rid of it until we
have more complete clock tree documentation.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/meson8b-clkc.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index 94512b6..dcd8f03 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -112,11 +112,8 @@ static const struct clk_div_table cpu_div_table[] = {
 };
 
 PNAME(p_clk81)		= { "fclk_div3", "fclk_div4", "fclk_div5" };
-PNAME(p_mali)		= { "fclk_div3", "fclk_div4", "fclk_div5",
-			    "fclk_div7", "zero" };
 
 static u32 mux_table_clk81[]	= { 6, 5, 7 };
-static u32 mux_table_mali[]	= { 6, 5, 7, 4, 0 };
 
 static const struct composite_conf clk81_conf __initconst = {
 	.mux_table		= mux_table_clk81,
@@ -126,13 +123,6 @@ static const struct composite_conf clk81_conf __initconst = {
 	.gate_parm		= PARM(0x00, 7, 1),
 };
 
-static const struct composite_conf mali_conf __initconst = {
-	.mux_table		= mux_table_mali,
-	.mux_parm		= PARM(0x00, 9, 3),
-	.div_parm		= PARM(0x00, 0, 7),
-	.gate_parm		= PARM(0x00, 8, 1),
-};
-
 static struct clk_fixed_rate meson8b_xtal = {
 	.fixed_rate = 24000000,
 	.hw.init = &(struct clk_init_data){
@@ -142,15 +132,6 @@ static struct clk_fixed_rate meson8b_xtal = {
 	},
 };
 
-static struct clk_fixed_rate meson8b_zero = {
-	.fixed_rate = 0,
-	.hw.init = &(struct clk_init_data){
-		.name = "zero",
-		.num_parents = 0,
-		.ops = &clk_fixed_rate_ops,
-	},
-};
-
 static struct meson_clk_pll meson8b_fixed_pll = {
 	.m = {
 		.reg_off = MESON8B_REG_PLL_FIXED,
@@ -301,8 +282,6 @@ static struct meson_clk_cpu meson8b_cpu_clk = {
 static const struct clk_conf meson8b_clk_confs[] __initconst = {
 	COMPOSITE(MESON8B_REG_HHI_MPEG, CLKID_CLK81, "clk81", p_clk81,
 		  CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED, &clk81_conf),
-	COMPOSITE(MESON8B_REG_MALI, CLKID_MALI, "mali", p_mali,
-		  CLK_IGNORE_UNUSED, &mali_conf),
 };
 
 /*
@@ -315,7 +294,6 @@ static const struct clk_conf meson8b_clk_confs[] __initconst = {
 static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 	.hws = {
 		[CLKID_XTAL] = &meson8b_xtal.hw,
-		[CLKID_ZERO] = &meson8b_zero.hw,
 		[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
 		[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
 		[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
-- 
2.1.4
