Return-Path: <andre.przywara@arm.com>
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@googlegroups.com
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH 09/11] clk: sunxi: add critical-clocks property to mux clocks
Date: Mon,  1 Feb 2016 17:39:28 +0000
Message-Id: <1454348370-3816-10-git-send-email-andre.przywara@arm.com>
In-Reply-To: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
List-ID: <linux-clk.vger.kernel.org>

The only reason we match the different root compatible strings when
registering the different sunxi clock types is to provide a list of
critical clocks.
Tell the mux clock (for a start) to get this property from the
device tree, allowing new SoCs to refer to the generic fallback
compatible string when the DT provides the critical clock information.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi/clk-sunxi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 9416e0f3..e1e5a8f 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -644,6 +644,11 @@ static void __init sunxi_mux_clk_setup(struct device_node *node,
 		goto out_unmap;
 	}
 
+	if (of_property_read_bool(node, "critical-clocks")) {
+		pr_debug("marked clock %s as critical\n", clk_name);
+		clk_prepare_enable(clk);
+	}
+
 	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 	clk_register_clkdev(clk, clk_name, NULL);
 	return;
@@ -1064,6 +1069,10 @@ CLK_OF_DECLARE(sun8i_a23_clk_init, "allwinner,sun8i-a23", sun6i_init_clocks);
 CLK_OF_DECLARE(sun8i_a33_clk_init, "allwinner,sun8i-a33", sun6i_init_clocks);
 CLK_OF_DECLARE(sun8i_h3_clk_init, "allwinner,sun8i-h3", sun6i_init_clocks);
 
+/*
+ * Those SoCs here either don't have a specific critical clock to
+ * protect or they mark the critical clocks as such in their DT.
+ */
 static void __init sunxi_generic_init_clocks(struct device_node *node)
 {
 	sunxi_init_clocks(NULL, 0);
-- 
2.6.4
