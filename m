Return-Path: <vivek.gautam@codeaurora.org>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] clk: qcom: Fix a possible NULL pointer dereferencing
Date: Thu,  5 Jan 2017 14:25:25 +0530
Message-Id: <1483606525-27709-1-git-send-email-vivek.gautam@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Assign num_parents as 0 while registering fixed rate clocks
in _qcom_cc_register_board_clk(), to make sure the clk framework
doesn't dereference parent.

Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")

Cc: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---

Based on 'clk-next'. Build tested.

 drivers/clk/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index cfab7b400381..df004ead1bef 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -157,6 +157,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 
 		init_data.name = path;
 		init_data.ops = &clk_fixed_rate_ops;
+		init_data.num_parents = 0;
 
 		ret = devm_clk_hw_register(dev, &fixed->hw);
 		if (ret)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
