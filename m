Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Nov 2016 14:24:10 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	Michael Turquette <mturquette@baylibre.com>,
	Jon Mason <jonmason@broadcom.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: bcm: Fix unmet Kconfig dependencies for CLK_BCM_63XX
Message-ID: <20161123222410.GJ25626@codeaurora.org>
References: <20161122174329.11592-1-f.fainelli@gmail.com>
 <20161123201819.GI25626@codeaurora.org>
 <d9b72f90-6879-e455-3236-71bfb51fa346@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d9b72f90-6879-e455-3236-71bfb51fa346@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/23, Florian Fainelli wrote:
> On 11/23/2016 12:18 PM, Stephen Boyd wrote:
> > On 11/22, Florian Fainelli wrote:
> >> With commit f4e871509959 ("clk: iproc: Make clocks visible options"),
> >> COMMON_CLK_IPROC gained a dependency on ARCH_BCM_IPROC, yet CLK_BCM_63XX
> >> also selects that option, this causes the following Kconfig warning:
> >>
> >> warning: (CLK_BCM_63XX) selects COMMON_CLK_IPROC which has unmet direct
> >> dependencies ((ARCH_BCM_IPROC || COMPILE_TEST) && COMMON_CLK)
> >>
> >> Fix this by adding proper depends/default for COMMON_CLK_IPROC
> >>
> >> Fixes: f4e871509959 ("clk: iproc: Make clocks visible options")
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >> ---
> >>  drivers/clk/bcm/Kconfig | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> >> index f21e9b7afd1a..80de9fc2e833 100644
> >> --- a/drivers/clk/bcm/Kconfig
> >> +++ b/drivers/clk/bcm/Kconfig
> >> @@ -20,9 +20,9 @@ config CLK_BCM_KONA
> >>  
> >>  config COMMON_CLK_IPROC
> >>  	bool "Broadcom iProc clock support"
> >> -	depends on ARCH_BCM_IPROC || COMPILE_TEST
> >> +	depends on ARCH_BCM_IPROC || ARCH_BCM_63XX || COMPILE_TEST
> >>  	depends on COMMON_CLK
> >> -	default ARCH_BCM_IPROC
> >> +	default ARCH_BCM_IPROC || ARCH_BCM_63XX
> >>  	help
> >>  	  Enable common clock framework support for Broadcom SoCs
> >>  	  based on the iProc architecture
> > 
> > It's confusing that CLK_BCM_63XX selects COMMON_CLK_IPROC and the
> > other drivers don't. Also, why are we now defaulting IPROC to be
> > true when ARCH_BCM_63XX is there? It will be selected anyway by
> > the clk driver on that machine so what's the point?
> > 
> > I'd prefer we handled this one way instead of two. Given that
> > COMMON_CLK_IPROC is a symbol for what looks like a library it
> > seems that it needs to be a hidden option that gets selected by
> > the other three options for the machine specific drivers.
> > 
> > I'd like to drop the default ARCH_BCM_63XX part of your patch,
> > merge that for 4.9 and apply this on top for 4.10. Agreed?
> 
> So essentially you propose to revert the change that you suggested Jon
> to do in the Fixes commit mentioned, that's fine with me.
> 

Not exactly. We always wanted to have the option of compiling
support for different drivers from the menu, which is what Jon's
change was about. The difference here is that we don't require
the support library code to be selected to make those options
visible.

Anyway, it sounds like your fine with this approach so let's do
it! I'll send this patch out properly.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
