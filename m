Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v2 0/2] Add initial support for RPM clocks
Date: Mon,  3 Aug 2015 19:48:07 +0300
Message-Id: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patchset adds initial support for the clocks controlled by
the RPM (Resource Power Manager) processor on Qualcomm platforms.
It depends on Bjorn's Qualcomm SMD & RPM patches, that are now in
linux-next: https://lkml.org/lkml/2015/7/27/1125

The first patch implements the RPM clock operations, which are
using a shared memory for sending requests to the RPM processor.
The second patch adds the support of RPM clocks on the MSM8916
platform.

Changes since v1 (https://lkml.org/lkml/2015/7/9/257):
* Changed the driver name to clk-smd-rpm, also build it only
  when it is needed - suggested by Srini and Bjorn.
* More detailed binding example.
* Minor changes.

Georgi Djakov (2):
  clk: qcom: Add support for RPM Clocks
  clk: qcom: Add MSM8916 RPM clock driver

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   35 ++++
 drivers/clk/qcom/Kconfig                           |    4 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-smd-rpm.c                     |  165 ++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.h                     |  139 ++++++++++++++
 drivers/clk/qcom/gcc-msm8916.c                     |   13 --
 drivers/clk/qcom/rpmcc-msm8916.c                   |  196 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc-msm8916.h     |   44 +++++
 8 files changed, 585 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.h
 create mode 100644 drivers/clk/qcom/rpmcc-msm8916.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc-msm8916.h
