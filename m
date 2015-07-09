Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] Add initial support for RPM clocks
Date: Thu,  9 Jul 2015 15:18:28 +0300
Message-Id: <1436444310-15108-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset adds initial support for the clocks controlled by the
RPM (Resource Power Manager) processor on Qualcomm platforms. It
depends on Bjorn Andersson's Qualcomm SMD & RPM drivers patchset [1]

The first patch implements the RPM clock operations, which are
using a shared memory for sending requests to the RPM processor.
The second patch adds the support of RPM clocks on the MSM8916
platform.

[1] https://lkml.org/lkml/2015/6/26/577

Georgi Djakov (2):
  clk: qcom: Add support for RPM Clocks
  clk: qcom: Add MSM8916 RPM clock driver

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   20 +++
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpm.c                         |  164 ++++++++++++++++++
 drivers/clk/qcom/clk-rpm.h                         |  137 +++++++++++++++
 drivers/clk/qcom/gcc-msm8916.c                     |   13 --
 drivers/clk/qcom/rpmcc-msm8916.c                   |  183 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc-msm8916.h     |   44 +++++
 7 files changed, 550 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/clk-rpm.c
 create mode 100644 drivers/clk/qcom/clk-rpm.h
 create mode 100644 drivers/clk/qcom/rpmcc-msm8916.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc-msm8916.h

