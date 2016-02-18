Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kevin Smith <kevin.smith@elecsyscorp.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455209620-6125-2-git-send-email-kevin.smith@elecsyscorp.com>
Cc: "Kevin Smith" <kevin.smith@elecsyscorp.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>,
 "Gregory CLEMENT" <gregory.clement@free-electrons.com>,
 "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
 <1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
 <1455209620-6125-2-git-send-email-kevin.smith@elecsyscorp.com>
Message-ID: <20160218011644.2278.40155@quark.deferred.io>
Subject: Re: [PATCH v3 2/2] clk: mvebu: Move corediv config to mvebu config
Date: Wed, 17 Feb 2016 17:16:44 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Kevin Smith (2016-02-11 08:54:00)
> The core clock does not depend on corediv, so enabling corediv
> based on the clock is not really correct.  Move the corediv
> config option from the clock driver Kconfig to the mvebu Kconfig
> so that it can be enabled by the MACH option instead.
> =

> This also enables corediv on Armada 375 and 38X, which was
> previously missing.
> =

> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Michael Turquette <mturquette@baylibre.com>

I'm fine to take both patches through the clk tree, or to have them go
through arm-soc. Let me know if you have a preference.

Regards,
Mike

> ---
>  arch/arm/mach-mvebu/Kconfig | 3 +++
>  drivers/clk/mvebu/Kconfig   | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
> index 64e3d2c..71e97da 100644
> --- a/arch/arm/mach-mvebu/Kconfig
> +++ b/arch/arm/mach-mvebu/Kconfig
> @@ -32,6 +32,7 @@ config MACH_ARMADA_370
>         select CPU_PJ4B
>         select MACH_MVEBU_V7
>         select PINCTRL_ARMADA_370
> +       select MVEBU_CLK_COREDIV
>         help
>           Say 'Y' here if you want your kernel to support boards based
>           on the Marvell Armada 370 SoC with device tree.
> @@ -48,6 +49,7 @@ config MACH_ARMADA_375
>         select HAVE_SMP
>         select MACH_MVEBU_V7
>         select PINCTRL_ARMADA_375
> +       select MVEBU_CLK_COREDIV
>         help
>           Say 'Y' here if you want your kernel to support boards based
>           on the Marvell Armada 375 SoC with device tree.
> @@ -64,6 +66,7 @@ config MACH_ARMADA_38X
>         select HAVE_SMP
>         select MACH_MVEBU_V7
>         select PINCTRL_ARMADA_38X
> +       select MVEBU_CLK_COREDIV
>         help
>           Say 'Y' here if you want your kernel to support boards based
>           on the Marvell Armada 380/385 SoC with device tree.
> diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
> index e1bc567..eaee8f0 100644
> --- a/drivers/clk/mvebu/Kconfig
> +++ b/drivers/clk/mvebu/Kconfig
> @@ -11,7 +11,6 @@ config ARMADA_370_CLK
>         bool
>         select MVEBU_CLK_COMMON
>         select MVEBU_CLK_CPU
> -       select MVEBU_CLK_COREDIV
>  =

>  config ARMADA_375_CLK
>         bool
> -- =

> 2.4.6
