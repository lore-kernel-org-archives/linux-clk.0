Return-Path: <info@lategoodbye.de>
Subject: Re: [PATCH v2 0/3] Add PWM clock support for bcm2835
To: Remi Pommarel <repk@triplefau.lt>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
 <565A13F7.3020905@lategoodbye.de> <20151129003121.GH491@cruxbox>
Cc: Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>,
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bart Tanghe <bart.tanghe@thomasmore.be>
From: Stefan Wahren <info@lategoodbye.de>
Message-ID: <565B6CA0.2070702@lategoodbye.de>
Date: Sun, 29 Nov 2015 22:22:40 +0100
MIME-Version: 1.0
In-Reply-To: <20151129003121.GH491@cruxbox>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Remi,

Am 29.11.2015 um 01:31 schrieb Remi Pommarel:
> Hi Stefan,
>
> On Sat, Nov 28, 2015 at 09:52:07PM +0100, Stefan Wahren wrote:
>> i applied the series including the devicetree modification, but it
>> doesn't work for me.
>>
>> First of all i get an ugly division by zero warning from the pwm
>> driver. The pwm driver still assume a fixed clock and doesn't handle
>> the error cases of clk_get_rate(). I attached a patch at the end.
>
> Yes the devicetree patch from patchset version one does not work with
> this version.

thanks. I successfully tested the pwm with the led pwm driver.

> I haven't sent the modified devicetree because Eric said
> it is better to send it in a separate patchset. If you want to test it I
> attached the working devicetree patch at the end.

I don't think that he said that. He wanted you to send the devicetree 
changes as a separate patch. So it should be okay if it's part of the 
same patchset.

>
> But, yes, that would be nice if pwm driver was protected from this
> division by zero.

I will create a proper patch.

>
>>
>> The reason in my case why clk_get_rate() returns zero is that the
>> pwm clock is orphan ( pwm is listed under
>> /sys/kernel/debug/clk_orphan_summary ).
>>
>> My suspicion is it has something to do with the clock manager driver.
>> The bcm2835_clock_per_parents contains only 8 entries. But according to
>> BCM2835-ARM-Peripherals.pdf [1] CM_GP0CTL SRC page 107 has 16
>> entries. The upper 8 entries are all mapped to GND. It looks to me
>> that the driver doesn't take care of this and so the pwm clock isn't
>> able to determine it's parent.
>>
>
> In fact, default parent for pwm after boot up is GND (CM_GP0CTL SRC ==
> 0). Which means that the default pwm clock rate is 0. The clock appears
> to be orphan because in the bcm2835 clock driver, the GND clock is not
> registered.

Thanks for the explanation.

Best regards
Stefan

>
> So, IMHO, we have to set the default pwm rate from the devicetree, using
> assigned-clock-rates. That what does the following dts patch.
>
> This patch also set the gpio pin 18 to proper alternate function in order
> to be able to get pwm output from this gpio.
>
> Thanks
>
