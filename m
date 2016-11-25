Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: andy.gross@linaro.org,
	david.brown@linaro.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: robh+dt@kernel.org,
	mark.rutland@arm.com,
	varada@codeaurora.org,
	pradeepb@codeaurora.org,
	snlakshm@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 5/6] clk: qcom: ipq4019: Add all the frequencies for apss cpu
Date: Fri, 25 Nov 2016 21:11:32 +0530
Message-Id: <1480088493-4590-6-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The APSS CPU clock does not contain all the frequencies in its
frequency table so this patch adds the same.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 320750c..eeafca2 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -569,10 +569,20 @@ struct clk_fepll {
 };
 
 static const struct freq_tbl ftbl_gcc_apps_clk[] = {
-	F(48000000, P_XO,	   1, 0, 0),
+	F(48000000,  P_XO,         1, 0, 0),
 	F(200000000, P_FEPLL200,   1, 0, 0),
+	F(384000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(413000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(448000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(488000000, P_DDRPLLAPSS, 1, 0, 0),
 	F(500000000, P_FEPLL500,   1, 0, 0),
-	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(512000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(537000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(565000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(597000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(632000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(672000000, P_DDRPLLAPSS, 1, 0, 0),
+	F(716000000, P_DDRPLLAPSS, 1, 0, 0),
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
