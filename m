Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] clk: meson-gxbb: Add const to some parent name arrays
Date: Fri,  2 Jun 2017 10:58:31 -0700
Message-Id: <20170602175831.29100-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These can be marked as const * const.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/meson/gxbb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 2919a0e044a5..36c0e455437e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -701,7 +701,7 @@ static struct clk_gate gxbb_sar_adc_clk = {
  */
 
 static u32 mux_table_mali_0_1[] = {0, 1, 2, 3, 4, 5, 6, 7};
-static const char *gxbb_mali_0_1_parent_names[] = {
+static const char * const gxbb_mali_0_1_parent_names[] = {
 	"xtal", "gp0_pll", "mpll2", "mpll1", "fclk_div7",
 	"fclk_div4", "fclk_div3", "fclk_div5"
 };
@@ -801,7 +801,7 @@ static struct clk_gate gxbb_mali_1 = {
 };
 
 static u32 mux_table_mali[] = {0, 1};
-static const char *gxbb_mali_parent_names[] = {
+static const char * const gxbb_mali_parent_names[] = {
 	"mali_0", "mali_1"
 };
 
@@ -953,7 +953,7 @@ static struct clk_gate gxbb_32k_clk = {
 	},
 };
 
-static const char *gxbb_32k_clk_parent_names[] = {
+static const char * const gxbb_32k_clk_parent_names[] = {
 	"xtal", "cts_slow_oscin", "fclk_div3", "fclk_div5"
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
