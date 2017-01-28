Return-Path: <linux@roeck-us.net>
Subject: Re: [PATCH] clk: add more managed APIs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
Date: Sat, 28 Jan 2017 13:44:35 -0800
MIME-Version: 1.0
In-Reply-To: <20170128192207.GA38136@dtor-ws>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 01/28/2017 11:22 AM, Dmitry Torokhov wrote:
> On Sat, Jan 28, 2017 at 07:03:10PM +0000, Russell King - ARM Linux wrote:
>> On Sat, Jan 28, 2017 at 10:40:47AM -0800, Dmitry Torokhov wrote:
>>> When converting a driver to managed resources it is desirable to be able to
>>> manage all resources in the same fashion. This change allows managing
>>> clocks in the same way we manage many other resources.
>>>
>>> This adds the following managed APIs:
>>>
>>> - devm_clk_prepare()/devm_clk_unprepare();
>>> - devm_clk_enable()/devm_clk_disable();
>>> - devm_clk_prepare_enable()/devm_clk_disable_unprepare().
>>
>> Does it make any sense what so ever to have devm_clk_enable() and
>> devm_clk_disable()?
>>
>> Take a moment to think about where you use all of these.  The devm_*
>> functions are there to be used in probe functions so that cleanup
>> paths can be streamlined and less erroneous.  They aren't for general
>> use throughout the driver.
>>
>> Given that, there are two operations that you may wish to do in the
>> probe path:
>>
>> 1. prepare a clock (avoiding the enable because you want to perform
>>    the enable elsewhere in the driver.)
>> 2. prepare and enable a clock
>>
>> So, does having devm_clk_enable() really make sense?  I don't think
>> it does, and I suspect they'll get very little if any use.  So, I
>> think best not add them until someone comes up with a good and
>> wide-spread use case.
>
> That makes sense.
>
> Guenter, I know you are a coccinelle wizard, can you cook a script that
> can find current users of clk_enable() in probe paths? Then we can make
> informed decision on devm_clk_enable.
>

Questionable use:
	drivers/input/keyboard/st-keyscan.c

clk_enable() in probe, clk_disable() in remove:
	drivers/i2c/busses/i2c-tegra.c
	drivers/media/platform/exynos4-is/fimc-core.c
	drivers/media/platform/exynos4-is/mipi-csis.c
	drivers/thermal/spear_thermal.c
	drivers/usb/musb/am35x.c
	drivers/usb/musb/davinci.c

This does not count drivers which call clk_enable() in probe, but disable
the clock at some point, and only re-enable it when needed.
	
Not that many. A quick browse suggests that clk_enable()/clk_disable()
is more commonly used to temporarily enable the clock while needed.

For clk_prepare(), I get 33 hits in drivers/.

patching file drivers/usb/gadget/udc/at91_udc.c
patching file drivers/i2c/busses/i2c-tegra.c
patching file drivers/pwm/pwm-spear.c
patching file drivers/pinctrl/spear/pinctrl-plgpio.c
patching file drivers/input/keyboard/samsung-keypad.c
patching file drivers/crypto/atmel-aes.c
patching file drivers/usb/gadget/udc/pxa27x_udc.c
patching file drivers/iommu/msm_iommu.c
patching file drivers/i2c/busses/i2c-rk3x.c
patching file drivers/tty/serial/pxa.c
patching file drivers/remoteproc/st_remoteproc.c
patching file drivers/pwm/pwm-tiehrpwm.c
patching file drivers/media/platform/mtk-vpu/mtk_vpu.c
patching file drivers/i2c/busses/i2c-meson.c
patching file drivers/crypto/ux500/hash/hash_core.c
patching file drivers/pwm/pwm-vt8500.c
patching file drivers/pwm/pwm-sti.c
patching file drivers/tty/serial/xilinx_uartps.c
patching file drivers/pwm/pwm-atmel.c
patching file drivers/phy/phy-dm816x-usb.c
patching file drivers/input/keyboard/spear-keyboard.c
patching file drivers/gpu/host1x/mipi.c
patching file drivers/crypto/ux500/cryp/cryp_core.c
patching file drivers/spi/spi-armada-3700.c
patching file drivers/pwm/pwm-mtk-disp.c
patching file drivers/nvmem/mxs-ocotp.c
patching file drivers/media/platform/s5p-g2d/g2d.c
patching file drivers/i2c/busses/i2c-sirf.c
patching file drivers/crypto/atmel-sha.c
patching file drivers/tty/serial/8250/8250_pxa.c
patching file drivers/thermal/samsung/exynos_tmu.c
patching file drivers/media/platform/sti/bdisp/bdisp-v4l2.c
patching file drivers/dma/s3c24xx-dma.c

Those drivers call clk_prepare() in the probe function. The list
may not be complete; my script currently only checks for clk_prepare()
in the probe function of platform, i2c, and spi drivers.

I quick glance through the generated diffs suggests that most
if not all of those call clk_prepare() in probe and clk_unprepare()
in remove.

For clk_prepare_enable() in probe functions, I get 288 hits in drivers/.
I didn't check those for validity - there are just too many. I did check
watchdog and input earlier, though. For those, almost all would be
candidates for devm_clk_prepare_enable().

Overall, I think we should have devm_clk_prepare() and most definitely
devm_clk_prepare_enable(). I am not that sure about clk_enable().

Thanks,
Guenter
