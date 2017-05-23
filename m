Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1495552190.2344.17.camel@baylibre.com>
Subject: Re: [PATCH v2 10/11] clk: fix CLK_SET_RATE_GATE with clock rate
 protection
From: Jerome Brunet <jbrunet@baylibre.com>
To: Adriana Reus <adi.reus@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, Linus Walleij
 <linus.walleij@linaro.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Date: Tue, 23 May 2017 17:09:50 +0200
In-Reply-To: <CABjU8GuZQ_2ynUTJpwNoG19zPq-P8Ld=4mwk0EvpHrPROF=bXg@mail.gmail.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
	 <20170521215958.19743-11-jbrunet@baylibre.com>
	 <CABjU8GuZQ_2ynUTJpwNoG19zPq-P8Ld=4mwk0EvpHrPROF=bXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-05-23 at 16:42 +0300, Adriana Reus wrote:
> On Mon, May 22, 2017 at 12:59 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > Using clock rate protection, we can now enforce CLK_SET_RATE_GATE along the
> > clock tree
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/clk/clk.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 01306191133c..6ee5fc59cf1f 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -491,6 +491,9 @@ static void clk_core_unprepare(struct clk_core *core)
> >         if (WARN_ON(core->prepare_count == 1 && core->flags &
> > CLK_IS_CRITICAL))
> >                 return;
> > 
> > +       if (core->flags & CLK_SET_RATE_GATE)
> > +               clk_core_rate_unprotect(core);
> 
> ^ function call before declaration (unless i missed something when applying),
>   gets fixed in following patch, but makes this one not compile standalone.
> 

You didn't miss anything, I did. It is now fixed


> drivers/clk/clk.c: In function 'clk_core_unprepare':
> drivers/clk/clk.c:495:3: error: implicit declaration of function
> 'clk_core_rate_unprotect' [-Werror=implicit-function-declaration]
>    clk_core_rate_unprotect(core);
> 
> > +
> >         if (--core->prepare_count > 0)
> >                 return;
> > 
> > @@ -561,6 +564,14 @@ static int clk_core_prepare(struct clk_core *core)
> > 
> >         core->prepare_count++;
> > 
> > +       /*
> > +        * CLK_SET_RATE_GATE is a special case of clock protection
> > +        * Instead of a consumer protection, the provider is protecting
> > +        * itself when prepared
> > +        */
> > +       if (core->flags & CLK_SET_RATE_GATE)
> > +               clk_core_rate_protect(core);
> 
> ^ same here;
> Note: maybe have a quick check that each patch compiles individually
> (if you haven't already), I did not check them all.

I should have. Now it is done and it is OK (with our remarks fixed, of course)
Thanks a lot for pointing this out.

> > +
> >         return 0;
> >  }
> > 
> > @@ -1738,9 +1749,6 @@ static int clk_core_set_rate_nolock(struct clk_core
> > *core,
> >         if (clk_core_rate_is_protected(core))
> >                 return -EBUSY;
> > 
> > -       if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
> > -               return -EBUSY;
> > -
> >         /* calculate new rates and get the topmost changed clock */
> >         top = clk_calc_new_rates(core, req_rate);
> >         if (!top)
> > --
> > 2.9.4
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
