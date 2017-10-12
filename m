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
Subject: [PATCH 0/3] clk: qcom: msm8996: handle mmagic gdscs and clocks
Date: Thu, 12 Oct 2017 12:28:46 +0530
Message-Id: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

With no bus driver to handle the mmagic bus clocks and gdscs on msm8996,
its best to just turn them all ON at gdsc/clk driver probe and leave
them ON thereafter. This should unblock a lot of multimedia support on
msm8996 which rely on these to be ON and have no way to control them at
this point. Once we do have better noc/bus management drivers in place
we can avoid leaving these ON always and turn them ON/OFF as needed.

Rajendra Nayak (3):
  clk: qcom: gdsc: Add support for ALWAYS_ON gdscs
  clk: qcom: Register the gdscs before the clocks
  clk: qcom: mmcc-msm8996: leave all mmagic gdscs and clocks always    
    enabled

 drivers/clk/qcom/common.c       | 32 ++++++++++++++++----------------
 drivers/clk/qcom/gdsc.c         |  8 ++++++++
 drivers/clk/qcom/gdsc.h         |  1 +
 drivers/clk/qcom/mmcc-msm8996.c | 22 +++++++++++-----------
 4 files changed, 36 insertions(+), 27 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
