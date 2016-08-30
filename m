Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2] clk: renesas: rz: Select EXTAL vs USB clock
Date: Mon, 29 Aug 2016 23:13:58 -0400
Message-Id: <20160830031358.19468-1-chris.brandt@renesas.com>
In-Reply-To: <20160825190518.20764-1-chris.brandt@renesas.com>
References: <20160825190518.20764-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Check the MD_CLK pin to determine the current clock mode in order to set
the pll clock parent correctly.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
* Switched to reading MD_CLK pin to determine mode
---
 drivers/clk/renesas/clk-rz.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index f6312c6..2fc8aae 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -25,6 +25,9 @@ struct rz_cpg {
 #define CPG_FRQCR	0x10
 #define CPG_FRQCR2	0x14
 
+#define PPR0 0xFCFE3200
+#define PIBC0 0xFCFE7000
+
 /* -----------------------------------------------------------------------------
  * Initialization
  */
@@ -37,10 +40,20 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
 	static const unsigned frqcr_tab[4] = { 3, 2, 0, 1 };
 
 	if (strcmp(name, "pll") == 0) {
-		/* FIXME: cpg_mode should be read from GPIO. But no GPIO support yet */
-		unsigned cpg_mode = 0; /* hardcoded to EXTAL for now */
-		const char *parent_name = of_clk_get_parent_name(np, cpg_mode);
-
+		unsigned int cpg_mode;
+		const char *parent_name;
+		void __iomem *ppr0, *pibc0;
+
+		/* MD_CLK is on P0_2 */
+		ppr0 = ioremap_nocache(PPR0, 2);
+		pibc0 = ioremap_nocache(PIBC0, 2);
+		BUG_ON(!ppr0 || !pibc0);
+		iowrite16(4, pibc0);	/* Enable input buffer */
+		cpg_mode = ioread16(ppr0) & 4;
+		iounmap(ppr0);
+		iounmap(pibc0);
+
+		parent_name = cpg_mode ? "usb_x1" : "extal";
 		mult = cpg_mode ? (32 / 4) : 30;
 
 		return clk_register_fixed_factor(NULL, name, parent_name, 0, mult, 1);
-- 
2.9.2
