Return-Path: <tdas@codeaurora.org>
From: Taniya Das <tdas@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 0/3] Add display clock controller driver for SDM845
Date: Sat, 23 Jun 2018 19:49:24 +0530
Message-Id: <1529763567-13131-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

 [v3]
  * Move frequency table macro to common file,
    add the patch along to maintain dependency.

 [v2]
  * Removed unused header file includes.
  * Moved the frequency table macro to a common file [1].
  * Move to pll config to probe.
  * Update SoC name in device tree binding and
    also update the Kconfig.

Add support for the display clock controller found on SDM845
based devices. This would allow display drivers to probe and
control their clocks.

Taniya Das (3):
  clk: qcom: Move frequency table macro to common file
  dt-bindings: clock: Introduce QCOM Display clock bindings
  clk: qcom: Add display clock controller driver for SDM845

 .../devicetree/bindings/clock/qcom,dispcc.txt      |  19 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-rcg.h                         |   2 +
 drivers/clk/qcom/dispcc-sdm845.c                   | 674 +++++++++++++++++++++
 drivers/clk/qcom/gcc-apq8084.c                     |   2 -
 drivers/clk/qcom/gcc-ipq4019.c                     |   2 -
 drivers/clk/qcom/gcc-ipq8074.c                     |   2 -
 drivers/clk/qcom/gcc-msm8916.c                     |   2 -
 drivers/clk/qcom/gcc-msm8974.c                     |   2 -
 drivers/clk/qcom/gcc-msm8994.c                     |   2 -
 drivers/clk/qcom/gcc-msm8996.c                     |   2 -
 drivers/clk/qcom/gcc-msm8998.c                     |   2 -
 drivers/clk/qcom/gcc-sdm845.c                      |   2 -
 drivers/clk/qcom/mmcc-apq8084.c                    |   2 -
 drivers/clk/qcom/mmcc-msm8974.c                    |   2 -
 drivers/clk/qcom/mmcc-msm8996.c                    |   2 -
 drivers/clk/qcom/videocc-sdm845.c                  |   2 -
 include/dt-bindings/clock/qcom,dispcc-sdm845.h     |  45 ++
 19 files changed, 751 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.txt
 create mode 100644 drivers/clk/qcom/dispcc-sdm845.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sdm845.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
