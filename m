Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a77990: Add missing I2C7 clock
Date: Thu, 30 Aug 2018 17:28:13 +0200
Message-Id: <20180830152813.20883-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

When trying to use I2C7 on R-Car E3:

    renesas-cpg-mssr e6150000.clock-controller: Cannot get module clock 1003: -2
    i2c-rcar e6690000.i2c: failed to add to PM domain always-on: -2
    i2c-rcar: probe of e6690000.i2c failed with error -2

Unlike other R-Car Gen3 SoCs, R-Car E3 has more than 7 I2C bus
interfaces.  Add the forgotten module clock for the 8th instance to fix
this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.20.

 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 9437219efdd98e34..7e000d0705891a3f 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -210,6 +210,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 	DEF_MOD("i2c1",			 930,	R8A77990_CLK_S3D2),
 	DEF_MOD("i2c0",			 931,	R8A77990_CLK_S3D2),
 
+	DEF_MOD("i2c7",			1003,	R8A77990_CLK_S3D2),
 	DEF_MOD("ssi-all",		1005,	R8A77990_CLK_S3D4),
 	DEF_MOD("ssi9",			1006,	MOD_CLK_ID(1005)),
 	DEF_MOD("ssi8",			1007,	MOD_CLK_ID(1005)),
-- 
2.17.1
