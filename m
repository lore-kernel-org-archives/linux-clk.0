Return-Path: <dvhart@infradead.org>
Date: Thu, 13 Jul 2017 08:54:48 -0700
From: Darren Hart <dvhart@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Carlo Caione <carlo@caione.org>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	sboyd@codeaurora.org, linux@endlessm.com, eballetbo@gmail.com,
	Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH v2] clk: x86: Do not gate clocks enabled by the firmware
Message-ID: <20170713155448.GD15146@fury>
References: <20170713094213.2775-1-carlo@caione.org>
 <1499940374.22624.370.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1499940374.22624.370.camel@linux.intel.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 13, 2017 at 01:06:14PM +0300, Andy Shevchenko wrote:
> On Thu, 2017-07-13 at 11:42 +0200, Carlo Caione wrote:
> > From: Carlo Caione <carlo@endlessm.com>
> > 
> > Read the enable register to determine if the clock is already in use
> > by
> > the firmware. In this case avoid gating the clock.
> > 
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I suppose it should go via clock tree.
> 
> > Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Signed-off-by: Carlo Caione <carlo@endlessm.com>
> > ---
> >  drivers/clk/x86/clk-pmc-atom.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-
> > atom.c
> > index 2b60577703ef..3c73d2e564ca 100644
> > --- a/drivers/clk/x86/clk-pmc-atom.c
> > +++ b/drivers/clk/x86/clk-pmc-atom.c
> > @@ -185,6 +185,13 @@ static struct clk_plt *plt_clk_register(struct
> > platform_device *pdev, int id,
> >  	pclk->reg = base + PMC_CLK_CTL_OFFSET + id *
> > PMC_CLK_CTL_SIZE;
> >  	spin_lock_init(&pclk->lock);
> >  
> > +	/*
> > +	 * If the clock was already enabled by the firmware mark is a
> > critical

Nit... I think this should read... "mark it as critical" ?

> > +	 * to avoid it being gated by the clock framework if no
> > driver owns it

owns it.

Acked-by: Darren Hart (VMware) <dvhart@infradead.org>

-- 
Darren Hart
VMware Open Source Technology Center
