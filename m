Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robdclark@gmail.com,
	jcrouse@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/2] clk: qcom: Add support for msm8996 gpu gdscs
Date: Thu, 20 Oct 2016 15:08:05 +0530
Message-Id: <1476956287-13749-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The GPU gdsc for 8996 has an additonal clamp that needs to be
released/deasserted before the gdsc can be enabled, and asserted
back on a disable.
This series adds support to do that based off a flag in the gdsc
driver and also populates the data for the 2 gdscs which are part
of mmcc

Rajendra Nayak (2):
  clk: qcom: Handle the clamp_io assert/deassert sequence
  clk: qcom: mmcc-8996: Add gpu gdscs

 drivers/clk/qcom/gdsc.c         | 26 +++++++++++++++++++++++++-
 drivers/clk/qcom/gdsc.h         |  2 ++
 drivers/clk/qcom/mmcc-msm8996.c | 24 ++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 1 deletion(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
