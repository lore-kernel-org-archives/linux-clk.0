Return-Path: <benh@kernel.crashing.org>
Message-ID: <1500412458.2865.121.camel@kernel.crashing.org>
Subject: Re: Coupled clk/reset
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Joel Stanley <joel@jms.id.au>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Ryan Chen
 <ryan_chen@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 19 Jul 2017 07:14:18 +1000
In-Reply-To: <1500386760.9510.9.camel@pengutronix.de>
References: 
	<CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
	 <1500386760.9510.9.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-07-18 at 16:06 +0200, Philipp Zabel wrote:
> If this is some special treatment for a single IP block, I'd just open
> code this in the driver:
>         reset_control_assert(rstc);
>         usleep_range(100, 200);
>         clk_prepare_enable(clk);
>         usleep_range(10000, 20000);
>         reset_control_deassert(rstc);
> 
> If this is a common pattern needed for multiple clocks, you could
> investigate hiding this in the clock driver and not export the resets to
> the 'engine' driver at all.

Right, it's a common pattern for all the IP blocks in that SoC. I agree
with your proposal, it would keep things simpler.

Cheers,
Ben.
