Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:59330 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755333AbdGWK2u (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 23 Jul 2017 06:28:50 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH 05/10] clk: sunxi-ng: h3: gate then ungate PLL CPU clk after rate change
Date: Sun, 23 Jul 2017 18:27:44 +0800
Message-Id: <20170723102749.17323-6-icenowy@aosc.io>
In-Reply-To: <20170723102749.17323-1-icenowy@aosc.io>
References: <20170723102749.17323-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Chen-Yu Tsai <wens@csie.org>

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
index 62e4f0d2b2fc..406d0aac9fd6 100644
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
2.13.0

