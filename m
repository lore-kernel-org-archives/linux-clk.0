Return-Path: <dvhart@infradead.org>
Date: Mon, 10 Jul 2017 18:38:32 -0700
From: Darren Hart <dvhart@infradead.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Carlo Caione <carlo@caione.org>,
	Enric Balletbo Serra <eballetbo@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	linux@endlessm.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH] clk: x86: Do not gate clocks enabled by the firmware
Message-ID: <20170711013832.GC25390@fury>
References: <20170710203801.17496-1-carlo@caione.org>
 <CAFqH_51Mje4tK494JRgb=wWJNU9zu=WZ1sS482kRAvRrPpLkXQ@mail.gmail.com>
 <20170710235403.GB25390@fury>
 <20170711012908.GO22780@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170711012908.GO22780@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 10, 2017 at 06:29:08PM -0700, Stephen Boyd wrote:
> On 07/10, Darren Hart wrote:
> > On Tue, Jul 11, 2017 at 12:31:28AM +0200, Enric Balletbo Serra wrote:
> > > 2017-07-10 22:38 GMT+02:00 Carlo Caione <carlo@caione.org>:
> > > >         pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
> > > >         spin_lock_init(&pclk->lock);
> > > >
> > > > +       if (plt_clk_is_enabled(&pclk->hw))
> > > > +               init.flags |= CLK_IGNORE_UNUSED;
> 
> Can you add a comment to the effect of why we're adding ignore
> unused here? That will make it clearer when reading the code a
> year from now why we're not turning these clks off by default and
> also allow us to recall why it isn't marked as a critical clk.

Yes please, good point.

> 
> Probably, we want some sort of handoff mechanism here so that the
> clk is left on until a driver comes into the picture and acquires
> a handle to this clk?

Presumably optionally - it will stay on permanently if nothing claims
it, as in the case where the firmware sets up for the platform, and
nothing else touches it.

> 
> > > > +
> > > >         ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
> > > >         if (ret) {
> > > >                 pclk = ERR_PTR(ret);
> > > > --
> > > > 2.13.2
> > > >
> > > 
> > > It also fixes the issue introduced in commit 282a4e4 ("platform/x86:
> > > Enable Atom PMC platform clocks") that causes no audio on Baytrail.
> > > 
> > > Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > 
> > Excellent, thank you Enric. Pierre, any objections to this going in to
> > 4.13 now and stable back to 4.12?
> > 
> 
> You mean v4.11? That's when commit 282a4e4 was released.

Yes indeed.

> Typically we punt these sorts of things to the next release
> because it isn't a regression in the release that's being worked
> on (i.e. it wasn't introduced in this merge window), but in this
> case it seems like a small enough patch plus it's a bother to
> keep it out of the release to make it alright to merge now.
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
Darren Hart
VMware Open Source Technology Center
