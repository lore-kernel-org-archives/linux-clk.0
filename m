Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH v2 0/6] Add support for AmLogic GXBB clock controller
Date: Wed, 22 Jun 2016 19:01:14 -0700
Message-Id: <1466647280-17596-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This series is based on the AmLogic Meson8b rewrite/cleanup[0]. The
AmLogic GXBB is an ARMv8-based SoC, fed by a 24MHZ xtal, and it provides
several PLLs, muxes dividers and gates to drive CPUs and peripherals.

The main change from v1[1] is that I have moved all of the arch/arm64
changes to a separate patch series to be picked up by the amlogic
maintainers. This series will go through the clk tree and everyone will
meet up and be friends in linux-next, as usual. Additionally the last
patch includes a fix to set the CLK_IS_CRITICAL flag for clk81,
suggested by Kevin Hilman.

A stable, immutable branch based on -rc1 with this series is available here:
git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-s905

While based on the Meson8b clock controller driver, this series adds
supports for Multi-phase Locked Loops (mpll) and support for PLLs with
fractional rates.

This series introduces support for the new clock types and the clock controller
platform_driver. I'm not sure about the names for the gate clocks, and
suggestions/patches are welcome.

Notably missing from this driver are the branch clocks (e.g. the mess of
muxes and dividers that come after the PLLs and MPLLs). I could have
guessed how things were wired up from the resources available to me, but
I'm hoping to get some improved documentation soon and then I'll go back
and fill them in.

[0] http://lkml.kernel.org/g/1465518467-23939-1-git-send-email-mturquette@baylibre.com
[1] Link: 1465518774-26924-1-git-send-email-mturquette@baylibre.com

Michael Turquette (6):
  clk: meson: only build selected platforms
  clk: meson: add peripheral gate macro
  clk: meson: add mpll support
  clk: meson: fractional pll support
  clk: gxbb: Document bindings for the GXBB clock controller
  clk: gxbb: add AmLogic GXBB clk controller driver

 .../bindings/clock/amlogic,gxbb-clkc.txt           |  36 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/meson/Kconfig                          |  19 +
 drivers/clk/meson/Makefile                         |   5 +-
 drivers/clk/meson/clk-mpll.c                       |  94 ++
 drivers/clk/meson/clk-pll.c                        |  32 +-
 drivers/clk/meson/clkc.h                           |  39 +
 drivers/clk/meson/gxbb.c                           | 954 +++++++++++++++++++++
 drivers/clk/meson/gxbb.h                           | 271 ++++++
 include/dt-bindings/clock/gxbb-clkc.h              |  12 +
 11 files changed, 1460 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
 create mode 100644 drivers/clk/meson/Kconfig
 create mode 100644 drivers/clk/meson/clk-mpll.c
 create mode 100644 drivers/clk/meson/gxbb.c
 create mode 100644 drivers/clk/meson/gxbb.h
 create mode 100644 include/dt-bindings/clock/gxbb-clkc.h

-- 
2.1.4
