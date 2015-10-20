Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v3 0/8] Add initial support for RPM clocks
Date: Tue, 20 Oct 2015 19:57:52 +0300
Message-Id: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patchset adds initial support for the clocks controlled by
the RPM (Resource Power Manager) processor on Qualcomm platforms.

The RPM is a dedicated hardware engine for managing the shared
SoC resources in order to keep the lowest power profile. It
communicates with other hardware subsystems via shared memory
and accepts clock requests, aggregates the requests and turns
the clocks on/off or scales them on demand.

Until now the RPM clock controller was not supported and a hard-
coded fixed-rate clocks were registered in the drivers. Now we
try to do a smooth transition by moving the xo oscillator to DT
(where it actually belongs) and handle both cases when RPMCC is
enabled or disabled (also to avoid breakage on current boards).

Changes since v2 (https://lkml.org/lkml/2015/8/3/513)
* Addressed various comments from Stephen. Thanks!
* Added sleep sets support.
* Added a mutex in the RPM driver.
* Support both scenarios - RPMCC enabled or disabled.
* Make RPMCC more generic in order to support other SMD RPM
  based platforms.

Changes since v1 (https://lkml.org/lkml/2015/7/9/257):
* Changed the driver name to clk-smd-rpm, also build it only
  when it is needed - suggested by Srini and Bjorn.
* More detailed binding example.
* Minor changes.

Georgi Djakov (8):
  arm64: dts: qcom: 8x16: Add fixed rate on-board oscillator
  clk: qcom: msm8916: Set the parent of xo to xo_board
  clk: qcom: msm8916: Ignore sleep_clk_src registration errors
  arm64: dts: qcom: 8x16: Add fixed rate sleep clock oscillator
  clk: qcom: Add support for RPM Clocks
  clk: qcom: Add RPM clock controller driver
  clk: qcom: msm8916: Use RPMCC if it is enabled
  clk: qcom: msm8916: Remove hard-coded sleep_clk_src

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   35 +++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   16 ++
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-smd-rpm.c                     |  260 ++++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.h                     |  142 +++++++++++
 drivers/clk/qcom/gcc-msm8916.c                     |   15 +-
 drivers/clk/qcom/rpmcc.c                           |  198 +++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc-msm8916.h     |   44 ++++
 9 files changed, 714 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.h
 create mode 100644 drivers/clk/qcom/rpmcc.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc-msm8916.h
