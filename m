Return-Path: <sboyd@kernel.org>
From: sboyd@kernel.org
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Amit Nischal <anischal@codeaurora.org>
Subject: [PATCH] clk: qcom: Export clk_fabia_pll_configure()
Date: Sat,  2 Jun 2018 00:21:32 -0700
Message-Id: <20180602072132.222257-1-sboyd@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

From: Stephen Boyd <sboyd@kernel.org>

This is used by the video clk driver on sdm845 and that's a module.
Export it to prevent module build failures.

Cc: Amit Nischal <anischal@codeaurora.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 9722b701fbdb..3c49a60072f1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -885,6 +885,7 @@ void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
 }
+EXPORT_SYMBOL_GPL(clk_fabia_pll_configure);
 
 static int alpha_pll_fabia_enable(struct clk_hw *hw)
 {
-- 
Sent by a computer through tubes
