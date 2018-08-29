Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55840 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729200AbeH2Tsf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:48:35 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 01/10] clk: samsung: Remove excessive include
Date: Wed, 29 Aug 2018 17:50:37 +0200
Message-id: <20180829155046.29359-2-m.szyprowski@samsung.com>
In-reply-to: <20180829155046.29359-1-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155059eucas1p28a20924521edaa4c9bd3d9683d0f2d0d@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Exynos Audio SubSystem and Exynos3250 clock drivers don't use any syscore
function, so don't include linux/syscore_ops.h in their code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos-audss.c | 1 -
 drivers/clk/samsung/clk-exynos3250.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index f659c5cbf1d5..8f8a0f9fc842 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -15,7 +15,6 @@
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
-#include <linux/syscore_ops.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 27c9d23657b3..0e9a41a4cac8 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -12,7 +12,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-#include <linux/syscore_ops.h>
 
 #include <dt-bindings/clock/exynos3250.h>
 
-- 
2.17.1
