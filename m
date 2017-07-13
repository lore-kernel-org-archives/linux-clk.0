Return-Path: <tirupath@codeaurora.org>
From: Tirupathi Reddy <tirupath@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	andy.gross@linaro.org,
	david.brown@linaro.org
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	Tirupathi Reddy <tirupath@codeaurora.org>
Subject: [PATCH V1]: clk: qcom: support qpnp clock divider configuration
Date: Thu, 13 Jul 2017 17:02:15 +0530
Message-Id: <1499945536-18281-1-git-send-email-tirupath@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This patch adds a new device driver for configuring the clkdiv module
presents on the Qualcomm QPNP PMIC. The driver configures the frequency
of clkdiv outputs. The driver provides callback functions for different
clock operations and register the clkdiv module to clock framework.

Tirupathi Reddy (1):
  clk: qcom: Add qpnp clock divider support

 .../devicetree/bindings/clock/clk-qpnp-div.txt     |  52 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-qpnp-div.c                    | 422 +++++++++++++++++++++
 4 files changed, 484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/clk-qpnp-div.txt
 create mode 100644 drivers/clk/qcom/clk-qpnp-div.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
