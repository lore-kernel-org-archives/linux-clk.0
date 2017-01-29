Return-Path: <linux@roeck-us.net>
Subject: Re: [PATCH] clk: add more managed APIs
To: Russell King - ARM Linux <linux@armlinux.org.uk>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <71ad5742-6264-6864-69f9-288609617340@roeck-us.net>
Date: Sun, 29 Jan 2017 08:00:20 -0800
MIME-Version: 1.0
In-Reply-To: <20170128233911.GO27312@n2100.armlinux.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 01/28/2017 03:39 PM, Russell King - ARM Linux wrote:
> On Sat, Jan 28, 2017 at 01:44:35PM -0800, Guenter Roeck wrote:
>> On 01/28/2017 11:22 AM, Dmitry Torokhov wrote:
>>> Guenter, I know you are a coccinelle wizard, can you cook a script that
>>> can find current users of clk_enable() in probe paths? Then we can make
>>> informed decision on devm_clk_enable.
>>>
>>
>> Questionable use:
>> 	drivers/input/keyboard/st-keyscan.c
>
> clk_enable() without preceding clk_prepare() - buggy.
>
>>
>> clk_enable() in probe, clk_disable() in remove:
>> 	drivers/i2c/busses/i2c-tegra.c
>
> Could be converted to use clk_prepare_enable() or clk_prepare()
> depending on i2c_dev->is_multimaster_mode in the initialisation
> path (and their devm_* equivalents.)
>
>> 	drivers/media/platform/exynos4-is/fimc-core.c
>> 	drivers/media/platform/exynos4-is/mipi-csis.c
>
> Looks like it does a sequence of:
>
> 	devm_clk_get()
> 	clk_prepare()
> 	clk_set_rate()
> 	clk_enable()
>
> which seems a little wrong - clk_set_rate() should be before
> clk_prepare() if you care about not having the clock output.  Remember
> that clk_prepare() _may_ result in the clock output being enabled.  So
> these two look buggy, and when fixed could use devm_clk_prepare_enable().
>
>> 	drivers/thermal/spear_thermal.c
>
> clk_enable() without a preceding clk_prepare().  Buggy driver.
>
>> 	drivers/usb/musb/am35x.c
>
> Ditto.
>
>> 	drivers/usb/musb/davinci.c
>
> Ditto.
>
>> Not that many. A quick browse suggests that clk_enable()/clk_disable()
>> is more commonly used to temporarily enable the clock while needed.
>
> So out of all those, there's probably only _one_ which is legit - the
> rest are all technically buggy.
>
> Given that, I'd say there's real reason _not_ to provide devm_clk_enable()
> to persuade people to use the correct interfaces in the probe path.
>

I tend to agree, after looking into its existing use.

Do we have agreement on the other two ? I would like to see those in the
next release so we can start using them.

Thanks,
Guenter
