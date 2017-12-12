Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57396 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751612AbdLLMbw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Dec 2017 07:31:52 -0500
From: Ilia Lin <ilialin@codeaurora.org>
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com,
        will.deacon@arm.com, rnayak@codeaurora.org,
        qualcomm-lt@lists.linaro.org, ilialin@codeaurora.org,
        celster@codeaurora.org, tfinkel@codeaurora.org
Subject: [PATCH 03/10] clk: qcom: Make clk_alpha_pll_configure available to modules
Date: Tue, 12 Dec 2017 14:31:30 +0200
Message-Id: <1513081897-31612-4-git-send-email-ilialin@codeaurora.org>
In-Reply-To: <1513081897-31612-1-git-send-email-ilialin@codeaurora.org>
References: <1513081897-31612-1-git-send-email-ilialin@codeaurora.org>
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
index ecb9e7f..7b06e21 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -141,6 +141,7 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, off + PLL_MODE, 6, 0);
 }
+EXPORT_SYMBOL_GPL(clk_alpha_pll_configure);
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
-- 
1.9.1

