Return-Path: <yorksun@freescale.com>
Subject: Re: What's the proper use of con_id in clkdev
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Stephen Boyd
	<sboyd@codeaurora.org>
References: <5612D4D0.30104@freescale.com>
 <20151006194430.GJ12338@codeaurora.org>
 <20151006195042.GZ21513@n2100.arm.linux.org.uk>
CC: Michael Turquette <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>
From: York Sun <yorksun@freescale.com>
Message-ID: <561426CB.8020708@freescale.com>
Date: Tue, 6 Oct 2015 12:53:47 -0700
MIME-Version: 1.0
In-Reply-To: <20151006195042.GZ21513@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="windows-1252"
Return-Path: yorksun@freescale.com
List-ID: <linux-clk.vger.kernel.org>

On 10/06/2015 12:50 PM, Russell King - ARM Linux wrote:
> On Tue, Oct 06, 2015 at 12:44:30PM -0700, Stephen Boyd wrote:
>> On 10/05, York Sun wrote:
>>> Michael and Stephen,
>>>
>>> Can you help me to understand "#define MAX_CON_ID 16" in clkdev.c? I am trying
>>> to use clk_get() to acquire the clock with its name. This fails when the clock
>>> name is more than 15 characters. I traced it to this macro.
>>>
>>> The reason of using clk_get() is I don't have device tree for my platform until
>>> device tree overlay is officially supported. So I use clkdev_add() in the clock
>>> driver.
>>>
>>> So my issue is with the MAX_CON_ID. Is there a reason to limit it to 16?
>>> Wouldn't it be better to use kstrdup() in vclkdev_alloc()?
>>>
>>
>> Mike and I are not the maintainers of clkdev. The maintainer of
>> clkdev is Russell King.
>>
>> I believe we can't use kstrdup() in vclkdev_alloc() because we
>> don't know if vclkdev_alloc() is called before the slab
>> allocators are up and running (this is why we have a
>> __clkdev_alloc() function). The simplest solution is to use
>> shorter names, can you do that?
> 
> Why does anyone need a _connection_ _id_ longer than 15 characters
> anyway?
> 
> It's not a system clock name - it's supposed to be a device _specific_
> clock _input_ name.  This statement comes from many years experience,
> where people have repeatedly passed clk_get(NULL, "global clock name")
> and eventually run into great problems, ending up having to pass clk
> connection names through platform data, or clk pointers through
> platform data.  Both are abhorrent.
> 
> Use the API as it was designed to be used: always use
> clk_get(device, "device-input-name") or clk_get_sys("device-name",
> "device-input-name") and not clk_get(NULL, "global-clock-name").
> 

Thanks to all for the guidance.

York
