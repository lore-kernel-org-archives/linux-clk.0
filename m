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
Subject: [PATCH 3/4] clk: renesas: mstp: Clarify cpg_mstp_{at,de}tach_dev() domain parameter
Date: Wed,  9 Mar 2016 20:18:33 +0100
Message-Id: <1457551114-21764-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
References: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Make it clear that the "domain" parameter of the cpg_mstp_attach_dev()
and cpg_mstp_detach_dev() functions is not used.

The cpg_mstp_attach_dev() and cpg_mstp_detach_dev() callbacks are not
only used by the CPG/MSTP Clock Domain driver, but also by the R-Mobile
SYSC PM Domain driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-mstp.c | 4 ++--
 include/linux/clk/renesas.h    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 91eed7ced08d8fe6..0144d54351a6953b 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -244,7 +244,7 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 CLK_OF_DECLARE(cpg_mstp_clks, "renesas,cpg-mstp-clocks", cpg_mstp_clocks_init);
 
 
-int cpg_mstp_attach_dev(struct generic_pm_domain *domain, struct device *dev)
+int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
@@ -296,7 +296,7 @@ fail_put:
 	return error;
 }
 
-void cpg_mstp_detach_dev(struct generic_pm_domain *domain, struct device *dev)
+void cpg_mstp_detach_dev(struct generic_pm_domain *unused, struct device *dev)
 {
 	if (!list_empty(&dev->power.subsys_data->clock_list))
 		pm_clk_destroy(dev);
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 2a3379cf13304837..095b1681daf46faf 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -25,7 +25,7 @@ void r8a7779_clocks_init(u32 mode);
 void rcar_gen2_clocks_init(u32 mode);
 
 void cpg_mstp_add_clk_domain(struct device_node *np);
-int cpg_mstp_attach_dev(struct generic_pm_domain *domain, struct device *dev);
-void cpg_mstp_detach_dev(struct generic_pm_domain *domain, struct device *dev);
+int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
+void cpg_mstp_detach_dev(struct generic_pm_domain *unused, struct device *dev);
 
 #endif
-- 
1.9.1
