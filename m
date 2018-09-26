Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] clk: renesas: r7s9210: Add SPI clocks
Date: Wed, 26 Sep 2018 08:39:56 -0500
Message-Id: <20180926133956.79788-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Add RSPI clocks for RZ/A2.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index d8ff4cb0defc..5135f13ec628 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -95,6 +95,9 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 	DEF_MOD_STB("i2c1",	 86,	R7S9210_CLK_P1),
 	DEF_MOD_STB("i2c0",	 87,	R7S9210_CLK_P1),
 
+	DEF_MOD_STB("spi2",	 95,	R7S9210_CLK_P1),
+	DEF_MOD_STB("spi1",	 96,	R7S9210_CLK_P1),
+	DEF_MOD_STB("spi0",	 97,	R7S9210_CLK_P1),
 };
 
 /* The clock dividers in the table vary based on DT and register settings */
-- 
2.16.1
