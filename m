Return-Path: <benh@kernel.crashing.org>
Message-ID: <1500375379.2865.114.camel@kernel.crashing.org>
Subject: Re: Coupled clk/reset
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 18 Jul 2017 20:56:19 +1000
In-Reply-To: <CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
References: 
	<CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-07-18 at 19:53 +0930, Joel Stanley wrote:
> Hello!
> 
> I'm taking a stab at a clk and reset driver for the Aspeed SoCs. I've
> used the Gemini driver for inspiration so far, which looks to be a
> good fit for the clock gating and important clocks (those we need in
> order to get the uart and timer source going).
> 
> One tricky bit is the datasheet specifies the following for enabling
> an IP block ('engine'), whenever the engine is started from the
> clocked stopped state:
> 
>  1. Enable engine reset
>  2. Delay 100us
>  3. Enable clock
>  4. Delay 10ms
>  5. Disable engine reset
> 
> How does this dance fit into the reset/clock framework? I need to show
> that there is this dependency when enabling a clock.

My gut feeling is that I would have a single driver exposing both clock
and reset interfaces.

It keeps a "reset state" for each device.

The reset API just changes that internal (SW) state, and adjusts the HW
reset if and only if the clock is on.

When the clock is turned off, we force the reset, disable the clock.

When the clock is turned on, we force the reset if not already set,
enable the clock, then only lift the reset if the "user" reset is
not asserted.

That being said, I think for the aspeed SoC, the argument could be made
that we don't actually need a reset driver. We yet have to encounter a
single device that needs to control it's own reset line for anything
other than enabling/disabling its clock/IP block.

So I suspect sticking to just a clock API that does the underlying
reset manipulations as needed is sufficient and we can "upgrade" to the
above proposal if it ends up being needed (which I doubt).

Cheers,
Ben.
