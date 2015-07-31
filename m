Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Pawel Moll <pawel.moll@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 24/26] clk: versatile: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:04:04 -0700
Message-Id: <1438362246-6664-25-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/versatile/clk-sp810.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index 7fbe4d4bf35e..af653bfd4901 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -80,7 +80,7 @@ static int clk_sp810_timerclken_prepare(struct clk_hw *hw)
 {
 	struct clk_sp810_timerclken *timerclken = to_clk_sp810_timerclken(hw);
 	struct clk_sp810 *sp810 = timerclken->sp810;
-	struct clk *old_parent = __clk_get_parent(hw->clk);
+	struct clk_hw *old_parent = clk_hw_get_parent(hw);
 	struct clk *new_parent;
 
 	if (!sp810->refclk)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

