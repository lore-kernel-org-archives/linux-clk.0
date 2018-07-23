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
Subject: [PATCH 0/2] Add QCOM camera clock controller driver
Date: Mon, 23 Jul 2018 16:56:31 +0530
Message-Id: <1532345193-18108-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This patch series adds a driver and device tree documentation binding
for the camera clock controller on some Qualcomm Technologies, Inc, SoCs
such as SDM845. This would allow camera drivers to probe and control their
clocks.

Amit Nischal (2):
  dt-bindings: clock: Introduce QCOM Camera clock bindings
  clk: qcom: Add camera clock controller driver for SDM845

 .../devicetree/bindings/clock/qcom,camcc.txt       |   18 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sdm845.c                    | 1736 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,camcc-sdm845.h      |  116 ++
 5 files changed, 1879 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc.txt
 create mode 100644 drivers/clk/qcom/camcc-sdm845.c
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sdm845.h

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
