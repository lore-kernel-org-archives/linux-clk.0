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
Subject: [PATCH 4/4] clk: renesas: cpg-mssr: Export cpg_mssr_{at,de}tach_dev()
Date: Wed,  9 Mar 2016 20:18:34 +0100
Message-Id: <1457551114-21764-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
References: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The R-Car SYSC PM Domain driver has to power manage devices in power
areas using clocks. To reuse code and to share knowledge of clocks
suitable for power management, this is ideally done through the existing
cpg_mssr_attach_dev() and cpg_mssr_detach_dev() callbacks.

Hence these callbacks can no longer rely on their "domain" parameter
pointing to the CPG/MSSR Clock Domain. To handle this, keep a pointer to
the clock domain in a static variable. cpg_mssr_attach_dev() has to
support probe deferral, as the R-Car SYSC PM Domain may be initialized,
and devices may be added to it, before the CPG/MSSR Clock Domain is
initialized.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The probe deferral path was tested by initializing the renesas,fcpv
driver from an arch_initcall.
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 18 ++++++++++++------
 include/linux/clk/renesas.h            |  2 ++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 7482e7f6d37fbe22..dfdeb7d9f602011b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -15,6 +15,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
@@ -383,6 +384,8 @@ struct cpg_mssr_clk_domain {
 	unsigned int core_pm_clks[0];
 };
 
+static struct cpg_mssr_clk_domain *cpg_mssr_clk_domain;
+
 static bool cpg_mssr_is_pm_clk(const struct of_phandle_args *clkspec,
 			       struct cpg_mssr_clk_domain *pd)
 {
@@ -406,17 +409,20 @@ static bool cpg_mssr_is_pm_clk(const struct of_phandle_args *clkspec,
 	}
 }
 
-static int cpg_mssr_attach_dev(struct generic_pm_domain *genpd,
-			       struct device *dev)
+int cpg_mssr_attach_dev(struct generic_pm_domain *unused, struct device *dev)
 {
-	struct cpg_mssr_clk_domain *pd =
-		container_of(genpd, struct cpg_mssr_clk_domain, genpd);
+	struct cpg_mssr_clk_domain *pd = cpg_mssr_clk_domain;
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
 	struct clk *clk;
 	int i = 0;
 	int error;
 
+	if (!pd) {
+		dev_dbg(dev, "CPG/MSSR clock domain not yet available\n");
+		return -EPROBE_DEFER;
+	}
+
 	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
 					   &clkspec)) {
 		if (cpg_mssr_is_pm_clk(&clkspec, pd))
@@ -456,8 +462,7 @@ fail_put:
 	return error;
 }
 
-static void cpg_mssr_detach_dev(struct generic_pm_domain *genpd,
-				struct device *dev)
+void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev)
 {
 	if (!list_empty(&dev->power.subsys_data->clock_list))
 		pm_clk_destroy(dev);
@@ -486,6 +491,7 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 	pm_genpd_init(genpd, &simple_qos_governor, false);
 	genpd->attach_dev = cpg_mssr_attach_dev;
 	genpd->detach_dev = cpg_mssr_detach_dev;
+	cpg_mssr_clk_domain = pd;
 
 	of_genpd_add_provider_simple(np, genpd);
 	return 0;
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 095b1681daf46faf..69ec7f5f20910d08 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -28,4 +28,6 @@ void cpg_mstp_add_clk_domain(struct device_node *np);
 int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
 void cpg_mstp_detach_dev(struct generic_pm_domain *unused, struct device *dev);
 
+int cpg_mssr_attach_dev(struct generic_pm_domain *unused, struct device *dev);
+void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
 #endif
-- 
1.9.1
