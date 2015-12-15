Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v6 0/2] Add initial support for RPM clocks
Date: Tue, 15 Dec 2015 14:30:00 +0200
Message-Id: <1450182602-6996-1-git-send-email-georgi.djakov@linaro.org>
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

Changes since v5 (https://lkml.org/lkml/2015/12/3/376)
* Drop all DT patches as they are already picked.
* Fix dependencies in Kconfig.
* Minor changes.

Changes since v4 (https://lkml.org/lkml/2015/11/19/309)
* Re-organize code into two separate drivers:
  - clk-smd-rpm for RPM over SMD based clocks like msm8916
  - clk-rpm for RPM based clocks like apq8064
* Drop the patches that are already merged.
* Added the extra compatible string to docs and example.

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

Georgi Djakov (2):
  clk: qcom: Add support for SMD-RPM Clocks
  clk: qcom: Add support for RPM Clocks

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   37 ++
 drivers/clk/qcom/Kconfig                           |   29 ++
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpm.c                         |  290 +++++++++++++
 drivers/clk/qcom/clk-rpm.h                         |   71 ++++
 drivers/clk/qcom/clk-smd-rpm.c                     |  433 ++++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.h                     |  142 +++++++
 include/dt-bindings/clock/qcom,rpmcc.h             |   45 ++
 8 files changed, 1049 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/clk-rpm.c
 create mode 100644 drivers/clk/qcom/clk-rpm.h
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.h
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc.h
