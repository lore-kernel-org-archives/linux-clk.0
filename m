Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] move the ICST library to common clocks
Date: Sat, 18 Mar 2017 09:59:42 +0100
Message-Id: <20170318085944.15899-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This consolidates the last piece of the Versatile clocks, the ICST
clock divider, into drivers/clk/*

If the series is OK I suggest we take this through ARM SoC since
the first patch needs to be applied there, alternatively they
can both go into the clk tree.

Linus Walleij (2):
  ARM: plat-versatile: remove stale clock header
  ARM/clk: move the ICST library to drivers/clk

 arch/arm/common/Kconfig                                   |  3 ---
 arch/arm/common/Makefile                                  |  1 -
 arch/arm/plat-versatile/include/plat/clock.h              | 15 ---------------
 drivers/clk/versatile/Kconfig                             |  3 +++
 drivers/clk/versatile/Makefile                            |  2 +-
 drivers/clk/versatile/clk-icst.c                          |  1 +
 drivers/clk/versatile/clk-icst.h                          |  2 --
 drivers/clk/versatile/clk-impd1.c                         |  1 +
 drivers/clk/versatile/clk-realview.c                      |  1 +
 drivers/clk/versatile/clk-versatile.c                     |  1 +
 {arch/arm/common => drivers/clk/versatile}/icst.c         |  2 +-
 .../include/asm/hardware => drivers/clk/versatile}/icst.h |  6 ++----
 12 files changed, 11 insertions(+), 27 deletions(-)
 delete mode 100644 arch/arm/plat-versatile/include/plat/clock.h
 rename {arch/arm/common => drivers/clk/versatile}/icst.c (98%)
 rename {arch/arm/include/asm/hardware => drivers/clk/versatile}/icst.h (94%)

-- 
2.9.3
