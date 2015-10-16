Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Oct 2015 14:31:39 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: York Sun <yorksun@freescale.com>
Cc: linux-clk@vger.kernel.org, pmarrecas@outlook.com,
	Mike Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andrey Filippov <andrey@elphel.com>,
	Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [Resend Patch v6] driver/clk/clk-si5338: Add common clock
 framework driver for si5338
Message-ID: <20151016213139.GE16437@codeaurora.org>
References: <1444410574-28677-1-git-send-email-yorksun@freescale.com>
 <20151010000948.GW26883@codeaurora.org>
 <562165C3.1090103@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <562165C3.1090103@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/16, York Sun wrote:
> 
> 
> On 10/09/2015 05:09 PM, Stephen Boyd wrote:
> > On 10/09, York Sun wrote:
> >> +/*
> >> + * To support multiple si5338 chips, we cannot use devm_clk_get because
> >> + * each chip has its own clock sources. If device tree is not used,
> >> + * platform driver should provide these clocks. Let the clocks be freed
> >> + * automatically when device is unbound. We implement our own devm_of_clk_get.
> >> + */
> >> +static void devm_of_clk_release(struct device *dev, void *res)
> >> +{
> >> +	clk_put(*(struct clk **)res);
> >> +}
> >> +
> >> +static struct clk *devm_of_clk_get(struct device *dev, struct device_node *np,
> > 
> > What is this? I don't get it at all.
> 
> Maybe you can help me on this.
> We have two ways to get parent clock. One is from device tree, the other is from
> platform data. When the clock is from platform data, the consumer gets the clock
> and passes it. The clock will be put by the consumer as well. When the parent
> clock comes from device tree, what I am trying to do is to call of_clk_get(),
> without worrying about to call clk_put() later when the driver is removed, so I
> don't have to know where the parent clock data came from.
> 

This driver should always use clk_get() then. If the mode is
device tree, clk_get() will lookup the clock in DT and get it
from there. If the mode is platform data, then we'll fallback to
the clkdev method of clk_get(), which will look for a clk_lookup
created for the device calling clk_get() + the connection id that
was provided by the lookup creator. This driver should always
call clk_put() on the clock when it's done with it, regardless of
DT vs. platform data.

> >> +	/*
> >> +	 * Important: Go through the procedure to check PLL locking
> >> +	 * and other steps required by si5338 reference manual.
> >> +	 */
> >> +	ret = post_init(drvdata);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	dev_dbg(&client->dev, "%s clocks are registered\n", id->name);
> >> +
> >> +#ifdef CONFIG_OF
> > 
> > Remove this ifdef
> 
> So we always use OF?

No, the function is stubbed out if CONFIG_OF=n so there's no
point to the ifdef. The compiler will optimize away the dead
code.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
