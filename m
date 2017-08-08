Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	rnayak@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [RFC v2 08/12] clk: qcom: support for Brammo PLL
Date: Tue,  8 Aug 2017 23:54:13 +0530
Message-Id: <1502216657-3342-9-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

1. Brammo PLL does not allow configuration of VCO
2. Supports the dynamic update in which the frequency can
   be changed dynamically without turning off the PLL
3. The register offsets are different from normal Alpha PLL

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 12 ++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 23e2bb7..b491dbe 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -107,6 +107,18 @@
 };
 EXPORT_SYMBOL_GPL(clk_alpha_huayra_pll_offsets);
 
+const u8 clk_alpha_brammo_pll_offsets[] = {
+	[ALPHA_PLL_MODE] = 0x00,
+	[ALPHA_PLL_L_VAL] = 0x04,
+	[ALPHA_PLL_ALPHA_VAL] = 0x08,
+	[ALPHA_PLL_ALPHA_VAL_U] = 0x0c,
+	[ALPHA_PLL_USER_CTL] = 0x10,
+	[ALPHA_PLL_CONFIG_CTL] = 0x18,
+	[ALPHA_PLL_TEST_CTL] = 0x1c,
+	[ALPHA_PLL_STATUS] = 0x24,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_brammo_pll_offsets);
+
 static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 			const char *action)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index af74abf..8a0dab6 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -64,6 +64,7 @@ struct clk_alpha_pll {
 #define CLK_HUAYRA_PLL_FLAGS	(SUPPORTS_NO_VCO | SUPPORTS_DYNAMIC_UPDATE | \
 				 SUPPORTS_64BIT_CONFIG_CTL |		     \
 				 SUPPORTS_16BIT_ALPHA)
+#define CLK_BRAMMO_PLL_FLAGS	(SUPPORTS_NO_VCO | SUPPORTS_DYNAMIC_UPDATE)
 
 /**
  * struct clk_alpha_pll_postdiv - phase locked loop (PLL) post-divider
@@ -102,6 +103,7 @@ struct alpha_pll_config {
 
 extern const u8 clk_alpha_pll_offsets[];
 extern const u8 clk_alpha_huayra_pll_offsets[];
+extern const u8 clk_alpha_brammo_pll_offsets[];
 
 extern const struct clk_ops clk_alpha_pll_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
