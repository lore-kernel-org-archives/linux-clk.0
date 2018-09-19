Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77970: add TPU clock
To: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-clk@vger.kernel.org
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Message-ID: <53539d21-bb00-eb11-bfde-206f3b7e3fe0@cogentembedded.com>
Date: Wed, 19 Sep 2018 21:10:40 +0300
MIME-Version: 1.0
In-Reply-To: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

The TPU0 clock wasn't present in the original R8A77970 patch by Daisuke
Matsushita, it was added in a later BSP version...

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert's 'renesas-drivers.git'
repo...

 drivers/clk/renesas/r8a77970-cpg-mssr.c |    1 +
 1 file changed, 1 insertion(+)

Index: renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -127,6 +127,7 @@ static const struct mssr_mod_clk r8a7797
 	DEF_MOD("cmt2",			 301,	R8A77970_CLK_R),
 	DEF_MOD("cmt1",			 302,	R8A77970_CLK_R),
 	DEF_MOD("cmt0",			 303,	R8A77970_CLK_R),
+	DEF_MOD("tpu0",			 304,	R8A77970_CLK_S2D4),
 	DEF_MOD("sd-if",		 314,	R8A77970_CLK_SD0),
 	DEF_MOD("rwdt",			 402,	R8A77970_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A77970_CLK_CP),
