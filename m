Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1500386760.9510.9.camel@pengutronix.de>
Subject: Re: Coupled clk/reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Joel Stanley <joel@jms.id.au>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Ryan Chen
 <ryan_chen@aspeedtech.com>, Linus Walleij <linus.walleij@linaro.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andrew Jeffery
 <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 18 Jul 2017 16:06:00 +0200
In-Reply-To: <CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
References: 
	<CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Joel,

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
>  1. Enable engine reset
>  2. Delay 100us
>  3. Enable clock
>  4. Delay 10ms
>  5. Disable engine reset
>
> How does this dance fit into the reset/clock framework? I need to show
> that there is this dependency when enabling a clock.

If this is some special treatment for a single IP block, I'd just open
code this in the driver:
	reset_control_assert(rstc);
	usleep_range(100, 200);
	clk_prepare_enable(clk);
	usleep_range(10000, 20000);
	reset_control_deassert(rstc);

If this is a common pattern needed for multiple clocks, you could
investigate hiding this in the clock driver and not export the resets to
the 'engine' driver at all.

regards
Philipp
