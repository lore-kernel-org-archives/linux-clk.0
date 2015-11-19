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
Subject: [PATCH v4 0/5] Add initial support for RPM clocks
Date: Thu, 19 Nov 2015 15:57:55 +0200
Message-Id: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
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
are moving the on-board clocks to the DT (where they actually
belong). If the RPM clock controller is enabled we insert it
right after the DT clocks making it a parent of some GCC clocks.

The DT patches should go through the soc/qcom tree. This also
depends on smem and smd.

Changes since v3 (https://lkml.org/lkml/2015/10/20/613)
* Drop some of the patches as now we handle both scenarios -
  RPMCC enabled or disabled.
* Addressed more comments from Stephen. Thanks again!

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


Georgi Djakov (5):
  clk: qcom: msm8916: Move xo and sleep clocks into DT
  arm64: dts: qcom: msm8916: Add fixed rate on-board oscillator
  clk: qcom: Add support for RPM Clocks
  clk: qcom: Add RPM clock controller driver
  arm64: dts: qcom: msm8916: Add RPMCC DT node

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   35 +++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   20 ++
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-smd-rpm.c                     |  263 ++++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.h                     |  142 +++++++++++
 drivers/clk/qcom/gcc-msm8916.c                     |   16 +-
 drivers/clk/qcom/rpmcc.c                           |  206 +++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc-msm8916.h     |   44 ++++
 9 files changed, 730 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.h
 create mode 100644 drivers/clk/qcom/rpmcc.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc-msm8916.h
