Return-Path: <Govindraj.Raja@imgtec.com>
From: Govindraj Raja <govindraj.raja@imgtec.com>
To: <linux-mips@linux-mips.org>, <linux-clk@vger.kernel.org>, Stephen Boyd
	<sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
CC: Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee
	<cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, "Andrew
 Bresticker" <abrestic@chromium.org>, James Hartley
	<James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan
	<James.Hogan@imgtec.com>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ezequiel Garcia
	<ezequiel.garcia@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH v3 4/4] clk: pistachio: correct critical clock list
Date: Mon, 10 Aug 2015 11:10:08 +0100
Message-ID: <1439201408-9009-1-git-send-email-govindraj.raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: "Damien.Horsley" <Damien.Horsley@imgtec.com>

Current critical clock list for pistachio enables
only mips and sys clocks by default but there are
also other clocks that are not claimed by anyone and
needs to be enabled by default.

This patch updates the critical clocks that needs
to be enabled by default.

Add a separate struct to distinguish the critical clocks
as listed below which needs to enabled by default:
1.) core clocks:
	a.) mips clock
2.) peripheral system clocks:
	a.) sys clock
	b.) sys_bus clock
	c.) DDR clock
	d.) ROM clock

Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Signed-off-by: Damien.Horsley <Damien.Horsley@imgtec.com>
Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
---

Changes from v2:
----------------
Fixes comments from Sergei as dicussed in below thread:
http://patchwork.linux-mips.org/patch/10903/


 drivers/clk/pistachio/clk-pistachio.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/pistachio/clk-pistachio.c b/drivers/clk/pistachio/clk-pistachio.c
index 8c0fe88..c4ceb5e 100644
--- a/drivers/clk/pistachio/clk-pistachio.c
+++ b/drivers/clk/pistachio/clk-pistachio.c
@@ -159,9 +159,15 @@ PNAME(mux_debug) = { "mips_pll_mux", "rpu_v_pll_mux",
 		     "wifi_pll_mux", "bt_pll_mux" };
 static u32 mux_debug_idx[] = { 0x0, 0x1, 0x2, 0x4, 0x8, 0x10 };
 
-static unsigned int pistachio_critical_clks[] __initdata = {
-	CLK_MIPS,
-	CLK_PERIPH_SYS,
+static unsigned int pistachio_critical_clks_core[] __initdata = {
+	CLK_MIPS
+};
+
+static unsigned int pistachio_critical_clks_sys[] __initdata = {
+	PERIPH_CLK_SYS,
+	PERIPH_CLK_SYS_BUS,
+	PERIPH_CLK_DDR,
+	PERIPH_CLK_ROM,
 };
 
 static void __init pistachio_clk_init(struct device_node *np)
@@ -193,8 +199,8 @@ static void __init pistachio_clk_init(struct device_node *np)
 
 	pistachio_clk_register_provider(p);
 
-	pistachio_clk_force_enable(p, pistachio_critical_clks,
-				   ARRAY_SIZE(pistachio_critical_clks));
+	pistachio_clk_force_enable(p, pistachio_critical_clks_core,
+				   ARRAY_SIZE(pistachio_critical_clks_core));
 }
 CLK_OF_DECLARE(pistachio_clk, "img,pistachio-clk", pistachio_clk_init);
 
@@ -261,6 +267,9 @@ static void __init pistachio_clk_periph_init(struct device_node *np)
 				    ARRAY_SIZE(pistachio_periph_gates));
 
 	pistachio_clk_register_provider(p);
+
+	pistachio_clk_force_enable(p, pistachio_critical_clks_sys,
+				   ARRAY_SIZE(pistachio_critical_clks_sys));
 }
 CLK_OF_DECLARE(pistachio_clk_periph, "img,pistachio-clk-periph",
 	       pistachio_clk_periph_init);
-- 
1.9.1
