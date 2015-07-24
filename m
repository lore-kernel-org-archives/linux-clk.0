Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org, agross@codeaurora.org
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v2 0/5] Add support for Qualcomm A53 CPU clock
Date: Fri, 24 Jul 2015 19:58:34 +0300
Message-Id: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset adds support for the A53 CPU clock and allows scaling
of the CPU frequency on msm8916 based platforms.

Changes since v1 (https://lkml.org/lkml/2015/6/12/193)
 * Drop SR2 PLL patch, as it is already applied.
 * Add gpll0_vote rate propagation patch.
 * Update/rebase patches to the current clk-next.

Georgi Djakov (4):
  clk: qcom: Enable gpll0_vote rate propagation on MSM8916
  clk: qcom: Add support for regmap mux-div clocks
  clk: qcom: Add A53 clock driver
  arm64: dts: qcom: msm8916: Add A53 DT node

Stephen Boyd (1):
  clk: Add safe switch hook

 Documentation/devicetree/bindings/clock/qcom,a53cc |   25 ++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   12 +
 drivers/clk/clk.c                                  |   73 ++++-
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-a53.c                         |  202 ++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.c              |  291 ++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |   63 +++++
 drivers/clk/qcom/gcc-msm8916.c                     |    1 +
 include/linux/clk-provider.h                       |    2 +
 10 files changed, 674 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc
 create mode 100644 drivers/clk/qcom/clk-a53.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h

