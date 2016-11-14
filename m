Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 0/3] clk: qcom: PLL updates..take2
Date: Mon, 14 Nov 2016 16:30:37 +0530
Message-Id: <1479121240-20922-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This is a v4 of the patches left over from v3.
Reworked and rebased on top of clk-next.

Changes in v4:
* got rid of the use of init structures from the .set_rate ops

Rajendra Nayak (1):
  clk: qcom: mmcc-8996: Add capability flags for some alpha PLLs

Taniya Das (2):
  clk: qcom: Fix .set_rate to handle alpha PLLs w/wo dynamic update
  clk: qcom: support dynamic update using latched interface

 drivers/clk/qcom/clk-alpha-pll.c | 106 +++++++++++++++++++++++++++++++++++----
 drivers/clk/qcom/clk-alpha-pll.h |  10 ++++
 drivers/clk/qcom/mmcc-msm8996.c  |   4 ++
 3 files changed, 109 insertions(+), 11 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
