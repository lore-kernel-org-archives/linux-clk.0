Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: shawn.guo@linaro.org,
	jason.liu@linaro.org,
	wan.zhijun@zte.com.cn,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2 2/3] clk: zx: Add audio and GPIO clock for zx296702
Date: Thu, 23 Jul 2015 15:02:52 +0800
Message-Id: <1437634973-27347-3-git-send-email-jun.nie@linaro.org>
In-Reply-To: <1437634973-27347-1-git-send-email-jun.nie@linaro.org>
References: <1437634973-27347-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add SPDIF/I2S and GPIO clock for zx296702

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/zte/clk-zx296702.c             | 92 +++++++++++++++++++++++++++++-
 include/dt-bindings/clock/zx296702-clock.h | 17 +++++-
 2 files changed, 105 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/zte/clk-zx296702.c b/drivers/clk/zte/clk-zx296702.c
index 929d033..9dcac73 100644
--- a/drivers/clk/zte/clk-zx296702.c
+++ b/drivers/clk/zte/clk-zx296702.c
@@ -36,10 +36,21 @@ static struct clk_onecell_data lsp1clk_data;
 #define CLK_MUX1		(topcrm_base + 0x8c)
 
 #define CLK_SDMMC1		(lsp0crpm_base + 0x0c)
+#define CLK_GPIO		(lsp0crpm_base + 0x2c)
+#define CLK_SPDIF0		(lsp0crpm_base + 0x10)
+#define SPDIF0_DIV		(lsp0crpm_base + 0x14)
+#define CLK_I2S0		(lsp0crpm_base + 0x18)
+#define I2S0_DIV		(lsp0crpm_base + 0x1c)
+#define CLK_I2S1		(lsp0crpm_base + 0x20)
+#define I2S1_DIV		(lsp0crpm_base + 0x24)
+#define CLK_I2S2		(lsp0crpm_base + 0x34)
+#define I2S2_DIV		(lsp0crpm_base + 0x38)
 
 #define CLK_UART0		(lsp1crpm_base + 0x20)
 #define CLK_UART1		(lsp1crpm_base + 0x24)
 #define CLK_SDMMC0		(lsp1crpm_base + 0x2c)
+#define CLK_SPDIF1		(lsp1crpm_base + 0x30)
+#define SPDIF1_DIV		(lsp1crpm_base + 0x34)
 
 static const struct zx_pll_config pll_a9_config[] = {
 	{ .rate = 700000000, .cfg0 = 0x800405d1, .cfg1 = 0x04555555 },
@@ -170,6 +181,21 @@ static const char * uart_wclk_sel[] = {
 	"lsp1_26M_wclk",
 };
 
+static const char * spdif0_wclk_sel[] = {
+	"lsp0_104M_wclk",
+	"lsp0_26M_wclk",
+};
+
+static const char * spdif1_wclk_sel[] = {
+	"lsp1_104M_wclk",
+	"lsp1_26M_wclk",
+};
+
+static const char * i2s_wclk_sel[] = {
+	"lsp0_104M_wclk",
+	"lsp0_26M_wclk",
+};
+
 static inline struct clk *zx_divtbl(const char *name, const char *parent,
 				    void __iomem *reg, u8 shift, u8 width,
 				    const struct clk_div_table *table)
@@ -196,7 +222,7 @@ static inline struct clk *zx_gate(const char *name, const char *parent,
 				  void __iomem *reg, u8 shift)
 {
 	return clk_register_gate(NULL, name, parent, CLK_IGNORE_UNUSED,
-				 reg, shift, 0, &reg_lock);
+				 reg, shift, CLK_SET_RATE_PARENT, &reg_lock);
 }
 
 static void __init zx296702_top_clocks_init(struct device_node *np)
@@ -585,7 +611,57 @@ static void __init zx296702_lsp0_clocks_init(struct device_node *np)
 	clk[ZX296702_SDMMC1_WCLK] =
 		zx_gate("sdmmc1_wclk", "sdmmc1_wclk_div", CLK_SDMMC1, 1);
 	clk[ZX296702_SDMMC1_PCLK] =
