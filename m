Return-Path: <vivek.gautam@codeaurora.org>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: andy.gross@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/1] clk/mmcc-msm8996: Make mmagic_bimc_gdsc ALWAYS_ON
Date: Fri, 29 Jun 2018 17:00:59 +0530
Message-Id: <20180629113059.9406-1-vivek.gautam@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Patch (3a48ea5bbbc9 "clk: qcom: mmcc-msm8996: leave all mmagic gdscs
and clocks always enabled") makes all mmgaic gdscs ALWAYS_ON.
The mmagic_bimc_gdsc is also needed to be turned on to get display
working on 8x96.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index dfc5b4e431d3..38311a67e846 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -2910,6 +2910,7 @@ static struct gdsc mmagic_bimc_gdsc = {
 		.name = "mmagic_bimc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = ALWAYS_ON,
 };
 
 static struct gdsc mmagic_video_gdsc = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
