Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46319 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753696AbeCFOd0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Mar 2018 09:33:26 -0500
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 1/6] soc: samsung: pm_domains: Add blacklisting clock
 handling
Date: Tue, 06 Mar 2018 15:33:07 +0100
Message-id: <20180306143312.21035-2-m.szyprowski@samsung.com>
In-reply-to: <20180306143312.21035-1-m.szyprowski@samsung.com>
References: <20180306143312.21035-1-m.szyprowski@samsung.com>
        <CGME20180306143323eucas1p1d420abb34b827a3128503859e0c21727@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Handling of clock reparenting will be move to clock controller driver, so
add possibility to blacklist clock handling on systems, where the clock
controller already does all needed operations. This is needed to avoid
potential deadlock on clock reparenting during power domain on/off
procedure.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/samsung/pm_domains.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index b6a436594a19..cef30bdf19b1 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -147,6 +147,9 @@ static __init const char *exynos_get_domain_name(struct device_node *node)
 	return kstrdup_const(name, GFP_KERNEL);
 }
 
+static const char *soc_force_no_clk[] = {
+};
+
 static __init int exynos4_pm_init_power_domain(void)
 {
 	struct device_node *np;
@@ -183,6 +186,11 @@ static __init int exynos4_pm_init_power_domain(void)
 		pd->pd.power_on = exynos_pd_power_on;
 		pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
 
+		for (i = 0; i < ARRAY_SIZE(soc_force_no_clk); i++)
+			if (of_find_compatible_node(NULL, NULL,
+						    soc_force_no_clk[i]))
+				goto no_clk;
+
 		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
 			char clk_name[8];
 
-- 
2.15.0

