Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH 15/26] clk: stm32f4: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:55 -0700
Message-Id: <1438362246-6664-16-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-stm32f4.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 5cfe50717536..fd89e771107e 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -178,8 +178,7 @@ static long clk_apb_mul_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
 		unsigned long best_parent = rate / mult;
 
-		*prate =
-		    __clk_round_rate(__clk_get_parent(hw->clk), best_parent);
+		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 	}
 
 	return *prate * mult;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

