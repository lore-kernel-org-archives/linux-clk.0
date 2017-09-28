Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 11/13] clk: qcom: support for Brammo PLL
Date: Thu, 28 Sep 2017 23:20:48 +0530
Message-Id: <1506621050-10129-12-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

1. Brammo PLL does not allow configuration of VCO
2. Supports the dynamic update in which the frequency can
   be changed dynamically without turning off the PLL
3. The register offsets are different from normal Alpha PLL

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 24 ++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4844e63..c682387 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -922,4 +922,28 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 			.set_rate = alpha_pll_huayra_set_rate,
 		},
 	},
+	[CLK_ALPHA_PLL_TYPE_BRAMMO] =  {
+		.reg_offsets = {
+			[PLL_L_VAL] = 0x04,
+			[PLL_ALPHA_VAL] = 0x08,
+			[PLL_ALPHA_VAL_U] = 0x0c,
+			[PLL_USER_CTL] = 0x10,
+			[PLL_CONFIG_CTL] = 0x18,
+			[PLL_TEST_CTL] = 0x1c,
+			[PLL_STATUS] = 0x24,
+		},
+		.alpha_width = 40,
+		.flags = SUPPORTS_DYNAMIC_UPDATE,
+		.ops = {
+			.enable = alpha_pll_default_enable,
+			.disable = alpha_pll_default_disable,
+			.is_enabled = alpha_pll_default_is_enabled,
+			.hwfsm_enable = alpha_pll_default_hwfsm_enable,
+			.hwfsm_disable = alpha_pll_default_hwfsm_disable,
+			.hwfsm_is_enabled = alpha_pll_default_hwfsm_is_enabled,
+			.recalc_rate = alpha_pll_default_recalc_rate,
+			.round_rate = alpha_pll_default_round_rate,
+			.set_rate = alpha_pll_default_set_rate,
+		},
+	},
 };
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index fed783e..dee71b4 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -21,6 +21,7 @@
 enum {
 	CLK_ALPHA_PLL_TYPE_DEFAULT,
 	CLK_ALPHA_PLL_TYPE_HUAYRA,
+	CLK_ALPHA_PLL_TYPE_BRAMMO,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
