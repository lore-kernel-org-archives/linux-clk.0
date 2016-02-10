Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2016 22:28:21 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 "Gregory CLEMENT" <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] clk: mvebu: Require corediv clock for Armada 38x
Message-ID: <20160210222821.51cfd91f@free-electrons.com>
In-Reply-To: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Dear Kevin Smith,

On Wed, 10 Feb 2016 20:41:13 +0000, Kevin Smith wrote:
> The corediv clock driver is required for the pxa3xx_nand driver,
> but is not included in the ARMADA_38X_CLK config.  Add
> MVEBU_CLK_COREDIV as a dependency of ARMADA_38X_CLK.
> 
> Without the corediv driver, nand initialization fails with the
> message:
> 
> pxa3xx-nand f10d0000.flash: failed to get nand clock
> pxa3xx-nand f10d0000.flash: alloc nand resource failed
> 
> With corediv enabled, flash is successfully detected.
> 
> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  drivers/clk/mvebu/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
> index 2769625..1107056 100644
> --- a/drivers/clk/mvebu/Kconfig
> +++ b/drivers/clk/mvebu/Kconfig
> @@ -20,6 +20,7 @@ config ARMADA_375_CLK
>  config ARMADA_38X_CLK
>  	bool
>  	select MVEBU_CLK_COMMON
> +	select MVEBU_CLK_COREDIV

Thanks for the patch!

I believe there are some more issues in this Kconfig file:

 - The ARMADA_XP_CLK option selects MVEBU_CLK_COREDIV but there is no
   corediv clock on Armada XP.

 - The ARMADA_375_CLK should also select MVEBU_CLK_COREDIV.

However, technically speaking, building ARMADA_38X_CLK or
ARMADA_375_CLK does not require building clk-corediv.c, it only needs
common.c. So maybe instead we should change arch/arm/mach-mvebu/Kconfig
to have MACH_ARMADA_xxx select MVEBU_CLK_COREDIV when needed.

But maybe I'm being overly pedantic here, and your solution is good
enough. I don't have a strong opinion on this.

But if we go with your solution, then I'd like to fix the Armada XP and
Armada 375 cases as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
