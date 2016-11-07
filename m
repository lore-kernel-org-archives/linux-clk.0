Return-Path: <gabriel.fernandez@st.com>
From: <gabriel.fernandez@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>,
        Arnd Bergmann
	<arnd@arndb.de>, <daniel.thompson@linaro.org>,
        <andrea.merello@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel@stlinux.com>, <gabriel.fernandez@st.com>,
        <ludovic.barre@st.com>, <olivier.bideau@st.com>,
        <amelie.delaunay@st.com>
Subject: [PATCH 5/6] clk: stm32f4: Add SAI clocks
Date: Mon, 7 Nov 2016 14:05:42 +0100
Message-ID: <1478523943-23142-6-git-send-email-gabriel.fernandez@st.com>
In-Reply-To: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com>
References: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch introduces SAI clocks for stm32f4 socs.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 drivers/clk/clk-stm32f4.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index b7cb359..c305659 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -217,6 +217,7 @@ enum {
 	PLL_VCO_I2S, PLL_VCO_SAI,
 	CLK_LCD,
 	CLK_I2S,
+	CLK_SAI1, CLK_SAI2,
 	END_PRIMARY_CLK
 };
 
@@ -970,6 +971,9 @@ static struct clk_hw *stm32_register_cclk(struct device *dev, const char *name,
 
 static const char *i2s_parents[2] = { "plli2s-r", NULL };
 
+static const char *sai_parents[4] = { "pllsai-q-div", "plli2s-q-div", NULL,
+	"no-clock" };
+
 struct stm32f4_clk_data {
 	const struct stm32f4_gate_data *gates_data;
 	const u64 *gates_map;
@@ -1063,6 +1067,19 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 				i2s_parents, ARRAY_SIZE(i2s_parents), 0,
 				base + STM32F4_RCC_CFGR, 23, 1, 0, NULL,
 				&stm32f4_clk_lock);
+
+	sai_parents[2] = i2s_in_clk;
+
+	clks[CLK_SAI1] = clk_hw_register_mux_table(NULL, "sai1-clk",
+			sai_parents, ARRAY_SIZE(sai_parents), 0,
+			base + STM32F4_RCC_DCKCFGR, 20, 1, 0, NULL,
+			&stm32f4_clk_lock);
+
+	clks[CLK_SAI2] = clk_hw_register_mux_table(NULL, "sai2-clk",
+			sai_parents, ARRAY_SIZE(sai_parents), 0,
+			base + STM32F4_RCC_DCKCFGR, 22, 1, 0, NULL,
+			&stm32f4_clk_lock);
+
 	sys_parents[1] = hse_clk;
 	clk_register_mux_table(
 	    NULL, "sys", sys_parents, ARRAY_SIZE(sys_parents), 0,
-- 
1.9.1
