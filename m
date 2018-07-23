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
Subject: [PATCH v5] Add display clock controller driver for SDM845
Date: Mon, 23 Jul 2018 16:24:34 +0530
Message-Id: <1532343275-7027-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

 [v5]
  * Initialize pll config before assigining l/alpha values for
    pll configure.
  * Add module description.

 [v4]
  * Add comments for the RCGs/CBCRs using the CLK_GET_RATE_NOCACHE flag.

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

Taniya Das (1):
  clk: qcom: Add display clock controller driver for SDM845

 drivers/clk/qcom/Kconfig         |  10 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/dispcc-sdm845.c | 687 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 698 insertions(+)
 create mode 100644 drivers/clk/qcom/dispcc-sdm845.c

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
