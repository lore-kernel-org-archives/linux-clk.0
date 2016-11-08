Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: pxa: fix pxa2xx_determine_rate return
Date: Tue, 08 Nov 2016 23:22:40 +0100
Message-ID: <2012366.hMim84DLbv@wuerfel>
In-Reply-To: <87k2cdyhnu.fsf@belgarion.home>
References: <20161108144950.3472058-1-arnd@arndb.de> <20161108144950.3472058-2-arnd@arndb.de> <87k2cdyhnu.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Tuesday, November 8, 2016 7:01:57 PM CET Robert Jarzmik wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
> 
> > The new pxa2xx_determine_rate() function seems lacking in a few
> > regards:
> >
> > - For an exact match or no match at all, the rate is uninitialized
> >   as reported by gcc -Wmaybe-unintialized:
> >    drivers/clk/pxa/clk-pxa.c: In function 'pxa2xx_determine_rate':
> >    drivers/clk/pxa/clk-pxa.c:243:5: error: 'rate' may be used uninitialized in
> >   this function
> Euh I don't think that is true.
> 
> For an exact match, rate is assigned the exact value in the first line after the
> for(xxx).

Right, my mistake.

> For no match at all, there are 2 cases :
>  - either a closest match is found, and rate is actually assigned (see below)
>  - or no match is found, and it's true rate remains uninitialized, but we have
>    ret = -EINVAL

Or a third case that gcc finds but that probably won't happen in practice:

- nb_freqs==0, rate is never initialized

This is what I'm addressing by returning early in the 'else' case.

> > - If we get a non-exact match, the req->rate output is never set
> >   to the actual rate but remains at the requested rate.
> Euh no, that doesn't seem correct to me.
> 
> If a non-exact match is found, either by closest_below or closest_above, rate is
> set (rate = freqs[closest_xxx].cpll). And a couple of lines later after the
> if/else, req->rate = rate is set as well, so I don't think this part of the
> commit message is accurate.

It is only set if rate is zero, and that normally is not the case here:

       if (!rate)
               req->rate = rate;


> > - We should not attempt to print a rate if none could be found
> True.
> 
> > This rewrites the logic accordingly.
> Unless I'm wrong in the analysis above, I'd rather have just "unsigned long rate
> = 0" in the variable declaration, and keep the pr_debug() even if -EINVAL is
> returned (it's better for bug tracking, with a rate == 0 in this case for example).

I think it's safer not to initialize the variable, to ensure we get a
warning if the function is changed incorrectly again later.

	Arnd
