Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 5/6] clk: qcom: gdsc: Do not check for disabled status on votable gdscs
Date: Thu, 26 Nov 2015 11:24:56 +0530
Message-Id: <1448517297-32419-6-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some gdscs might be controlled via voting registers and might not
really disable when the kernel intends to disable them (due to other
votes keeping them enabled)
Mark these gdscs with a flag for we do not check/wait on a disable
status for these gdscs within the kernel disable callback.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c  |  4 ++++
 drivers/clk/qcom/gdsc.c         |  4 ++++
 drivers/clk/qcom/gdsc.h         | 15 ++++++++-------
 drivers/clk/qcom/mmcc-msm8996.c |  3 +++
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index c5bce5f..bb8c61f 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3067,6 +3067,7 @@ static struct gdsc aggre0_noc_gdsc = {
 		.name = "aggre0_noc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_aggre0_noc_gdsc = {
@@ -3075,6 +3076,7 @@ static struct gdsc hlos1_vote_aggre0_noc_gdsc = {
 		.name = "hlos1_vote_aggre0_noc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_lpass_adsp_gdsc = {
@@ -3083,6 +3085,7 @@ static struct gdsc hlos1_vote_lpass_adsp_gdsc = {
 		.name = "hlos1_vote_lpass_adsp",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc hlos1_vote_lpass_core_gdsc = {
@@ -3091,6 +3094,7 @@ static struct gdsc hlos1_vote_lpass_core_gdsc = {
 		.name = "hlos1_vote_lpass_core",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 static struct gdsc usb30_gdsc = {
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fb2e43c..984537f 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -65,6 +65,10 @@ static int gdsc_toggle_logic(struct gdsc *sc, bool en)
 	if (ret)
 		return ret;
 
+	/* If disabling votable gdscs, don't poll on status */
+	if ((sc->flags & VOTABLE) && !en)
+		return 0;
+
 	timeout = jiffies + usecs_to_jiffies(TIMEOUT_US);
 
 	if (sc->gds_hw_ctrl) {
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 66a43be..91cbb09 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -20,13 +20,6 @@
 struct regmap;
 struct reset_controller_dev;
 
-/* Powerdomain allowable state bitfields */
-#define PWRSTS_OFF		BIT(0)
-#define PWRSTS_RET		BIT(1)
-#define PWRSTS_ON		BIT(2)
-#define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
-#define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
-
 /**
  * struct gdsc - Globally Distributed Switch Controller
  * @pd: generic power domain
@@ -49,6 +42,14 @@ struct gdsc {
 	unsigned int			*cxcs;
 	unsigned int			cxc_count;
 	const u8			pwrsts;
+/* Powerdomain allowable state bitfields */
+#define PWRSTS_OFF		BIT(0)
+#define PWRSTS_RET		BIT(1)
+#define PWRSTS_ON		BIT(2)
+#define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
+#define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
+	const u8			flags;
+#define VOTABLE		BIT(0)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 236acf5..a0a7338 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -2925,6 +2925,7 @@ struct gdsc mmagic_video_gdsc = {
 		.name = "mmagic_video",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 struct gdsc mmagic_mdss_gdsc = {
@@ -2934,6 +2935,7 @@ struct gdsc mmagic_mdss_gdsc = {
 		.name = "mmagic_mdss",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 struct gdsc mmagic_camss_gdsc = {
@@ -2943,6 +2945,7 @@ struct gdsc mmagic_camss_gdsc = {
 		.name = "mmagic_camss",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
 };
 
 struct gdsc venus_gdsc = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
