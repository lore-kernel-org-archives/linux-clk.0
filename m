Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] clk: meson: axg: add the fractional part of the fixed_pll
Date: Thu, 18 Jan 2018 19:45:32 +0100
Message-Id: <20180118184532.6856-10-jbrunet@baylibre.com>
In-Reply-To: <20180118184532.6856-1-jbrunet@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The fixed_pll also has a fractional part. On axg s400 board, without
this parameter, the calculated rate is off by ~8Mhz (0,4%). The fixed_pll
being the root of peripheral clock tree, this error is propagated to the
rest of the clocks

Adding the definition of the parameter fixes the problem

Fixes: 78b4af312f91 ("clk: meson-axg: add clock controller drivers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 56806c6bd9d5..953e119635a2 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -37,6 +37,11 @@ static struct meson_clk_pll axg_fixed_pll = {
 		.shift   = 16,
 		.width   = 2,
 	},
+	.frac = {
+		.reg_off = HHI_MPLL_CNTL2,
+		.shift   = 0,
+		.width   = 12,
+	},
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "fixed_pll",
-- 
2.14.3
