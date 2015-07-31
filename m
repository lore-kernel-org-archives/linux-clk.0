Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42338 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753978AbbGaREP (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 31 Jul 2015 13:04:15 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:54 -0700
Message-Id: <1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs. This also
removes a clk_get() in this driver that can just as easily use
of_clk_get_parent_name() instead.

Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mvebu/clk-cpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index 86888a658d4c..5837eb8a212f 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -121,7 +121,7 @@ static int clk_cpu_on_set_rate(struct clk_hw *hwclk, unsigned long rate,
 	if (!cpuclk->pmu_dfs)
 		return -ENODEV;
 
-	cur_rate = __clk_get_rate(hwclk->clk);
+	cur_rate = clk_hw_get_rate(hwclk);
 
 	reg = readl(cpuclk->reg_base + SYS_CTRL_CLK_DIVIDER_CTRL2_OFFSET);
 	fabric_div = (reg >> SYS_CTRL_CLK_DIVIDER_CTRL2_NBCLK_RATIO_SHIFT) &
@@ -197,7 +197,6 @@ static void __init of_cpu_clk_setup(struct device_node *node)
 	for_each_node_by_type(dn, "cpu") {
 		struct clk_init_data init;
 		struct clk *clk;
-		struct clk *parent_clk;
 		char *clk_name = kzalloc(5, GFP_KERNEL);
 		int cpu, err;
 
@@ -209,9 +208,8 @@ static void __init of_cpu_clk_setup(struct device_node *node)
 			goto bail_out;
 
 		sprintf(clk_name, "cpu%d", cpu);
-		parent_clk = of_clk_get(node, 0);
 
-		cpuclk[cpu].parent_name = __clk_get_name(parent_clk);
+		cpuclk[cpu].parent_name = of_clk_get_parent_name(node, 0);
 		cpuclk[cpu].clk_name = clk_name;
 		cpuclk[cpu].cpu = cpu;
 		cpuclk[cpu].reg_base = clock_complex_base;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

