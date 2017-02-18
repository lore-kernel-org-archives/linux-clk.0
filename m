Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170218213936.142813519@cogentembedded.com>
Date: Sun, 19 Feb 2017 00:39:26 +0300
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/1] clk: renesas: cpg-mssr: r8a7796: add IMR clocks
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

Add the IMR[0-1] clocks to the R8A7796 CPG/MSSR driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-next' branch of CLK group's 'linux.git' repo.

 drivers/clk/renesas/r8a7796-cpg-mssr.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/drivers/clk/renesas/r8a7796-cpg-mssr.c
===================================================================
--- linux.orig/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ linux/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -179,6 +179,8 @@ static const struct mssr_mod_clk r8a7796
 	DEF_MOD("vin1",			 810,	R8A7796_CLK_S0D2),
 	DEF_MOD("vin0",			 811,	R8A7796_CLK_S0D2),
 	DEF_MOD("etheravb",		 812,	R8A7796_CLK_S0D6),
+	DEF_MOD("imr1",			 822,	R8A7796_CLK_S2D1),
+	DEF_MOD("imr0",			 823,	R8A7796_CLK_S2D1),
 	DEF_MOD("gpio7",		 905,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio6",		 906,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio5",		 907,	R8A7796_CLK_S3D4),
