Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 20/26] clk: spear: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:04:00 -0700
Message-Id: <1438362246-6664-21-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/spear/clk-vco-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spear/clk-vco-pll.c b/drivers/clk/spear/clk-vco-pll.c
index 1b9b65bca51e..185b294c923b 100644
--- a/drivers/clk/spear/clk-vco-pll.c
+++ b/drivers/clk/spear/clk-vco-pll.c
@@ -87,7 +87,7 @@ static long clk_pll_round_rate_index(struct clk_hw *hw, unsigned long drate,
 	struct clk_pll *pll = to_clk_pll(hw);
 	unsigned long prev_rate, vco_prev_rate, rate = 0;
 	unsigned long vco_parent_rate =
-		__clk_get_rate(__clk_get_parent(__clk_get_parent(hw->clk)));
+		clk_hw_get_rate(clk_hw_get_parent(clk_hw_get_parent(hw)));
 
 	if (!prate) {
 		pr_err("%s: prate is must for pll clk\n", __func__);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

