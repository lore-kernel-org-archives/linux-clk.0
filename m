Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi: fix uninitialized access
Date: Wed, 23 Aug 2017 16:39:27 +0200
Message-Id: <20170823143937.2176025-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

gcc-8 reports an uninitialized variable access in a code path
that we would see with incorrect DTB input:

drivers/clk/sunxi/clk-sun8i-bus-gates.c: In function 'sun8i_h3_bus_gates_init':
drivers/clk/sunxi/clk-sun8i-bus-gates.c:85:27: error: 'clk_parent' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This works around by skipping invalid input and printing a warning
instead if it ever happens. The problem was apparently part of the
initiali driver submission, but older compilers don't notice it.

Fixes: ab6e23a4e388 ("clk: sunxi: Add H3 clocks support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/sunxi/clk-sun8i-bus-gates.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/sunxi/clk-sun8i-bus-gates.c b/drivers/clk/sunxi/clk-sun8i-bus-gates.c
index 63fdb790df29..bee305bdddbe 100644
--- a/drivers/clk/sunxi/clk-sun8i-bus-gates.c
+++ b/drivers/clk/sunxi/clk-sun8i-bus-gates.c
@@ -78,6 +78,10 @@ static void __init sun8i_h3_bus_gates_init(struct device_node *node)
 			clk_parent = APB1;
 		else if (index >= 96 && index <= 127)
 			clk_parent = APB2;
+		else {
+			WARN_ON(true);
+			continue;
+		}
 
 		clk_reg = reg + 4 * (index / 32);
 		clk_bit = index % 32;
-- 
2.9.0
