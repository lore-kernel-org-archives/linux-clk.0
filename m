Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a7792: Add IMR-LX3/LSX3 clocks
Date: Wed,  5 Jul 2017 13:54:30 +0200
Message-Id: <1499255670-26721-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add the module clocks for the Image Renderer Light (SRAM) Extended 3
(IMR-LX3/LSX3) Distortion Correction Engines on R-Car V2H.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.14.

 drivers/clk/renesas/r8a7792-cpg-mssr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r8a7792-cpg-mssr.c b/drivers/clk/renesas/r8a7792-cpg-mssr.c
index a832b9b6f7b0dde8..7f85bbf20bf782b7 100644
--- a/drivers/clk/renesas/r8a7792-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7792-cpg-mssr.c
@@ -118,6 +118,13 @@ static const struct mssr_mod_clk r8a7792_mod_clks[] __initconst = {
 	DEF_MOD("vin1",			 810,	R8A7792_CLK_ZG),
 	DEF_MOD("vin0",			 811,	R8A7792_CLK_ZG),
 	DEF_MOD("etheravb",		 812,	R8A7792_CLK_HP),
+	DEF_MOD("imr-lx3",		 821,	R8A7792_CLK_ZG),
+	DEF_MOD("imr-lsx3-1",		 822,	R8A7792_CLK_ZG),
+	DEF_MOD("imr-lsx3-0",		 823,	R8A7792_CLK_ZG),
+	DEF_MOD("imr-lsx3-5",		 825,	R8A7792_CLK_ZG),
+	DEF_MOD("imr-lsx3-4",		 826,	R8A7792_CLK_ZG),
+	DEF_MOD("imr-lsx3-3",		 827,	R8A7792_CLK_ZG),
+	DEF_MOD("imr-lsx3-2",		 828,	R8A7792_CLK_ZG),
 	DEF_MOD("gyro-adc",		 901,	R8A7792_CLK_P),
 	DEF_MOD("gpio7",		 904,	R8A7792_CLK_CP),
 	DEF_MOD("gpio6",		 905,	R8A7792_CLK_CP),
-- 
2.7.4
