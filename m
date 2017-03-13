Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/4] clk: renesas: Add r8a7795 ES2.0 CPG Core Clock Definitions
Date: Mon, 13 Mar 2017 18:12:31 +0100
Message-Id: <1489425153-22623-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489425153-22623-1-git-send-email-geert+renesas@glider.be>
References: <1489425153-22623-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add all R-Car H3 ES2.0 Clock Pulse Generator Core Clock Outputs, as
listed in Table 8.2a ("List of Clocks [R-Car H3]") of the R-Car Gen3
Hardware User's Manual rev. 0.53E.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop RFC state,
  - Update datasheet revision.
---
 include/dt-bindings/clock/r8a7795-cpg-mssr.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/r8a7795-cpg-mssr.h b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
index e864aae0a2561c4b..f047eaf261f34ac7 100644
--- a/include/dt-bindings/clock/r8a7795-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
@@ -60,4 +60,11 @@
 #define R8A7795_CLK_R			45
 #define R8A7795_CLK_OSC			46
 
+/* r8a7795 ES2.0 CPG Core Clocks */
+#define R8A7795_CLK_S0D2		47
+#define R8A7795_CLK_S0D3		48
+#define R8A7795_CLK_S0D6		49
+#define R8A7795_CLK_S0D8		50
+#define R8A7795_CLK_S0D12		51
+
 #endif /* __DT_BINDINGS_CLOCK_R8A7795_CPG_MSSR_H__ */
-- 
2.7.4
