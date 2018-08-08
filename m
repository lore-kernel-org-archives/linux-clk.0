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
Subject: [PATCH v3] Add QCOM camera clock controller driver
Date: Wed,  8 Aug 2018 16:17:18 +0530
Message-Id: <1533725239-14214-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Changes in v3:
1. Mentioned the name of the non-fixed PLL in the comment text.

Changes in v2:
Addressed below review comments - https://lkml.org/lkml/2018/7/23/377
1. Add comment to use clk_rcg2_shared_ops and CLK_SET_RATE_PARENT flag.
2. Replace commas with semicolon for PLL configuration in probe function.

Changes in v1:
This patch series adds a driver and device tree documentation binding
for the camera clock controller on some Qualcomm Technologies, Inc, SoCs
such as SDM845. This would allow camera drivers to probe and control
their clocks.

[v1] : https://lore.kernel.org/patchwork/project/lkml/list/?series=360354
[v2] : https://lore.kernel.org/patchwork/project/lkml/list/?series=361196

Amit Nischal (1):
  clk: qcom: Add camera clock controller driver for SDM845

 drivers/clk/qcom/Kconfig        |    8 +
 drivers/clk/qcom/Makefile       |    1 +
 drivers/clk/qcom/camcc-sdm845.c | 1745 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 1754 insertions(+)
 create mode 100644 drivers/clk/qcom/camcc-sdm845.c

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
