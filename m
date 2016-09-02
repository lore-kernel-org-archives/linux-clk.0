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
Subject: [PATCH v4] clk: renesas: rz: Select EXTAL vs USB clock
Date: Thu,  1 Sep 2016 22:32:25 -0400
Message-Id: <20160902023225.13898-1-chris.brandt@renesas.com>
In-Reply-To: <20160901131036.17241-1-chris.brandt@renesas.com>
References: <20160901131036.17241-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Check the MD_CLK pin to determine the current clock mode in order to set
the pll clock parent correctly.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
V4:
* added static and __init to rz_cpg_read_mode_pins
* set cpg_mode during declaration 
v3:
* move reading GPIO port into separate function
v2:
* Switched to reading MD_CLK pin to determine mode
---
 drivers/clk/renesas/clk-rz.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
index f6312c6..6dd490c 100644
--- a/drivers/clk/renesas/clk-rz.c
+++ b/drivers/clk/renesas/clk-rz.c
@@ -25,10 +25,31 @@ struct rz_cpg {
 #define CPG_FRQCR	0x10
 #define CPG_FRQCR2	0x14
 
+#define PPR0 0xFCFE3200
+#define PIBC0 0xFCFE7000
+
+#define MD_CLK(x)   ((x >> 2) & 1)	/* P0_2 */
+
 /* -----------------------------------------------------------------------------
  * Initialization
  */
 
+static u16 __init rz_cpg_read_mode_pins(void)
+{
+	void __iomem *ppr0, *pibc0;
+	u16 modes;
+
+	ppr0 = ioremap_nocache(PPR0, 2);
+	pibc0 = ioremap_nocache(PIBC0, 2);
+	BUG_ON(!ppr0 || !pibc0);
+	iowrite16(4, pibc0);	/* enable input buffer */
+	modes = ioread16(ppr0);
+	iounmap(ppr0);
+	iounmap(pibc0);
+
+	return modes;
+}
+
 static struct clk * __init
 rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *name)
 {
@@ -37,8 +58,7 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
 	static const unsigned frqcr_tab[4] = { 3, 2, 0, 1 };
 
 	if (strcmp(name, "pll") == 0) {
-		/* FIXME: cpg_mode should be read from GPIO. But no GPIO support yet */
-		unsigned cpg_mode = 0; /* hardcoded to EXTAL for now */
+		unsigned int cpg_mode = MD_CLK(rz_cpg_read_mode_pins());
 		const char *parent_name = of_clk_get_parent_name(np, cpg_mode);
 
 		mult = cpg_mode ? (32 / 4) : 30;
-- 
2.9.2
