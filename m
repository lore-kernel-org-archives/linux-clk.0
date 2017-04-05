Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/6] clk: qcom: CPU clock driver for msm8996  
Date: Wed,  5 Apr 2017 10:25:23 +0530
Message-Id: <1491368129-24721-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This series adds support for the CPU clocks on msm8996 devices.
A previous post of RFC can be found here
https://patchwork.kernel.org/patch/9355925/

Rajendra Nayak (5):
  clk: qcom: Make clk_alpha_pll_configure available to modules
  clk: qcom: Add CPU clock driver for msm8996
  clk: qcom: cpu-8996: Add support to switch to alternate PLL
  clk: qcom: cpu-8996: Add support to switch below 600Mhz
  arm64: dts: msm8996: Add CPU clock controller node

Taniya Das (1):
  clk: qcom: Fix .set_rate to handle alpha PLLs w/wo dynamic update

 .../devicetree/bindings/clock/qcom,kryocc.txt      |  17 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   6 +
 drivers/clk/qcom/Kconfig                           |   8 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  72 +++-
 drivers/clk/qcom/clk-alpha-pll.h                   |   5 +
 drivers/clk/qcom/clk-cpu-8996.c                    | 440 +++++++++++++++++++++
 7 files changed, 538 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt
 create mode 100644 drivers/clk/qcom/clk-cpu-8996.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
