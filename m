Return-Path: <anischal@codeaurora.org>
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Nischal <anischal@codeaurora.org>
Subject: [PATCH 0/2] clk: qcom: MISC RCG changes for SDM845
Date: Fri, 15 Dec 2017 14:34:02 +0530
Message-Id: <1513328644-23346-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This patch series does the miscellaneous changes for RCGs
used in SDM845.

1. Clear hardware clock control bit of RCGs where HW clock
   control bit is set by default so that software can control
   those root clocks.
2. Introduces clk_rcg2_shared_ops to support clock controller
   drivers for SDM845. With new shared ops, RCGs with shared
   branches will be configured to a safe source in disable
   path and actual RCG update configuration will be done in
   enable path instead of doing config update in set_rate.
   In set_rate(), just cache the rate instead of doing actual
   configuration update. Also each RCG in clock controller
   driver will have their own safe configuration frequency
   table to switch to safe frequency.

Amit Nischal (2):
  clk: qcom: Clear hardware clock control bit of RCG
  clk: qcom: Configure the RCGs to a safe source as needed

 drivers/clk/qcom/clk-rcg.h  |   8 ++-
 drivers/clk/qcom/clk-rcg2.c | 154 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 3 deletions(-)

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
