Return-Path: <k.kozlowski@samsung.com>
Message-id: <55947D93.3090606@samsung.com>
Date: Thu, 02 Jul 2015 08:53:55 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Abraham <thomas.ab@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>,
 Lukasz Majewski <l.majewski@samsung.com>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@linaro.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 Andreas Faerber <afaerber@suse.de>
Subject: Re: [PATCH v3 2/4] ARM: dts: Exynos5250: add CPU OPP and regulator
 supply property
References: <1435756238-845-1-git-send-email-b.zolnierkie@samsung.com>
 <1435756238-845-3-git-send-email-b.zolnierkie@samsung.com>
In-reply-to: <1435756238-845-3-git-send-email-b.zolnierkie@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 01.07.2015 22:10, Bartlomiej Zolnierkiewicz wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> For Exynos5250 platforms, add CPU operating points and CPU
> regulator supply properties for migrating from Exynos specific
> cpufreq driver to using generic cpufreq driver.
> 
> Changes by Bartlomiej:
> - split Exynos5250 support from the original patch
> - added CPU regulator supply property for Google Spring board
> - put the new cpu nodes in alphabetical order
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Cc: Andreas Faerber <afaerber@suse.de>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts  |  4 ++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |  4 ++++
>  arch/arm/boot/dts/exynos5250-snow.dts     |  4 ++++
>  arch/arm/boot/dts/exynos5250-spring.dts   |  4 ++++
>  arch/arm/boot/dts/exynos5250.dtsi         | 22 ++++++++++++++++++++++
>  5 files changed, 38 insertions(+)

Looks good, thanks!

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
