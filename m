Return-Path: <aisheng.dong@nxp.com>
From: Dong Aisheng <aisheng.dong@nxp.com>
To: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	shawnguo@kernel.org,
	fabio.estevam@nxp.com,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 00/12] clk: imx: add imx8qxp clock support
Date: Sat, 28 Apr 2018 02:56:31 +0800
Message-Id: <1524855403-15301-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: aisheng.dong@nxp.com
List-ID: <linux-clk.vger.kernel.org>

This patch series adds i.MX8QXP clock support which is based
on the clock service provided by SCU firmware.
It depends on SCU APIs patch set.

Dong Aisheng (12):
  clk: imx: add configuration option for mmio clks
  clk: imx: scu: add scu clock common part
  clk: imx: scu: add scu clock divider
  clk: imx: scu: add scu clock gpr divider
  clk: imx: scu: add scu clock gate
  clk: imx: scu: add scu clock gpr gate
  clk: imx: scu: add scu clock mux
  clk: imx: scu: add scu clock gpr mux
  clk: imx: add common imx_clk_hw_fixed functions
  clk: imx: add imx_check_clk_hws helper function
  dt-bindings: clock: add imx8qxp clock binding doc
  clk: imx: add imx8qxp clk driver

 .../devicetree/bindings/clock/imx8qxp-clk.txt      |  39 ++
 arch/arm/mach-imx/Kconfig                          |  10 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/imx/Kconfig                            |   7 +
 drivers/clk/imx/Makefile                           |   4 +-
 drivers/clk/imx/clk-common.h                       |  27 ++
 drivers/clk/imx/scu/Kconfig                        |   5 +
 drivers/clk/imx/scu/Makefile                       |  12 +
 drivers/clk/imx/scu/clk-divider-gpr-scu.c          | 131 +++++++
 drivers/clk/imx/scu/clk-divider-scu.c              | 129 +++++++
 drivers/clk/imx/scu/clk-gate-gpr-scu.c             |  84 ++++
 drivers/clk/imx/scu/clk-gate-scu.c                 | 193 ++++++++++
 drivers/clk/imx/scu/clk-imx8qxp.c                  | 426 +++++++++++++++++++++
 drivers/clk/imx/scu/clk-mux-gpr-scu.c              |  90 +++++
 drivers/clk/imx/scu/clk-mux-scu.c                  |  89 +++++
 drivers/clk/imx/scu/clk-scu.c                      |  25 ++
 drivers/clk/imx/scu/clk-scu.h                      |  97 +++++
 include/dt-bindings/clock/imx8qxp-clock.h          | 362 +++++++++++++++++
 include/soc/imx/imx8qxp/lpcg.h                     | 186 +++++++++
 19 files changed, 1916 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8qxp-clk.txt
 create mode 100644 drivers/clk/imx/Kconfig
 create mode 100644 drivers/clk/imx/clk-common.h
 create mode 100644 drivers/clk/imx/scu/Kconfig
 create mode 100644 drivers/clk/imx/scu/Makefile
 create mode 100644 drivers/clk/imx/scu/clk-divider-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-divider-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-gate-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-gate-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-imx8qxp.c
 create mode 100644 drivers/clk/imx/scu/clk-mux-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-mux-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-scu.h
 create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
 create mode 100644 include/soc/imx/imx8qxp/lpcg.h

-- 
2.7.4
