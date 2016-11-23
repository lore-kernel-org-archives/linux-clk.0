Return-Path: <scott.branden@broadcom.com>
Return-Path: <scott.branden@broadcom.com>
Subject: Re: [PATCH] clk: bcm: Make COMMON_CLK_IPROC into a library
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20161123224159.9988-1-sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <ray.jui@broadcom.com>,
 Jon Mason <jonmason@broadcom.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <d7938d3a-39bb-193e-d792-369786cdc54d@broadcom.com>
Date: Wed, 23 Nov 2016 14:55:30 -0800
MIME-Version: 1.0
In-Reply-To: <20161123224159.9988-1-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 16-11-23 02:41 PM, Stephen Boyd wrote:
> The broadcom clk driver Kconfig file selects and depends on the
> COMMON_CLK_IPROC config for different SoC specific drivers. Let's
> simplify this by always selecting the COMMON_CLK_IPROC config,
> turning it into a set of library code. We still want to retain
> the SoC specific options, so we leave those in place. Since we're
> here we also drop COMMON_CLK dependency because that's implicitly
> handled by including this file in drivers/clk/Kconfig in the
> right place and also make CLK_BCM_KONA default to y on the
> architecture it exists for instead of plain default y.
>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <ray.jui@broadcom.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/bcm/Kconfig | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index e3eed5a78404..b5ae5311b0a2 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -1,7 +1,6 @@
>  config CLK_BCM_63XX
>  	bool "Broadcom BCM63xx clock support"
>  	depends on ARCH_BCM_63XX || COMPILE_TEST
> -	depends on COMMON_CLK
I think the depends on COMMON_CLK needs to remain?
>  	select COMMON_CLK_IPROC
>  	default ARCH_BCM_63XX
>  	help
> @@ -11,27 +10,22 @@ config CLK_BCM_63XX
>  config CLK_BCM_KONA
>  	bool "Broadcom Kona CCU clock support"
>  	depends on ARCH_BCM_MOBILE || COMPILE_TEST
> -	depends on COMMON_CLK
I think the depends on COMMON_CLK needs to remain?
> -	default y
> +	default ARCH_BCM_MOBILE
>  	help
>  	  Enable common clock framework support for Broadcom SoCs
>  	  using "Kona" style clock control units, including those
>  	  in the BCM281xx and BCM21664 families.
>
>  config COMMON_CLK_IPROC
> -	bool "Broadcom iProc clock support"
> -	depends on ARCH_BCM_IPROC || ARCH_BCM_63XX || COMPILE_TEST
> -	depends on COMMON_CLK
I think the depends on COMMON_CLK needs to remain?
> -	default ARCH_BCM_IPROC
> +	bool
>  	help
>  	  Enable common clock framework support for Broadcom SoCs
>  	  based on the iProc architecture
>
> -if COMMON_CLK_IPROC
> -
>  config CLK_BCM_CYGNUS
>  	bool "Broadcom Cygnus clock support"
>  	depends on ARCH_BCM_CYGNUS || COMPILE_TEST
> +	select COMMON_CLK_IPROC
>  	default ARCH_BCM_CYGNUS
>  	help
>  	  Enable common clock framework support for the Broadcom Cygnus SoC
> @@ -39,6 +33,7 @@ config CLK_BCM_CYGNUS
>  config CLK_BCM_NSP
>  	bool "Broadcom Northstar/Northstar Plus clock support"
>  	depends on ARCH_BCM_5301X || ARCH_BCM_NSP || COMPILE_TEST
> +	select COMMON_CLK_IPROC
>  	default ARCH_BCM_5301X || ARCH_BCM_NSP
>  	help
>  	  Enable common clock framework support for the Broadcom Northstar and
> @@ -47,8 +42,7 @@ config CLK_BCM_NSP
>  config CLK_BCM_NS2
>  	bool "Broadcom Northstar 2 clock support"
>  	depends on ARCH_BCM_IPROC || COMPILE_TEST
> +	select COMMON_CLK_IPROC
>  	default ARCH_BCM_IPROC
>  	help
>  	  Enable common clock framework support for the Broadcom Northstar 2 SoC
> -
> -endif
>

Regards,
Scott
