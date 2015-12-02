Return-Path: <ben@smart-cactus.org>
From: Ben Gamari <ben@smart-cactus.org>
To: Thomas Abraham <thomas.ab@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>,
	Lukasz Majewski <l.majewski@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Kevin Hilman <khilman@linaro.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Anand Moon <linux.amoon@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	b.zolnierkie@samsung.com,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Ben Gamari <ben@smart-cactus.org>
Subject: [PATCH 08/12] ARM: Exynos: use generic cpufreq driver for Exynos5800
Date: Wed,  2 Dec 2015 22:19:23 +0100
Message-Id: <1449091167-20758-9-git-send-email-ben@smart-cactus.org>
In-Reply-To: <1449091167-20758-1-git-send-email-ben@smart-cactus.org>
References: <1449091167-20758-1-git-send-email-ben@smart-cactus.org>
List-ID: <linux-clk.vger.kernel.org>

From: Thomas Abraham <thomas.ab@samsung.com>

The new CPU clock type allows the use of generic arm_big_little_dt
cpufreq driver for Exynos5800.

Changes by Bartlomiej:
- split Exynos5800 support from the original patch
- disable cpufreq if big.LITTLE switcher support is enabled

Changes by Ben Gamari:
- rebase

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Ben Gamari <ben@smart-cactus.org>
---
 arch/arm/mach-exynos/exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 818e6a0..9289412 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -236,6 +236,7 @@ static const struct of_device_id exynos_cpufreq_matches[] = {
 	 */
 #ifndef CONFIG_BL_SWITCHER
 	{ .compatible = "samsung,exynos5420", .data = "arm-bL-cpufreq-dt" },
+	{ .compatible = "samsung,exynos5800", .data = "arm-bL-cpufreq-dt" },
 #endif
 	{ /* sentinel */ }
 };
-- 
2.6.2
