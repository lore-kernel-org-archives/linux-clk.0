Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v4 0/3] Add support for Qualcomm A53 CPU clock
Date: Mon, 14 Dec 2015 15:58:00 +0200
Message-Id: <1450101483-23509-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>


This patchset adds support for the A53 CPU clock and allows scaling
of the CPU frequency on msm8916 based platforms.

Changes since v3 (https://lkml.org/lkml/2015/8/12/585)
 * Split driver into two parts - and separate A53 PLL and
   A53 clock controller drivers.
 * Drop the safe switch hook patch. Add a clock notifier in
   the clock provider to handle switching via safe mux and
   divider configuration.

Changes since v2 (https://lkml.org/lkml/2015/7/24/526)
 * Drop gpll0_vote patch.
 * Switch to the new clk_hw_* APIs.
 * Rebase to the current clk-next.

Changes since v1 (https://lkml.org/lkml/2015/6/12/193)
 * Drop SR2 PLL patch, as it is already applied.
 * Add gpll0_vote rate propagation patch.
 * Update/rebase patches to the current clk-next.

Georgi Djakov (3):
  clk: qcom: Add A53 PLL support
  clk: qcom: Add regmap mux-div clocks support
  clk: qcom: Add A53 clock driver

 .../devicetree/bindings/clock/qcom,a53-pll.txt     |   18 ++
 .../devicetree/bindings/clock/qcom,a53cc.txt       |   23 ++
 drivers/clk/qcom/Kconfig                           |   17 ++
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/a53-pll.c                         |  100 ++++++++
 drivers/clk/qcom/a53cc.c                           |  166 +++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.c              |  256 ++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |   58 +++++
 8 files changed, 641 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53-pll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c
 create mode 100644 drivers/clk/qcom/a53cc.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h
