Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43002 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030471AbeBNOAJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Feb 2018 09:00:09 -0500
From: Ilia Lin <ilialin@codeaurora.org>
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com,
        will.deacon@arm.com, rnayak@codeaurora.org, ilialin@codeaurora.org,
        amit.kucheria@linaro.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org, tfinkel@codeaurora.org
Subject: [PATCH v3 02/10] clk: qcom: Make clk_alpha_pll_configure available to modules
Date: Wed, 14 Feb 2018 15:59:44 +0200
Message-Id: <1518616792-29028-3-git-send-email-ilialin@codeaurora.org>
In-Reply-To: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Rajendra Nayak <rnayak@codeaurora.org>

Allow clk_alpha_pll_configure to be called from loadable
kernel modules.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6d04cd9..5c962af 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -208,6 +208,7 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
 }
+EXPORT_SYMBOL_GPL(clk_alpha_pll_configure);
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
-- 
1.9.1

