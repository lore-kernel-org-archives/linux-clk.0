Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 00/11] clk: qcom: PLL updates
Date: Thu, 29 Sep 2016 14:05:41 +0530
Message-Id: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The series is adding a few things in clk-alpha-pll code which
will be needed to model CPU PLLs and also needed by some MMCC
PLLs on msm8996

Changes in v3:
* Removed all the confusing additions to clk-pll code from v2
* Added patches showing users for the new additions to clk-alpha-pll in mmcc and cpu clocks
* RFC of skeletal cpu clock driver included

Rajendra Nayak (10):
  clk: qcom: Add support for alpha pll hwfsm ops
  clk: qcom: Add support to initialize alpha plls
  clk: qcom: handle alpha PLLs with 16bit alpha val registers
  clk: qcom: Enable FSM mode for votable alpha PLLs
  clk: qcom: Add .is_enabled ops for clk-alpha-pll
  clk: qcom: Fix .set_rate to handle alpha PLLs w/wo dynamic update
  clk: qcom: mmcc-8996: Add capability flags for some alpha PLLs
  clk: qcom: Add support for table based lookups in clk-regmap-mux
  clk: Add clk_hw_get_clk() helper API to be used by clk providers
  clk: qcom: Add basic CPU clock driver for msm8996

Taniya Das (1):
  clk: qcom: support dynamic update using latched interface

 drivers/clk/clk.c                 |   6 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/clk-alpha-pll.c  | 272 ++++++++++++++++++++++---
 drivers/clk/qcom/clk-alpha-pll.h  |  31 +++
 drivers/clk/qcom/clk-cpu-8996.c   | 408 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-pll.c        |  31 +--
 drivers/clk/qcom/clk-regmap-mux.c |  13 ++
 drivers/clk/qcom/clk-regmap-mux.h |   1 +
 drivers/clk/qcom/common.c         |  21 ++
 drivers/clk/qcom/common.h         |   9 +
 drivers/clk/qcom/mmcc-msm8996.c   |   4 +
 include/linux/clk-provider.h      |   1 +
 12 files changed, 744 insertions(+), 54 deletions(-)
 create mode 100644 drivers/clk/qcom/clk-cpu-8996.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
