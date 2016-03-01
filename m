Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 33/41] clk: pwm: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:18 -0800
Message-Id: <1456858826-28541-34-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index 328fcfcefd8c..883045814dac 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -95,7 +95,7 @@ static int clk_pwm_probe(struct platform_device *pdev)
 
 	init.name = clk_name;
 	init.ops = &clk_pwm_ops;
-	init.flags = CLK_IS_BASIC | CLK_IS_ROOT;
+	init.flags = CLK_IS_BASIC;
 	init.num_parents = 0;
 
 	clk_pwm->pwm = pwm;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
