Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: gxbb: add all clk81 parents
Date: Thu,  8 Jun 2017 15:55:45 +0200
Message-Id: <20170608135545.31499-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Remove the FIXME on clk81 mux and add all the documented parents

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 36c0e455437e..a897ea45327c 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -603,7 +603,11 @@ static struct meson_clk_mpll gxbb_mpll2 = {
  * coordinated clock rates feature
  */
 
-static u32 mux_table_clk81[]	= { 6, 5, 7 };
+static u32 mux_table_clk81[]	= { 0, 2, 3, 4, 5, 6, 7 };
+static const char * const clk81_parent_names[] = {
+	"xtal", "fclk_div7", "mpll1", "mpll2", "fclk_div4",
+	"fclk_div3", "fclk_div5"
+};
 
 static struct clk_mux gxbb_mpeg_clk_sel = {
 	.reg = (void *)HHI_MPEG_CLK_CNTL,
@@ -616,13 +620,12 @@ static struct clk_mux gxbb_mpeg_clk_sel = {
 		.name = "mpeg_clk_sel",
 		.ops = &clk_mux_ro_ops,
 		/*
-		 * FIXME bits 14:12 selects from 8 possible parents:
+		 * bits 14:12 selects from 8 possible parents:
 		 * xtal, 1'b0 (wtf), fclk_div7, mpll_clkout1, mpll_clkout2,
 		 * fclk_div4, fclk_div3, fclk_div5
 		 */
-		.parent_names = (const char *[]){ "fclk_div3", "fclk_div4",
-			"fclk_div5" },
-		.num_parents = 3,
+		.parent_names = clk81_parent_names,
+		.num_parents = ARRAY_SIZE(clk81_parent_names),
 		.flags = (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
 	},
 };
-- 
2.9.4
