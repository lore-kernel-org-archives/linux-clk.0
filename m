Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org,
	stanimir.varbanov@linaro.org
Cc: sricharan@codeaurora.org
Subject: [PATCH 0/2] clk: qcom: Add support for hw controlled gdscs/clocks
Date: Fri, 18 Nov 2016 17:39:27 +0530
Message-Id: <1479470969-15976-1-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This series adds support for gdscs(powerdomains) that can be configured
in hw controlled mode. So they are turned 'ON' based on needs dynamically,
helping to save power. Also updated the venus video ip's gdsc/clock
data to put them in hw control.

V2:
 Dropped patch#3 [1] as it was concluded that the patch was effectively
 masking the fact the clocks were not getting turned on when the gdsc
 is put in hwctrl. With some change in sequence from venus core, masking
 is not needed and so patch needs to handled in venus driver.

 Fixed a comment in patch#1 to check the return value for gdsc_hwctrl

[1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1270922.html

Rajendra Nayak (1):
  clk: qcom: gdsc: Add support for gdscs with HW control

Sricharan R (1):
  clk: qcom: Put venus core0/1 gdscs to hw control mode

 drivers/clk/qcom/gdsc.c         | 19 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h         |  1 +
 drivers/clk/qcom/mmcc-msm8996.c |  2 ++
 3 files changed, 22 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
