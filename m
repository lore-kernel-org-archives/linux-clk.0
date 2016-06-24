Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] clk: mdm9615: Add support for MDM9615 Clock Controllers
Date: Fri, 24 Jun 2016 11:18:31 +0200
Message-Id: <1466759912-25551-3-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1466759912-25551-1-git-send-email-narmstrong@baylibre.com>
References: <1466759912-25551-1-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

In order to support the Qualcomm MDM9615 SoC, add support for
the Global and LPASS Clock Controllers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/qcom/Kconfig       |   17 +
 drivers/clk/qcom/Makefile      |    2 +
 drivers/clk/qcom/gcc-mdm9615.c | 1727 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/lcc-mdm9615.c |  580 ++++++++++++++
 4 files changed, 2326 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-mdm9615.c
 create mode 100644 drivers/clk/qcom/lcc-mdm9615.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 95e3b3e..1e7c86f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -87,6 +87,23 @@ config MSM_LCC_8960
 	  Say Y if you want to use audio devices such as i2s, pcm,
 	  SLIMBus, etc.
 
+config MDM_GCC_9615
+	tristate "MDM9615 Global Clock Controller"
+	depends on COMMON_CLK_QCOM
+	help
+	  Support for the global clock controller on mdm9615 devices.
+	  Say Y if you want to use peripheral devices such as UART, SPI,
+	  i2c, USB, SD/eMMC, etc.
+
+config MDM_LCC_9615
+	tristate "MDM9615 LPASS Clock Controller"
+	select MDM_GCC_9615
+	depends on COMMON_CLK_QCOM
+	help
+	  Support for the LPASS clock controller on mdm9615 devices.
+	  Say Y if you want to use audio devices such as i2s, pcm,
+	  SLIMBus, etc.
+
 config MSM_MMCC_8960
 	tristate "MSM8960 Multimedia Clock Controller"
 	select MSM_GCC_8960
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 2a25f4e..15ab44e 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -26,3 +26,5 @@ obj-$(CONFIG_MSM_GCC_8996) += gcc-msm8996.o
 obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
+obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
+obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
new file mode 100644
index 0000000..0f648fc
--- /dev/null
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -0,0 +1,1727 @@
+/*
+ * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) BayLibre, SAS.
+ * Author : Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/clock/qcom,gcc-mdm9615.h>
+#include <dt-bindings/reset/qcom,gcc-mdm9615.h>
+
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-branch.h"
+#include "reset.h"
+
+static struct clk_fixed_factor cxo = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "cxo",
+		.parent_names = (const char *[]){ "cxo_board" },
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_pll pll0 = {
+	.l_reg = 0x30c4,
+	.m_reg = 0x30c8,
+	.n_reg = 0x30cc,
+	.config_reg = 0x30d4,
+	.mode_reg = 0x30c0,
+	.status_reg = 0x30d8,
+	.status_bit = 16,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pll0",
+		.parent_names = (const char *[]){ "cxo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap pll0_vote = {
+	.enable_reg = 0x34c0,
+	.enable_mask = BIT(0),
+	.hw.init = &(struct clk_init_data){
+		.name = "pll0_vote",
+		.parent_names = (const char *[]){ "pll8" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_regmap pll4_vote = {
+	.enable_reg = 0x34c0,
+	.enable_mask = BIT(4),
+	.hw.init = &(struct clk_init_data){
+		.name = "pll4_vote",
+		.parent_names = (const char *[]){ "pll4" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll pll8 = {
+	.l_reg = 0x3144,
+	.m_reg = 0x3148,
+	.n_reg = 0x314c,
+	.config_reg = 0x3154,
+	.mode_reg = 0x3140,
+	.status_reg = 0x3158,
+	.status_bit = 16,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pll8",
+		.parent_names = (const char *[]){ "cxo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap pll8_vote = {
+	.enable_reg = 0x34c0,
+	.enable_mask = BIT(8),
+	.hw.init = &(struct clk_init_data){
+		.name = "pll8_vote",
+		.parent_names = (const char *[]){ "pll8" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll pll14 = {
+	.l_reg = 0x31c4,
+	.m_reg = 0x31c8,
+	.n_reg = 0x31cc,
+	.config_reg = 0x31d4,
+	.mode_reg = 0x31c0,
+	.status_reg = 0x31d8,
+	.status_bit = 16,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pll14",
+		.parent_names = (const char *[]){ "cxo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap pll14_vote = {
+	.enable_reg = 0x34c0,
+	.enable_mask = BIT(11),
+	.hw.init = &(struct clk_init_data){
+		.name = "pll14_vote",
+		.parent_names = (const char *[]){ "pll14" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+enum {
+	P_CXO,
+	P_PLL8,
+	P_PLL14,
+};
+
+static const struct parent_map gcc_cxo_pll8_map[] = {
+	{ P_CXO, 0 },
+	{ P_PLL8, 3 }
+};
+
+static const char * const gcc_cxo_pll8[] = {
+	"cxo",
+	"pll8_vote",
+};
+
+static const struct parent_map gcc_cxo_pll14_map[] = {
+	{ P_CXO, 0 },
+	{ P_PLL14, 4 }
+};
+
+static const char * const gcc_cxo_pll14[] = {
+	"cxo",
+	"pll14_vote",
+};
+
+static const struct parent_map gcc_cxo_map[] = {
+	{ P_CXO, 0 },
+};
+
+static const char * const gcc_cxo[] = {
+	"cxo",
+};
+
+static struct freq_tbl clk_tbl_gsbi_uart[] = {
+	{  1843200, P_PLL8, 2,  6, 625 },
+	{  3686400, P_PLL8, 2, 12, 625 },
+	{  7372800, P_PLL8, 2, 24, 625 },
+	{ 14745600, P_PLL8, 2, 48, 625 },
+	{ 16000000, P_PLL8, 4,  1,   6 },
+	{ 24000000, P_PLL8, 4,  1,   4 },
+	{ 32000000, P_PLL8, 4,  1,   3 },
+	{ 40000000, P_PLL8, 1,  5,  48 },
+	{ 46400000, P_PLL8, 1, 29, 240 },
+	{ 48000000, P_PLL8, 4,  1,   2 },
+	{ 51200000, P_PLL8, 1,  2,  15 },
+	{ 56000000, P_PLL8, 1,  7,  48 },
+	{ 58982400, P_PLL8, 1, 96, 625 },
+	{ 64000000, P_PLL8, 2,  1,   3 },
+	{ }
+};
+
+static struct clk_rcg gsbi1_uart_src = {
+	.ns_reg = 0x29d4,
+	.md_reg = 0x29d0,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 16,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_uart,
+	.clkr = {
+		.enable_reg = 0x29d4,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi1_uart_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi1_uart_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 10,
+	.clkr = {
+		.enable_reg = 0x29d4,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi1_uart_clk",
+			.parent_names = (const char *[]){
+				"gsbi1_uart_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gsbi2_uart_src = {
+	.ns_reg = 0x29f4,
+	.md_reg = 0x29f0,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 16,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_uart,
+	.clkr = {
+		.enable_reg = 0x29f4,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi2_uart_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi2_uart_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 6,
+	.clkr = {
+		.enable_reg = 0x29f4,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi2_uart_clk",
+			.parent_names = (const char *[]){
+				"gsbi2_uart_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gsbi3_uart_src = {
+	.ns_reg = 0x2a14,
+	.md_reg = 0x2a10,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 16,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_uart,
+	.clkr = {
+		.enable_reg = 0x2a14,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi3_uart_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi3_uart_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 2,
+	.clkr = {
+		.enable_reg = 0x2a14,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi3_uart_clk",
+			.parent_names = (const char *[]){
+				"gsbi3_uart_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gsbi4_uart_src = {
+	.ns_reg = 0x2a34,
+	.md_reg = 0x2a30,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 16,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_uart,
+	.clkr = {
+		.enable_reg = 0x2a34,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi4_uart_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi4_uart_clk = {
+	.halt_reg = 0x2fd0,
+	.halt_bit = 26,
+	.clkr = {
+		.enable_reg = 0x2a34,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi4_uart_clk",
+			.parent_names = (const char *[]){
+				"gsbi4_uart_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gsbi5_uart_src = {
+	.ns_reg = 0x2a54,
+	.md_reg = 0x2a50,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 16,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_uart,
+	.clkr = {
+		.enable_reg = 0x2a54,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi5_uart_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi5_uart_clk = {
+	.halt_reg = 0x2fd0,
+	.halt_bit = 22,
+	.clkr = {
+		.enable_reg = 0x2a54,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi5_uart_clk",
+			.parent_names = (const char *[]){
+				"gsbi5_uart_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct freq_tbl clk_tbl_gsbi_qup[] = {
+	{   960000, P_CXO,  4, 1,  5 },
+	{  4800000, P_CXO,  4, 0,  1 },
+	{  9600000, P_CXO,  2, 0,  1 },
+	{ 15060000, P_PLL8, 1, 2, 51 },
+	{ 24000000, P_PLL8, 4, 1,  4 },
+	{ 25600000, P_PLL8, 1, 1, 15 },
+	{ 48000000, P_PLL8, 4, 1,  2 },
+	{ 51200000, P_PLL8, 1, 2, 15 },
+	{ }
+};
+
+static struct clk_rcg gsbi1_qup_src = {
+	.ns_reg = 0x29cc,
+	.md_reg = 0x29c8,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_qup,
+	.clkr = {
+		.enable_reg = 0x29cc,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi1_qup_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi1_qup_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 9,
+	.clkr = {
+		.enable_reg = 0x29cc,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi1_qup_clk",
+			.parent_names = (const char *[]){ "gsbi1_qup_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gsbi2_qup_src = {
+	.ns_reg = 0x29ec,
+	.md_reg = 0x29e8,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_qup,
+	.clkr = {
+		.enable_reg = 0x29ec,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi2_qup_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi2_qup_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 4,
+	.clkr = {
+		.enable_reg = 0x29ec,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi2_qup_clk",
+			.parent_names = (const char *[]){ "gsbi2_qup_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gsbi3_qup_src = {
+	.ns_reg = 0x2a0c,
+	.md_reg = 0x2a08,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_qup,
+	.clkr = {
+		.enable_reg = 0x2a0c,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi3_qup_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi3_qup_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 0,
+	.clkr = {
+		.enable_reg = 0x2a0c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi3_qup_clk",
+			.parent_names = (const char *[]){ "gsbi3_qup_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gsbi4_qup_src = {
+	.ns_reg = 0x2a2c,
+	.md_reg = 0x2a28,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_qup,
+	.clkr = {
+		.enable_reg = 0x2a2c,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi4_qup_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi4_qup_clk = {
+	.halt_reg = 0x2fd0,
+	.halt_bit = 24,
+	.clkr = {
+		.enable_reg = 0x2a2c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi4_qup_clk",
+			.parent_names = (const char *[]){ "gsbi4_qup_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gsbi5_qup_src = {
+	.ns_reg = 0x2a4c,
+	.md_reg = 0x2a48,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_gsbi_qup,
+	.clkr = {
+		.enable_reg = 0x2a4c,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi5_qup_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	},
+};
+
+static struct clk_branch gsbi5_qup_clk = {
+	.halt_reg = 0x2fd0,
+	.halt_bit = 20,
+	.clkr = {
+		.enable_reg = 0x2a4c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi5_qup_clk",
+			.parent_names = (const char *[]){ "gsbi5_qup_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl clk_tbl_gp[] = {
+	{ 9600000, P_CXO,  2, 0, 0 },
+	{ 19200000, P_CXO,  1, 0, 0 },
+	{ }
+};
+
+static struct clk_rcg gp0_src = {
+	.ns_reg = 0x2d24,
+	.md_reg = 0x2d00,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_map,
+	},
+	.freq_tbl = clk_tbl_gp,
+	.clkr = {
+		.enable_reg = 0x2d24,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gp0_src",
+			.parent_names = gcc_cxo,
+			.num_parents = 1,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_PARENT_GATE,
+		},
+	}
+};
+
+static struct clk_branch gp0_clk = {
+	.halt_reg = 0x2fd8,
+	.halt_bit = 7,
+	.clkr = {
+		.enable_reg = 0x2d24,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gp0_clk",
+			.parent_names = (const char *[]){ "gp0_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gp1_src = {
+	.ns_reg = 0x2d44,
+	.md_reg = 0x2d40,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_map,
+	},
+	.freq_tbl = clk_tbl_gp,
+	.clkr = {
+		.enable_reg = 0x2d44,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gp1_src",
+			.parent_names = gcc_cxo,
+			.num_parents = 1,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch gp1_clk = {
+	.halt_reg = 0x2fd8,
+	.halt_bit = 6,
+	.clkr = {
+		.enable_reg = 0x2d44,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gp1_clk",
+			.parent_names = (const char *[]){ "gp1_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg gp2_src = {
+	.ns_reg = 0x2d64,
+	.md_reg = 0x2d60,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_map,
+	},
+	.freq_tbl = clk_tbl_gp,
+	.clkr = {
+		.enable_reg = 0x2d64,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "gp2_src",
+			.parent_names = gcc_cxo,
+			.num_parents = 1,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch gp2_clk = {
+	.halt_reg = 0x2fd8,
+	.halt_bit = 5,
+	.clkr = {
+		.enable_reg = 0x2d64,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gp2_clk",
+			.parent_names = (const char *[]){ "gp2_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch pmem_clk = {
+	.hwcg_reg = 0x25a0,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fc8,
+	.halt_bit = 20,
+	.clkr = {
+		.enable_reg = 0x25a0,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "pmem_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_rcg prng_src = {
+	.ns_reg = 0x2e80,
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 4,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "prng_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+		},
+	},
+};
+
+static struct clk_branch prng_clk = {
+	.halt_reg = 0x2fd8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.halt_bit = 10,
+	.clkr = {
+		.enable_reg = 0x3080,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "prng_clk",
+			.parent_names = (const char *[]){ "prng_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static const struct freq_tbl clk_tbl_sdc[] = {
+	{    144000, P_CXO,   1, 1, 133 },
+	{    400000, P_PLL8,  4, 1, 240 },
+	{  16000000, P_PLL8,  4, 1,   6 },
+	{  17070000, P_PLL8,  1, 2,  45 },
+	{  20210000, P_PLL8,  1, 1,  19 },
+	{  24000000, P_PLL8,  4, 1,   4 },
+	{  38400000, P_PLL8,  2, 1,   5 },
+	{  48000000, P_PLL8,  4, 1,   2 },
+	{  64000000, P_PLL8,  3, 1,   2 },
+	{  76800000, P_PLL8,  1, 1,   5 },
+	{ }
+};
+
+static struct clk_rcg sdc1_src = {
+	.ns_reg = 0x282c,
+	.md_reg = 0x2828,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_sdc,
+	.clkr = {
+		.enable_reg = 0x282c,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "sdc1_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch sdc1_clk = {
+	.halt_reg = 0x2fc8,
+	.halt_bit = 6,
+	.clkr = {
+		.enable_reg = 0x282c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "sdc1_clk",
+			.parent_names = (const char *[]){ "sdc1_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg sdc2_src = {
+	.ns_reg = 0x284c,
+	.md_reg = 0x2848,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_sdc,
+	.clkr = {
+		.enable_reg = 0x284c,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "sdc2_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch sdc2_clk = {
+	.halt_reg = 0x2fc8,
+	.halt_bit = 5,
+	.clkr = {
+		.enable_reg = 0x284c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "sdc2_clk",
+			.parent_names = (const char *[]){ "sdc2_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl clk_tbl_usb[] = {
+	{ 60000000, P_PLL8, 1, 5, 32 },
+	{ }
+};
+
+static struct clk_rcg usb_hs1_xcvr_src = {
+	.ns_reg = 0x290c,
+	.md_reg = 0x2908,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_usb,
+	.clkr = {
+		.enable_reg = 0x290c,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hs1_xcvr_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch usb_hs1_xcvr_clk = {
+	.halt_reg = 0x2fc8,
+	.halt_bit = 0,
+	.clkr = {
+		.enable_reg = 0x290c,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hs1_xcvr_clk",
+			.parent_names = (const char *[]){ "usb_hs1_xcvr_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg usb_hsic_xcvr_fs_src = {
+	.ns_reg = 0x2928,
+	.md_reg = 0x2924,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_usb,
+	.clkr = {
+		.enable_reg = 0x2928,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hsic_xcvr_fs_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch usb_hsic_xcvr_fs_clk = {
+	.halt_reg = 0x2fc8,
+	.halt_bit = 9,
+	.clkr = {
+		.enable_reg = 0x2928,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hsic_xcvr_fs_clk",
+			.parent_names =
+				(const char *[]){ "usb_hsic_xcvr_fs_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl clk_tbl_usb_hs1_system[] = {
+	{ 60000000, P_PLL8, 1, 5, 32 },
+	{ }
+};
+
+static struct clk_rcg usb_hs1_system_src = {
+	.ns_reg = 0x36a4,
+	.md_reg = 0x36a0,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_usb_hs1_system,
+	.clkr = {
+		.enable_reg = 0x36a4,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hs1_system_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch usb_hs1_system_clk = {
+	.halt_reg = 0x2fc8,
+	.halt_bit = 4,
+	.clkr = {
+		.enable_reg = 0x36a4,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.parent_names =
+				(const char *[]){ "usb_hs1_system_src" },
+			.num_parents = 1,
+			.name = "usb_hs1_system_clk",
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static const struct freq_tbl clk_tbl_usb_hsic_system[] = {
+	{ 64000000, P_PLL8, 1, 1, 6 },
+	{ }
+};
+
+static struct clk_rcg usb_hsic_system_src = {
+	.ns_reg = 0x2b58,
+	.md_reg = 0x2b54,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll8_map,
+	},
+	.freq_tbl = clk_tbl_usb_hsic_system,
+	.clkr = {
+		.enable_reg = 0x2b58,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hsic_system_src",
+			.parent_names = gcc_cxo_pll8,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch usb_hsic_system_clk = {
+	.halt_reg = 0x2fc8,
+	.halt_bit = 7,
+	.clkr = {
+		.enable_reg = 0x2b58,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.parent_names =
+				(const char *[]){ "usb_hsic_system_src" },
+			.num_parents = 1,
+			.name = "usb_hsic_system_clk",
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl clk_tbl_usb_hsic_hsic[] = {
+	{ 48000000, P_PLL14, 1, 0, 0 },
+	{ }
+};
+
+static struct clk_rcg usb_hsic_hsic_src = {
+	.ns_reg = 0x2b50,
+	.md_reg = 0x2b4c,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = gcc_cxo_pll14_map,
+	},
+	.freq_tbl = clk_tbl_usb_hsic_hsic,
+	.clkr = {
+		.enable_reg = 0x2b50,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hsic_hsic_src",
+			.parent_names = gcc_cxo_pll14,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	}
+};
+
+static struct clk_branch usb_hsic_hsic_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2b50,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.parent_names = (const char *[]){ "usb_hsic_hsic_src" },
+			.num_parents = 1,
+			.name = "usb_hsic_hsic_clk",
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch usb_hsic_hsio_cal_clk = {
+	.halt_reg = 0x2fc8,
+	.halt_bit = 8,
+	.clkr = {
+		.enable_reg = 0x2b48,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.name = "usb_hsic_hsio_cal_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch ce1_core_clk = {
+	.hwcg_reg = 0x2724,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fd4,
+	.halt_bit = 27,
+	.clkr = {
+		.enable_reg = 0x2724,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "ce1_core_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch ce1_h_clk = {
+	.halt_reg = 0x2fd4,
+	.halt_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2720,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "ce1_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch dma_bam_h_clk = {
+	.hwcg_reg = 0x25c0,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fc8,
+	.halt_bit = 12,
+	.clkr = {
+		.enable_reg = 0x25c0,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "dma_bam_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch gsbi1_h_clk = {
+	.hwcg_reg = 0x29c0,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fcc,
+	.halt_bit = 11,
+	.clkr = {
+		.enable_reg = 0x29c0,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi1_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch gsbi2_h_clk = {
+	.hwcg_reg = 0x29e0,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fcc,
+	.halt_bit = 7,
+	.clkr = {
+		.enable_reg = 0x29e0,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi2_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch gsbi3_h_clk = {
+	.hwcg_reg = 0x2a00,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fcc,
+	.halt_bit = 3,
+	.clkr = {
+		.enable_reg = 0x2a00,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi3_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch gsbi4_h_clk = {
+	.hwcg_reg = 0x2a20,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fd0,
+	.halt_bit = 27,
+	.clkr = {
+		.enable_reg = 0x2a20,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi4_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch gsbi5_h_clk = {
+	.hwcg_reg = 0x2a40,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fd0,
+	.halt_bit = 23,
+	.clkr = {
+		.enable_reg = 0x2a40,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gsbi5_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch usb_hs1_h_clk = {
+	.hwcg_reg = 0x2900,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fc8,
+	.halt_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2900,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hs1_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch usb_hsic_h_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 28,
+	.clkr = {
+		.enable_reg = 0x2920,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "usb_hsic_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch sdc1_h_clk = {
+	.hwcg_reg = 0x2820,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fc8,
+	.halt_bit = 11,
+	.clkr = {
+		.enable_reg = 0x2820,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "sdc1_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch sdc2_h_clk = {
+	.hwcg_reg = 0x2840,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fc8,
+	.halt_bit = 10,
+	.clkr = {
+		.enable_reg = 0x2840,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "sdc2_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch adm0_clk = {
+	.halt_reg = 0x2fdc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.halt_bit = 14,
+	.clkr = {
+		.enable_reg = 0x3080,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "adm0_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch adm0_pbus_clk = {
+	.hwcg_reg = 0x2208,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fdc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.halt_bit = 13,
+	.clkr = {
+		.enable_reg = 0x3080,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "adm0_pbus_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch pmic_arb0_h_clk = {
+	.halt_reg = 0x2fd8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.halt_bit = 22,
+	.clkr = {
+		.enable_reg = 0x3080,
+		.enable_mask = BIT(8),
+		.hw.init = &(struct clk_init_data){
+			.name = "pmic_arb0_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch pmic_arb1_h_clk = {
+	.halt_reg = 0x2fd8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.halt_bit = 21,
+	.clkr = {
+		.enable_reg = 0x3080,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "pmic_arb1_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch pmic_ssbi2_clk = {
+	.halt_reg = 0x2fd8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.halt_bit = 23,
+	.clkr = {
+		.enable_reg = 0x3080,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "pmic_ssbi2_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch rpm_msg_ram_h_clk = {
+	.hwcg_reg = 0x27e0,
+	.hwcg_bit = 6,
+	.halt_reg = 0x2fd8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.halt_bit = 12,
+	.clkr = {
+		.enable_reg = 0x3080,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "rpm_msg_ram_h_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_hw *gcc_mdm9615_hws[] = {
+	&cxo.hw,
+};
+
+static struct clk_regmap *gcc_mdm9615_clks[] = {
+	[PLL0] = &pll0.clkr,
+	[PLL0_VOTE] = &pll0_vote,
+	[PLL4_VOTE] = &pll4_vote,
+	[PLL8] = &pll8.clkr,
+	[PLL8_VOTE] = &pll8_vote,
+	[PLL14] = &pll14.clkr,
+	[PLL14_VOTE] = &pll14_vote,
+	[GSBI1_UART_SRC] = &gsbi1_uart_src.clkr,
+	[GSBI1_UART_CLK] = &gsbi1_uart_clk.clkr,
+	[GSBI2_UART_SRC] = &gsbi2_uart_src.clkr,
+	[GSBI2_UART_CLK] = &gsbi2_uart_clk.clkr,
+	[GSBI3_UART_SRC] = &gsbi3_uart_src.clkr,
+	[GSBI3_UART_CLK] = &gsbi3_uart_clk.clkr,
+	[GSBI4_UART_SRC] = &gsbi4_uart_src.clkr,
+	[GSBI4_UART_CLK] = &gsbi4_uart_clk.clkr,
+	[GSBI5_UART_SRC] = &gsbi5_uart_src.clkr,
+	[GSBI5_UART_CLK] = &gsbi5_uart_clk.clkr,
+	[GSBI1_QUP_SRC] = &gsbi1_qup_src.clkr,
+	[GSBI1_QUP_CLK] = &gsbi1_qup_clk.clkr,
+	[GSBI2_QUP_SRC] = &gsbi2_qup_src.clkr,
+	[GSBI2_QUP_CLK] = &gsbi2_qup_clk.clkr,
+	[GSBI3_QUP_SRC] = &gsbi3_qup_src.clkr,
+	[GSBI3_QUP_CLK] = &gsbi3_qup_clk.clkr,
+	[GSBI4_QUP_SRC] = &gsbi4_qup_src.clkr,
+	[GSBI4_QUP_CLK] = &gsbi4_qup_clk.clkr,
+	[GSBI5_QUP_SRC] = &gsbi5_qup_src.clkr,
+	[GSBI5_QUP_CLK] = &gsbi5_qup_clk.clkr,
+	[GP0_SRC] = &gp0_src.clkr,
+	[GP0_CLK] = &gp0_clk.clkr,
+	[GP1_SRC] = &gp1_src.clkr,
+	[GP1_CLK] = &gp1_clk.clkr,
+	[GP2_SRC] = &gp2_src.clkr,
+	[GP2_CLK] = &gp2_clk.clkr,
+	[PMEM_A_CLK] = &pmem_clk.clkr,
+	[PRNG_SRC] = &prng_src.clkr,
+	[PRNG_CLK] = &prng_clk.clkr,
+	[SDC1_SRC] = &sdc1_src.clkr,
+	[SDC1_CLK] = &sdc1_clk.clkr,
+	[SDC2_SRC] = &sdc2_src.clkr,
+	[SDC2_CLK] = &sdc2_clk.clkr,
+	[USB_HS1_XCVR_SRC] = &usb_hs1_xcvr_src.clkr,
+	[USB_HS1_XCVR_CLK] = &usb_hs1_xcvr_clk.clkr,
+	[USB_HS1_SYSTEM_CLK_SRC] = &usb_hs1_system_src.clkr,
+	[USB_HS1_SYSTEM_CLK] = &usb_hs1_system_clk.clkr,
+	[USB_HSIC_XCVR_FS_SRC] = &usb_hsic_xcvr_fs_src.clkr,
+	[USB_HSIC_XCVR_FS_CLK] = &usb_hsic_xcvr_fs_clk.clkr,
+	[USB_HSIC_SYSTEM_CLK_SRC] = &usb_hsic_system_src.clkr,
+	[USB_HSIC_SYSTEM_CLK] = &usb_hsic_system_clk.clkr,
+	[USB_HSIC_HSIC_CLK_SRC] = &usb_hsic_hsic_src.clkr,
+	[USB_HSIC_HSIC_CLK] = &usb_hsic_hsic_clk.clkr,
+	[USB_HSIC_HSIO_CAL_CLK] = &usb_hsic_hsio_cal_clk.clkr,
+	[CE1_CORE_CLK] = &ce1_core_clk.clkr,
+	[CE1_H_CLK] = &ce1_h_clk.clkr,
+	[DMA_BAM_H_CLK] = &dma_bam_h_clk.clkr,
+	[GSBI1_H_CLK] = &gsbi1_h_clk.clkr,
+	[GSBI2_H_CLK] = &gsbi2_h_clk.clkr,
+	[GSBI3_H_CLK] = &gsbi3_h_clk.clkr,
+	[GSBI4_H_CLK] = &gsbi4_h_clk.clkr,
+	[GSBI5_H_CLK] = &gsbi5_h_clk.clkr,
+	[USB_HS1_H_CLK] = &usb_hs1_h_clk.clkr,
+	[USB_HSIC_H_CLK] = &usb_hsic_h_clk.clkr,
+	[SDC1_H_CLK] = &sdc1_h_clk.clkr,
+	[SDC2_H_CLK] = &sdc2_h_clk.clkr,
+	[ADM0_CLK] = &adm0_clk.clkr,
+	[ADM0_PBUS_CLK] = &adm0_pbus_clk.clkr,
+	[PMIC_ARB0_H_CLK] = &pmic_arb0_h_clk.clkr,
+	[PMIC_ARB1_H_CLK] = &pmic_arb1_h_clk.clkr,
+	[PMIC_SSBI2_CLK] = &pmic_ssbi2_clk.clkr,
+	[RPM_MSG_RAM_H_CLK] = &rpm_msg_ram_h_clk.clkr,
+};
+
+static const struct qcom_reset_map gcc_mdm9615_resets[] = {
+	[DMA_BAM_RESET] = { 0x25c0, 7 },
+	[CE1_H_RESET] = { 0x2720, 7 },
+	[CE1_CORE_RESET] = { 0x2724, 7 },
+	[SDC1_RESET] = { 0x2830 },
+	[SDC2_RESET] = { 0x2850 },
+	[ADM0_C2_RESET] = { 0x220c, 4 },
+	[ADM0_C1_RESET] = { 0x220c, 3 },
+	[ADM0_C0_RESET] = { 0x220c, 2 },
+	[ADM0_PBUS_RESET] = { 0x220c, 1 },
+	[ADM0_RESET] = { 0x220c },
+	[USB_HS1_RESET] = { 0x2910 },
+	[USB_HSIC_RESET] = { 0x2934 },
+	[GSBI1_RESET] = { 0x29dc },
+	[GSBI2_RESET] = { 0x29fc },
+	[GSBI3_RESET] = { 0x2a1c },
+	[GSBI4_RESET] = { 0x2a3c },
+	[GSBI5_RESET] = { 0x2a5c },
+	[PDM_RESET] = { 0x2CC0, 12 },
+};
+
+static const struct regmap_config gcc_mdm9615_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x3660,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_mdm9615_desc = {
+	.config = &gcc_mdm9615_regmap_config,
+	.clks = gcc_mdm9615_clks,
+	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
+	.resets = gcc_mdm9615_resets,
+	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
+};
+
+static const struct of_device_id gcc_mdm9615_match_table[] = {
+	{ .compatible = "qcom,gcc-mdm9615" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_mdm9615_match_table);
+
+static int gcc_mdm9615_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	struct clk *clk;
+	int i;
+
+	regmap = qcom_cc_map(pdev, &gcc_mdm9615_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	for (i = 0; i < ARRAY_SIZE(gcc_mdm9615_hws); i++) {
+		clk = devm_clk_register(dev, gcc_mdm9615_hws[i]);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+	}
+
+	return qcom_cc_really_probe(pdev, &gcc_mdm9615_desc, regmap);
+}
+
+static struct platform_driver gcc_mdm9615_driver = {
+	.probe		= gcc_mdm9615_probe,
+	.driver		= {
+		.name	= "gcc-mdm9615",
+		.of_match_table = gcc_mdm9615_match_table,
+	},
+};
+
+static int __init gcc_mdm9615_init(void)
+{
+	return platform_driver_register(&gcc_mdm9615_driver);
+}
+core_initcall(gcc_mdm9615_init);
+
+static void __exit gcc_mdm9615_exit(void)
+{
+	platform_driver_unregister(&gcc_mdm9615_driver);
+}
+module_exit(gcc_mdm9615_exit);
+
+MODULE_DESCRIPTION("QCOM GCC MDM9615 Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:gcc-mdm9615");
diff --git a/drivers/clk/qcom/lcc-mdm9615.c b/drivers/clk/qcom/lcc-mdm9615.c
new file mode 100644
index 0000000..3237ef4
--- /dev/null
+++ b/drivers/clk/qcom/lcc-mdm9615.c
@@ -0,0 +1,580 @@
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) BayLibre, SAS.
+ * Author : Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lcc-mdm9615.h>
+
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-branch.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+
+static struct clk_pll pll4 = {
+	.l_reg = 0x4,
+	.m_reg = 0x8,
+	.n_reg = 0xc,
+	.config_reg = 0x14,
+	.mode_reg = 0x0,
+	.status_reg = 0x18,
+	.status_bit = 16,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pll4",
+		.parent_names = (const char *[]){ "cxo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+enum {
+	P_CXO,
+	P_PLL4,
+};
+
+static const struct parent_map lcc_cxo_pll4_map[] = {
+	{ P_CXO, 0 },
+	{ P_PLL4, 2 }
+};
+
+static const char * const lcc_cxo_pll4[] = {
+	"cxo",
+	"pll4_vote",
+};
+
+static struct freq_tbl clk_tbl_aif_osr_492[] = {
+	{   512000, P_PLL4, 4, 1, 240 },
+	{   768000, P_PLL4, 4, 1, 160 },
+	{  1024000, P_PLL4, 4, 1, 120 },
+	{  1536000, P_PLL4, 4, 1,  80 },
+	{  2048000, P_PLL4, 4, 1,  60 },
+	{  3072000, P_PLL4, 4, 1,  40 },
+	{  4096000, P_PLL4, 4, 1,  30 },
+	{  6144000, P_PLL4, 4, 1,  20 },
+	{  8192000, P_PLL4, 4, 1,  15 },
+	{ 12288000, P_PLL4, 4, 1,  10 },
+	{ 24576000, P_PLL4, 4, 1,   5 },
+	{ 27000000, P_CXO,  1, 0,   0 },
+	{ }
+};
+
+static struct freq_tbl clk_tbl_aif_osr_393[] = {
+	{   512000, P_PLL4, 4, 1, 192 },
+	{   768000, P_PLL4, 4, 1, 128 },
+	{  1024000, P_PLL4, 4, 1,  96 },
+	{  1536000, P_PLL4, 4, 1,  64 },
+	{  2048000, P_PLL4, 4, 1,  48 },
+	{  3072000, P_PLL4, 4, 1,  32 },
+	{  4096000, P_PLL4, 4, 1,  24 },
+	{  6144000, P_PLL4, 4, 1,  16 },
+	{  8192000, P_PLL4, 4, 1,  12 },
+	{ 12288000, P_PLL4, 4, 1,   8 },
+	{ 24576000, P_PLL4, 4, 1,   4 },
+	{ 27000000, P_CXO,  1, 0,   0 },
+	{ }
+};
+
+static struct clk_rcg mi2s_osr_src = {
+	.ns_reg = 0x48,
+	.md_reg = 0x4c,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 24,
+		.m_val_shift = 8,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = lcc_cxo_pll4_map,
+	},
+	.freq_tbl = clk_tbl_aif_osr_393,
+	.clkr = {
+		.enable_reg = 0x48,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "mi2s_osr_src",
+			.parent_names = lcc_cxo_pll4,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	},
+};
+
+static const char * const lcc_mi2s_parents[] = {
+	"mi2s_osr_src",
+};
+
+static struct clk_branch mi2s_osr_clk = {
+	.halt_reg = 0x50,
+	.halt_bit = 1,
+	.halt_check = BRANCH_HALT_ENABLE,
+	.clkr = {
+		.enable_reg = 0x48,
+		.enable_mask = BIT(17),
+		.hw.init = &(struct clk_init_data){
+			.name = "mi2s_osr_clk",
+			.parent_names = lcc_mi2s_parents,
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_div mi2s_div_clk = {
+	.reg = 0x48,
+	.shift = 10,
+	.width = 4,
+	.clkr = {
+		.enable_reg = 0x48,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "mi2s_div_clk",
+			.parent_names = lcc_mi2s_parents,
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+		},
+	},
+};
+
+static struct clk_branch mi2s_bit_div_clk = {
+	.halt_reg = 0x50,
+	.halt_bit = 0,
+	.halt_check = BRANCH_HALT_ENABLE,
+	.clkr = {
+		.enable_reg = 0x48,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "mi2s_bit_div_clk",
+			.parent_names = (const char *[]){ "mi2s_div_clk" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_mux mi2s_bit_clk = {
+	.reg = 0x48,
+	.shift = 14,
+	.width = 1,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "mi2s_bit_clk",
+			.parent_names = (const char *[]){
+				"mi2s_bit_div_clk",
+				"mi2s_codec_clk",
+			},
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+#define CLK_AIF_OSR_DIV(prefix, _ns, _md, hr)			\
+static struct clk_rcg prefix##_osr_src = {			\
+	.ns_reg = _ns,						\
+	.md_reg = _md,						\
+	.mn = {							\
+		.mnctr_en_bit = 8,				\
+		.mnctr_reset_bit = 7,				\
+		.mnctr_mode_shift = 5,				\
+		.n_val_shift = 24,				\
+		.m_val_shift = 8,				\
+		.width = 8,					\
+	},							\
+	.p = {							\
+		.pre_div_shift = 3,				\
+		.pre_div_width = 2,				\
+	},							\
+	.s = {							\
+		.src_sel_shift = 0,				\
+		.parent_map = lcc_cxo_pll4_map,			\
+	},							\
+	.freq_tbl = clk_tbl_aif_osr_393,			\
+	.clkr = {						\
+		.enable_reg = _ns,				\
+		.enable_mask = BIT(9),				\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_osr_src",		\
+			.parent_names = lcc_cxo_pll4,		\
+			.num_parents = 2,			\
+			.ops = &clk_rcg_ops,			\
+			.flags = CLK_SET_RATE_GATE,		\
+		},						\
+	},							\
+};								\
+								\
+static const char * const lcc_##prefix##_parents[] = {		\
+	#prefix "_osr_src",					\
+};								\
+								\
+static struct clk_branch prefix##_osr_clk = {			\
+	.halt_reg = hr,						\
+	.halt_bit = 1,						\
+	.halt_check = BRANCH_HALT_ENABLE,			\
+	.clkr = {						\
+		.enable_reg = _ns,				\
+		.enable_mask = BIT(21),				\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_osr_clk",		\
+			.parent_names = lcc_##prefix##_parents,	\
+			.num_parents = 1,			\
+			.ops = &clk_branch_ops,			\
+			.flags = CLK_SET_RATE_PARENT,		\
+		},						\
+	},							\
+};								\
+								\
+static struct clk_regmap_div prefix##_div_clk = {		\
+	.reg = _ns,						\
+	.shift = 10,						\
+	.width = 8,						\
+	.clkr = {						\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_div_clk",		\
+			.parent_names = lcc_##prefix##_parents,	\
+			.num_parents = 1,			\
+			.ops = &clk_regmap_div_ops,		\
+		},						\
+	},							\
+};								\
+								\
+static struct clk_branch prefix##_bit_div_clk = {		\
+	.halt_reg = hr,						\
+	.halt_bit = 0,						\
+	.halt_check = BRANCH_HALT_ENABLE,			\
+	.clkr = {						\
+		.enable_reg = _ns,				\
+		.enable_mask = BIT(19),				\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_bit_div_clk",		\
+			.parent_names = (const char *[]){	\
+				#prefix "_div_clk"		\
+			},					\
+			.num_parents = 1,			\
+			.ops = &clk_branch_ops,			\
+			.flags = CLK_SET_RATE_PARENT,		\
+		},						\
+	},							\
+};								\
+								\
+static struct clk_regmap_mux prefix##_bit_clk = {		\
+	.reg = _ns,						\
+	.shift = 18,						\
+	.width = 1,						\
+	.clkr = {						\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_bit_clk",		\
+			.parent_names = (const char *[]){	\
+				#prefix "_bit_div_clk",		\
+				#prefix "_codec_clk",		\
+			},					\
+			.num_parents = 2,			\
+			.ops = &clk_regmap_mux_closest_ops,	\
+			.flags = CLK_SET_RATE_PARENT,		\
+		},						\
+	},							\
+}
+
+CLK_AIF_OSR_DIV(codec_i2s_mic, 0x60, 0x64, 0x68);
+CLK_AIF_OSR_DIV(spare_i2s_mic, 0x78, 0x7c, 0x80);
+CLK_AIF_OSR_DIV(codec_i2s_spkr, 0x6c, 0x70, 0x74);
+CLK_AIF_OSR_DIV(spare_i2s_spkr, 0x84, 0x88, 0x8c);
+
+static struct freq_tbl clk_tbl_pcm_492[] = {
+	{   256000, P_PLL4, 4, 1, 480 },
+	{   512000, P_PLL4, 4, 1, 240 },
+	{   768000, P_PLL4, 4, 1, 160 },
+	{  1024000, P_PLL4, 4, 1, 120 },
+	{  1536000, P_PLL4, 4, 1,  80 },
+	{  2048000, P_PLL4, 4, 1,  60 },
+	{  3072000, P_PLL4, 4, 1,  40 },
+	{  4096000, P_PLL4, 4, 1,  30 },
+	{  6144000, P_PLL4, 4, 1,  20 },
+	{  8192000, P_PLL4, 4, 1,  15 },
+	{ 12288000, P_PLL4, 4, 1,  10 },
+	{ 24576000, P_PLL4, 4, 1,   5 },
+	{ 27000000, P_CXO,  1, 0,   0 },
+	{ }
+};
+
+static struct freq_tbl clk_tbl_pcm_393[] = {
+	{   256000, P_PLL4, 4, 1, 384 },
+	{   512000, P_PLL4, 4, 1, 192 },
+	{   768000, P_PLL4, 4, 1, 128 },
+	{  1024000, P_PLL4, 4, 1,  96 },
+	{  1536000, P_PLL4, 4, 1,  64 },
+	{  2048000, P_PLL4, 4, 1,  48 },
+	{  3072000, P_PLL4, 4, 1,  32 },
+	{  4096000, P_PLL4, 4, 1,  24 },
+	{  6144000, P_PLL4, 4, 1,  16 },
+	{  8192000, P_PLL4, 4, 1,  12 },
+	{ 12288000, P_PLL4, 4, 1,   8 },
+	{ 24576000, P_PLL4, 4, 1,   4 },
+	{ 27000000, P_CXO,  1, 0,   0 },
+	{ }
+};
+
+static struct clk_rcg pcm_src = {
+	.ns_reg = 0x54,
+	.md_reg = 0x58,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 16,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = lcc_cxo_pll4_map,
+	},
+	.freq_tbl = clk_tbl_pcm_393,
+	.clkr = {
+		.enable_reg = 0x54,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "pcm_src",
+			.parent_names = lcc_cxo_pll4,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	},
+};
+
+static struct clk_branch pcm_clk_out = {
+	.halt_reg = 0x5c,
+	.halt_bit = 0,
+	.halt_check = BRANCH_HALT_ENABLE,
+	.clkr = {
+		.enable_reg = 0x54,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "pcm_clk_out",
+			.parent_names = (const char *[]){ "pcm_src" },
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_mux pcm_clk = {
+	.reg = 0x54,
+	.shift = 10,
+	.width = 1,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "pcm_clk",
+			.parent_names = (const char *[]){
+				"pcm_clk_out",
+				"pcm_codec_clk",
+			},
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg slimbus_src = {
+	.ns_reg = 0xcc,
+	.md_reg = 0xd0,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 24,
+		.m_val_shift = 8,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = lcc_cxo_pll4_map,
+	},
+	.freq_tbl = clk_tbl_aif_osr_393,
+	.clkr = {
+		.enable_reg = 0xcc,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "slimbus_src",
+			.parent_names = lcc_cxo_pll4,
+			.num_parents = 2,
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	},
+};
+
+static const char * const lcc_slimbus_parents[] = {
+	"slimbus_src",
+};
+
+static struct clk_branch audio_slimbus_clk = {
+	.halt_reg = 0xd4,
+	.halt_bit = 0,
+	.halt_check = BRANCH_HALT_ENABLE,
+	.clkr = {
+		.enable_reg = 0xcc,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "audio_slimbus_clk",
+			.parent_names = lcc_slimbus_parents,
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch sps_slimbus_clk = {
+	.halt_reg = 0xd4,
+	.halt_bit = 1,
+	.halt_check = BRANCH_HALT_ENABLE,
+	.clkr = {
+		.enable_reg = 0xcc,
+		.enable_mask = BIT(12),
+		.hw.init = &(struct clk_init_data){
+			.name = "sps_slimbus_clk",
+			.parent_names = lcc_slimbus_parents,
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap *lcc_mdm9615_clks[] = {
+	[PLL4] = &pll4.clkr,
+	[MI2S_OSR_SRC] = &mi2s_osr_src.clkr,
+	[MI2S_OSR_CLK] = &mi2s_osr_clk.clkr,
+	[MI2S_DIV_CLK] = &mi2s_div_clk.clkr,
+	[MI2S_BIT_DIV_CLK] = &mi2s_bit_div_clk.clkr,
+	[MI2S_BIT_CLK] = &mi2s_bit_clk.clkr,
+	[PCM_SRC] = &pcm_src.clkr,
+	[PCM_CLK_OUT] = &pcm_clk_out.clkr,
+	[PCM_CLK] = &pcm_clk.clkr,
+	[SLIMBUS_SRC] = &slimbus_src.clkr,
+	[AUDIO_SLIMBUS_CLK] = &audio_slimbus_clk.clkr,
+	[SPS_SLIMBUS_CLK] = &sps_slimbus_clk.clkr,
+	[CODEC_I2S_MIC_OSR_SRC] = &codec_i2s_mic_osr_src.clkr,
+	[CODEC_I2S_MIC_OSR_CLK] = &codec_i2s_mic_osr_clk.clkr,
+	[CODEC_I2S_MIC_DIV_CLK] = &codec_i2s_mic_div_clk.clkr,
+	[CODEC_I2S_MIC_BIT_DIV_CLK] = &codec_i2s_mic_bit_div_clk.clkr,
+	[CODEC_I2S_MIC_BIT_CLK] = &codec_i2s_mic_bit_clk.clkr,
+	[SPARE_I2S_MIC_OSR_SRC] = &spare_i2s_mic_osr_src.clkr,
+	[SPARE_I2S_MIC_OSR_CLK] = &spare_i2s_mic_osr_clk.clkr,
+	[SPARE_I2S_MIC_DIV_CLK] = &spare_i2s_mic_div_clk.clkr,
+	[SPARE_I2S_MIC_BIT_DIV_CLK] = &spare_i2s_mic_bit_div_clk.clkr,
+	[SPARE_I2S_MIC_BIT_CLK] = &spare_i2s_mic_bit_clk.clkr,
+	[CODEC_I2S_SPKR_OSR_SRC] = &codec_i2s_spkr_osr_src.clkr,
+	[CODEC_I2S_SPKR_OSR_CLK] = &codec_i2s_spkr_osr_clk.clkr,
+	[CODEC_I2S_SPKR_DIV_CLK] = &codec_i2s_spkr_div_clk.clkr,
+	[CODEC_I2S_SPKR_BIT_DIV_CLK] = &codec_i2s_spkr_bit_div_clk.clkr,
+	[CODEC_I2S_SPKR_BIT_CLK] = &codec_i2s_spkr_bit_clk.clkr,
+	[SPARE_I2S_SPKR_OSR_SRC] = &spare_i2s_spkr_osr_src.clkr,
+	[SPARE_I2S_SPKR_OSR_CLK] = &spare_i2s_spkr_osr_clk.clkr,
+	[SPARE_I2S_SPKR_DIV_CLK] = &spare_i2s_spkr_div_clk.clkr,
+	[SPARE_I2S_SPKR_BIT_DIV_CLK] = &spare_i2s_spkr_bit_div_clk.clkr,
+	[SPARE_I2S_SPKR_BIT_CLK] = &spare_i2s_spkr_bit_clk.clkr,
+};
+
+static const struct regmap_config lcc_mdm9615_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0xfc,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc lcc_mdm9615_desc = {
+	.config = &lcc_mdm9615_regmap_config,
+	.clks = lcc_mdm9615_clks,
+	.num_clks = ARRAY_SIZE(lcc_mdm9615_clks),
+};
+
+static const struct of_device_id lcc_mdm9615_match_table[] = {
+	{ .compatible = "qcom,lcc-mdm9615" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lcc_mdm9615_match_table);
+
+static int lcc_mdm9615_probe(struct platform_device *pdev)
+{
+	u32 val;
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &lcc_mdm9615_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Use the correct frequency plan depending on speed of PLL4 */
+	regmap_read(regmap, 0x4, &val);
+	if (val == 0x12) {
+		slimbus_src.freq_tbl = clk_tbl_aif_osr_492;
+		mi2s_osr_src.freq_tbl = clk_tbl_aif_osr_492;
+		codec_i2s_mic_osr_src.freq_tbl = clk_tbl_aif_osr_492;
+		spare_i2s_mic_osr_src.freq_tbl = clk_tbl_aif_osr_492;
+		codec_i2s_spkr_osr_src.freq_tbl = clk_tbl_aif_osr_492;
+		spare_i2s_spkr_osr_src.freq_tbl = clk_tbl_aif_osr_492;
+		pcm_src.freq_tbl = clk_tbl_pcm_492;
+	}
+	/* Enable PLL4 source on the LPASS Primary PLL Mux */
+	regmap_write(regmap, 0xc4, 0x1);
+
+	return qcom_cc_really_probe(pdev, &lcc_mdm9615_desc, regmap);
+}
+
+static struct platform_driver lcc_mdm9615_driver = {
+	.probe		= lcc_mdm9615_probe,
+	.driver		= {
+		.name	= "lcc-mdm9615",
+		.of_match_table = lcc_mdm9615_match_table,
+	},
+};
+module_platform_driver(lcc_mdm9615_driver);
+
+MODULE_DESCRIPTION("QCOM LCC MDM9615 Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:lcc-mdm9615");
-- 
1.9.1
