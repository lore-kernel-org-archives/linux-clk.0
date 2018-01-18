Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] clk: meson: add gxl hdmi pll
Date: Thu, 18 Jan 2018 19:45:29 +0100
Message-Id: <20180118184532.6856-7-jbrunet@baylibre.com>
In-Reply-To: <20180118184532.6856-1-jbrunet@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The hdmi pll used in the gxl family is actually different from the gxbb.
The register layout is completely different, which explain why the hdmi
pll rate has always been rubbish on the gxl.

Adding the correct register field is the first part of the fix to get a
correct rate out the hdmi pll

Fixes: 0d48fc558d01 ("clk: meson-gxbb: Add GXL/GXM GP0 Variant")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index cf083a1906d1..08b3e1cdba5b 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -253,6 +253,52 @@ static struct meson_clk_pll gxbb_hdmi_pll = {
 	},
 };
 
+static struct meson_clk_pll gxl_hdmi_pll = {
+	.m = {
+		.reg_off = HHI_HDMI_PLL_CNTL,
+		.shift   = 0,
+		.width   = 9,
+	},
+	.n = {
+		.reg_off = HHI_HDMI_PLL_CNTL,
+		.shift   = 9,
+		.width   = 5,
+	},
+	.frac = {
+		/*
+		 * On gxl, there a register shift due to HHI_HDMI_PLL_CNTL1
+		 * which does not exist on gxbb, so we compute the register
+		 * offset based on the PLL base to get it right
+		 */
+		.reg_off = HHI_HDMI_PLL_CNTL + 4,
+		.shift   = 0,
+		.width   = 12,
+	},
+	.od = {
+		.reg_off = HHI_HDMI_PLL_CNTL + 8,
+		.shift   = 21,
+		.width   = 2,
+	},
+	.od2 = {
+		.reg_off = HHI_HDMI_PLL_CNTL + 8,
+		.shift   = 23,
+		.width   = 2,
+	},
+	.od3 = {
+		.reg_off = HHI_HDMI_PLL_CNTL + 8,
+		.shift   = 19,
+		.width   = 2,
+	},
+	.lock = &meson_clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_pll",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
 static struct meson_clk_pll gxbb_sys_pll = {
 	.m = {
 		.reg_off = HHI_SYS_PLL_CNTL,
@@ -1520,7 +1566,7 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
 static struct clk_hw_onecell_data gxl_hw_onecell_data = {
 	.hws = {
 		[CLKID_SYS_PLL]		    = &gxbb_sys_pll.hw,
-		[CLKID_HDMI_PLL]	    = &gxbb_hdmi_pll.hw,
+		[CLKID_HDMI_PLL]	    = &gxl_hdmi_pll.hw,
 		[CLKID_FIXED_PLL]	    = &gxbb_fixed_pll.hw,
 		[CLKID_FCLK_DIV2]	    = &gxbb_fclk_div2.hw,
 		[CLKID_FCLK_DIV3]	    = &gxbb_fclk_div3.hw,
@@ -1675,7 +1721,7 @@ static struct meson_clk_pll *const gxbb_clk_plls[] = {
 
 static struct meson_clk_pll *const gxl_clk_plls[] = {
 	&gxbb_fixed_pll,
-	&gxbb_hdmi_pll,
+	&gxl_hdmi_pll,
 	&gxbb_sys_pll,
 	&gxl_gp0_pll,
 };
-- 
2.14.3
