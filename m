Return-Path: <sergej@taudac.com>
From: Sergej Sawazki <sergej@taudac.com>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: sebastian.hesselbarth@gmail.com,
	rabeeh@solid-run.com,
	linux@armlinux.org.uk,
	linux-clk@vger.kernel.org,
	Sergej Sawazki <sergej@taudac.com>
Subject: [PATCH 0/3] clk: si5351: PLL reset fixes
Date: Sat, 12 Aug 2017 16:23:00 +0200
Message-Id: <1502547783-24685-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

The Si5351 clock generator has up to 8 output clocks and 2 PLLs. In order
to get a deterministic phase offset relationship between the output clocks,
it is necessary to reset the PLLs is certain scenarios.

This patch-set:
 * fixes a regression and adds resetting the PLL before enabling the outputs
 * adds a dt-property for enabling/disabling the PLL reset
 * adds a debug message for PLL reset (it is helpful during debugging,
   probably no longer required?)

Based on clk-next.

Best regards,
Sergej

Sergej Sawazki (3):
  clk: si5351: Apply PLL soft reset before enabling the outputs
  clk: si5351: Add DT property to enable PLL reset
  clk: si5351: Add a debug message for PLL reset

 .../devicetree/bindings/clock/silabs,si5351.txt    |  1 +
 drivers/clk/clk-si5351.c                           | 40 ++++++++++++++++++++--
 include/linux/platform_data/si5351.h               |  2 ++
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.7.4
