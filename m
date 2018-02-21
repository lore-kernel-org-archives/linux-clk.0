Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53946 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932740AbeBUKPi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Feb 2018 05:15:38 -0500
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 5/6] soc: samsung: pm_domains: Deprecate support for clocks
Date: Wed, 21 Feb 2018 11:15:26 +0100
Message-id: <20180221101527.25554-6-m.szyprowski@samsung.com>
In-reply-to: <20180221101527.25554-1-m.szyprowski@samsung.com>
References: <20180221101527.25554-1-m.szyprowski@samsung.com>
        <CGME20180221101534eucas1p29d832ffe11055241a39d79a8863845ad@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Handling of special clock operations on power domain on/off sequences has
been moved to respective Exynos clock controller drivers, so there is no
need to keep the duplicated (and conflicting) code in Exynos power domain
driver. Mark clock related properties in Exynos power domain bindings as
deprecated. This change has no inpact on backwards-compatibility, as the
new drivers properly work with old DTBs (deprecated properties are
ignored).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../devicetree/bindings/power/pd-samsung.txt       | 20 +----
 drivers/soc/samsung/pm_domains.c                   | 90 +---------------------
 2 files changed, 5 insertions(+), 105 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.txt b/Documentation/devicetree/bindings/power/pd-samsung.txt
index 549f7dee9b9d..92ef355e8f64 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.txt
+++ b/Documentation/devicetree/bindings/power/pd-samsung.txt
@@ -15,23 +15,13 @@ Required Properties:
 Optional Properties:
 - label: Human readable string with domain name. Will be visible in userspace
 	to let user to distinguish between multiple domains in SoC.
-- clocks: List of clock handles. The parent clocks of the input clocks to the
-	devices in this power domain are set to oscclk before power gating
-	and restored back after powering on a domain. This is required for
-	all domains which are powered on and off and not required for unused
-	domains.
-- clock-names: The following clocks can be specified:
-	- oscclk: Oscillator clock.
-	- clkN: Input clocks to the devices in this power domain. These clocks
-		will be reparented to oscclk before switching power domain off.
-		Their original parent will be brought back after turning on
-		the domain. Maximum of 4 clocks (N = 0 to 3) are supported.
-	- asbN: Clocks required by asynchronous bridges (ASB) present in
-		the power domain. These clock should be enabled during power
-		domain on/off operations.
 - power-domains: phandle pointing to the parent power domain, for more details
 		 see Documentation/devicetree/bindings/power/power_domain.txt
 
+Deprecated Properties:
+- clocks
+- clock-names
+
 Node of a device using power domains must have a power-domains property
 defined with a phandle to respective power domain.
 
@@ -47,8 +37,6 @@ Example:
 	mfc_pd: power-domain@10044060 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044060 0x20>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_USER_ACLK333>;
-		clock-names = "oscclk", "clk0";
 		#power-domain-cells = <0>;
 		label = "MFC";
 	};
diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index caf45cf7aa8e..ab8582971bfc 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -13,14 +13,11 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
-#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/sched.h>
 
-#define MAX_CLK_PER_DOMAIN	4
-
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
@@ -33,10 +30,6 @@ struct exynos_pm_domain {
 	void __iomem *base;
 	bool is_off;
 	struct generic_pm_domain pd;
-	struct clk *oscclk;
-	struct clk *clk[MAX_CLK_PER_DOMAIN];
-	struct clk *pclk[MAX_CLK_PER_DOMAIN];
-	struct clk *asb_clk[MAX_CLK_PER_DOMAIN];
 	u32 local_pwr_cfg;
 };
 
@@ -46,29 +39,10 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	void __iomem *base;
 	u32 timeout, pwr;
 	char *op;
-	int i;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 	base = pd->base;
 
-	for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
-		if (IS_ERR(pd->asb_clk[i]))
-			break;
-		clk_prepare_enable(pd->asb_clk[i]);
-	}
-
-	/* Set oscclk before powering off a domain*/
-	if (!power_on) {
-		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
-			if (IS_ERR(pd->clk[i]))
-				break;
-			pd->pclk[i] = clk_get_parent(pd->clk[i]);
-			if (clk_set_parent(pd->clk[i], pd->oscclk))
-				pr_err("%s: error setting oscclk as parent to clock %d\n",
-						domain->name, i);
-		}
-	}
-
 	pwr = power_on ? pd->local_pwr_cfg : 0;
 	writel_relaxed(pwr, base);
 
@@ -86,26 +60,6 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		usleep_range(80, 100);
 	}
 
-	/* Restore clocks after powering on a domain*/
-	if (power_on) {
-		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
-			if (IS_ERR(pd->clk[i]))
-				break;
-
-			if (IS_ERR(pd->pclk[i]))
-				continue; /* Skip on first power up */
-			if (clk_set_parent(pd->clk[i], pd->pclk[i]))
-				pr_err("%s: error setting parent to clock%d\n",
-						domain->name, i);
-		}
-	}
-
-	for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
-		if (IS_ERR(pd->asb_clk[i]))
-			break;
-		clk_disable_unprepare(pd->asb_clk[i]);
-	}
-
 	return 0;
 }
 
@@ -147,12 +101,6 @@ static __init const char *exynos_get_domain_name(struct device_node *node)
 	return kstrdup_const(name, GFP_KERNEL);
 }
 
-static const char *soc_force_no_clk[] = {
-	"samsung,exynos5250-clock",
-	"samsung,exynos5420-clock",
-	"samsung,exynos5800-clock",
-};
-
 static __init int exynos4_pm_init_power_domain(void)
 {
 	struct device_node *np;
@@ -161,7 +109,7 @@ static __init int exynos4_pm_init_power_domain(void)
 	for_each_matching_node_and_match(np, exynos_pm_domain_of_match, &match) {
 		const struct exynos_pm_domain_config *pm_domain_cfg;
 		struct exynos_pm_domain *pd;
-		int on, i;
+		int on;
 
 		pm_domain_cfg = match->data;
 
@@ -189,42 +137,6 @@ static __init int exynos4_pm_init_power_domain(void)
 		pd->pd.power_on = exynos_pd_power_on;
 		pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
 
-		for (i = 0; i < ARRAY_SIZE(soc_force_no_clk); i++)
-			if (of_find_compatible_node(NULL, NULL,
-						    soc_force_no_clk[i]))
-				goto no_clk;
-
-		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
-			char clk_name[8];
-
-			snprintf(clk_name, sizeof(clk_name), "asb%d", i);
-			pd->asb_clk[i] = of_clk_get_by_name(np, clk_name);
-			if (IS_ERR(pd->asb_clk[i]))
-				break;
-		}
-
-		pd->oscclk = of_clk_get_by_name(np, "oscclk");
-		if (IS_ERR(pd->oscclk))
-			goto no_clk;
-
-		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
-			char clk_name[8];
-
-			snprintf(clk_name, sizeof(clk_name), "clk%d", i);
-			pd->clk[i] = of_clk_get_by_name(np, clk_name);
-			if (IS_ERR(pd->clk[i]))
-				break;
-			/*
-			 * Skip setting parent on first power up.
-			 * The parent at this time may not be useful at all.
-			 */
-			pd->pclk[i] = ERR_PTR(-EINVAL);
-		}
-
-		if (IS_ERR(pd->clk[0]))
-			clk_put(pd->oscclk);
-
-no_clk:
 		on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
 
 		pm_genpd_init(&pd->pd, NULL, !on);
-- 
2.15.0

