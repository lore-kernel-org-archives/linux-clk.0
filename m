Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/7] clk: renesas: rcar-gen3-cpg: Pass mode pins to rcar_gen3_cpg_init()
Date: Mon, 13 Mar 2017 17:19:53 +0100
Message-Id: <1489421994-19707-7-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
References: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Pass the mode pin states from the SoC-specific CPG/MSSR driver to the
R-Car Gen3 CPG driver core, as their state will be needed to make some
core clock configuration decisions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 +-
 drivers/clk/renesas/rcar-gen3-cpg.c    | 4 +++-
 drivers/clk/renesas/rcar-gen3-cpg.h    | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 608178618da87bef..4699f416e275d924 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -330,7 +330,7 @@ static int __init r8a7795_cpg_mssr_init(struct device *dev)
 		return -EINVAL;
 	}
 
-	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR);
+	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
 }
 
 const struct cpg_mssr_info r8a7795_cpg_mssr_info __initconst = {
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index f7787101b8d0406c..9d114b31b0731b5e 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -273,7 +273,7 @@ static int __init r8a7796_cpg_mssr_init(struct device *dev)
 		return -EINVAL;
 	}
 
-	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR);
+	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
 }
 
 const struct cpg_mssr_info r8a7796_cpg_mssr_info __initconst = {
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 742f6dc7c15653ef..d395bb8c22f575cf 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -247,6 +247,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
+static u32 cpg_mode __initdata;
 
 struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
@@ -334,9 +335,10 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 }
 
 int __init rcar_gen3_cpg_init(const struct rcar_gen3_cpg_pll_config *config,
-			      unsigned int clk_extalr)
+			      unsigned int clk_extalr, u32 mode)
 {
 	cpg_pll_config = config;
 	cpg_clk_extalr = clk_extalr;
+	cpg_mode = mode;
 	return 0;
 }
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index f788f481dd42cdf6..073be54b5d038ae3 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -37,6 +37,6 @@ struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base);
 int rcar_gen3_cpg_init(const struct rcar_gen3_cpg_pll_config *config,
-		       unsigned int clk_extalr);
+		       unsigned int clk_extalr, u32 mode);
 
 #endif
-- 
2.7.4
