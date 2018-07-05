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
	rohitkr@codeaurora.org,
	Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/2] Add support for LPASS clock controller for SDM845
Date: Thu,  5 Jul 2018 12:25:19 +0530
Message-Id: <1530773721-14668-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

 [v2]
  * Make gcc_lpass_sway_clk static.
  * Remove using child nodes and use reg-names to differentiate various
    domains of LPASS CC.

Add support for the lpass clock controller found on SDM845 based devices.
This would allow lpass peripheral loader drivers to control the clocks to
bring the subsystem out of reset.

Taniya Das (2):
  dt-bindings: clock: Introduce QCOM LPASS clock bindings
  clk: qcom: Add lpass clock controller driver for SDM845

 .../devicetree/bindings/clock/qcom,lpasscc.txt     |  31 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/lpasscc-sdm845.c                  | 243 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,lpass-sdm845.h      |  18 ++
 4 files changed, 301 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
 create mode 100644 drivers/clk/qcom/lpasscc-sdm845.c
 create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
