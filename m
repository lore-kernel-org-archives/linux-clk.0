Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCH] clk: bcm: Fix unmet Kconfig dependencies for CLK_BCM_63XX
To: Stephen Boyd <sboyd@codeaurora.org>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20161122174329.11592-1-f.fainelli@gmail.com>
 <20161123201819.GI25626@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Michael Turquette <mturquette@baylibre.com>,
 Jon Mason <jonmason@broadcom.com>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d9b72f90-6879-e455-3236-71bfb51fa346@gmail.com>
Date: Wed, 23 Nov 2016 12:25:31 -0800
MIME-Version: 1.0
In-Reply-To: <20161123201819.GI25626@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 11/23/2016 12:18 PM, Stephen Boyd wrote:
> On 11/22, Florian Fainelli wrote:
>> With commit f4e871509959 ("clk: iproc: Make clocks visible options"),
>> COMMON_CLK_IPROC gained a dependency on ARCH_BCM_IPROC, yet CLK_BCM_63XX
>> also selects that option, this causes the following Kconfig warning:
>>
>> warning: (CLK_BCM_63XX) selects COMMON_CLK_IPROC which has unmet direct
>> dependencies ((ARCH_BCM_IPROC || COMPILE_TEST) && COMMON_CLK)
>>
>> Fix this by adding proper depends/default for COMMON_CLK_IPROC
>>
>> Fixes: f4e871509959 ("clk: iproc: Make clocks visible options")
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/clk/bcm/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
>> index f21e9b7afd1a..80de9fc2e833 100644
>> --- a/drivers/clk/bcm/Kconfig
>> +++ b/drivers/clk/bcm/Kconfig
>> @@ -20,9 +20,9 @@ config CLK_BCM_KONA
>>  
>>  config COMMON_CLK_IPROC
>>  	bool "Broadcom iProc clock support"
>> -	depends on ARCH_BCM_IPROC || COMPILE_TEST
>> +	depends on ARCH_BCM_IPROC || ARCH_BCM_63XX || COMPILE_TEST
>>  	depends on COMMON_CLK
>> -	default ARCH_BCM_IPROC
>> +	default ARCH_BCM_IPROC || ARCH_BCM_63XX
>>  	help
>>  	  Enable common clock framework support for Broadcom SoCs
>>  	  based on the iProc architecture
> 
> It's confusing that CLK_BCM_63XX selects COMMON_CLK_IPROC and the
> other drivers don't. Also, why are we now defaulting IPROC to be
> true when ARCH_BCM_63XX is there? It will be selected anyway by
> the clk driver on that machine so what's the point?
> 
> I'd prefer we handled this one way instead of two. Given that
> COMMON_CLK_IPROC is a symbol for what looks like a library it
> seems that it needs to be a hidden option that gets selected by
> the other three options for the machine specific drivers.
> 
> I'd like to drop the default ARCH_BCM_63XX part of your patch,
> merge that for 4.9 and apply this on top for 4.10. Agreed?

So essentially you propose to revert the change that you suggested Jon
to do in the Fixes commit mentioned, that's fine with me.

> 
> ----8<----
> 
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index f21e9b7afd1a..b5ae5311b0a2 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -1,7 +1,6 @@
>  config CLK_BCM_63XX
>  	bool "Broadcom BCM63xx clock support"
>  	depends on ARCH_BCM_63XX || COMPILE_TEST
> -	depends on COMMON_CLK
>  	select COMMON_CLK_IPROC
>  	default ARCH_BCM_63XX
>  	help
> @@ -11,27 +10,22 @@ config CLK_BCM_63XX
>  config CLK_BCM_KONA
>  	bool "Broadcom Kona CCU clock support"
>  	depends on ARCH_BCM_MOBILE || COMPILE_TEST
> -	depends on COMMON_CLK
> -	default y
> +	default ARCH_BCM_MOBILE
>  	help
>  	  Enable common clock framework support for Broadcom SoCs
>  	  using "Kona" style clock control units, including those
>  	  in the BCM281xx and BCM21664 families.
>  
>  config COMMON_CLK_IPROC
> -	bool "Broadcom iProc clock support"
> -	depends on ARCH_BCM_IPROC || COMPILE_TEST
> -	depends on COMMON_CLK
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


-- 
Florian
