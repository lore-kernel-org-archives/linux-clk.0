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
Subject: [RFC 09/12] clk: qcom: support for Brammo PLL
Date: Thu, 27 Jul 2017 16:40:22 +0530
Message-Id: <1501153825-5181-10-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Brammo PLL does not allow configuration of VCO and it
supports the dynamic update in which the frequency can
be changed dynamically without turning off the PLL.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 12 ++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d17d83a..e37a3ab 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -52,6 +52,7 @@
 #define PLL_HUAYRA_N_MASK		0xff
 #define PLL_HUAYRA_ALPHA_WIDTH		16
 
+#define PLL_BRAMMO_ALPHA_BITWIDTH	40
 /*
  * Even though 40 bits are present, use only 32 for ease of calculation.
  */
@@ -105,6 +106,17 @@
 	[ALPHA_PLL_STATUS] = 0x24,
 };
 
+const u8 brammo_pll_offsets[] = {
+	[ALPHA_PLL_MODE] = 0x00,
+	[ALPHA_PLL_L_VAL] = 0x04,
+	[ALPHA_PLL_ALPHA_VAL] = 0x08,
+	[ALPHA_PLL_ALPHA_VAL_U] = 0x0c,
+	[ALPHA_PLL_USER_CTL] = 0x10,
+	[ALPHA_PLL_CONFIG_CTL] = 0x18,
+	[ALPHA_PLL_TEST_CTL] = 0x1c,
+	[ALPHA_PLL_STATUS] = 0x24,
+};
+
 static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 			const char *action)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index c98e7469..891d14b 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -64,6 +64,7 @@ struct clk_alpha_pll {
 #define CLK_HUAYRA_PLL_FLAGS	(HAVE_NO_VCO_CONF | SUPPORTS_DYNAMIC_UPDATE | \
 				 SUPPORTS_64BIT_CONFIG_CTL |		      \
 				 SUPPORTS_16BIT_ALPHA)
+#define CLK_BRAMMO_PLL_FLAGS	(HAVE_NO_VCO_CONF | SUPPORTS_DYNAMIC_UPDATE)
 
 /**
  * struct clk_alpha_pll_postdiv - phase locked loop (PLL) post-divider
@@ -102,6 +103,7 @@ struct alpha_pll_config {
 
 extern const u8 alpha_pll_offsets[];
 extern const u8 huayra_pll_offsets[];
+extern const u8 brammo_pll_offsets[];
 
 extern const struct clk_ops clk_alpha_pll_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
