Return-Path: <giulio.benetti@micronovasrl.com>
From: Giulio Benetti <giulio.benetti@micronovasrl.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH] clk: sunxi-ng: ccu-sun4i-a10: Fix mali changing dclk frequency
Date: Wed, 31 Jan 2018 00:23:59 +0100
Message-Id: <1517354639-92978-1-git-send-email-giulio.benetti@micronovasrl.com>
List-ID: <linux-clk.vger.kernel.org>

When mali.ko is inserted, it set default clocks
and call all parent clocks to stay into range,
causing pll-video0 to change and subsequently
to change dclk to wrong frequencies.
"gpu" clock has lot of parent plls inside driver,
but on sun7i pll8-gpu does not depend on pll-video0,
pll-ve, pll-video1.
It only depends on 24Mhz main clock.

Remove all pll parents from gpu_parents_sun7i except "pll-gpu".

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
index ffa5dac..49726a6 100644
--- a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
+++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
@@ -790,9 +790,7 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu_sun4i_clk, "gpu", gpu_parents_sun4i,
 				 0x154, 0, 4, 24, 2, BIT(31),
 				 CLK_SET_RATE_PARENT);
 
-static const char *const gpu_parents_sun7i[] = { "pll-video0", "pll-ve",
-						 "pll-ddr-other", "pll-video1",
-						 "pll-gpu" };
+static const char *const gpu_parents_sun7i[] = { "pll-gpu" };
 static const u8 gpu_table_sun7i[] = { 0, 1, 2, 3, 4 };
 static SUNXI_CCU_M_WITH_MUX_TABLE_GATE(gpu_sun7i_clk, "gpu",
 				       gpu_parents_sun7i, gpu_table_sun7i,
-- 
2.7.4
