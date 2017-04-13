Return-Path: <wens@mirror2.csie.ntu.edu.tw>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 3/3] clk: sunxi-ng: h3: gate then ungate PLL CPU clk after rate change
Date: Thu, 13 Apr 2017 10:13:54 +0800
Message-Id: <20170413021354.3258-4-wens@csie.org>
In-Reply-To: <20170413021354.3258-1-wens@csie.org>
References: <20170413021354.3258-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

This patch utilizes the new PLL clk notifier to gate then ungate the
PLL CPU clock after rate changes. This should prevent any system hangs
resulting from cpufreq changes to the clk.

Reported-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index 4cbc1b701b7c..fc04ef2af1ac 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -1103,6 +1103,13 @@ static const struct sunxi_ccu_desc sun50i_h5_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_ccu_resets),
 };
 
+static struct ccu_pll_nb sun8i_h3_pll_cpu_nb = {
+	.common	= &pll_cpux_clk.common,
+	/* copy from pll_cpux_clk */
+	.enable	= BIT(31),
+	.lock	= BIT(28),
+};
+
 static struct ccu_mux_nb sun8i_h3_cpu_nb = {
 	.common		= &cpux_clk.common,
 	.cm		= &cpux_clk.mux,
@@ -1130,6 +1137,10 @@ static void __init sunxi_h3_h5_ccu_init(struct device_node *node,
 
 	sunxi_ccu_probe(node, reg, desc);
 
+	/* Gate then ungate PLL CPU after any rate changes */
+	ccu_pll_notifier_register(&sun8i_h3_pll_cpu_nb);
+
+	/* Reparent CPU during PLL CPU rate changes */
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun8i_h3_cpu_nb);
 }
-- 
2.11.0