-		zx_gate("sdmmc1_pclk", "lsp1_apb_pclk", CLK_SDMMC1, 0);
+		zx_gate("sdmmc1_pclk", "lsp0_apb_pclk", CLK_SDMMC1, 0);
+
+	clk[ZX296702_GPIO_CLK] =
+		zx_gate("gpio_clk", "lsp0_apb_pclk", CLK_GPIO, 0);
+
+	/* SPDIF */
+	clk[ZX296702_SPDIF0_WCLK_MUX] =
+		zx_mux("spdif0_wclk_mux", spdif0_wclk_sel,
+				ARRAY_SIZE(spdif0_wclk_sel), CLK_SPDIF0, 4, 1);
+	clk[ZX296702_SPDIF0_WCLK] =
+		zx_gate("spdif0_wclk", "spdif0_wclk_mux", CLK_SPDIF0, 1);
+	clk[ZX296702_SPDIF0_PCLK] =
+		zx_gate("spdif0_pclk", "lsp0_apb_pclk", CLK_SPDIF0, 0);
+
+	clk[ZX296702_SPDIF0_DIV] =
+		clk_register_zx_audio("spdif0_div", "spdif0_wclk", 0,
+				SPDIF0_DIV);
+
+	/* I2S */
+	clk[ZX296702_I2S0_WCLK_MUX] =
+		zx_mux("i2s0_wclk_mux", i2s_wclk_sel,
+				ARRAY_SIZE(i2s_wclk_sel), CLK_I2S0, 4, 1);
+	clk[ZX296702_I2S0_WCLK] =
+		zx_gate("i2s0_wclk", "i2s0_wclk_mux", CLK_I2S0, 1);
+	clk[ZX296702_I2S0_PCLK] =
+		zx_gate("i2s0_pclk", "lsp0_apb_pclk", CLK_I2S0, 0);
+
+	clk[ZX296702_I2S0_DIV] =
+		clk_register_zx_audio("i2s0_div", "i2s0_wclk", 0, I2S0_DIV);
+
+	clk[ZX296702_I2S1_WCLK_MUX] =
+		zx_mux("i2s1_wclk_mux", i2s_wclk_sel,
+				ARRAY_SIZE(i2s_wclk_sel), CLK_I2S1, 4, 1);
+	clk[ZX296702_I2S1_WCLK] =
+		zx_gate("i2s1_wclk", "i2s1_wclk_mux", CLK_I2S1, 1);
+	clk[ZX296702_I2S1_PCLK] =
+		zx_gate("i2s1_pclk", "lsp0_apb_pclk", CLK_I2S1, 0);
+
+	clk[ZX296702_I2S1_DIV] =
+		clk_register_zx_audio("i2s1_div", "i2s1_wclk", 0, I2S1_DIV);
+
+	clk[ZX296702_I2S2_WCLK_MUX] =
+		zx_mux("i2s2_wclk_mux", i2s_wclk_sel,
+				ARRAY_SIZE(i2s_wclk_sel), CLK_I2S2, 4, 1);
+	clk[ZX296702_I2S2_WCLK] =
+		zx_gate("i2s2_wclk", "i2s2_wclk_mux", CLK_I2S2, 1);
+	clk[ZX296702_I2S2_PCLK] =
+		zx_gate("i2s2_pclk", "lsp0_apb_pclk", CLK_I2S2, 0);
+
+	clk[ZX296702_I2S2_DIV] =
+		clk_register_zx_audio("i2s2_div", "i2s2_wclk", 0, I2S2_DIV);
 
 	for (i = 0; i < ARRAY_SIZE(lsp0clk); i++) {
 		if (IS_ERR(clk[i])) {
@@ -641,6 +717,18 @@ static void __init zx296702_lsp1_clocks_init(struct device_node *np)
 	clk[ZX296702_SDMMC0_PCLK] =
 		zx_gate("sdmmc0_pclk", "lsp1_apb_pclk", CLK_SDMMC0, 0);
 
+	clk[ZX296702_SPDIF1_WCLK_MUX] =
+		zx_mux("spdif1_wclk_mux", spdif1_wclk_sel,
+				ARRAY_SIZE(spdif1_wclk_sel), CLK_SPDIF1, 4, 1);
+	clk[ZX296702_SPDIF1_WCLK] =
+		zx_gate("spdif1_wclk", "spdif1_wclk_mux", CLK_SPDIF1, 1);
+	clk[ZX296702_SPDIF1_PCLK] =
+		zx_gate("spdif1_pclk", "lsp1_apb_pclk", CLK_SPDIF1, 0);
+
+	clk[ZX296702_SPDIF1_DIV] =
+		clk_register_zx_audio("spdif1_div", "spdif1_wclk", 0,
+				SPDIF1_DIV);
+
 	for (i = 0; i < ARRAY_SIZE(lsp1clk); i++) {
 		if (IS_ERR(clk[i])) {
 			pr_err("zx296702 clk %d: register failed with %ld\n",
diff --git a/include/dt-bindings/clock/zx296702-clock.h b/include/dt-bindings/clock/zx296702-clock.h
index e683dbb..26ee564 100644
--- a/include/dt-bindings/clock/zx296702-clock.h
+++ b/include/dt-bindings/clock/zx296702-clock.h
@@ -153,7 +153,16 @@
 #define ZX296702_I2S0_WCLK			9
 #define ZX296702_I2S0_PCLK			10
 #define ZX296702_I2S0_DIV			11
-#define ZX296702_LSP0CLK_END			12
+#define ZX296702_I2S1_WCLK_MUX			12
+#define ZX296702_I2S1_WCLK			13
+#define ZX296702_I2S1_PCLK			14
+#define ZX296702_I2S1_DIV			15
+#define ZX296702_I2S2_WCLK_MUX			16
+#define ZX296702_I2S2_WCLK			17
+#define ZX296702_I2S2_PCLK			18
+#define ZX296702_I2S2_DIV			19
+#define ZX296702_GPIO_CLK			20
+#define ZX296702_LSP0CLK_END			21
 
 #define ZX296702_UART0_WCLK_MUX			0
 #define ZX296702_UART0_WCLK			1
@@ -165,6 +174,10 @@
 #define ZX296702_SDMMC0_WCLK_DIV		7
 #define ZX296702_SDMMC0_WCLK			8
 #define ZX296702_SDMMC0_PCLK			9
-#define ZX296702_LSP1CLK_END			10
+#define ZX296702_SPDIF1_WCLK_MUX		10
+#define ZX296702_SPDIF1_WCLK			11
+#define ZX296702_SPDIF1_PCLK			12
+#define ZX296702_SPDIF1_DIV			13
+#define ZX296702_LSP1CLK_END			14
 
 #endif /* __DT_BINDINGS_CLOCK_ZX296702_H */
-- 
1.9.1
