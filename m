Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 09:16:51 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 "Gregory CLEMENT" <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 2/2] clk: mvebu: Move corediv config to mvebu config
Message-ID: <20160211091651.765cd91c@free-electrons.com>
In-Reply-To: <1455147596-16078-2-git-send-email-kevin.smith@elecsyscorp.com>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455147596-16078-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455147596-16078-2-git-send-email-kevin.smith@elecsyscorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Kevin,

On Wed, 10 Feb 2016 23:40:26 +0000, Kevin Smith wrote:
> The corediv clock is not required for all builds, only those that
> enable peripherals that need it.  Move the corediv config option
> from the clock driver Kconfig to the mvebu Kconfig and make it
> conditional.
> 
> This also enables corediv on Armada 375 and 38X as needed.
> 
> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/arm/mach-mvebu/Kconfig | 3 +++
>  drivers/clk/mvebu/Kconfig   | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
> index 64e3d2c..794e7c5 100644
> --- a/arch/arm/mach-mvebu/Kconfig
> +++ b/arch/arm/mach-mvebu/Kconfig
> @@ -32,6 +32,7 @@ config MACH_ARMADA_370
>  	select CPU_PJ4B
>  	select MACH_MVEBU_V7
>  	select PINCTRL_ARMADA_370
> +	select MVEBU_CLK_COREDIV if MTD_NAND_PXA3xx

Thanks for the new iteration. I know the corediv clock is only used for
the NAND, but I'm wondering if it's really worth doing this "if
MTD_NAND_PXA3xx.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
