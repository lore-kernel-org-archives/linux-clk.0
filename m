Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stanimir.varbanov@linaro.org,
	vivek.gautam@codeaurora.org,
	srinivas.kandagatla@linaro.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 0/3] clk: qcom: msm8996: handle mmagic gdscs and clocks
Date: Fri, 23 Mar 2018 13:56:13 +0530
Message-Id: <20180323082616.10142-1-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This is a respin of v1 with minor updates since this series is still
needed for most multimedia usescases to work on msm8996.

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
 drivers/clk/qcom/gcc-msm8996.c  |  2 +-
 drivers/clk/qcom/gdsc.c         |  8 ++++++++
 drivers/clk/qcom/gdsc.h         |  1 +
 drivers/clk/qcom/mmcc-msm8996.c | 22 +++++++++++-----------
 5 files changed, 37 insertions(+), 28 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
