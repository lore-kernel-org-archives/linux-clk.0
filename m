Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/7] clk: qcom: Misc gcc/mmcc msm8996 fixes
Date: Wed, 19 Oct 2016 16:58:36 +0530
Message-Id: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These are some misc fixes in the gcc and mmcc clock drivers for msm8996

Rajendra Nayak (7):
  clk: qcom: Mark a few branch clocks with BRANCH_HALT_DELAY
  clk: qcom: Add a custom udelay needed for some branch clocks
  clk: qcom: Add custom udelays for clks in msm8996
  clk: qcom: Add freq tables for a few rcgs
  clk: qcom: Mark a few clocks as BRANCH_VOTED
  clk: qcom: Add force enable/disable needed for gfx3d rcg on msm8996
  clk: qcom: Add some missing gcc clks for msm8996

 drivers/clk/qcom/clk-branch.c                |   5 +-
 drivers/clk/qcom/clk-branch.h                |   2 +
 drivers/clk/qcom/clk-rcg2.c                  |  31 +++-
 drivers/clk/qcom/gcc-msm8996.c               | 254 ++++++++++++++++++++++++++-
 include/dt-bindings/clock/qcom,gcc-msm8996.h |  12 ++
 5 files changed, 291 insertions(+), 13 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
