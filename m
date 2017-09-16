Return-Path: <sergej@taudac.com>
From: Sergej Sawazki <sergej@taudac.com>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	sebastian.hesselbarth@gmail.com
Cc: linux@armlinux.org.uk,
	linux-clk@vger.kernel.org,
	ce3a@gmx.de,
	Sergej Sawazki <sergej@taudac.com>
Subject: [PATCH v2 0/2] clk: si5351: PLL reset fixes
Date: Sat, 16 Sep 2017 13:44:40 +0200
Message-Id: <1505562282-9111-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

The Si5351 clock generator has up to 8 output clocks and 2 PLLs. In order
to get a deterministic phase offset relationship between the output clocks,
it is necessary to reset the PLLs is certain scenarios.

This patch-set:
 * adds a dt-property for enabling/disabling the PLL reset
 * adds resetting the PLL before enabling the outputs

Changes in v2 (thanks to Sebastian Hesselbarth for reviewing v1):
 * removed fix for commit 6dc669a22c77 ("clk: si5351: Add PLL soft reset"),
   it is already fixed by commit 73c950da6ec5 ("clk: si5351: fix PLL reset")
 * adding the PLL reset dt-property is now the first patch, to avoid changing
   the driver behavior for current users
 * the debug message is squashed it into the patch adding the PLL reset function

Based on clk-next.

Best regards,
Sergej

Sergej Sawazki (2):
  clk: si5351: Add DT property to enable PLL reset
  clk: si5351: Apply PLL soft reset before enabling the outputs

 .../devicetree/bindings/clock/silabs,si5351.txt    |  1 +
 drivers/clk/clk-si5351.c                           | 32 ++++++++++++++++++++++
 include/linux/platform_data/si5351.h               |  2 ++
 3 files changed, 35 insertions(+)

-- 
2.7.4
