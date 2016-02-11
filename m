Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 17:04:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 "Gregory CLEMENT" <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 2/2] clk: mvebu: Move corediv config to mvebu config
Message-ID: <20160211170448.7dbc872a@free-electrons.com>
In-Reply-To: <56BCB043.5040909@elecsyscorp.com>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455147596-16078-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455147596-16078-2-git-send-email-kevin.smith@elecsyscorp.com>
	<20160211091651.765cd91c@free-electrons.com>
	<56BCB043.5040909@elecsyscorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Kevin,

On Thu, 11 Feb 2016 16:01:03 +0000, Kevin Smith wrote:

> >> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
> >> index 64e3d2c..794e7c5 100644
> >> --- a/arch/arm/mach-mvebu/Kconfig
> >> +++ b/arch/arm/mach-mvebu/Kconfig
> >> @@ -32,6 +32,7 @@ config MACH_ARMADA_370
> >>   	select CPU_PJ4B
> >>   	select MACH_MVEBU_V7
> >>   	select PINCTRL_ARMADA_370
> >> +	select MVEBU_CLK_COREDIV if MTD_NAND_PXA3xx
> > Thanks for the new iteration. I know the corediv clock is only used for
> > the NAND, but I'm wondering if it's really worth doing this "if
> > MTD_NAND_PXA3xx.
> >
> > Thomas
> Maybe I misunderstood.  In your previous e-mail you said "building 
> ARMADA_38X_CLK or ARMADA_375_CLK does not require building 
> clk-corediv.c, it only needs common.c.  So maybe instead we should 
> change arch/arm/mach-mvebu/Kconfig to have MACH_ARMADA_xxx select 
> MVEBU_CLK_COREDIV when needed."  I thought you meant only when a 
> peripheral depended on the coreclk.
> 
> Should I remove the conditional and just have MACH_ARMADA_XXX always 
> enable MVEBU_CLK_COREDIV for platforms that have it?

Yes, at least, this is what my comment was suggesting to do. Sorry if
it was unclear, but my point is that the clock is there regardless of
whether the NAND driver is available/used.

Anyway, it's not a big deal because the defconfig has the pxa3xx_nand
driver enabled, so most people are very likely going to have this
driver enabled on Marvell platforms.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
