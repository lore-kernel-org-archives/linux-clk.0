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
Subject: [PATCH v2 04/10] clk: renesas: Add r8a7792 CPG Core Clock Definitions
Date: Fri, 19 May 2017 10:45:59 +0200
Message-Id: <1495183565-21679-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
References: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Add all R-Car V2H Clock Pulse Generator Core Clock Outputs, as listed in
Table 7.2c ("List of Clocks [R-Car V2H]") of the R-Car Gen2 Hardware
User's Manual rev. 2.00.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2:
  - Add Reviewed-by.
---
 include/dt-bindings/clock/r8a7792-cpg-mssr.h | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a7792-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a7792-cpg-mssr.h b/include/dt-bindings/clock/r8a7792-cpg-mssr.h
new file mode 100644
index 0000000000000000..72ce85cb2f94b0ab
--- /dev/null
+++ b/include/dt-bindings/clock/r8a7792-cpg-mssr.h
@@ -0,0 +1,43 @@
+/*
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a7792 CPG Core Clocks */
+#define R8A7792_CLK_Z			0
+#define R8A7792_CLK_ZG			1
+#define R8A7792_CLK_ZTR			2
+#define R8A7792_CLK_ZTRD2		3
+#define R8A7792_CLK_ZT			4
+#define R8A7792_CLK_ZX			5
+#define R8A7792_CLK_ZS			6
+#define R8A7792_CLK_HP			7
+#define R8A7792_CLK_I			8
+#define R8A7792_CLK_B			9
+#define R8A7792_CLK_LB			10
+#define R8A7792_CLK_P			11
+#define R8A7792_CLK_CL			12
+#define R8A7792_CLK_M2			13
+#define R8A7792_CLK_IMP			14
+#define R8A7792_CLK_ZB3			15
+#define R8A7792_CLK_ZB3D2		16
+#define R8A7792_CLK_DDR			17
+#define R8A7792_CLK_SD			18
+#define R8A7792_CLK_MP			19
+#define R8A7792_CLK_QSPI		20
+#define R8A7792_CLK_CP			21
+#define R8A7792_CLK_CPEX		22
+#define R8A7792_CLK_RCAN		23
+#define R8A7792_CLK_R			24
+#define R8A7792_CLK_OSC			25
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__ */
-- 
2.7.4
