Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1496049173.7514.2.camel@baylibre.com>
Subject: Re: [PATCH v2 04/11] clk: use round rate to bail out early in
 set_rate
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, Linus
 Walleij <linus.walleij@linaro.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Date: Mon, 29 May 2017 11:12:53 +0200
In-Reply-To: <149574365034.52617.9521289317050513324@resonance>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
	 <20170521215958.19743-5-jbrunet@baylibre.com>
	 <149574365034.52617.9521289317050513324@resonance>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-05-25 at 13:20 -0700, Michael Turquette wrote:
> Quoting Jerome Brunet (2017-05-21 14:59:51)
> > The current implementation of clk_core_set_rate_nolock bails out early if
> > the requested rate is exactly the same as the one set. It should bail out
> > if the request would not result in rate a change.  This important when rate
> > is not exactly what is requested, which is fairly common with PLLs.
> > 
> > Ex: provider able to give any rate with steps of 100Hz
> >  - 1st consumer request 48000Hz and gets it.
> >  - 2nd consumer request 48010Hz as well. If we were to perform the usual
> >    mechanism, we would get 48000Hz as well. The clock would not change so
> >    there is no point performing any checks to make sure the clock can
> >    change, we know it won't.
> > 
> > This is important to prepare the addition of the clock protection mechanism
> 
> Why is this change necessary for the rate_protect feature? I don't see a
> major problem with it, but not sure I want to change the expected
> behavior unless it is required.

It isn't strictly required for the clock protection to work but it allows the
consumer to get a coherent feedback from set_rate.

Without this, we may end up in a situation where the set_rate return with -EBUSY
while the rate of the clock is actually the best possible we could have wished
for (like in the example: we ask for 48010 and the rate set in 48000)

With this patch, If a consumer gets EBUSY, it knows the rate set is not optimal.
It could have been closer to what is requested if it wasn't busy doing something
else.

If the rate is (already) optimally set, as requested by the consumer, I think we
should not return an error here.

I don't think this changes the behavior of the function, the rate set will be
same anyway, it just won't return an error in a particular case.

If you firmly oppose this idea, I suppose It can be dropped but I think it could
be a valuable addition.

> 
> Thanks,
> Mike
> 
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/clk/clk.c | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 100f72472e10..1a8c0d013238 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1570,15 +1570,34 @@ static void clk_change_rate(struct clk_core *core)
> >                 clk_change_rate(core->new_child);
> >  }
> >  
> > +static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
> > +                                                    unsigned long req_rate)
> > +{
> > +       int ret;
> > +       struct clk_rate_request req;
> > +
> > +       if (!core)
> > +               return 0;
> > +
> > +       clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
> > +       req.rate = req_rate;
> > +
> > +       ret = clk_core_round_rate_nolock(core, &req);
> > +
> > +       return ret ? 0 : req.rate;
> > +}
> > +
> >  static int clk_core_set_rate_nolock(struct clk_core *core,
> >                                     unsigned long req_rate)
> >  {
> >         struct clk_core *top, *fail_clk;
> > -       unsigned long rate = req_rate;
> > +       unsigned long rate;
> >  
> >         if (!core)
> >                 return 0;
> >  
> > +       rate = clk_core_req_round_rate_nolock(core, req_rate);
> > +
> >         /* bail early if nothing to do */
> >         if (rate == clk_core_get_rate_nolock(core))
> >                 return 0;
> > @@ -1587,7 +1606,7 @@ static int clk_core_set_rate_nolock(struct clk_core
> > *core,
> >                 return -EBUSY;
> >  
> >         /* calculate new rates and get the topmost changed clock */
> > -       top = clk_calc_new_rates(core, rate);
> > +       top = clk_calc_new_rates(core, req_rate);
> >         if (!top)
> >                 return -EINVAL;
> >  
> > -- 
> > 2.9.4
> > 
