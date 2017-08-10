Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Russell King - ARM Linux <linux@armlinux.org.uk>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170809114548.GD20805@n2100.armlinux.org.uk>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 "Kevin Hilman" <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-6-jbrunet@baylibre.com>
 <20170726001217.GC2146@codeaurora.org>
 <1501089516.2401.29.camel@baylibre.com>
 <20170804001836.GU2146@codeaurora.org>
 <150223186723.22158.11617219588466426777@resonance>
 <20170809021906.GA2146@codeaurora.org>
 <20170809114548.GD20805@n2100.armlinux.org.uk>
Message-ID: <150238357489.5192.13375163361255683826@resonance>
Subject: Re: [PATCH v3 05/10] clk: add support for clock protection
Date: Thu, 10 Aug 2017 09:46:15 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Russell,

Quoting Russell King - ARM Linux (2017-08-09 04:45:48)
> I'm not sure that the clock rate protection API is really the right
> solution - if we're trying to stop others from changing the clock rate,
> that implies we have multiple different threads potentially changing
> the rate at any time.  If a driver does this:
> =

>         clk_set_rate(clk, foo);
>         clk_rate_protect(clk);
> =

> what prevents another thread from changing the clock rate between these
> two calls?  The only way to do this safely would be something like:

I agree that ordering the calls in your example above is racy. It is an
incorrect use of this new api. The two correct ways to use this api are:

1) Use clk_set_rate_protect, introduced in patch #6 of this series

2) Call clk_rate_protect() first, and if that call succeeds then call
clk_set_rate(). Thanks to per-consumer struct clk objects, we can know
that *this* consumer is the exclusive owner of the clk rate, and is
allowed to change the rate within the critical section.

I think this subtlety is not well described in the commitlog nor the
kerneldoc, since most reviewing including myself have missed it: the
consumer that successfully protects the clk can change the rate within
the critical section, by design.

> =

>         r =3D clk_round_rate(clk, foo);
>         while (1) {
>                 err =3D clk_set_rate(clk, foo);
>                 clk_rate_protect(clk);
>                 if (err < 0)
>                         break;
> =

>                 if (r =3D=3D clk_get_rate(clk)) /* success */
>                         break;
> =

>                 clk_rate_unprotect(clk);
>         }
> =

>         if (err)
>                 failed;
> =

> That's rather a lot of code to add to every driver, and given the
> number of times I've seen people get the clk_round_rate() vs
> clk_set_rate() thing wrong, I've zero confidence that folk will get
> this right either.
> =

> So, I'd suggest _not_ adding this clk_rate_protect() thing, but
> instead an API that simultaneously sets and protects the rate, so
> driver authors don't have to get involved in details like the above.

As mentioned above, patch #6 does exactly this. Furthermore if you
simply flip your use of clk_set_rate and clk_rate_protect, then things
Just Work.

Thanks,
Mike

> =

> -- =

> RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps=
 up
> According to speedtest.net: 8.21Mbps down 510kbps up
