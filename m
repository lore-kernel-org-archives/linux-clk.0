Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77970: add CMT clocks
To: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-clk@vger.kernel.org
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Message-ID: <d7c78a11-b876-0587-c684-88f1865f0260@cogentembedded.com>
Date: Wed, 5 Sep 2018 19:59:48 +0300
MIME-Version: 1.0
In-Reply-To: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Add the R8A77970 CMT module clocks.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/r8a77970-cpg-mssr.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: renesas/drivers/clk/renesas/r8a77970-cpg-mssr.c
===================================================================
--- renesas.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ renesas/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -118,6 +118,10 @@ static const struct mssr_mod_clk r8a7797
 	DEF_MOD("mfis",			 213,	R8A77970_CLK_S2D2),
 	DEF_MOD("sys-dmac2",		 217,	R8A77970_CLK_S2D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A77970_CLK_S2D1),
+	DEF_MOD("cmt3",			 300,	R8A77970_CLK_R),
+	DEF_MOD("cmt2",			 301,	R8A77970_CLK_R),
+	DEF_MOD("cmt1",			 302,	R8A77970_CLK_R),
+	DEF_MOD("cmt0",			 303,	R8A77970_CLK_R),
 	DEF_MOD("sd-if",		 314,	R8A77970_CLK_SD0),
 	DEF_MOD("rwdt",			 402,	R8A77970_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A77970_CLK_CP),
