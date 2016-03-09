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
Subject: [PATCH 1/4] clk: renesas: mstp: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
Date: Wed,  9 Mar 2016 20:18:31 +0100
Message-Id: <1457551114-21764-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
References: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

As of commit 71d076ceb245f0d9 ("ARM: shmobile: Enable PM and
PM_GENERIC_DOMAINS for SoCs with PM Domains"),
CONFIG_PM_GENERIC_DOMAINS_OF is always enabled for SoCs with MSTP
clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-mstp.c | 2 --
 include/linux/clk/renesas.h    | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 3d44e183aedd61c7..91eed7ced08d8fe6 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -244,7 +244,6 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 CLK_OF_DECLARE(cpg_mstp_clks, "renesas,cpg-mstp-clocks", cpg_mstp_clocks_init);
 
 
-#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
 int cpg_mstp_attach_dev(struct generic_pm_domain *domain, struct device *dev)
 {
 	struct device_node *np = dev->of_node;
@@ -326,4 +325,3 @@ void __init cpg_mstp_add_clk_domain(struct device_node *np)
 
 	of_genpd_add_provider_simple(np, pd);
 }
-#endif /* !CONFIG_PM_GENERIC_DOMAINS_OF */
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 7adfd80fbf55d484..2a3379cf13304837 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -24,12 +24,8 @@ void r8a7778_clocks_init(u32 mode);
 void r8a7779_clocks_init(u32 mode);
 void rcar_gen2_clocks_init(u32 mode);
 
-#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
 void cpg_mstp_add_clk_domain(struct device_node *np);
 int cpg_mstp_attach_dev(struct generic_pm_domain *domain, struct device *dev);
 void cpg_mstp_detach_dev(struct generic_pm_domain *domain, struct device *dev);
-#else
-static inline void cpg_mstp_add_clk_domain(struct device_node *np) {}
-#endif
 
 #endif
-- 
1.9.1
