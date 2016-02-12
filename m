Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: "linux-clk\@vger.kernel.org" <linux-clk@vger.kernel.org>,  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 2/2] clk: mvebu: Move corediv config to mvebu config
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455209620-6125-2-git-send-email-kevin.smith@elecsyscorp.com>
Date: Fri, 12 Feb 2016 17:28:37 +0100
In-Reply-To: <1455209620-6125-2-git-send-email-kevin.smith@elecsyscorp.com>
	(Kevin Smith's message of "Thu, 11 Feb 2016 16:54:00 +0000")
Message-ID: <87r3ghx58q.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Kevin,
=20
 On jeu., f=C3=A9vr. 11 2016, Kevin Smith <kevin.smith@elecsyscorp.com> wro=
te:

> The core clock does not depend on corediv, so enabling corediv
> based on the clock is not really correct.  Move the corediv
> config option from the clock driver Kconfig to the mvebu Kconfig
> so that it can be enabled by the MACH option instead.
>
> This also enables corediv on Armada 375 and 38X, which was
> previously missing.
>
> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory

> ---
>  arch/arm/mach-mvebu/Kconfig | 3 +++
>  drivers/clk/mvebu/Kconfig   | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
> index 64e3d2c..71e97da 100644
> --- a/arch/arm/mach-mvebu/Kconfig
> +++ b/arch/arm/mach-mvebu/Kconfig
> @@ -32,6 +32,7 @@ config MACH_ARMADA_370
>  	select CPU_PJ4B
>  	select MACH_MVEBU_V7
>  	select PINCTRL_ARMADA_370
> +	select MVEBU_CLK_COREDIV
>  	help
>  	  Say 'Y' here if you want your kernel to support boards based
>  	  on the Marvell Armada 370 SoC with device tree.
> @@ -48,6 +49,7 @@ config MACH_ARMADA_375
>  	select HAVE_SMP
>  	select MACH_MVEBU_V7
>  	select PINCTRL_ARMADA_375
> +	select MVEBU_CLK_COREDIV
>  	help
>  	  Say 'Y' here if you want your kernel to support boards based
>  	  on the Marvell Armada 375 SoC with device tree.
> @@ -64,6 +66,7 @@ config MACH_ARMADA_38X
>  	select HAVE_SMP
>  	select MACH_MVEBU_V7
>  	select PINCTRL_ARMADA_38X
> +	select MVEBU_CLK_COREDIV
>  	help
>  	  Say 'Y' here if you want your kernel to support boards based
>  	  on the Marvell Armada 380/385 SoC with device tree.
> diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
> index e1bc567..eaee8f0 100644
> --- a/drivers/clk/mvebu/Kconfig
> +++ b/drivers/clk/mvebu/Kconfig
> @@ -11,7 +11,6 @@ config ARMADA_370_CLK
>  	bool
>  	select MVEBU_CLK_COMMON
>  	select MVEBU_CLK_CPU
> -	select MVEBU_CLK_COREDIV
>=20=20
>  config ARMADA_375_CLK
>  	bool
> --=20
> 2.4.6

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
