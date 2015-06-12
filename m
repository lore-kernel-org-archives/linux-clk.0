Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] Add support for A53 CPU clock
Date: Fri, 12 Jun 2015 11:41:54 +0300
Message-Id: <1434098519-26406-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patchset adds support for the A53 CPU clock to allow CPU
frequency scaling. It is used on platforms like Qualcomm's msm8916.

Georgi Djakov (4):
  clk: qcom: Add support for SR2 PLLs
  clk: qcom: Add support for regmap mux-div clocks
  clk: qcom: Add A53 clock driver
  arm64: dts: qcom: msm8916: Add A53 DT node

Stephen Boyd (1):
  clk: Add safe switch hook

 Documentation/devicetree/bindings/clock/qcom,a53cc |   22 ++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   12 +
 drivers/clk/clk.c                                  |   76 ++++-
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-a53.c                         |  195 +++++++++++++
 drivers/clk/qcom/clk-pll.c                         |   75 +++++
 drivers/clk/qcom/clk-pll.h                         |    1 +
 drivers/clk/qcom/clk-regmap-mux-div.c              |  297 ++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |   63 +++++
 include/linux/clk-provider.h                       |    2 +
 11 files changed, 745 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc
 create mode 100644 drivers/clk/qcom/clk-a53.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h
