Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andy.gross@linaro.org,
	bjorn.andersson@linaro.org,
	zhang.chunyan@linaro.org,
	georgi.djakov@linaro.org
Subject: [PATCH v8 0/3] Add initial support for RPM clocks
Date: Thu, 14 Apr 2016 17:34:46 +0300
Message-Id: <1460644489-11310-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patchset adds initial support for the clocks controlled by
the RPM (Resource Power Manager) processor on Qualcomm platforms.

The RPM is a dedicated hardware engine for managing the shared
SoC resources in order to keep the lowest power profile. It
communicates with other hardware subsystems via shared memory
and accepts clock requests, aggregates the requests and turns
the clocks on/off or scales them on demand.

Changes since v7 (https://lkml.org/lkml/2016/2/23/542)
* Add handoff support.
* Remove smd-rpm XO clocks until clk deferring is supported and
  switch msm8916 back to fixed factor XO.

Changes since v6 (https://lkml.org/lkml/2015/12/15/279)
* Remove header files and exported ops.
* Add support for active only RPM clocks.

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


Georgi Djakov (3):
  clk: qcom: Add support for SMD-RPM Clocks
  clk: qcom: Add support for RPM Clocks
  arm64: dts: qcom: msm8916: Use fixed factor xo clock

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   37 ++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    2 +-
 drivers/clk/qcom/Kconfig                           |   29 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpm.c                         |  503 +++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.c                     |  578 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h             |   69 +++
 7 files changed, 1219 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/clk-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc.h
