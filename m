Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43618 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030633AbeBNOAc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Feb 2018 09:00:32 -0500
From: Ilia Lin <ilialin@codeaurora.org>
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com,
        will.deacon@arm.com, rnayak@codeaurora.org, ilialin@codeaurora.org,
        amit.kucheria@linaro.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org, tfinkel@codeaurora.org
Subject: [PATCH v3 07/10] clk: qcom: clk-cpu-8996: Prepare PLLs on probe
Date: Wed, 14 Feb 2018 15:59:49 +0200
Message-Id: <1518616792-29028-8-git-send-email-ilialin@codeaurora.org>
In-Reply-To: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The PLLs must be prepared enabled during the probe to be
accessible by the OPPs. Otherwise an OPP may switch
to non-enabled clock.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 854f327..b0a3b73 100644
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
@@ -376,6 +376,18 @@ struct clk_hw_clks {
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

