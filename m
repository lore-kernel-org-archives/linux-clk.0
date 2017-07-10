Return-Path: <dvhart@infradead.org>
Date: Mon, 10 Jul 2017 16:54:03 -0700
From: Darren Hart <dvhart@infradead.org>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux@endlessm.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH] clk: x86: Do not gate clocks enabled by the firmware
Message-ID: <20170710235403.GB25390@fury>
References: <20170710203801.17496-1-carlo@caione.org>
 <CAFqH_51Mje4tK494JRgb=wWJNU9zu=WZ1sS482kRAvRrPpLkXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAFqH_51Mje4tK494JRgb=wWJNU9zu=WZ1sS482kRAvRrPpLkXQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 11, 2017 at 12:31:28AM +0200, Enric Balletbo Serra wrote:
> Hi,
> 
> 2017-07-10 22:38 GMT+02:00 Carlo Caione <carlo@caione.org>:
> > From: Carlo Caione <carlo@endlessm.com>
> >
> > Read the enable register to determine if the clock is already in use by
> > the firmware. In this case avoid gating the clock.
> >
> > Signed-off-by: Carlo Caione <carlo@endlessm.com>
> > ---
> >  drivers/clk/x86/clk-pmc-atom.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
> > index 2b60577703ef..46a8b6216fca 100644
> > --- a/drivers/clk/x86/clk-pmc-atom.c
> > +++ b/drivers/clk/x86/clk-pmc-atom.c
> > @@ -185,6 +185,9 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
> >         pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
> >         spin_lock_init(&pclk->lock);
> >
> > +       if (plt_clk_is_enabled(&pclk->hw))
> > +               init.flags |= CLK_IGNORE_UNUSED;
> > +
> >         ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
> >         if (ret) {
> >                 pclk = ERR_PTR(ret);
> > --
> > 2.13.2
> >
> 
> It also fixes the issue introduced in commit 282a4e4 ("platform/x86:
> Enable Atom PMC platform clocks") that causes no audio on Baytrail.
> 
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Excellent, thank you Enric. Pierre, any objections to this going in to
4.13 now and stable back to 4.12?

-- 
Darren Hart
VMware Open Source Technology Center
