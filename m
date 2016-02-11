Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Thu, 11 Feb 2016 09:09:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Russell King <linux@arm.linux.org.uk>
Subject: Re: [PATCH 01/14] mfd: intel_quark_i2c_gpio: Use clkdev_create()
Message-ID: <20160211090946.GY3782@x1>
References: <1454982341-22715-1-git-send-email-sboyd@codeaurora.org>
 <1454982341-22715-2-git-send-email-sboyd@codeaurora.org>
 <20160210162349.GJ3782@x1>
 <20160210183504.GG30978@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20160210183504.GG30978@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, 10 Feb 2016, Stephen Boyd wrote:

> On 02/10, Lee Jones wrote:
> > On Mon, 08 Feb 2016, Stephen Boyd wrote:
> > 
> > > Convert this driver to use clkdev_create() instead of
> > > clk_register_clkdevs(). The latter API is only used by this driver,
> > > although this driver only allocates one clk to add anyway.
> > > Furthermore, this driver allocates the clk_lookup structure with
> > > devm, but clkdev_drop() will free that structure when passed,
> > > leading to a double free when this driver is removed. Clean it
> > > all up and pave the way for the removal of clk_register_clkdevs().
> > > 
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Russell King <linux@arm.linux.org.uk>
> > > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > > ---
> > >  drivers/mfd/intel_quark_i2c_gpio.c | 26 +++++++++-----------------
> > >  1 file changed, 9 insertions(+), 17 deletions(-)
> > 
> > I never much liked this code [0]
> > 
> > Glad for it to be simplified.
> > 
> > Applied, thanks.
> > 
> 
> Can you please ack the patch instead? I'd like to take it through
> the clk tree so that I can remove clk_register_clkdevs() as well.

I'll make a branch you can pull from.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
