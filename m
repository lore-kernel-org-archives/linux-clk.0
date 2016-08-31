Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
From: Leo Yan <leo.yan@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Simon Horman <horms+renesas@verge.net.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Riku Voipio <riku.voipio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Guodong Xu <guodong.xu@linaro.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH 3/3] arm64: defconfig: enable two common modules for power management
Date: Wed, 31 Aug 2016 16:50:17 +0800
Message-Id: <1472633417-9330-4-git-send-email-leo.yan@linaro.org>
In-Reply-To: <1472633417-9330-1-git-send-email-leo.yan@linaro.org>
References: <1472633417-9330-1-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Enable two common modules for power management, one is to enable
CPUFREQ_DT driver; this CPUFreq driver is used by many platforms by
passing OPP table from device tree.

Also enables CPU_THERMAL for CPU cooling device driver; so after we
enabled thermal framework and can bind thermal zone with CPU cooling
device driver.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index eadf485..9fd2681 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -82,6 +82,7 @@ CONFIG_COMPAT=y
 CONFIG_CPU_IDLE=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
+CONFIG_CPUFREQ_DT=y
 CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_NET=y
@@ -252,6 +253,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
+CONFIG_CPU_THERMAL=y
 CONFIG_EXYNOS_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
-- 
1.9.1
