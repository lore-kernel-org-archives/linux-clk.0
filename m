Return-Path: <pdeschrijver@nvidia.com>
Date: Wed, 19 Jul 2017 11:10:26 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Joel Stanley <joel@jms.id.au>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr
	<jk@ozlabs.org>
Subject: Re: Coupled clk/reset
Message-ID: <20170719081026.GE1002@tbergstrom-lnx.Nvidia.com>
References: <CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 18, 2017 at 07:53:09PM +0930, Joel Stanley wrote:
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

This is a pretty standard sequence. The reset is synchronous, so the module
clock needs to be running for the reset toggling to take effect. And it takes
some time for the reset propagate through all the logic, hence the second
delay, although 10ms seems large to me.

Peter.
