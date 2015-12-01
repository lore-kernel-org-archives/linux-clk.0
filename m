Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] Add support for MSM8996 clock controllers
Date: Mon, 30 Nov 2015 17:31:37 -0800
Message-Id: <1448933502-11944-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These patches add support for the global and multimedia clock controllers
found on MSM8996 devices. The first patch allows us to implement a
"power of two" divider of different widths with a table based divider.
The second patch adds support for Alpha PLLs and the 3rd and 5th patches
add support for the two clock controllers. The fourth patch is
a new type of clock ops for the graphics clock that does some custom
ping-pong between different PLLs when switching graphics frequencies.

Changes from v1:
 * Added some missing clocks in gcc and mmcc drivers
 * Updated PLL settings in mmcc

Stephen Boyd (5):
  clk: divider: Cap table divider values to 'width' member
  clk: qcom: Add Alpha PLL support
  clk: qcom: Add MSM8996 Global Clock Control (GCC) driver
  clk: qcom: Add gfx3d ping-pong PLL frequency switching
  clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver

 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 .../devicetree/bindings/clock/qcom,mmcc.txt        |    1 +
 drivers/clk/clk-divider.c                          |    9 +-
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  355 ++
 drivers/clk/qcom/clk-alpha-pll.h                   |   57 +
 drivers/clk/qcom/clk-rcg.h                         |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |   87 +
 drivers/clk/qcom/gcc-msm8996.c                     | 3422 ++++++++++++++++++++
 drivers/clk/qcom/mmcc-msm8996.c                    | 3217 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8996.h       |  339 ++
 include/dt-bindings/clock/qcom,mmcc-msm8996.h      |  285 ++
 13 files changed, 7790 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/qcom/clk-alpha-pll.c
 create mode 100644 drivers/clk/qcom/clk-alpha-pll.h
 create mode 100644 drivers/clk/qcom/gcc-msm8996.c
 create mode 100644 drivers/clk/qcom/mmcc-msm8996.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8996.h
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8996.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
