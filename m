Return-Path: <linux+mturquette=baylibre.com@armlinux.org.uk>
Date: Wed, 9 Aug 2017 12:45:48 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 05/10] clk: add support for clock protection
Message-ID: <20170809114548.GD20805@n2100.armlinux.org.uk>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-6-jbrunet@baylibre.com>
 <20170726001217.GC2146@codeaurora.org>
 <1501089516.2401.29.camel@baylibre.com>
 <20170804001836.GU2146@codeaurora.org>
 <150223186723.22158.11617219588466426777@resonance>
 <20170809021906.GA2146@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170809021906.GA2146@codeaurora.org>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 08, 2017 at 07:19:06PM -0700, Stephen Boyd wrote:
> I also vaguely remember Paul saying that
> clk_round_rate() could return something and then clk_set_rate()
> after that would fail because what was calculated during the rate
> speculation/rounding phase would be different if some other
> consumer goes and changes some rate high up in the tree.

That's probably because people tend to get this stuff wrong.  It is
_not_ supposed to be:

	rounded_rate = clk_round_rate(clk, requested_rate);

	clk_set_rate(clk, rounded_rate);

but:

	rounded_rate = clk_round_rate(clk, requested_rate);

	clk_set_rate(clk, requested_rate);

The former is wrong for two reasons:

1. it's completely wasteful of CPU resources to do all the calculations
   that need to be done within clk_set_rate().

2. it's racy - there is no guarantee that you'll end up with "rounded_rate"

The API definition of clk_round_rate() explicitly mentions that it is
equivalent to clk_set_rate() followed by clk_get_rate() with the
exception that it doesn't affect the hardware.

I'm not sure that the clock rate protection API is really the right
solution - if we're trying to stop others from changing the clock rate,
that implies we have multiple different threads potentially changing
the rate at any time.  If a driver does this:

	clk_set_rate(clk, foo);
	clk_rate_protect(clk);

what prevents another thread from changing the clock rate between these
two calls?  The only way to do this safely would be something like:

	r = clk_round_rate(clk, foo);
	while (1) {
		err = clk_set_rate(clk, foo);
		clk_rate_protect(clk);
		if (err < 0)
			break;

		if (r == clk_get_rate(clk)) /* success */
			break;

		clk_rate_unprotect(clk);
	}

	if (err)
		failed;

That's rather a lot of code to add to every driver, and given the
number of times I've seen people get the clk_round_rate() vs
clk_set_rate() thing wrong, I've zero confidence that folk will get
this right either.

So, I'd suggest _not_ adding this clk_rate_protect() thing, but
instead an API that simultaneously sets and protects the rate, so
driver authors don't have to get involved in details like the above.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
