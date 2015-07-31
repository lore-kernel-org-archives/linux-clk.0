Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42352 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752607AbbGaREQ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 31 Jul 2015 13:04:16 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Barry Song <Baohua.Song@csr.com>
Subject: [PATCH 19/26] clk: sirf: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:59 -0700
Message-Id: <1438362246-6664-20-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Barry Song <Baohua.Song@csr.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sirf/clk-common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sirf/clk-common.c b/drivers/clk/sirf/clk-common.c
index 2f64d4beeb52..77e1e2491689 100644
--- a/drivers/clk/sirf/clk-common.c
+++ b/drivers/clk/sirf/clk-common.c
@@ -167,10 +167,10 @@ static long cpu_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * SiRF SoC has not cpu clock control,
 	 * So bypass to it's parent pll.
 	 */
-	struct clk *parent_clk = clk_get_parent(hw->clk);
-	struct clk *pll_parent_clk = clk_get_parent(parent_clk);
-	unsigned long pll_parent_rate = clk_get_rate(pll_parent_clk);
-	return pll_clk_round_rate(__clk_get_hw(parent_clk), rate, &pll_parent_rate);
+	struct clk_hw *parent_clk = clk_hw_get_parent(hw);
+	struct clk_hw *pll_parent_clk = clk_hw_get_parent(parent_clk);
+	unsigned long pll_parent_rate = clk_hw_get_rate(pll_parent_clk);
+	return pll_clk_round_rate(parent_clk, rate, &pll_parent_rate);
 }
 
 static unsigned long cpu_clk_recalc_rate(struct clk_hw *hw,
@@ -180,8 +180,8 @@ static unsigned long cpu_clk_recalc_rate(struct clk_hw *hw,
 	 * SiRF SoC has not cpu clock control,
 	 * So return the parent pll rate.
 	 */
-	struct clk *parent_clk = clk_get_parent(hw->clk);
-	return __clk_get_rate(parent_clk);
+	struct clk_hw *parent_clk = clk_hw_get_parent(hw);
+	return clk_hw_get_rate(parent_clk);
 }
 
 static struct clk_ops std_pll_ops = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

