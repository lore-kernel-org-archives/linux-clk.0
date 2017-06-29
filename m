Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: div6: Document fields used for parent selection
Date: Thu, 29 Jun 2017 14:50:00 +0200
Message-Id: <1498740600-1772-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add the missing documentation for the fields in struct div6_clock
related to parent selection for DIV6 clocks with selectable parents, as
found in R/SH-Mobile SoCs.

Fixes: c6d67fb037f4eaaf ("clk: shmobile: div6: support selectable-input clocks")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.14.

 drivers/clk/renesas/clk-div6.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 0627860233cbf97e..3e0040c0ac87a14b 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -29,6 +29,9 @@
  * @hw: handle between common and hardware-specific interfaces
  * @reg: IO-remapped register
  * @div: divisor value (1-64)
+ * @src_shift: Shift to access the register bits to select the parent clock
+ * @src_width: Number of register bits to select the parent clock (may be 0)
+ * @parents: Array to map from valid parent clocks indices to hardware indices
  */
 struct div6_clock {
 	struct clk_hw hw;
-- 
2.7.4
