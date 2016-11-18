Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org,
	stanimir.varbanov@linaro.org
Cc: sricharan@codeaurora.org
Subject: [PATCH 2/2] clk: qcom: Put venus core0/1 gdscs to hw control mode
Date: Fri, 18 Nov 2016 17:39:29 +0530
Message-Id: <1479470969-15976-3-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1479470969-15976-1-git-send-email-sricharan@codeaurora.org>
References: <1479470969-15976-1-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The venus video ip's internal core blocks are under the
control of the firmware and their powerdomains needs to be
'ON' only when used by the firmware. So putting it into
hw controlled mode lets this to happen, otherwise the firmware
hangs checking for this.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index ca97e11..41aabe3 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -2945,6 +2945,7 @@ enum {
 		.name = "venus_core0",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc venus_core1_gdsc = {
@@ -2955,6 +2956,7 @@ enum {
 		.name = "venus_core1",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc camss_gdsc = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
