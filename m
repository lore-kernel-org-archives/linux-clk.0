Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57690 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751927AbdLLMcC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Dec 2017 07:32:02 -0500
From: Ilia Lin <ilialin@codeaurora.org>
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com,
        will.deacon@arm.com, rnayak@codeaurora.org,
        qualcomm-lt@lists.linaro.org, ilialin@codeaurora.org,
        celster@codeaurora.org, tfinkel@codeaurora.org
Subject: [PATCH 05/10] clk: qcom: cpu-8996: Add support to switch to alternate PLL
Date: Tue, 12 Dec 2017 14:31:32 +0200
Message-Id: <1513081897-31612-6-git-send-email-ilialin@codeaurora.org>
In-Reply-To: <1513081897-31612-1-git-send-email-ilialin@codeaurora.org>
References: <1513081897-31612-1-git-send-email-ilialin@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Rajendra Nayak <rnayak@codeaurora.org>

Each of the CPU clusters on msm8996 and powered via a primary
PLL and a secondary PLL. The primary PLL is what drivers the
CPU clk, except for times when we are reprogramming the PLL
itself, when we temporarily switch to an alternate PLL.
Use clock rate change notifiers to support this.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index bc60111..9bb25be 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -119,10 +119,14 @@ struct clk_cpu_8996_mux {
 	u32	reg;
 	u32	shift;
 	u32	width;
+	struct notifier_block nb;
 	struct clk_hw	*pll;
 	struct clk_regmap clkr;
 };
 
+#define to_clk_cpu_8996_mux_nb(_nb) \
+	container_of(_nb, struct clk_cpu_8996_mux, nb)
+
 static inline
 struct clk_cpu_8996_mux *to_clk_cpu_8996_mux_hw(struct clk_hw *hw)
 {
@@ -173,6 +177,27 @@ static int clk_cpu_8996_mux_set_parent(struct clk_hw *hw, u8 index)
 	return 0;
 }
 
+int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
+			void *data)
+{
+	int ret;
+	struct clk_cpu_8996_mux *cpuclk = to_clk_cpu_8996_mux_nb(nb);
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		ret = clk_cpu_8996_mux_set_parent(&cpuclk->clkr.hw, ALT_INDEX);
+		break;
+	case POST_RATE_CHANGE:
+		ret = clk_cpu_8996_mux_set_parent(&cpuclk->clkr.hw, PLL_INDEX);
+		break;
+	default:
+		ret = 0;
+		break;
+	}
+
+	return notifier_from_errno(ret);
+};
+
 const struct clk_ops clk_cpu_8996_mux_ops = {
 	.set_parent = clk_cpu_8996_mux_set_parent,
 	.get_parent = clk_cpu_8996_mux_get_parent,
@@ -216,6 +241,7 @@ static int clk_cpu_8996_mux_set_parent(struct clk_hw *hw, u8 index)
 	.shift = 0,
 	.width = 2,
 	.pll = &pwrcl_pll.clkr.hw,
+	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_pmux",
 		.parent_names = (const char *[]){
@@ -235,6 +261,7 @@ static int clk_cpu_8996_mux_set_parent(struct clk_hw *hw, u8 index)
 	.shift = 0,
 	.width = 2,
 	.pll = &perfcl_pll.clkr.hw,
+	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_pmux",
 		.parent_names = (const char *[]){
@@ -310,6 +337,14 @@ struct clk_hw_clks {
 	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
 
+	ret = clk_notifier_register(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
+	if (ret)
+		return ret;
+
+	ret = clk_notifier_register(perfcl_pmux.clkr.hw.clk, &perfcl_pmux.nb);
+	if (ret)
+		return ret;
+
 	return ret;
 }
 
-- 
1.9.1

