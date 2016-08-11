Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 00/10] clk: qcom: PLL updates
Date: Thu, 11 Aug 2016 14:10:48 +0530
Message-Id: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This series adds some additional support to the clk-alpha-pll and the
clk-pll drivers in preperation to add the CPU clock driver support
on msm8996

Changes in v2:
* Patch 1 to 6 are same as v1 post, added patches 7 to 10

Rajendra Nayak (8):
  clk: Fix inconsistencies in usage of data types
  clk: qcom: Add support for alpha pll hwfsm ops
  clk: qcom: Add support to initialize alpha plls
  clk: qcom: Add support for PLLs with alpha mode
  clk: qcom: Add support for PLLs with early output
  clk: qcom: Add support for PLLs supporting dynamic reprogramming
  clk: qcom: Add support to enable FSM mode for votable alpha PLLs
  clk: qcom: Add .is_enabled ops for clk-alpha-pll

Taniya Das (2):
  clk: qcom: Cleanup some macro defs
  clk: qcom: Fix .set_rate to handle alpha PLLs w/wo dynamic update

 drivers/clk/clk.c                |   4 +-
 drivers/clk/qcom/clk-alpha-pll.c | 235 ++++++++++++++++++++++++++++++++++-----
 drivers/clk/qcom/clk-alpha-pll.h |  17 +++
 drivers/clk/qcom/clk-pll.c       | 123 +++++++++++++++++---
 drivers/clk/qcom/clk-pll.h       |  12 +-
 drivers/clk/qcom/common.c        |  29 +++++
 drivers/clk/qcom/common.h        |   2 +
 include/linux/clk-provider.h     |   5 +-
 8 files changed, 378 insertions(+), 49 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
