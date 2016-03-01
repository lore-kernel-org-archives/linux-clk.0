Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCH 30/41] clk: mb86s7x: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:15 -0800
Message-Id: <1456858826-28541-31-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-mb86s7x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-mb86s7x.c b/drivers/clk/clk-mb86s7x.c
index f39c25a22f43..e0817754ca3e 100644
--- a/drivers/clk/clk-mb86s7x.c
+++ b/drivers/clk/clk-mb86s7x.c
@@ -217,7 +217,7 @@ static struct clk *crg11_get(struct of_phandle_args *clkspec, void *data)
 	init.name = clkp;
 	init.num_parents = 0;
 	init.ops = &crg_port_ops;
-	init.flags = CLK_IS_ROOT;
+	init.flags = 0;
 	crgclk->hw.init = &init;
 	crgclk->cntrlr = cntrlr;
 	crgclk->domain = domain;
@@ -341,7 +341,7 @@ struct clk *mb86s7x_clclk_register(struct device *cpu_dev)
 
 	init.name = dev_name(cpu_dev);
 	init.ops = &clk_clc_ops;
-	init.flags = CLK_IS_ROOT | CLK_GET_RATE_NOCACHE;
+	init.flags = CLK_GET_RATE_NOCACHE;
 	init.num_parents = 0;
 
 	return devm_clk_register(cpu_dev, &clc->hw);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
