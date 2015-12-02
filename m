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
	Mike Turquette <mturquette@linaro.org>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Ben Gamari <ben@smart-cactus.org>
Subject: [PATCH 04/12] ARM: Exynos: use generic cpufreq driver for Exynos5420
Date: Wed,  2 Dec 2015 22:19:19 +0100
Message-Id: <1449091167-20758-5-git-send-email-ben@smart-cactus.org>
In-Reply-To: <1449091167-20758-1-git-send-email-ben@smart-cactus.org>
References: <1449091167-20758-1-git-send-email-ben@smart-cactus.org>
List-ID: <linux-clk.vger.kernel.org>

From: Thomas Abraham <thomas.ab@samsung.com>

The new CPU clock type allows the use of generic arm_big_little_dt
cpufreq driver for Exynos5420.

Changes by Bartlomiej:
- split Exynos5420 support from the original patch
- disable cpufreq if big.LITTLE switcher support is enabled

Changes by Ben Gamari:
- rebase

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com> (Mon. 15:01)
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Ben Gamari <ben@smart-cactus.org>
---
 arch/arm/mach-exynos/exynos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 1c47aee..818e6a0 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -230,6 +230,13 @@ static const struct of_device_id exynos_cpufreq_matches[] = {
 	{ .compatible = "samsung,exynos4212", .data = "cpufreq-dt" },
 	{ .compatible = "samsung,exynos4412", .data = "cpufreq-dt" },
 	{ .compatible = "samsung,exynos5250", .data = "cpufreq-dt" },
+	/*
+	 * FIXME: When big.LITTLE switcher is enabled system lockups during
+	 * ondemand governor stress testing (observed on ODROID-XU3 board).
+	 */
+#ifndef CONFIG_BL_SWITCHER
+	{ .compatible = "samsung,exynos5420", .data = "arm-bL-cpufreq-dt" },
+#endif
 	{ /* sentinel */ }
 };
 
-- 
2.6.2
