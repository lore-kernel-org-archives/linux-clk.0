Return-Path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1500412458.2865.121.camel@kernel.crashing.org>
References: <CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
 <1500386760.9510.9.camel@pengutronix.de> <1500412458.2865.121.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 12:38:16 +0930
Message-ID: <CACPK8XckGZanBQ4ZwrWyEv05ho8jdZ2hZMH5pP0Zv2a9tcGJjw@mail.gmail.com>
Subject: Re: Coupled clk/reset
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Ryan Chen <ryan_chen@aspeedtech.com>, Linus Walleij <linus.walleij@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jul 19, 2017 at 6:44 AM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Tue, 2017-07-18 at 16:06 +0200, Philipp Zabel wrote:
>> If this is some special treatment for a single IP block, I'd just open
>> code this in the driver:
>>         reset_control_assert(rstc);
>>         usleep_range(100, 200);
>>         clk_prepare_enable(clk);
>>         usleep_range(10000, 20000);
>>         reset_control_deassert(rstc);
>>
>> If this is a common pattern needed for multiple clocks, you could
>> investigate hiding this in the clock driver and not export the resets to
>> the 'engine' driver at all.
>
> Right, it's a common pattern for all the IP blocks in that SoC. I agree
> with your proposal, it would keep things simpler.

Thanks Philipp and Ben. I'll go ahead with a clock driver that does
the right things, and drop the reset controller parts.

Cheers,

Joel
