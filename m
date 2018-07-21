Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	carlo@caione.org,
	khilman@baylibre.com,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] clk: meson: meson8b: add the CPU_DIV16 clock
Date: Sat, 21 Jul 2018 19:25:37 +0200
Message-Id: <20180721172537.15639-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180721172537.15639-1-martin.blumenstingl@googlemail.com>
References: <20180721172537.15639-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

The TWD (timer and watchdog) of the Cortex-A9 (on Meson8 and Meson8m2)
and Cortex-A9 (on Meson8b) cores is clocked by the CPU clock divided by
16. Add this new clock so the TWD timer can be added.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 12 ++++++++++++
 drivers/clk/meson/meson8b.h |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 7447d96a265f..17f56f600e09 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -633,6 +633,17 @@ static struct clk_regmap meson8b_cpu_clk = {
 	},
 };
 
+static struct clk_fixed_factor meson8b_cpu_div16_div = {
+	.mult = 1,
+	.div = 16,
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_div16_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "cpu_clk" },
+		.num_parents = 1,
+	},
+};
+
 static struct clk_regmap meson8b_nand_clk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_NAND_CLK_CNTL,
@@ -879,6 +890,7 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_NAND_SEL]	    = &meson8b_nand_clk_sel.hw,
 		[CLKID_NAND_DIV]	    = &meson8b_nand_clk_div.hw,
 		[CLKID_NAND_CLK]	    = &meson8b_nand_clk_gate.hw,
+		[CLKID_CPU_DIV16]	    = &meson8b_cpu_div16_div.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 5d09412b5084..d790991d5055 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -76,7 +76,7 @@
 #define CLKID_NAND_SEL		110
 #define CLKID_NAND_DIV		111
 
-#define CLK_NR_CLKS		113
+#define CLK_NR_CLKS		114
 
 /*
  * include the CLKID and RESETID that have
-- 
2.18.0
