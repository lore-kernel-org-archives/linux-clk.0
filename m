Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1500387910.9510.22.camel@pengutronix.de>
Subject: Re: Coupled clk/reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joel Stanley <joel@jms.id.au>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,  Linus
 Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 18 Jul 2017 16:25:10 +0200
In-Reply-To: <1500375379.2865.114.camel@kernel.crashing.org>
References: 
	<CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
	 <1500375379.2865.114.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-07-18 at 20:56 +1000, Benjamin Herrenschmidt wrote:
[...]
> My gut feeling is that I would have a single driver exposing both clock
> and reset interfaces.

Agreed.

> It keeps a "reset state" for each device.
> 
> The reset API just changes that internal (SW) state, and adjusts the HW
> reset if and only if the clock is on.
> 
> When the clock is turned off, we force the reset, disable the clock.
> 
> When the clock is turned on, we force the reset if not already set,
> enable the clock, then only lift the reset if the "user" reset is
> not asserted.

Please let's not do this. If a reset line is controlled by the clocks
like this, I'd rather not have it exported via the reset API at the same
time.
Both shared and exclusive reset control API are incompatible with
another controlling instance forcing the reset line into asserted state:
the exclusive reset API promises full control over the reset line, and
the shared reset API guarantees deassertion while requested (just like
the clk API can't be used to force-disable a clock).

> That being said, I think for the aspeed SoC, the argument could be made
> that we don't actually need a reset driver. We yet have to encounter a
> single device that needs to control it's own reset line for anything
> other than enabling/disabling its clock/IP block.
> 
> So I suspect sticking to just a clock API that does the underlying
> reset manipulations as needed is sufficient and we can "upgrade" to the
> above proposal if it ends up being needed (which I doubt).

I agree with hiding the whole mechanism in the clock driver. If that
can't be done in the clock driver, I would prefer to give control to the
IP block drivers instead.

regards
Philipp
