Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54732 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbeIXRCk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 13:02:40 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] clk: samsung: exynos5420: Define CLK_SECKEY gate clock only
 or Exynos5420
Date: Mon, 24 Sep 2018 13:00:56 +0200
Message-id: <20180924110056.21033-1-m.szyprowski@samsung.com>
References: <CGME20180924110106eucas1p2465d1fdd263f7921ae6e9c65d32155f6@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Joonyoung Shim <jy0922.shim@samsung.com>

The bit of GATE_BUS_PERIS1 for CLK_SECKEY is just reserved on
exynos5422/5800, not exynos5420. Define gate clk for exynos5420 to
handle the bit only on exynos5420.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
[m.szyprow: rewrote commit subject]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 76e7686c6162..a2d6e7f4bcd3 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -568,6 +568,7 @@ static const struct samsung_div_clock exynos5420_div_clks[] __initconst = {
 };
 
 static const struct samsung_gate_clock exynos5420_gate_clks[] __initconst = {
+	GATE(CLK_SECKEY, "seckey", "aclk66_psgen", GATE_BUS_PERIS1, 1, 0, 0),
 	GATE(CLK_MAU_EPLL, "mau_epll", "mout_mau_epll_clk",
 			SRC_MASK_TOP7, 20, CLK_SET_RATE_PARENT, 0),
 };
@@ -1097,8 +1098,6 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 	GATE(CLK_TMU, "tmu", "aclk66_psgen", GATE_IP_PERIS, 21, 0, 0),
 	GATE(CLK_TMU_GPU, "tmu_gpu", "aclk66_psgen", GATE_IP_PERIS, 22, 0, 0),
 
-	GATE(CLK_SECKEY, "seckey", "aclk66_psgen", GATE_BUS_PERIS1, 1, 0, 0),
-
 	/* GEN Block */
 	GATE(CLK_ROTATOR, "rotator", "mout_user_aclk266", GATE_IP_GEN, 1, 0, 0),
 	GATE(CLK_JPEG, "jpeg", "aclk300_jpeg", GATE_IP_GEN, 2, 0, 0),
-- 
2.17.1
