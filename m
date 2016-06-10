Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 0/7] Add support for AmLogic GXBB clock controller
Date: Thu,  9 Jun 2016 17:32:47 -0700
Message-Id: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This series is based on the AmLogic Meson8b rewrite/cleanup[0]. The
AmLogic GXBB is an ARMv8-based SoC, fed by a 24MHZ xtal, and it provides
several PLLs, muxes dividers and gates to drive CPUs and peripherals.

While based on the Meson8b clock controller driver, this series adds
supports for Multi-phase Locked Loops (mpll) and support for PLLs with
fractional rates.

This series introduces the clock controller driver for the gxbb,
including the DT binding description and accompanying change in the gxbb
dtsi. Only three clocks are exposed via the headers in the dt-bindings
include-chroot. More can be added later, but since these values
represent an ABI I wanted to start small. I'm not sure about the names
for the gate clocks, so I especially tried to avoid putting those in the
binding (with the exception of the Ethernet gate, which Kevin has needed
for a while).

Notably missing from this driver are the branch clocks (e.g. the mess of
muxes and dividers that come after the PLLs and MPLLs). I could have
guessed how things were wired up from the resources available to me, but
I'm hoping to get some improved documentation soon and then I'll go back
and fill them in.

[0] http://lkml.kernel.org/g/1465518467-23939-1-git-send-email-mturquette@baylibre.com

Michael Turquette (7):
  clk: meson: add peripheral gate macro
  clk: meson: add mpll support
  clk: meson: fractional pll support
  clk: gxbb: Document bindings for the GXBB clock controller
  clk: gxbb: add AmLogic GXBB clk controller driver
  arm64: amlogic: select gxbb clk driver
  arm64: dts: gxbb clock controller

 .../bindings/clock/amlogic,gxbb-clkc.txt           |  36 +
 arch/arm64/Kconfig.platforms                       |   2 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
 drivers/clk/meson/Kconfig                          |   7 +
 drivers/clk/meson/Makefile                         |   3 +-
 drivers/clk/meson/clk-mpll.c                       |  94 ++
 drivers/clk/meson/clk-pll.c                        |  32 +-
 drivers/clk/meson/clkc.h                           |  39 +
 drivers/clk/meson/gxbb.c                           | 954 +++++++++++++++++++++
 drivers/clk/meson/gxbb.h                           | 271 ++++++
 include/dt-bindings/clock/gxbb-clkc.h              |  12 +
 11 files changed, 1454 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
 create mode 100644 drivers/clk/meson/clk-mpll.c
 create mode 100644 drivers/clk/meson/gxbb.c
 create mode 100644 drivers/clk/meson/gxbb.h
 create mode 100644 include/dt-bindings/clock/gxbb-clkc.h

-- 
2.1.4
