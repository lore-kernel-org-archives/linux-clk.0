Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/10] clk: renesas: Add r8a7793 CPG Core Clock Definitions
Date: Fri, 19 May 2017 10:46:00 +0200
Message-Id: <1495183565-21679-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
References: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Add all R-Car M2-N Clock Pulse Generator Core Clock Outputs, as listed
in Table 7.2b ("List of Clocks [R-Car M2-W/M2-N]") of the R-Car Gen2
Hardware User's Manual rev. 2.00.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2:
  - Add Reviewed-by.
---
 include/dt-bindings/clock/r8a7793-cpg-mssr.h | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a7793-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a7793-cpg-mssr.h b/include/dt-bindings/clock/r8a7793-cpg-mssr.h
new file mode 100644
index 0000000000000000..8809b0f62d615457
--- /dev/null
+++ b/include/dt-bindings/clock/r8a7793-cpg-mssr.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_R8A7793_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A7793_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a7793 CPG Core Clocks */
+#define R8A7793_CLK_Z			0
+#define R8A7793_CLK_ZG			1
+#define R8A7793_CLK_ZTR			2
+#define R8A7793_CLK_ZTRD2		3
+#define R8A7793_CLK_ZT			4
+#define R8A7793_CLK_ZX			5
+#define R8A7793_CLK_ZS			6
+#define R8A7793_CLK_HP			7
+#define R8A7793_CLK_I			8
+#define R8A7793_CLK_B			9
+#define R8A7793_CLK_LB			10
+#define R8A7793_CLK_P			11
+#define R8A7793_CLK_CL			12
+#define R8A7793_CLK_M2			13
+#define R8A7793_CLK_ADSP		14
+#define R8A7793_CLK_ZB3			15
+#define R8A7793_CLK_ZB3D2		16
+#define R8A7793_CLK_DDR			17
+#define R8A7793_CLK_SDH			18
+#define R8A7793_CLK_SD0			19
+#define R8A7793_CLK_SD2			20
+#define R8A7793_CLK_SD3			21
+#define R8A7793_CLK_MMC0		22
+#define R8A7793_CLK_MP			23
+#define R8A7793_CLK_SSP			24
+#define R8A7793_CLK_SSPRS		25
+#define R8A7793_CLK_QSPI		26
+#define R8A7793_CLK_CP			27
+#define R8A7793_CLK_RCAN		28
+#define R8A7793_CLK_R			29
+#define R8A7793_CLK_OSC			30
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7793_CPG_MSSR_H__ */
-- 
2.7.4
