Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Denis Efremov <yefremov.denis@gmail.com>
Subject: [PATCH 2/2] clk: fixed-rate: Remove export symbol on setup function
Date: Fri, 12 Aug 2016 18:50:23 -0700
Message-Id: <20160813015023.28221-2-sboyd@codeaurora.org>
In-Reply-To: <20160813015023.28221-1-sboyd@codeaurora.org>
References: <20160813015023.28221-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This function is only called by builtin code, but we always
exported it and had marked it as __init before commit
e4eda8e0654c (clk: remove exported function from __init section,
2013-01-06) removed that marking. Given that it isn't used by
modules, lets unexport it and add back __init.

Cc: Denis Efremov <yefremov.denis@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-fixed-rate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index c735272ed706..b5c46b3f8764 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -190,11 +190,10 @@ static struct clk *_of_fixed_clk_setup(struct device_node *node)
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
  */
-void of_fixed_clk_setup(struct device_node *node)
+void __init of_fixed_clk_setup(struct device_node *node)
 {
 	_of_fixed_clk_setup(node);
 }
-EXPORT_SYMBOL_GPL(of_fixed_clk_setup);
 CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
 
 static int of_fixed_clk_remove(struct platform_device *pdev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
