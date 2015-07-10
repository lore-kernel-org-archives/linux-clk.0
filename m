Return-Path: <linux-pm-owner@vger.kernel.org>
Message-id: <559F88DE.1020202@samsung.com>
Date: Fri, 10 Jul 2015 17:57:02 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Thomas Abraham <thomas.ab@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>,
	Lukasz Majewski <l.majewski@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Kevin Hilman <khilman@linaro.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Anand Moon <linux.amoon@gmail.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] cpufreq: exynos: remove Exynos4x12 specific cpufreq
 driver support
References: <1436456621-29839-1-git-send-email-b.zolnierkie@samsung.com>
 <1436456621-29839-8-git-send-email-b.zolnierkie@samsung.com>
In-reply-to: <1436456621-29839-8-git-send-email-b.zolnierkie@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10.07.2015 00:43, Bartlomiej Zolnierkiewicz wrote:
> Exynos4x12 based platforms have switched over to use generic
> cpufreq driver for cpufreq functionality.  So the Exynos
> specific cpufreq support for these platforms can be removed.
> 
> Also once Exynos4x12 based platforms support have been removed
> the shared exynos-cpufreq driver is no longer needed and can
> be deleted.
> 
> Based on the earlier work by Thomas Abraham.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/cpufreq/Kconfig.arm          |  23 ----
>  drivers/cpufreq/Makefile             |   2 -
>  drivers/cpufreq/exynos-cpufreq.c     | 231 ----------------------------------
>  drivers/cpufreq/exynos-cpufreq.h     |  72 -----------
>  drivers/cpufreq/exynos4x12-cpufreq.c | 236 -----------------------------------
>  5 files changed, 564 deletions(-)
>  delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
>  delete mode 100644 drivers/cpufreq/exynos-cpufreq.h
>  delete mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c

Code removal is awesome!
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
