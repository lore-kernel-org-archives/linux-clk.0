Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] clk: renesas: mstp: disable runtime pm for r7s72100
Date: Fri, 27 Jan 2017 13:20:40 -0500
Message-Id: <20170127182040.22240-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Due to the lack of clock status bits, we need to disable runtime pm
for all RZ/A1 peripherals. Otherwise, it is possible that a driver
will start using a peripheral before it is fully ready.

By using pm_clk_resume immediately after we add the clock we ensure the
usage counter will never get back down to 0, and hence will always keep
the clock enabled.

In order for dis_runtime_pm to be accessible for all relevant functions
in this file, it needed to be a global.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/clk-mstp.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 69cfdb9..3c91555 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -59,6 +59,8 @@ struct mstp_clock {
 	struct mstp_clock_group *group;
 };
 
+static bool dis_runtime_pm;
+
 #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
 static inline u32 cpg_mstp_read(struct mstp_clock_group *group,
@@ -216,6 +218,13 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	if (of_device_is_compatible(np, "renesas,r7s72100-mstp-clocks"))
 		group->width_8bit = true;
 
+	/*
+	 * Due to the lack of clock status bits, we need to disable runtime pm
+	 * for all RZ/A1 peripherals.
+	 */
+	if (of_device_is_compatible(np, "renesas,r7s72100-mstp-clocks"))
+		dis_runtime_pm = true;
+
 	for (i = 0; i < MSTP_MAX_CLOCKS; ++i)
 		clks[i] = ERR_PTR(-ENOENT);
 
@@ -314,6 +323,9 @@ int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
 		goto fail_destroy;
 	}
 
+	if (dis_runtime_pm)
+		pm_clk_resume(dev);
+
 	return 0;
 
 fail_destroy:
@@ -325,8 +337,11 @@ int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
 
 void cpg_mstp_detach_dev(struct generic_pm_domain *unused, struct device *dev)
 {
-	if (!list_empty(&dev->power.subsys_data->clock_list))
+	if (!list_empty(&dev->power.subsys_data->clock_list)) {
+		if (dis_runtime_pm)
+			pm_clk_suspend(dev);
 		pm_clk_destroy(dev);
+	}
 }
 
 void __init cpg_mstp_add_clk_domain(struct device_node *np)
@@ -344,7 +359,8 @@ void __init cpg_mstp_add_clk_domain(struct device_node *np)
 		return;
 
 	pd->name = np->name;
-	pd->flags = GENPD_FLAG_PM_CLK;
+	if (!dis_runtime_pm)
+		pd->flags = GENPD_FLAG_PM_CLK;
 	pd->attach_dev = cpg_mstp_attach_dev;
 	pd->detach_dev = cpg_mstp_detach_dev;
 	pm_genpd_init(pd, &pm_domain_always_on_gov, false);
-- 
2.10.1
