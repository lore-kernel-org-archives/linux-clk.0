Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v3 0/3] Add support for Qualcomm A53 CPU clock
Date: Wed, 12 Aug 2015 16:54:30 +0300
Message-Id: <1439387673-13015-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset adds support for the A53 CPU clock and allows scaling
of the CPU frequency on msm8916 based platforms.

Changes since v2 (https://lkml.org/lkml/2015/7/24/526)
 * Drop gpll0_vote patch.
 * Switch to the new clk_hw_* APIs.
 * Rebase to the current clk-next.

Changes since v1 (https://lkml.org/lkml/2015/6/12/193)
 * Drop SR2 PLL patch, as it is already applied.
 * Add gpll0_vote rate propagation patch.
 * Update/rebase patches to the current clk-next.

Georgi Djakov (2):
  clk: qcom: Add support for regmap mux-div clocks
  clk: qcom: Add A53 clock driver

Stephen Boyd (1):
  clk: Add safe switch hook

 Documentation/devicetree/bindings/clock/qcom,a53cc |   25 ++
 drivers/clk/clk.c                                  |   73 ++++-
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-a53.c                         |  202 ++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.c              |  288 ++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |   63 +++++
 include/linux/clk-provider.h                       |    2 +
 8 files changed, 658 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc
 create mode 100644 drivers/clk/qcom/clk-a53.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h

