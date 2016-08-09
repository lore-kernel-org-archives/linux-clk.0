Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
Date: Tue, 9 Aug 2016 09:23:03 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Amit Kucheria <amit.kucheria@verdurent.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH] clk: Hi6220: enable stub clock driver for ARCH_HISI
Message-ID: <20160809012303.GA19812@leoy-linaro>
References: <1470627463-20570-1-git-send-email-leo.yan@linaro.org>
 <CAHLCerN1dwvjT_r7UD2ZFD0Aar8uPg_RkCh_FDSFxNvLKZPqDQ@mail.gmail.com>
 <20160808064241.GA30622@leoy-linaro>
 <CAHLCerObKvK2KZRQFWk2BpjEiRSskwUNs4csMMNRQGmjHF8nhg@mail.gmail.com>
 <5d98a054-c057-81eb-9ee7-789353a093e5@linaro.org>
 <CAHLCerPxpCVZONujNhjgQ-QKkiibKW1xYoFWOO9dGkLSO--hPQ@mail.gmail.com>
 <a735ec58-7a6c-dccd-e072-a73a76622c9d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <a735ec58-7a6c-dccd-e072-a73a76622c9d@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 08, 2016 at 09:36:32PM +0100, Daniel Thompson wrote:

[...]

> >My earlier patch focused on enabling the stub driver in the case the
> >thermal driver was enabled (and subsequently turning on HISI_THERMAL
> >in defconfig). The EAS profiling usecase to prevent thermal-throttling
> >from kicking in is a bad default to have in the kernel, IMO - it can
> >be easily achieved by just changing the thermal thresholds.
> >
> >Something like the following, with HISI_THERMAL added to defconfig
> >would give a "stable" kernel on Hikey.
> >
> >diff --git i/drivers/thermal/Kconfig w/drivers/thermal/Kconfig
> >index 2d702ca..77597a5 100644
> >--- i/drivers/thermal/Kconfig
> >+++ w/drivers/thermal/Kconfig
> >@@ -177,8 +177,11 @@ config THERMAL_EMULATION
> >
> > config HISI_THERMAL
> >  tristate "Hisilicon thermal driver"
> >-   depends on (ARCH_HISI && CPU_THERMAL && OF) || COMPILE_TEST
> >+ depends on (ARCH_HISI && OF) || COMPILE_TEST
> >  depends on HAS_IOMEM
> >+ select CPU_THERMAL
> >+ select CPUFREQ_DT
> >+ select STUB_CLK_HI6220
> 
> I'm actually a little uncomfortable having a thermal sensor dictate
> what cooling devices are used to react to its temperature reading.
> The link between sensors and cooling devices comes from DT.
> 
> However I admit there are other platforms (IMX and DB8500) that
> accept the same build time diktat from their thermal sensors.

For thermal enabling on Hikey with CPU cooling device, how about below
change? I checked arch/arm/configs/multi_v7_defconfig, both
CONFIG_CPUFREQ_DT and CONFIG_CPU_THERMAL have been enabled in it.
These two drivers are quite common and used by many ARM platforms.

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0555b7c..f65336f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -78,6 +78,7 @@ CONFIG_COMPAT=y
 CONFIG_CPU_IDLE=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
+CONFIG_CPUFREQ_DT=y
 CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_NET=y
@@ -217,6 +218,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
+CONFIG_CPU_THERMAL=y
 CONFIG_EXYNOS_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 2d702ca..91ebab3 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -177,8 +177,10 @@ config THERMAL_EMULATION
 
 config HISI_THERMAL
 	tristate "Hisilicon thermal driver"
-	depends on (ARCH_HISI && CPU_THERMAL && OF) || COMPILE_TEST
+	depends on ARCH_HISI || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on OF
+	default y
 	help
 	  Enable this to plug hisilicon's thermal sensor driver into the Linux
 	  thermal framework. cpufreq is used as the cooling device to throttle
