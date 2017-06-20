Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1497943298.2386.4.camel@pengutronix.de>
Subject: Re: [PATCH 3/3 v6] clk: Add Gemini SoC clock controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Janos Laube
 <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Hans Ulli Kroll
 <ulli.kroll@googlemail.com>,  Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 20 Jun 2017 09:21:38 +0200
In-Reply-To: <20170618215550.29216-3-linus.walleij@linaro.org>
References: <20170618215550.29216-1-linus.walleij@linaro.org>
	 <20170618215550.29216-3-linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Sun, 2017-06-18 at 23:55 +0200, Linus Walleij wrote:
> The Cortina Systems Gemini (SL3516/CS3516) has an on-chip clock
> controller that derive all clocks from a single crystal, using some
> documented and some undocumented PLLs, half dividers, counters and
> gates. This is a best attempt to construct a clock driver for the
> clocks so at least we can gate off unused hardware and driver the
> PCI bus clock.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Mike/Stephen: please merge this into the clk subsystem along
> with the <dt-bindings> patch once you're happy with it.
> 
> ChangeLog v5->v6:
> - Merge the Gemini reset controller code into the clock driver
>   so as to resolve the conflict about what device should be
>   probing from the system controller. The reset portions are
>   copy/pasted from the driver previously merged by Philipp
>   Zabel.

For the reset controller part,
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
