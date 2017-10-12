Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stanimir.varbanov@linaro.org,
	vivek.gautam@codeaurora.org,
	architt@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 3/3] clk: qcom: mmcc-msm8996: leave all mmagic gdscs and clocks always enabled
Date: Thu, 12 Oct 2017 12:28:49 +0530
Message-Id: <1507791529-24353-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
References: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

There's no bus infrastructure today to handle all the mmagic bus
clocks and GDSCs needed by all the multimedia blocks in msm8996, like
mdss, video, camera and gpu. Mark all these clocks with a CLK_IS_CRITICAL
and GDSCs with a ALWAYS_ON flag for now so they are left always enabled.
This patch should be reverted at some point when we do have a bus driver
to manage these clocks and GDSCs.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 352394d..3ba37f3 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -1229,7 +1229,7 @@ enum {
 			.name = "mmss_mmagic_ahb_clk",
 			.parent_names = (const char *[]){ "ahb_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1244,7 +1244,7 @@ enum {
 			.name = "mmss_mmagic_cfg_ahb_clk",
 			.parent_names = (const char *[]){ "ahb_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1303,7 +1303,7 @@ enum {
 			.name = "mmagic_camss_axi_clk",
 			.parent_names = (const char *[]){ "axi_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1318,7 +1318,7 @@ enum {
 			.name = "mmagic_camss_noc_cfg_ahb_clk",
 			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1423,7 +1423,7 @@ enum {
 			.name = "mmagic_mdss_axi_clk",
 			.parent_names = (const char *[]){ "axi_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1438,7 +1438,7 @@ enum {
 			.name = "mmagic_mdss_noc_cfg_ahb_clk",
 			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1513,7 +1513,7 @@ enum {
 			.name = "mmagic_video_axi_clk",
 			.parent_names = (const char *[]){ "axi_clk_src" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1528,7 +1528,7 @@ enum {
 			.name = "mmagic_video_noc_cfg_ahb_clk",
 			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2903,7 +2903,7 @@ enum {
 		.name = "mmagic_video",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | ALWAYS_ON,
 };
 
 static struct gdsc mmagic_mdss_gdsc = {
@@ -2913,7 +2913,7 @@ enum {
 		.name = "mmagic_mdss",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | ALWAYS_ON,
 };
 
 static struct gdsc mmagic_camss_gdsc = {
@@ -2923,7 +2923,7 @@ enum {
 		.name = "mmagic_camss",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | ALWAYS_ON,
 };
 
 static struct gdsc venus_gdsc = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
