Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: sun5i: Add clk_set_rate_parent to the CPU clock
Date: Fri, 21 Jul 2017 18:19:35 +0200
Message-Id: <20170721161935.18411-1-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The current CPU clock is missing the option to change the rate of its
parents, leading to improper rates calculated by cpufreq, and eventually
crashes.

Cc: <stable@vger.kernel.org>
Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
Reported-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi-ng/ccu-sun5i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun5i.c b/drivers/clk/sunxi-ng/ccu-sun5i.c
index 5372bf8be5e6..31d7ffda9aab 100644
--- a/drivers/clk/sunxi-ng/ccu-sun5i.c
+++ b/drivers/clk/sunxi-ng/ccu-sun5i.c
@@ -184,7 +184,7 @@ static struct ccu_mux cpu_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("cpu",
 						      cpu_parents,
 						      &ccu_mux_ops,
-						      CLK_IS_CRITICAL),
+						      CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
 	}
 };
 
-- 
2.13.3
