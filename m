Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 05/11] =?UTF-8?q?clk:=20qcom:=20ipq8074:=20add=20remaining?= =?UTF-8?q?=20PLL=E2=80=99s?=
Date: Tue, 26 Sep 2017 17:53:58 +0530
Message-Id: <1506428644-2996-6-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506428644-2996-1-git-send-email-absahu@codeaurora.org>
References: <1506428644-2996-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

- GPLL2, GPLL4 and GPLL6 are general PLL clocks and parent
  for all core peripherals.
- UBI PLL is mainly used by NSS (Network Switching System).
  IPQ8074 has 2 instances of NSS UBI cores and UBI PLL will
  be used to control the core frequency.
- NSS Crypto PLL is mainly used by NSS Crypto Engine which
  supports the multiple cryptographic algorithm used in
  Ethernet.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 178 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index f9b6d51..3af8f86 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -93,6 +93,173 @@ enum {
 	},
 };
 
+static struct clk_alpha_pll gpll2_main = {
+	.offset = 0x4a000,
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll2_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll2 = {
+	.offset = 0x4a000,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll2",
+		.parent_names = (const char *[]){
+			"gpll2_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll gpll4_main = {
+	.offset = 0x24000,
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll4_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll4 = {
+	.offset = 0x24000,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4",
+		.parent_names = (const char *[]){
+			"gpll4_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll gpll6_main = {
+	.offset = 0x37000,
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll6_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll6 = {
+	.offset = 0x37000,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll6",
+		.parent_names = (const char *[]){
+			"gpll6_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor gpll6_out_main_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll6_out_main_div2",
+		.parent_names = (const char *[]){
+			"gpll6_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll ubi32_pll_main = {
+	.offset = 0x25000,
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "ubi32_pll_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv ubi32_pll = {
+	.offset = 0x25000,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ubi32_pll",
+		.parent_names = (const char *[]){
+			"ubi32_pll_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll nss_crypto_pll_main = {
+	.offset = 0x22000,
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_crypto_pll_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv nss_crypto_pll = {
+	.offset = 0x22000,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_crypto_pll",
+		.parent_names = (const char *[]){
+			"nss_crypto_pll_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -806,12 +973,23 @@ enum {
 
 static struct clk_hw *gcc_ipq8074_hws[] = {
 	&gpll0_out_main_div2.hw,
+	&gpll6_out_main_div2.hw,
 	&pcnoc_clk_src.hw,
 };
 
 static struct clk_regmap *gcc_ipq8074_clks[] = {
 	[GPLL0_MAIN] = &gpll0_main.clkr,
 	[GPLL0] = &gpll0.clkr,
+	[GPLL2_MAIN] = &gpll2_main.clkr,
+	[GPLL2] = &gpll2.clkr,
+	[GPLL4_MAIN] = &gpll4_main.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[GPLL6_MAIN] = &gpll6_main.clkr,
+	[GPLL6] = &gpll6.clkr,
+	[UBI32_PLL_MAIN] = &ubi32_pll_main.clkr,
+	[UBI32_PLL] = &ubi32_pll.clkr,
+	[NSS_CRYPTO_PLL_MAIN] = &nss_crypto_pll_main.clkr,
+	[NSS_CRYPTO_PLL] = &nss_crypto_pll.clkr,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
 	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
