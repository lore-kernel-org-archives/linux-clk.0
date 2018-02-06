Return-Path: <pdeschrijver@nvidia.com>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>, <robh+dt@kernel.org>,
	<mark.rutland@arm.com>, <devicetree@vger.kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v3 00/11] Tegra210 DFLL implementation
Date: Tue, 6 Feb 2018 18:34:01 +0200
Message-ID: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

This series introduces support for the DFLL as a CPU clock source
on Tegra210. As Jetson TX2 uses a PWM controlled regulator IC which
is driven directly by the DFLLs PWM output, we also introduce support
for PWM regulators next to I2C controlled regulators. The DFLL output
frequency is directly controlled by the regulator voltage. The registers                                                                                       for controlling the PWM are part of the DFLL IP block, so there's no
separate linux regulator object involved because the regulator IC only                                                                                         supplies the rail powering the DFLL and the CPUs. It doesn't have any
other controls.

Changes since v2:
* added DT updates for Tegra210
* updated dfll DT binding documentation
* split changes to i2c support into its own patch
* retrieve regulator parameters from framework rather than from CVB table
* bug fixes

Changes since v1:
* improved commit messages
* some style cleanups                                                                                                                                           
Laxman Dewangan (1):
  regulator: core: add API to get voltage constraints

Peter De Schrijver (10):
  clk: tegra: retrieve regulator info from framework
  clk: tegra: dfll registration for multiple SoCs
  clk: tegra: add CVB tables for Tegra210 CPU DFLL
  clk: tegra: prepare dfll driver for PWM regulator
  clk: tegra: dfll: support PWM regulator control
  dt-bindings: tegra: Update DFLL binding for PWM regulator
  clk: tegra: build clk-dfll.c for Tegra124 and Tegra210
  cpufreq: tegra124-cpufreq: extend to support Tegra210
  arm64: dts: tegra: Add Tegra210 DFLL definition
  arm64: dts: nvidia: Tegra210 CPU clock definition

 .../bindings/clock/nvidia,tegra124-dfll.txt        |  76 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  18 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  12 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  26 +
 drivers/clk/tegra/Kconfig                          |   5 +
 drivers/clk/tegra/Makefile                         |   2 +-
 drivers/clk/tegra/clk-dfll.c                       | 462 +++++++++++++++---
 drivers/clk/tegra/clk-dfll.h                       |   2 +
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c         | 526 ++++++++++++++++++++-
 drivers/clk/tegra/cvb.c                            |  16 +-
 drivers/clk/tegra/cvb.h                            |   7 +-
 drivers/cpufreq/tegra124-cpufreq.c                 |  15 +-
 drivers/regulator/core.c                           |  31 ++
 include/linux/regulator/consumer.h                 |   2 +
 14 files changed, 1106 insertions(+), 94 deletions(-)

-- 
1.9.1
