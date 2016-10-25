Return-Path: <m.szyprowski@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] clk/samsung: Clear OF_POPULATED flag from clkout node in init
 callback
Date: Tue, 25 Oct 2016 14:34:21 +0200
Message-id: <1477398861-2270-1-git-send-email-m.szyprowski@samsung.com>
References: 
 <CGME20161025123519eucas1p1f8d2efba82ebd101e8fa0697a5708a28@eucas1p1.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

The Exynos PMU node is an interrupt, clock and PMU (Power Management Unit)
controller, and these functionalities are supported by different drivers
that matches the same compatible strings.

Since commit 989eafd0b609 ("clk: core: Avoid double initialization of
clocks") the OF core flags clock controllers registered with the
CLK_OF_DECLARE() macro as OF_POPULATED, so platform devices with the same
compatible string as the interrupt controller will not be registered.

This prevents the PMU platform device to be registered so the Exynos PMU
driver is never probed. This breaks (among other things) Suspend-to-RAM.

Fix this by clearing the OF_POPULATED flag in the clkout driver init
callback, to allow the Exynos PMU platform driver to be probed. The patch
is based on similar patch from Javier Martinez Canillas: b030485220ca
"ARM: EXYNOS: Clear OF_POPULATED flag from PMU node in IRQ init callback".

Fixes: 989eafd0b609 ("clk: core: Avoid double initialization of clocks")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 96fab6cfb202..57303cfec7d4 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -116,6 +116,12 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
 
 	register_syscore_ops(&exynos_clkout_syscore_ops);
 
+	/*
+	 * Clear the OF_POPULATED flag set in of_irq_init so that
+	 * later the Exynos PMU platform device won't be skipped.
+	 */
+	of_node_clear_flag(node, OF_POPULATED);
+
 	return;
 
 err_clk_unreg:
-- 
1.9.1
