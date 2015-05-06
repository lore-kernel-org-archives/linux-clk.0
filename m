Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH 14/19] clk: versatile: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:51 -0700
Message-Id: <1430897996-11597-15-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/versatile/clk-sp810.c:159:29: error: incompatible types for operation (<=)
drivers/clk/versatile/clk-sp810.c:159:29:    left side has type char const *<noident>
drivers/clk/versatile/clk-sp810.c:159:29:    right side has type int
drivers/clk/versatile/clk-sp810.c:159:53: error: incompatible types for operation (<=)
drivers/clk/versatile/clk-sp810.c:159:53:    left side has type char const *<noident>
drivers/clk/versatile/clk-sp810.c:159:53:    right side has type int
rivers/clk/versatile/clk-sp810.c:138:13: warning: symbol 'clk_sp810_of_setup' was not declared. Should it be static?

Cc: Pawel Moll <pawel.moll@arm.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/versatile/clk-sp810.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index c6e86a9a2aa3..a96dd8e53fdb 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -135,7 +135,7 @@ static struct clk *clk_sp810_timerclken_of_get(struct of_phandle_args *clkspec,
 	return sp810->timerclken[clkspec->args[0]].clk;
 }
 
-void __init clk_sp810_of_setup(struct device_node *node)
+static void __init clk_sp810_of_setup(struct device_node *node)
 {
 	struct clk_sp810 *sp810 = kzalloc(sizeof(*sp810), GFP_KERNEL);
 	const char *parent_names[2];
@@ -156,7 +156,7 @@ void __init clk_sp810_of_setup(struct device_node *node)
 			"timclk");
 	parent_names[1] = of_clk_get_parent_name(node, sp810->timclk_index);
 
-	if (parent_names[0] <= 0 || parent_names[1] <= 0) {
+	if (!parent_names[0] || !parent_names[1]) {
 		pr_warn("Failed to obtain parent clocks for SP810!\n");
 		return;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

