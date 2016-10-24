Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org,
	stanimir.varbanov@linaro.org
Cc: sricharan@codeaurora.org
Subject: [PATCH 0/3] clk: qcom: Add support for hw controlled gdscs/clocks
Date: Mon, 24 Oct 2016 15:48:14 +0530
Message-Id: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This series adds support for gdscs(powerdomains) that can be configured
in hw controlled mode. So they are turned 'ON' based on needs dynamically,
helping to save power. Also updated the venus video ip's gdsc/clock
data to put them in hw control.

Rajendra Nayak (1):
  clk: qcom: gdsc: Add support for gdscs with HW control

Sricharan R (2):
  clk: qcom: Put venus core0/1 gdscs to hw control mode
  clk: qcom: Set BRANCH_HALT_DELAY flags for venus core0/1 clks

 drivers/clk/qcom/gdsc.c         | 15 +++++++++++++++
 drivers/clk/qcom/gdsc.h         |  1 +
 drivers/clk/qcom/mmcc-msm8996.c |  4 ++++
 3 files changed, 20 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
