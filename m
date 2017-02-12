Return-Path: <ykaneko0929@gmail.com>
Return-Path: <ykaneko0929@gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFC] clk: renesas: r8a7795: Replace PLL3 multiplication setting
Date: Mon, 13 Feb 2017 02:35:39 +0900
Message-Id: <1486920939-3661-1-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch replaces PLL3 multiplication setting for DDR clock frequency.

  - After changes, new PLL3 multiplication setting:
    MD19 MD17 : DDR clock frequency
    -------------------------------
      0    0  : DDR3200
      0    1  : DDR2800
      1    0  : DDR2400
      1    1  : DDR1600

  - Before changes, old PLL3 multiplication setting:
    MD19 MD17 : DDR clock frequency
    -------------------------------
      0    0  : DDR3200
      0    1  : DDR2133
      1    0  : Prohibited setting
      1    1  : DDR1600

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index bfffdb0..9b34074 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -269,20 +269,20 @@ enum clk_ids {
  * 14 13 19 17	(MHz)
  *-------------------------------------------------------------------
  * 0  0  0  0	16.66 x 1	x180	x192	x144	x192	x144
- * 0  0  0  1	16.66 x 1	x180	x192	x144	x128	x144
- * 0  0  1  0	Prohibited setting
+ * 0  0  0  1	16.66 x 1	x180	x192	x144	x168	x144
+ * 0  0  1  0	16.66 x 1	x180	x192	x144	x144	x144
  * 0  0  1  1	16.66 x 1	x180	x192	x144	x192	x144
  * 0  1  0  0	20    x 1	x150	x160	x120	x160	x120
- * 0  1  0  1	20    x 1	x150	x160	x120	x106	x120
- * 0  1  1  0	Prohibited setting
+ * 0  1  0  1	20    x 1	x150	x160	x120	x140	x120
+ * 0  1  1  0	20    x 1	x150	x160	x120	x120	x120
  * 0  1  1  1	20    x 1	x150	x160	x120	x160	x120
  * 1  0  0  0	25    x 1	x120	x128	x96	x128	x96
- * 1  0  0  1	25    x 1	x120	x128	x96	x84	x96
- * 1  0  1  0	Prohibited setting
+ * 1  0  0  1	25    x 1	x120	x128	x96	x112	x96
+ * 1  0  1  0	25    x 1	x120	x128	x96	x96	x96
  * 1  0  1  1	25    x 1	x120	x128	x96	x128	x96
  * 1  1  0  0	33.33 / 2	x180	x192	x144	x192	x144
- * 1  1  0  1	33.33 / 2	x180	x192	x144	x128	x144
- * 1  1  1  0	Prohibited setting
+ * 1  1  0  1	33.33 / 2	x180	x192	x144	x168	x144
+ * 1  1  1  0	33.33 / 2	x180	x192	x144	x144	x144
  * 1  1  1  1	33.33 / 2	x180	x192	x144	x192	x144
  */
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 11) | \
@@ -293,20 +293,20 @@ enum clk_ids {
 static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 	/* EXTAL div	PLL1 mult	PLL3 mult */
 	{ 1,		192,		192,	},
-	{ 1,		192,		128,	},
-	{ 0, /* Prohibited setting */		},
+	{ 1,		192,		168,	},
+	{ 1,		192,		144,	},
 	{ 1,		192,		192,	},
 	{ 1,		160,		160,	},
-	{ 1,		160,		106,	},
-	{ 0, /* Prohibited setting */		},
+	{ 1,		160,		140,	},
+	{ 1,		160,		120,	},
 	{ 1,		160,		160,	},
 	{ 1,		128,		128,	},
-	{ 1,		128,		84,	},
-	{ 0, /* Prohibited setting */		},
+	{ 1,		128,		112,	},
+	{ 1,		128,		96,	},
 	{ 1,		128,		128,	},
 	{ 2,		192,		192,	},
-	{ 2,		192,		128,	},
-	{ 0, /* Prohibited setting */		},
+	{ 2,		192,		168,	},
+	{ 2,		192,		144,	},
 	{ 2,		192,		192,	},
 };
 
-- 
1.9.1
