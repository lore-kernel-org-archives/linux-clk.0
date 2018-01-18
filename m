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
Subject: [PATCH 7/9] clk: meson: fix pll with fractional part calculation
Date: Thu, 18 Jan 2018 19:45:30 +0100
Message-Id: <20180118184532.6856-8-jbrunet@baylibre.com>
In-Reply-To: <20180118184532.6856-1-jbrunet@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The rate of the parent should not be multiplied by 2 when there is a
fractional part to the pll. This is making the rate calculation of
gxl_hdmi_pll wrong (and others as well). This multiplication is specific
to the hdmi_pll of gxbb and is most likely due to a multiplier sitting
in front of this particular pll.

Add fixed factor clock in front on the gxbb pll and remove this constant
from the calculation

Fixes: 4a47295144dd ("clk: meson: fractional pll support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-pll.c |  1 -
 drivers/clk/meson/gxbb.c    | 14 +++++++++++++-
 drivers/clk/meson/gxbb.h    |  3 ++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 3f560b2cd83b..8845f65aeb07 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -87,7 +87,6 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 		frac = PARM_GET(p->width, p->shift, reg);
 
 		rate += (u64)parent_rate * frac >>  p->width;
-		rate *= 2;
 	}
 
 	return (rate / n) >> od >> od2 >> od3;
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 08b3e1cdba5b..9a92e64b428c 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -212,6 +212,17 @@ static struct meson_clk_pll gxbb_fixed_pll = {
 	},
 };
 
+static struct clk_fixed_factor gxbb_hdmi_pll_pre_mult = {
+	.mult = 2,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "hdmi_pll_pre_mult",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+	},
+};
+
 static struct meson_clk_pll gxbb_hdmi_pll = {
 	.m = {
 		.reg_off = HHI_HDMI_PLL_CNTL,
@@ -247,7 +258,7 @@ static struct meson_clk_pll gxbb_hdmi_pll = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll",
 		.ops = &meson_clk_pll_ro_ops,
-		.parent_names = (const char *[]){ "xtal" },
+		.parent_names = (const char *[]){ "hdmi_pll_pre_mult" },
 		.num_parents = 1,
 		.flags = CLK_GET_RATE_NOCACHE,
 	},
@@ -1558,6 +1569,7 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
 		[CLKID_VAPB_1]		    = &gxbb_vapb_1.hw,
 		[CLKID_VAPB_SEL]	    = &gxbb_vapb_sel.hw,
 		[CLKID_VAPB]		    = &gxbb_vapb.hw,
+		[CLKID_HDMI_PLL_PRE_MULT]   = &gxbb_hdmi_pll_pre_mult.hw,
 		[NR_CLKS]		    = NULL,
 	},
 	.num = NR_CLKS,
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index aee6fbba2004..42573b28a137 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -194,8 +194,9 @@
 #define CLKID_VPU_1_DIV		  130
 #define CLKID_VAPB_0_DIV	  134
 #define CLKID_VAPB_1_DIV	  137
+#define CLKID_HDMI_PLL_PRE_MULT	  141
 
-#define NR_CLKS			  141
+#define NR_CLKS			  142
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/gxbb-clkc.h>
-- 
2.14.3
