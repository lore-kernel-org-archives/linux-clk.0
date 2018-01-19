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
Subject: [PATCH v2 2/9] clk: meson: remove useless pll rate params tables
Date: Fri, 19 Jan 2018 16:55:22 +0100
Message-Id: <20180119155529.11532-3-jbrunet@baylibre.com>
In-Reply-To: <20180119155529.11532-1-jbrunet@baylibre.com>
References: <20180119155529.11532-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Read-only plls don't need param table to recalculate the rate.
Providing them with a param table is just a waste of memory.

Remove the useless tables from sys_pll on gxbb and axg.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c  | 94 ------------------------------------------------
 drivers/clk/meson/gxbb.c | 94 ------------------------------------------------
 2 files changed, 188 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 02f4401d7bc3..56806c6bd9d5 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -21,98 +21,6 @@
 
 static DEFINE_SPINLOCK(meson_clk_lock);
 
-static const struct pll_rate_table sys_pll_rate_table[] = {
-	PLL_RATE(24000000, 56, 1, 2),
-	PLL_RATE(48000000, 64, 1, 2),
-	PLL_RATE(72000000, 72, 1, 2),
-	PLL_RATE(96000000, 64, 1, 2),
-	PLL_RATE(120000000, 80, 1, 2),
-	PLL_RATE(144000000, 96, 1, 2),
-	PLL_RATE(168000000, 56, 1, 1),
-	PLL_RATE(192000000, 64, 1, 1),
-	PLL_RATE(216000000, 72, 1, 1),
-	PLL_RATE(240000000, 80, 1, 1),
-	PLL_RATE(264000000, 88, 1, 1),
-	PLL_RATE(288000000, 96, 1, 1),
-	PLL_RATE(312000000, 52, 1, 2),
-	PLL_RATE(336000000, 56, 1, 2),
-	PLL_RATE(360000000, 60, 1, 2),
-	PLL_RATE(384000000, 64, 1, 2),
-	PLL_RATE(408000000, 68, 1, 2),
-	PLL_RATE(432000000, 72, 1, 2),
-	PLL_RATE(456000000, 76, 1, 2),
-	PLL_RATE(480000000, 80, 1, 2),
-	PLL_RATE(504000000, 84, 1, 2),
-	PLL_RATE(528000000, 88, 1, 2),
-	PLL_RATE(552000000, 92, 1, 2),
-	PLL_RATE(576000000, 96, 1, 2),
-	PLL_RATE(600000000, 50, 1, 1),
-	PLL_RATE(624000000, 52, 1, 1),
-	PLL_RATE(648000000, 54, 1, 1),
-	PLL_RATE(672000000, 56, 1, 1),
-	PLL_RATE(696000000, 58, 1, 1),
-	PLL_RATE(720000000, 60, 1, 1),
-	PLL_RATE(744000000, 62, 1, 1),
-	PLL_RATE(768000000, 64, 1, 1),
-	PLL_RATE(792000000, 66, 1, 1),
-	PLL_RATE(816000000, 68, 1, 1),
-	PLL_RATE(840000000, 70, 1, 1),
-	PLL_RATE(864000000, 72, 1, 1),
-	PLL_RATE(888000000, 74, 1, 1),
-	PLL_RATE(912000000, 76, 1, 1),
-	PLL_RATE(936000000, 78, 1, 1),
-	PLL_RATE(960000000, 80, 1, 1),
-	PLL_RATE(984000000, 82, 1, 1),
-	PLL_RATE(1008000000, 84, 1, 1),
-	PLL_RATE(1032000000, 86, 1, 1),
-	PLL_RATE(1056000000, 88, 1, 1),
-	PLL_RATE(1080000000, 90, 1, 1),
-	PLL_RATE(1104000000, 92, 1, 1),
-	PLL_RATE(1128000000, 94, 1, 1),
-	PLL_RATE(1152000000, 96, 1, 1),
-	PLL_RATE(1176000000, 98, 1, 1),
-	PLL_RATE(1200000000, 50, 1, 0),
-	PLL_RATE(1224000000, 51, 1, 0),
-	PLL_RATE(1248000000, 52, 1, 0),
-	PLL_RATE(1272000000, 53, 1, 0),
-	PLL_RATE(1296000000, 54, 1, 0),
-	PLL_RATE(1320000000, 55, 1, 0),
-	PLL_RATE(1344000000, 56, 1, 0),
-	PLL_RATE(1368000000, 57, 1, 0),
-	PLL_RATE(1392000000, 58, 1, 0),
-	PLL_RATE(1416000000, 59, 1, 0),
-	PLL_RATE(1440000000, 60, 1, 0),
-	PLL_RATE(1464000000, 61, 1, 0),
-	PLL_RATE(1488000000, 62, 1, 0),
-	PLL_RATE(1512000000, 63, 1, 0),
-	PLL_RATE(1536000000, 64, 1, 0),
-	PLL_RATE(1560000000, 65, 1, 0),
-	PLL_RATE(1584000000, 66, 1, 0),
-	PLL_RATE(1608000000, 67, 1, 0),
-	PLL_RATE(1632000000, 68, 1, 0),
-	PLL_RATE(1656000000, 68, 1, 0),
-	PLL_RATE(1680000000, 68, 1, 0),
-	PLL_RATE(1704000000, 68, 1, 0),
-	PLL_RATE(1728000000, 69, 1, 0),
-	PLL_RATE(1752000000, 69, 1, 0),
-	PLL_RATE(1776000000, 69, 1, 0),
-	PLL_RATE(1800000000, 69, 1, 0),
-	PLL_RATE(1824000000, 70, 1, 0),
-	PLL_RATE(1848000000, 70, 1, 0),
-	PLL_RATE(1872000000, 70, 1, 0),
-	PLL_RATE(1896000000, 70, 1, 0),
-	PLL_RATE(1920000000, 71, 1, 0),
-	PLL_RATE(1944000000, 71, 1, 0),
-	PLL_RATE(1968000000, 71, 1, 0),
-	PLL_RATE(1992000000, 71, 1, 0),
-	PLL_RATE(2016000000, 72, 1, 0),
-	PLL_RATE(2040000000, 72, 1, 0),
-	PLL_RATE(2064000000, 72, 1, 0),
-	PLL_RATE(2088000000, 72, 1, 0),
-	PLL_RATE(2112000000, 73, 1, 0),
-	{ /* sentinel */ },
-};
-
 static struct meson_clk_pll axg_fixed_pll = {
 	.m = {
 		.reg_off = HHI_MPLL_CNTL,
@@ -154,8 +62,6 @@ static struct meson_clk_pll axg_sys_pll = {
 		.shift   = 10,
 		.width   = 2,
 	},
-	.rate_table = sys_pll_rate_table,
-	.rate_count = ARRAY_SIZE(sys_pll_rate_table),
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll",
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 472a3cfbfbc5..2d851bad13fa 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -29,98 +29,6 @@
 
 static DEFINE_SPINLOCK(meson_clk_lock);
 
-static const struct pll_rate_table sys_pll_rate_table[] = {
-	PLL_RATE(24000000, 56, 1, 2),
-	PLL_RATE(48000000, 64, 1, 2),
-	PLL_RATE(72000000, 72, 1, 2),
-	PLL_RATE(96000000, 64, 1, 2),
-	PLL_RATE(120000000, 80, 1, 2),
-	PLL_RATE(144000000, 96, 1, 2),
-	PLL_RATE(168000000, 56, 1, 1),
-	PLL_RATE(192000000, 64, 1, 1),
-	PLL_RATE(216000000, 72, 1, 1),
-	PLL_RATE(240000000, 80, 1, 1),
-	PLL_RATE(264000000, 88, 1, 1),
-	PLL_RATE(288000000, 96, 1, 1),
-	PLL_RATE(312000000, 52, 1, 2),
-	PLL_RATE(336000000, 56, 1, 2),
-	PLL_RATE(360000000, 60, 1, 2),
-	PLL_RATE(384000000, 64, 1, 2),
-	PLL_RATE(408000000, 68, 1, 2),
-	PLL_RATE(432000000, 72, 1, 2),
-	PLL_RATE(456000000, 76, 1, 2),
-	PLL_RATE(480000000, 80, 1, 2),
-	PLL_RATE(504000000, 84, 1, 2),
-	PLL_RATE(528000000, 88, 1, 2),
-	PLL_RATE(552000000, 92, 1, 2),
-	PLL_RATE(576000000, 96, 1, 2),
-	PLL_RATE(600000000, 50, 1, 1),
-	PLL_RATE(624000000, 52, 1, 1),
-	PLL_RATE(648000000, 54, 1, 1),
-	PLL_RATE(672000000, 56, 1, 1),
-	PLL_RATE(696000000, 58, 1, 1),
-	PLL_RATE(720000000, 60, 1, 1),
-	PLL_RATE(744000000, 62, 1, 1),
-	PLL_RATE(768000000, 64, 1, 1),
-	PLL_RATE(792000000, 66, 1, 1),
-	PLL_RATE(816000000, 68, 1, 1),
-	PLL_RATE(840000000, 70, 1, 1),
-	PLL_RATE(864000000, 72, 1, 1),
-	PLL_RATE(888000000, 74, 1, 1),
-	PLL_RATE(912000000, 76, 1, 1),
-	PLL_RATE(936000000, 78, 1, 1),
-	PLL_RATE(960000000, 80, 1, 1),
-	PLL_RATE(984000000, 82, 1, 1),
-	PLL_RATE(1008000000, 84, 1, 1),
-	PLL_RATE(1032000000, 86, 1, 1),
-	PLL_RATE(1056000000, 88, 1, 1),
-	PLL_RATE(1080000000, 90, 1, 1),
-	PLL_RATE(1104000000, 92, 1, 1),
-	PLL_RATE(1128000000, 94, 1, 1),
-	PLL_RATE(1152000000, 96, 1, 1),
-	PLL_RATE(1176000000, 98, 1, 1),
-	PLL_RATE(1200000000, 50, 1, 0),
-	PLL_RATE(1224000000, 51, 1, 0),
-	PLL_RATE(1248000000, 52, 1, 0),
-	PLL_RATE(1272000000, 53, 1, 0),
-	PLL_RATE(1296000000, 54, 1, 0),
-	PLL_RATE(1320000000, 55, 1, 0),
-	PLL_RATE(1344000000, 56, 1, 0),
-	PLL_RATE(1368000000, 57, 1, 0),
-	PLL_RATE(1392000000, 58, 1, 0),
-	PLL_RATE(1416000000, 59, 1, 0),
-	PLL_RATE(1440000000, 60, 1, 0),
-	PLL_RATE(1464000000, 61, 1, 0),
-	PLL_RATE(1488000000, 62, 1, 0),
-	PLL_RATE(1512000000, 63, 1, 0),
-	PLL_RATE(1536000000, 64, 1, 0),
-	PLL_RATE(1560000000, 65, 1, 0),
-	PLL_RATE(1584000000, 66, 1, 0),
-	PLL_RATE(1608000000, 67, 1, 0),
-	PLL_RATE(1632000000, 68, 1, 0),
-	PLL_RATE(1656000000, 68, 1, 0),
-	PLL_RATE(1680000000, 68, 1, 0),
-	PLL_RATE(1704000000, 68, 1, 0),
-	PLL_RATE(1728000000, 69, 1, 0),
-	PLL_RATE(1752000000, 69, 1, 0),
-	PLL_RATE(1776000000, 69, 1, 0),
-	PLL_RATE(1800000000, 69, 1, 0),
-	PLL_RATE(1824000000, 70, 1, 0),
-	PLL_RATE(1848000000, 70, 1, 0),
-	PLL_RATE(1872000000, 70, 1, 0),
-	PLL_RATE(1896000000, 70, 1, 0),
-	PLL_RATE(1920000000, 71, 1, 0),
-	PLL_RATE(1944000000, 71, 1, 0),
-	PLL_RATE(1968000000, 71, 1, 0),
-	PLL_RATE(1992000000, 71, 1, 0),
-	PLL_RATE(2016000000, 72, 1, 0),
-	PLL_RATE(2040000000, 72, 1, 0),
-	PLL_RATE(2064000000, 72, 1, 0),
-	PLL_RATE(2088000000, 72, 1, 0),
-	PLL_RATE(2112000000, 73, 1, 0),
-	{ /* sentinel */ },
-};
-
 static const struct pll_rate_table gxbb_gp0_pll_rate_table[] = {
 	PLL_RATE(96000000, 32, 1, 3),
 	PLL_RATE(99000000, 33, 1, 3),
@@ -356,8 +264,6 @@ static struct meson_clk_pll gxbb_sys_pll = {
 		.shift   = 10,
 		.width   = 2,
 	},
-	.rate_table = sys_pll_rate_table,
-	.rate_count = ARRAY_SIZE(sys_pll_rate_table),
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll",
-- 
2.14.3
