Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Oct 2015 17:03:47 -0700
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
Message-ID: <20151019234348.GE19782@codeaurora.org>
References: <1444410574-28677-1-git-send-email-yorksun@freescale.com>
 <20151010000948.GW26883@codeaurora.org>
 <562165C3.1090103@freescale.com>
 <20151016213139.GE16437@codeaurora.org>
 <56216E0D.4010709@freescale.com>
 <20151016230555.GE10182@codeaurora.org>
 <562553E4.30906@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <562553E4.30906@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/19, York Sun wrote:
> 
> 
> On 10/16/2015 04:05 PM, Stephen Boyd wrote:
> > On 10/16, York Sun wrote:
> >>
> >>
> >> On 10/16/2015 02:31 PM, Stephen Boyd wrote:
> >>> On 10/16, York Sun wrote:
> >>>>
> >>>>
> >>>> On 10/09/2015 05:09 PM, Stephen Boyd wrote:
> >>>>> On 10/09, York Sun wrote:
> >>>>>> +/*
> >>>>>> + * To support multiple si5338 chips, we cannot use devm_clk_get because
> >>>>>> + * each chip has its own clock sources. If device tree is not used,
> >>>>>> + * platform driver should provide these clocks. Let the clocks be freed
> >>>>>> + * automatically when device is unbound. We implement our own devm_of_clk_get.
> >>>>>> + */
> >>>>>> +static void devm_of_clk_release(struct device *dev, void *res)
> >>>>>> +{
> >>>>>> +	clk_put(*(struct clk **)res);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static struct clk *devm_of_clk_get(struct device *dev, struct device_node *np,
> >>>>>
> >>>>> What is this? I don't get it at all.
> >>>>
> >>>> Maybe you can help me on this.
> >>>> We have two ways to get parent clock. One is from device tree, the other is from
> >>>> platform data. When the clock is from platform data, the consumer gets the clock
> >>>> and passes it. The clock will be put by the consumer as well. When the parent
> >>>> clock comes from device tree, what I am trying to do is to call of_clk_get(),
> >>>> without worrying about to call clk_put() later when the driver is removed, so I
> >>>> don't have to know where the parent clock data came from.
> >>>>
> >>>
> >>> This driver should always use clk_get() then. If the mode is
> >>> device tree, clk_get() will lookup the clock in DT and get it
> >>> from there. If the mode is platform data, then we'll fallback to
> >>> the clkdev method of clk_get(), which will look for a clk_lookup
> >>> created for the device calling clk_get() + the connection id that
> >>> was provided by the lookup creator. This driver should always
> >>> call clk_put() on the clock when it's done with it, regardless of
> >>> DT vs. platform data.
> >>>
> >>
> >> For the platform data mode, I think it is up to the consumer to get and put the
> >> parent clocks. The current code is to pass (struct clk *) pointers as parent
> >> clocks. Are you suggesting to pass the name of parent clocks?
> >>
> > 
> > I'm suggesting to register clocks with clkdev using a device name
> > that matches the consumer. The consumer (this driver?) will
> > simply call clk_get() and clk_put() then, nothing else is needed.
> > I'm not suggesting to pass the names of the parent clocks. It
> > sounds like those are inputs to this device, so we should be
> > calling clk_get() with a device and a connection id to get the
> > clock.
> > 
> 
> Stephen,
> 
> I am still having difficulty to implement this. The platform device doesn't know
> the clock device id when probing the clock chip. For my case, the platform
> device is a PCIe device, with I2C controller on it. The clock chip is on the I2C
> bus. When the PCIe device is probed, it registers the parent clocks for si5338
> before calling i2c_new_probed_device(). At this moment, the si5338 doesn't have
> an instance yet. So the parent clock pointer(s) in platform data structure
> is/are passed.
> 
> I have another solution, let the platform data has clk pointer(s). The clock
> driver for si5338 will use device tree of_clk_get() if device tree is used, or
> take the pointer(s) from platform data. Upon driver removal, this driver call
> clk_put() regardless where the pointer(s) came from. The change will be in my
> platform device driver. It doesn't need to call clk_put again.
> 
> Would it be acceptable?

Sorry I'm a little lost. Where does the platform data come into
the picture? Is the i2c driver going to the parent device to get
the platform data?

If we have a way to pass data to the si5338 i2c device, then I
assume we have a way to get the device name of the i2c device. If
that's true, then we can create a clk lookup structure with
clkdev_create() in the place where we have the clock pointer and
use the dev_name() of the i2c device as the third argument to
that function.

BTW, the i2c device doesn't need to call of_clk_get(), it can
just call clk_get() and pass the device pointer and it will use
the DT path if there's a provider. Please don't use of_clk_get()
when a struct device is present.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
