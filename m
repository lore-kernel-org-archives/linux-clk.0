Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42396 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754034AbbGaRET (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 31 Jul 2015 13:04:19 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Wentao Xu <wentaox@codeaurora.org>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH 25/26] drm/msm/dsi: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:04:05 -0700
Message-Id: <1438362246-6664-26-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Wentao Xu <wentaox@codeaurora.org>
Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
index eb8ac3097ff5..18b7727bdc57 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
@@ -455,7 +455,7 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
 	cached_state->byte_mux = pll_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
-	cached_state->vco_rate = __clk_get_rate(pll->clk_hw.clk);
+	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
 }
 
 static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
@@ -466,7 +466,7 @@ static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
 	int ret;
 
 	if ((cached_state->vco_rate != 0) &&
-		(cached_state->vco_rate == __clk_get_rate(pll->clk_hw.clk))) {
+		(cached_state->vco_rate == clk_hw_get_rate(&pll->clk_hw))) {
 		ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
 						cached_state->vco_rate, 0);
 		if (ret) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

