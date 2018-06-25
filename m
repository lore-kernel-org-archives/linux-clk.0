Return-Path: <brgl@bgdev.pl>
Return-Path: <brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>,
	Kevin Hilman <khilman@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/9] ARM: davinci: deduplicate aemif support
Date: Mon, 25 Jun 2018 17:29:11 +0200
Message-Id: <20180625152920.11549-1-brgl@bgdev.pl>
List-ID: <linux-clk.vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series moves all aemif/nand users to using the ti-aemif platform
driver located in drivers/memory instead of the older API located in
mach-davinci.

The first patch adds a necessary clock lookup and the last patch
removes the duplicate aemif code.

Bartosz Golaszewski (9):
  clk: davinci: psc-dm365: use two lookup entries for the aemif clock
  ARM: davinci: omapl138-hawk: add aemif & nand support
  ARM: davinci: da850-evm: use aemif platform driver in legacy mode
  ARM: davinci: dm365-evm: use the ti-aemif soc driver
  ARM: davinci: dm644x-evm: use aemif platform driver
  ARM: davinci: da830-evm: use aemif platform driver
  ARM: davinci: dm646x-evm: use aemif platform driver
  ARM: davinci: mityomapl138: use aemif platform driver
  ARM: davinci: kill davinci_aemif_setup()

 arch/arm/mach-davinci/Makefile                |   2 +-
 arch/arm/mach-davinci/aemif.c                 | 218 ------------------
 arch/arm/mach-davinci/board-da830-evm.c       |  56 ++++-
 arch/arm/mach-davinci/board-da850-evm.c       |  93 ++++----
 arch/arm/mach-davinci/board-dm365-evm.c       |  59 +++--
 arch/arm/mach-davinci/board-dm644x-evm.c      |  55 +++--
 arch/arm/mach-davinci/board-dm646x-evm.c      |  52 ++++-
 arch/arm/mach-davinci/board-mityomapl138.c    |  55 +++--
 arch/arm/mach-davinci/board-omapl138-hawk.c   | 132 +++++++++++
 drivers/clk/davinci/psc-dm365.c               |   3 +-
 .../linux/platform_data/mtd-davinci-aemif.h   |   1 -
 11 files changed, 400 insertions(+), 326 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/aemif.c

-- 
2.17.1
