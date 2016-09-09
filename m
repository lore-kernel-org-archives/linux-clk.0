Return-Path: <alexandre.belloni@free-electrons.com>
Date: Fri, 9 Sep 2016 12:52:39 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: at91: Add sama5d4 sckc support
Message-ID: <20160909105239.dbtaqrxigs6uaimu@piout.net>
References: <20160908145146.20422-1-alexandre.belloni@free-electrons.com>
 <20160908145146.20422-3-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160908145146.20422-3-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 08/09/2016 at 16:51:43 +0200, Alexandre Belloni wrote :
> +static void __init of_sama5d4_sckc_setup(struct device_node *np)
> +{
> +	void __iomem *regbase = of_iomap(np, 0);
> +	struct clk *clk = NULL;
> +	struct clk_sama5d4_slow_osc *osc;
> +	struct clk_init_data init;
> +	const char *xtal_name;
> +	const char *parent_names[2] = { "slow_rc_osc", "slow_osc" };
> +	bool bypass;
> +
> +	if (!regbase)
> +		return;
> +
> +	xtal_name = of_clk_get_parent_name(np, 0);
> +
> +	bypass = of_property_read_bool(np, "atmel,osc-bypass");
> +
> +	osc = kzalloc(sizeof(*osc), GFP_KERNEL);
> +	if (!osc)
> +		return;
> +
> +	init.name = parent_names[1];
> +	init.ops = &sama5d4_slow_osc_ops;
> +	init.parent_names = &xtal_name;
> +	init.num_parents = 1;
> +	init.flags = CLK_IGNORE_UNUSED;
> +
> +	osc->hw.init = &init;
> +	osc->sckcr = regbase;
> +	osc->startup_usec = 1200000;
> +
> +	if (bypass)
> +		writel((readl(regbase) | AT91_SCKC_OSC32BYP), regbase);
> +
> +	clk = clk_register(NULL, &osc->hw);
> +	if (IS_ERR(clk))
> +		kfree(osc);
> +
> +	clk = at91_clk_register_slow_rc_osc(regbase, parent_names[0], 32768,
> +					    250000000, 75);

That one could be a fixed clock as it is actually impossible to
enable/disable it on sama5d4/2.

I'll send an updated patch series (maybe after getting some feedback).

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
