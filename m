Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH 0/3] clk: ti: add CLK_SET_RATE_PARENT support for clkctrl
To: Tony Lindgren <tony@atomide.com>
CC: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-omap@vger.kernel.org>, <jsarha@ti.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
 <20180226220520.GI16043@atomide.com>
 <e036e793-37f5-a6ee-4347-72d27579e278@ti.com>
 <20180227164142.GA5448@atomide.com> <20180227164813.GB5448@atomide.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <98bf01ee-f6e0-67e4-f8cc-cec4e5d37f31@ti.com>
Date: Wed, 28 Feb 2018 07:37:56 +0200
MIME-Version: 1.0
In-Reply-To: <20180227164813.GB5448@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 27/02/18 18:48, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [180227 16:43]:
>> * Tero Kristo <t-kristo@ti.com> [180227 06:35]:
>>> On 27/02/18 00:05, Tony Lindgren wrote:
>>>> Hmm so should we have all the timers use bit 0 in the dtsi?
>>>> Or default to bit 24 for all of them?
>>>
>>> Who is going to control the clkctrl clock for the timers if you just control
>>> the opt clock? Also, ain't the bit 24 the clksel mux setting? Tweaking that
>>> would seem wrong...
>>
>> Yeah OK.
> 
> $ git grep TIMER arch/arm/boot/dts/* | grep CLKCTRL
> 
> And that shows timer1 using bit 24 for omap4, omap5 and dra7
> dtsi files.
> 
> So shouldn't that then be just bit 0 instead of bit 24 for
> those? And then we let omap_dm_timer_init_one() reparent it?

Actually, that fck setting is because of this patch:

138f7ca78f5a0677f591fdf23d0309c2f4774bf7
ARM: OMAP2+: timer: add support for fetching fck handle from DT

So, you need to provide the clock handle at bit offset 24.

The main clkctrl clock is still handled via hwmod core, or via the 
interconnect driver.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
