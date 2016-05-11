Return-Path: <k.kozlowski@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 07/18] clk: samsung: exynos4415: Move PLL rates data to init
 section
Date: Wed, 11 May 2016 14:02:03 +0200
Message-id: <1462968134-6085-7-git-send-email-k.kozlowski@samsung.com>
In-reply-to: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com>
References: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

The arrays with initialization data of PLLs can be moved to initconst
section because they are referenced only from other initconst-level
symbols.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4415.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4415.c b/drivers/clk/samsung/clk-exynos4415.c
index 1a9e9d039a3f..6c9063159717 100644
--- a/drivers/clk/samsung/clk-exynos4415.c
+++ b/drivers/clk/samsung/clk-exynos4415.c
@@ -859,7 +859,7 @@ static const struct samsung_gate_clock exynos4415_gate_clks[] __initconst = {
 /*
  * APLL & MPLL & BPLL & ISP_PLL & DISP_PLL & G3D_PLL
  */
-static const struct samsung_pll_rate_table exynos4415_pll_rates[] = {
+static const struct samsung_pll_rate_table exynos4415_pll_rates[] __initconst = {
 	PLL_35XX_RATE(1600000000, 400, 3,  1),
 	PLL_35XX_RATE(1500000000, 250, 2,  1),
 	PLL_35XX_RATE(1400000000, 175, 3,  0),
@@ -891,7 +891,7 @@ static const struct samsung_pll_rate_table exynos4415_pll_rates[] = {
 };
 
 /* EPLL */
-static const struct samsung_pll_rate_table exynos4415_epll_rates[] = {
+static const struct samsung_pll_rate_table exynos4415_epll_rates[] __initconst = {
 	PLL_36XX_RATE(800000000, 200, 3, 1,     0),
 	PLL_36XX_RATE(288000000,  96, 2, 2,     0),
 	PLL_36XX_RATE(192000000, 128, 2, 3,     0),
-- 
1.9.1
