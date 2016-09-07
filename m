Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v6 0/3] Add support for Qualcomm A53 CPU clock
Date: Wed,  7 Sep 2016 16:13:28 +0300
Message-Id: <20160907131331.18638-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patchset adds support for the A53 CPU clock and allows scaling
of the CPU frequency on msm8916 based platforms.

Changes since v5 (https://lkml.org/lkml/2016/2/1/407)
 * Rebase to clk-next and update according to the recent API changes.

Changes since v4 (https://lkml.org/lkml/2015/12/14/367)
 * Convert to builtin drivers as now __clk_lookup() is used

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

 .../devicetree/bindings/clock/qcom,a53-pll.txt     |  18 ++
 .../devicetree/bindings/clock/qcom,a53cc.txt       |  23 ++
 drivers/clk/qcom/Kconfig                           |  17 ++
 drivers/clk/qcom/Makefile                          |   3 +
 drivers/clk/qcom/a53-pll.c                         |  94 ++++++++
 drivers/clk/qcom/a53cc.c                           | 155 +++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.c              | 254 +++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |  58 +++++
 8 files changed, 622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53-pll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c
 create mode 100644 drivers/clk/qcom/a53cc.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h
