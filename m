Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Stop enabling legacy DT clock support by default
Date: Tue,  2 Jan 2018 16:18:16 +0100
Message-Id: <1514906296-8099-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Since v4.15-rc1, the DTS files for all R-Car Gen2 SoCs have been
converted to the new CPG/MSSR bindings.  Hence it is now safe to no
longer enable legacy DT clock support by default.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.16.

 drivers/clk/renesas/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 43b5a89c4b282db8..84b40b95ca0eff5f 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -24,12 +24,13 @@ if CLK_RENESAS
 config CLK_RENESAS_LEGACY
 	bool "Legacy DT clock support"
 	depends on CLK_R8A7790 || CLK_R8A7791 || CLK_R8A7792 || CLK_R8A7794
-	default y
 	help
 	  Enable backward compatibility with old device trees describing a
 	  hierarchical representation of the various CPG and MSTP clocks.
 
 	  Say Y if you want your kernel to work with old DTBs.
+	  It is safe to say N if you use the DTS that is supplied with the
+	  current kernel source tree.
 
 # SoC
 config CLK_EMEV2
-- 
2.7.4
