Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:42294 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752823AbdLGLCJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Dec 2017 06:02:09 -0500
Received: by mail-wm0-f65.google.com with SMTP id l141so12295673wmg.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Dec 2017 03:02:08 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: sboyd@codeaurora.org, linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk: qcom: gcc-msm8996: Mark aggre0 noc clks as critical
Date: Thu,  7 Dec 2017 10:59:22 +0000
Message-Id: <20171207105922.31986-1-srinivas.kandagatla@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

aggre0 bus clks are not associated with any of the drivers, so its
important that these clks are always on to get peripherals on this
bus working. So mark them as critical.

Eventually when we have a proper bus driver these clks can be marked
appropriately.

Without this patch pcie on db820c is not functional.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 7ddec886fcd3..0146d8853488 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -2891,7 +2891,7 @@ static struct clk_branch gcc_aggre0_snoc_axi_clk = {
 			.name = "gcc_aggre0_snoc_axi_clk",
 			.parent_names = (const char *[]){ "system_noc_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2906,7 +2906,7 @@ static struct clk_branch gcc_aggre0_cnoc_ahb_clk = {
 			.name = "gcc_aggre0_cnoc_ahb_clk",
 			.parent_names = (const char *[]){ "config_noc_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2921,7 +2921,7 @@ static struct clk_branch gcc_smmu_aggre0_axi_clk = {
 			.name = "gcc_smmu_aggre0_axi_clk",
 			.parent_names = (const char *[]){ "system_noc_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2936,7 +2936,7 @@ static struct clk_branch gcc_smmu_aggre0_ahb_clk = {
 			.name = "gcc_smmu_aggre0_ahb_clk",
 			.parent_names = (const char *[]){ "config_noc_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.15.0

