Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-soc@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/2] clk: qcom: Export clk_alpha_pll_configure()
Date: Fri, 21 Sep 2018 11:59:35 -0700
Message-Id: <20180921185936.9590-1-vkoul@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

This is used by the QCS404 GCC driver, export it to allow that driver to
be compiled as a module..

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index a91d97cecbad..0ced4a5a9a17 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -220,6 +220,7 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
 }
+EXPORT_SYMBOL_GPL(clk_alpha_pll_configure);
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
-- 
2.14.4
