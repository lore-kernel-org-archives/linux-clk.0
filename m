Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54540 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751256AbdJDGij (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2017 02:38:39 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 5/7] clk: samsung: Remove support for Exynos4212 SoCs in
 Exynos CLKOUT driver
Date: Wed, 04 Oct 2017 08:38:26 +0200
Message-id: <20171004063828.22068-6-m.szyprowski@samsung.com>
In-reply-to: <20171004063828.22068-1-m.szyprowski@samsung.com>
References: <20171004063828.22068-1-m.szyprowski@samsung.com>
        <CGME20171004063836eucas1p1ab64c174baf2773eb17d1c94cd05ed8c@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
to keep remaining dead code related to this SoC version.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index a21aea062bae..f29fb5824005 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -144,8 +144,6 @@ static void __init exynos4_clkout_init(struct device_node *node)
 }
 CLK_OF_DECLARE_DRIVER(exynos4210_clkout, "samsung,exynos4210-pmu",
 		exynos4_clkout_init);
-CLK_OF_DECLARE_DRIVER(exynos4212_clkout, "samsung,exynos4212-pmu",
-		exynos4_clkout_init);
 CLK_OF_DECLARE_DRIVER(exynos4412_clkout, "samsung,exynos4412-pmu",
 		exynos4_clkout_init);
 CLK_OF_DECLARE_DRIVER(exynos3250_clkout, "samsung,exynos3250-pmu",
-- 
2.14.2

