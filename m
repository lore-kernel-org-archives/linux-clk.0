Return-Path: <anischal@codeaurora.org>
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Nischal <anischal@codeaurora.org>
Subject: [PATCH v2] Add QCOM camera clock controller driver
Date: Mon, 30 Jul 2018 14:52:19 +0530
Message-Id: <1532942540-2814-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Changes in v2:
Addressed below review comments - https://lkml.org/lkml/2018/7/23/377
1. Add comment to use clk_rcg2_shared_ops and CLK_SET_RATE_PARENT flag.
2. Replace commas with semicolon for PLL configuration in probe function.

Changes in v1:
This patch series adds a driver and device tree documentation binding
for the camera clock controller on some Qualcomm Technologies, Inc, SoCs
such as SDM845. This would allow camera drivers to probe and control
their clocks.

[v1] : https://lkml.org/lkml/2018/7/23/377

Amit Nischal (1):
  clk: qcom: Add camera clock controller driver for SDM845

 drivers/clk/qcom/Kconfig        |    8 +
 drivers/clk/qcom/Makefile       |    1 +
 drivers/clk/qcom/camcc-sdm845.c | 1744 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 1753 insertions(+)
 create mode 100644 drivers/clk/qcom/camcc-sdm845.c

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
