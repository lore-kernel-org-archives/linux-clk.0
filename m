Return-Path: <linux-pm-owner@vger.kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [RFC/PATCH] clk: samsung: exynos5433: Fix NOIRQ suspend/resume
 support
Date: Wed, 19 Sep 2018 14:13:42 +0200
Message-id: <20180919121342.18288-1-m.szyprowski@samsung.com>
References: <CGME20180919121357eucas1p19717351c40697483d3bf467c55e46f51@eucas1p1.samsung.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

My recent commit af68ec14f112 'clk: samsung: Use NOIRQ stage for Exynos5433
clocks suspend/resume' moved Exynos5433 CMU suspend/resume callbacks
to NOIRQ stage. It turned out that in some cases this is not enough to
ensure that clocks provided by the given CMU will be available for other
drivers during their NOIRQ system suspend/resume phase. Device core calls
pm_runtime_disable and pm_runtime_enable unconditionally on every device
during LATE system suspend/resume phase. This means that during
noirq_resume, CMU device cannot be runtime resumed, because its
power.disable_depth is higher than zero (runtime PM for it will be enabled
later in device_resume_early function).

To let other devices properly use clocks and keep runtime PM enabled also
during NOIRQ system sleep phase, add calls to pm_runtime_enable/disable
to balance the actions done by device core. The CMU device will be
suspended in its noirq_suspend callback and finally resumed in noirq_resume.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Hi!

The unconditional calls to pm_runtime_enable and pm_runtime_enable
in device_suspend_late and device_resume_early core functions were a bit
surprising for me, because they make NOIRQ phase a special case from
the perspective of runtime PM handling. Using LATE system sleep phase
to call pm_runtime_enable/disable looks like a workaround for me, but right
now I have no other idea how to ensure proper behavior of the Exynos5433
CMU driver.

The most strange thing is that I didn't observe this initially after
switching to NOIRQ phase. The CMU device (FSYS_CMU) which is not under
any power domain behaved correctly and was properly available for DWMMC
device, which needs to enable clocks in its noirq_resume callback.

However, in case of AUD_CMU and its clients (for example serial_3 device,
which is a part of audio-subsytem), the pm_runtime_get_sync() called from
clk_prepare() failed, because AUD_CMU device had still disabled runtime PM
support. The only difference between FSYS_CMU and AUD_CMU, is the fact
that AUD_CMU is under AUD power domain, while FSYS_CMU device has no power
domain assigned (for completely other reasons FSYS power domains is not yet
instantiated in exynos5433.dtsi).

Ulf/Rafael: could You comment a bit on this issue? How it should be solved
properly?

Best regards
Marek Szyprowski
Samsung R&D Institute Poland
---
 drivers/clk/samsung/clk-exynos5433.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 4a0f8ff87ca0..7e6c0c9397a9 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5623,6 +5623,24 @@ static int __maybe_unused exynos5433_cmu_resume(struct device *dev)
 	return 0;
 }
 
+/*
+ * late_suspend and early_resume callbacks are required to balance
+ * pm_runtime_disable and pm_runtime_enable calls in device_suspend_late
+ * and device_resume_early core functions to keep runtime enabled for
+ * CMU device during noirq sleep phase.
+ */
+static int __maybe_unused exynos5433_late_suspend(struct device *dev)
+{
+	pm_runtime_enable(dev);
+	return 0;
+}
+
+static int __maybe_unused exynos5433_early_resume(struct device *dev)
+{
+	pm_runtime_disable(dev);
+	return 0;
+}
+
 static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -5760,6 +5778,8 @@ static const struct of_device_id exynos5433_cmu_of_match[] = {
 static const struct dev_pm_ops exynos5433_cmu_pm_ops = {
 	SET_RUNTIME_PM_OPS(exynos5433_cmu_suspend, exynos5433_cmu_resume,
 			   NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(exynos5433_late_suspend,
+				     exynos5433_early_resume)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				     pm_runtime_force_resume)
 };
-- 
2.17.1
