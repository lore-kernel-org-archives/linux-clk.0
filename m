Return-Path: <andrew@lunn.ch>
Date: Fri, 27 Nov 2015 21:10:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Gregory Clement <gregory.clement@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/3] clk: add Dove PLL divider support for GPU, VMeta and
 AXI clocks
Message-ID: <20151127201008.GD14645@lunn.ch>
References: <E1a24wo-0004j2-Vd@rmk-PC.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E1a24wo-0004j2-Vd@rmk-PC.arm.linux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

Hi Russell

> +static int dove_calc_divider(const struct dove_clk *dc, unsigned long rate,
> +			     unsigned long parent_rate, bool set)
> +{
> +	unsigned int divider, max;
> +
> +	divider = DIV_ROUND_CLOSEST(parent_rate, rate);
> +
> +	if (dc->divider_table) {
> +		unsigned int i;
> +
> +		for (i = 0; dc->divider_table[i]; i++)
> +			if (divider == dc->divider_table[i]) {
> +				divider = i;
> +				break;
> +			}
> +
> +		if (dc->divider_table[i])
> +			return -EINVAL;

Is this condition correct? If we have reached the 0 at the end of the
table, -EINVAL makes sense. But that would need a !

       Andrew
