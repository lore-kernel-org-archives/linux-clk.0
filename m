Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42682 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752159AbeADLKu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Jan 2018 06:10:50 -0500
From: Ilia Lin <ilialin@codeaurora.org>
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com,
        will.deacon@arm.com, rnayak@codeaurora.org, ilialin@codeaurora.org,
        amit.kucheria@linaro.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org, tfinkel@codeaurora.org
Subject: [PATCH v2 08/11] clk: qcom: clk-cpu-8996: Prepare PLLs on probe
Date: Thu,  4 Jan 2018 13:10:12 +0200
Message-Id: <1515064215-22202-9-git-send-email-ilialin@codeaurora.org>
In-Reply-To: <1515064215-22202-1-git-send-email-ilialin@codeaurora.org>
References: <1515064215-22202-1-git-send-email-ilialin@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The PLLs must be prepared enabled during the probe to be
accessible by the OPPs. Otherwise an OPP may switch
to non-enabled clock.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 81cf466..f1bfd13 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-
+#include <linux/clk-provider.h>
 #include "clk-alpha-pll.h"
 
 #define VCO(a, b, c) { \
@@ -160,7 +160,7 @@ static int clk_cpu_8996_mux_set_parent(struct clk_hw *hw, u8 index)
 				    cpuclk->shift);
 
 	val = index;
-	val = cpuclk->shift;
+	val <<= cpuclk->shift;
 
 	return regmap_update_bits(clkr->regmap, cpuclk->reg, mask, val);
 }
@@ -269,7 +269,7 @@ int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 		},
 		.num_parents = 4,
 		.ops = &clk_cpu_8996_mux_ops,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 	},
 };
 
@@ -285,12 +285,12 @@ int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 		.parent_names = (const char *[]){
 			"perfcl_smux",
 			"perfcl_pll",
-			"pwrcl_pll_acd",
+			"perfcl_pll_acd",
 			"perfcl_alt_pll",
 		},
 		.num_parents = 4,
 		.ops = &clk_cpu_8996_mux_ops,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 	},
 };
 
@@ -355,6 +355,18 @@ struct clk_hw_clks {
 	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
 
+	/* Enable all PLLs and alt PLLs */
+	clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
+	clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
+	clk_prepare_enable(pwrcl_pll.clkr.hw.clk);
+	clk_prepare_enable(perfcl_pll.clkr.hw.clk);
+
+	/* Set initial boot frequencies for power/perf PLLs */
+	clk_set_rate(pwrcl_alt_pll.clkr.hw.clk, 652800000);
+	clk_set_rate(perfcl_alt_pll.clkr.hw.clk, 652800000);
+	clk_set_rate(pwrcl_pll.clkr.hw.clk, 652800000);
+	clk_set_rate(perfcl_pll.clkr.hw.clk, 652800000);
+
 	ret = clk_notifier_register(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
 	if (ret)
 		return ret;
-- 
1.9.1

