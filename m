Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/11] clk: renesas: cpg-mssr: Add support for fixed rate clocks
Date: Wed, 11 Jul 2018 16:20:55 +0200
Message-Id: <20180711142100.3765-7-geert+renesas@glider.be>
In-Reply-To: <20180711142100.3765-1-geert+renesas@glider.be>
References: <20180711142100.3765-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add support for defining fixed rate clocks, to be used for on-chip
oscillators.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/renesas-cpg-mssr.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f4b013e9352d9efc..e04338932786bc14 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -313,6 +313,11 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 		}
 		break;
 
+	case CLK_TYPE_FR:
+		clk = clk_register_fixed_rate(NULL, core->name, NULL, 0,
+					      core->mult);
+		break;
+
 	default:
 		if (info->cpg_clk_register)
 			clk = info->cpg_clk_register(dev, core, info,
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 642f720b9b055337..87bb8f368d4ecd18 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -38,6 +38,7 @@ enum clk_types {
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_DIV6P1,	/* DIV6 Clock with 1 parent clock */
 	CLK_TYPE_DIV6_RO,	/* DIV6 Clock read only with extra divisor */
+	CLK_TYPE_FR,		/* Fixed Rate Clock */
 
 	/* Custom definitions start here */
 	CLK_TYPE_CUSTOM,
@@ -56,6 +57,8 @@ enum clk_types {
 	DEF_BASE(_name, _id, CLK_TYPE_DIV6P1, _parent, .offset = _offset)
 #define DEF_DIV6_RO(_name, _id, _parent, _offset, _div)	\
 	DEF_BASE(_name, _id, CLK_TYPE_DIV6_RO, _parent, .offset = _offset, .div = _div, .mult = 1)
+#define DEF_RATE(_name, _id, _rate)	\
+	DEF_TYPE(_name, _id, CLK_TYPE_FR, .mult = _rate)
 
     /*
      * Definitions of Module Clocks
-- 
2.17.1
