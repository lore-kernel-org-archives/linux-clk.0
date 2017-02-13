Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170213210619.208900184@cogentembedded.com>
Date: Tue, 14 Feb 2017 00:06:04 +0300
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/1] clk: renesas: cpg-mssr: r8a7795: add IMR clocks
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

Add the IMR[0-3] clocks to the R8A7795 CPG/MSSR driver.

Based on the original (and large) patch by Konstantin Kozhevnikov
<Konstantin.Kozhevnikov@cogentembedded.com>.

Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-next' branch of CLK group's 'linux.git' repo.

 drivers/clk/renesas/r8a7795-cpg-mssr.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux/drivers/clk/renesas/r8a7795-cpg-mssr.c
===================================================================
--- linux.orig/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ linux/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -208,6 +208,10 @@ static const struct mssr_mod_clk r8a7795
 	DEF_MOD("vin0",			 811,	R8A7795_CLK_S2D1),
 	DEF_MOD("etheravb",		 812,	R8A7795_CLK_S3D2),
 	DEF_MOD("sata0",		 815,	R8A7795_CLK_S3D2),
+	DEF_MOD("imr3",			 820,	R8A7795_CLK_S2D1),
+	DEF_MOD("imr2",			 821,	R8A7795_CLK_S2D1),
+	DEF_MOD("imr1",			 822,	R8A7795_CLK_S2D1),
+	DEF_MOD("imr0",			 823,	R8A7795_CLK_S2D1),
 	DEF_MOD("gpio7",		 905,	R8A7795_CLK_CP),
 	DEF_MOD("gpio6",		 906,	R8A7795_CLK_CP),
 	DEF_MOD("gpio5",		 907,	R8A7795_CLK_CP),
