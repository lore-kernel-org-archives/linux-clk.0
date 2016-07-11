Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	stephen.boyd@linaro.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/6] clk: qcom: PLL updates
Date: Mon, 11 Jul 2016 16:20:33 +0530
Message-Id: <1468234239-28693-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This series adds some additional support to the clk-alpha-pll and the
clk-pll drivers in preperation to add the CPU clock driver support
on msm8996

regards,
Rajendra

Rajendra Nayak (6):
  clk: Fix inconsistencies in usage of data types
  clk: qcom: Add support for alpha pll hwfsm ops
  clk: qcom: Add support to initialize alpha plls
  clk: qcom: Add support for PLLs with alpha mode
  clk: qcom: Add support for PLLs with early output
  clk: qcom: Add support for PLLs supporting dynamic reprogramming

 drivers/clk/clk.c                |   4 +-
 drivers/clk/qcom/clk-alpha-pll.c | 132 +++++++++++++++++++++++++++++++++++----
 drivers/clk/qcom/clk-alpha-pll.h |  14 +++++
 drivers/clk/qcom/clk-pll.c       | 116 +++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-pll.h       |  12 +++-
 include/linux/clk-provider.h     |   5 +-
 6 files changed, 263 insertions(+), 20 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
