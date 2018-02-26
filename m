Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39381 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752289AbeBZMyG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Feb 2018 07:54:06 -0500
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/6] soc: samsung: pm_domains: Add blacklisting clock
 handling
Date: Mon, 26 Feb 2018 13:53:50 +0100
Message-id: <20180226125355.9052-2-m.szyprowski@samsung.com>
In-reply-to: <20180226125355.9052-1-m.szyprowski@samsung.com>
References: <20180226125355.9052-1-m.szyprowski@samsung.com>
        <CGME20180226125402eucas1p26624013733dcc44cf5f8d2818d0899c9@eucas1p2.samsung.com>
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

