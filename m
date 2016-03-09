Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] clk: renesas: cpg-mssr: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
Date: Wed,  9 Mar 2016 20:18:32 +0100
Message-Id: <1457551114-21764-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
References: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

As of commit 71d076ceb245f0d9 ("ARM: shmobile: Enable PM and
PM_GENERIC_DOMAINS for SoCs with PM Domains"),
CONFIG_PM_GENERIC_DOMAINS_OF is always enabled for SoCs with a CPG/MSSR
block.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 58e24b326a48bb81..7482e7f6d37fbe22 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -376,7 +376,6 @@ fail:
 }
 
 
-#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
 struct cpg_mssr_clk_domain {
 	struct generic_pm_domain genpd;
 	struct device_node *np;
@@ -491,14 +490,6 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 	of_genpd_add_provider_simple(np, genpd);
 	return 0;
 }
-#else
-static inline int cpg_mssr_add_clk_domain(struct device *dev,
-					  const unsigned int *core_pm_clks,
-					  unsigned int num_core_pm_clks)
-{
-	return 0;
-}
-#endif /* !CONFIG_PM_GENERIC_DOMAINS_OF */
 
 
 static const struct of_device_id cpg_mssr_match[] = {
-- 
1.9.1
