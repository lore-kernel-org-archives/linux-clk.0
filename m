Return-Path: <tomasz.figa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447637775-9887-3-git-send-email-k.kozlowski@samsung.com>
References: <1447637775-9887-1-git-send-email-k.kozlowski@samsung.com>
	<1447637775-9887-3-git-send-email-k.kozlowski@samsung.com>
Date: Thu, 19 Nov 2015 13:23:55 +0900
Message-ID: <CA+Ln22FP60Zc4cQmztNTy+2ZbhE1T7pgPXBMb9T=YZcYPo0EdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: EXYNOS: Consolidate ARCH_EXYNOS7 symbol into ARCH_EXYNOS
From: Tomasz Figa <tomasz.figa@gmail.com>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Kevin Hilman <khilman@linaro.org>, Pankaj Dubey <pankaj.dubey@samsung.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Krzysztof,

2015-11-16 10:36 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> The ARMv8 Exynos family SoCs in Linux kernel are currently:
>  - Exynos5433 (controlled by ARCH_EXYNOS),
>  - Exynos7 (controlled by ARCH_EXYNOS7).
>
> It duplicates Kconfig symbols unnecessarily, so consolidate them into
> one ARCH_EXYNOS. Future SoCs could fall also under the ARCH_EXYNOS
> symbol.
>
> The commit should not bring any visible functional change.

I think this basically matches the general recommendation for ARM64,
so excluding the single nitpick inline and assuming that, after this
patch, grep ARCH_EXYNOS7 gives no results:

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm64/Kconfig.platforms        | 11 ++---------
>  arch/arm64/boot/dts/exynos/Makefile |  2 +-
>  arch/arm64/configs/defconfig        |  2 +-
>  3 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 4043c35962cc..afa19baca94e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -13,21 +13,14 @@ config ARCH_BERLIN
>           This enables support for Marvell Berlin SoC Family
>
>  config ARCH_EXYNOS
> -       bool
> -       help
> -         This enables support for Samsung Exynos SoC family
> -
> -config ARCH_EXYNOS7
> -       bool "ARMv8 based Samsung Exynos7"
> -       select ARCH_EXYNOS
> +       bool "ARMv8 based Samsung Exynos SoC family"
>         select COMMON_CLK_SAMSUNG
>         select HAVE_S3C2410_WATCHDOG if WATCHDOG
>         select HAVE_S3C_RTC if RTC_CLASS
>         select PINCTRL
>         select PINCTRL_EXYNOS
> -
>         help
> -         This enables support for Samsung Exynos7 SoC family
> +         This enables support for Samsung Exynos ARMv8 SoC family

nit: Sounds a little bit strange. Maybe "This enables support for
ARMv8 based Samsung Exynos SoC family"?

Best regards,
Tomasz
