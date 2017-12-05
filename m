Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171205214345.812687071@cogentembedded.com>
Date: Wed, 06 Dec 2017 00:43:35 +0300
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77970: add LVDS clock
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

I seem to have omitted the LVDS clock from the R8A77970 CPG/MSSR support
patch for some reason -- add it back...

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Fixes: 8d46e28fb508 ("clk: renesas: cpg-mssr: Add R8A77970 support")
Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo...

 drivers/clk/renesas/r8a77970-cpg-mssr.c |    1 +
 1 file changed, 1 insertion(+)

Index: renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -105,6 +105,7 @@ static const struct mssr_mod_clk r8a7797
 	DEF_MOD("vspd0",		 623,	R8A77970_CLK_S2D1),
 	DEF_MOD("csi40",		 716,	R8A77970_CLK_CSI0),
 	DEF_MOD("du0",			 724,	R8A77970_CLK_S2D1),
+	DEF_MOD("lvds",			 727,	R8A77970_CLK_S2D1),
 	DEF_MOD("vin3",			 808,	R8A77970_CLK_S2D1),
 	DEF_MOD("vin2",			 809,	R8A77970_CLK_S2D1),
 	DEF_MOD("vin1",			 810,	R8A77970_CLK_S2D1),
