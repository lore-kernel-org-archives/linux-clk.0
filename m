Return-Path: <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, shawn.lin@rock-chips.com,
 linux-clk@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: Don't show the incorrect clock phase
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <1520495643-164458-1-git-send-email-shawn.lin@rock-chips.com>
 <1520503497.4264.12.camel@baylibre.com>
 <290e041d-7b53-9e62-92ce-33651ecb8a2f@rock-chips.com>
 <1520509048.4264.26.camel@baylibre.com>
 <1520509190.4264.28.camel@baylibre.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <ceb696cb-9961-00c0-20ef-324c590fb0ed@rock-chips.com>
Date: Thu, 8 Mar 2018 19:46:46 +0800
MIME-Version: 1.0
In-Reply-To: <1520509190.4264.28.camel@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 2018/3/8 19:39, Jerome Brunet wrote:
> On Thu, 2018-03-08 at 12:37 +0100, Jerome Brunet wrote:
>> On Thu, 2018-03-08 at 19:28 +0800, Shawn Lin wrote:
>>>>> +    if (core->phase < 0 && core->ops->get_phase)
>>>>
>>>> Why bother with core->phase < 0 ?
>>>> if core->ops->get_phase is available, why not call it anyway ?
>>>>
>>>> The phase may have changed since it was cached.
>>>>
>>>> A typical example would be phases based on adding fixed delays:
>>>>
>>>> * Take a 200MHz clock and set phase to 180 => a 2.5ns delay is set
>>>> * Clock rate change to 100MHz but delay is still 2.5ns
>>>>      -> cached phase = 180
>>>>      -> actual phase = 90
>>>
>>> Good point!
>>>
>>> (1)So either we should update phase once its rate is updated, for
>>> instance, doing it in clk_change_rate, or
>>
>> I don't think this would be a good option. The phase depending on the rate is
>> just one example. I'm pretty sure one could come up with another example
>>
>>>
>>> (2)we should always try to get the actual phase here.
>>
>> If the callback is available, lets use it. I prefer this second option
>>

okay.

>>>
>>> If we do anyway call ->get_phase, we should never need core->phase since
>>> it doesn't reflect the actual phase maybe.
>>
>> The cached value is used by debugfs so it is still a valuable information. I
>> would keep it around for now.
> 
> Oh ! and let's not forget that a clock driver is allowed to implement
> set_phase() w/o implementing get_phase() ... so you definitively want to keep
> the cached value around
> 

Yes, it's a little complicated. I just thought a case that, if the
driver need a fixed phase i.e. by call clk_set_phase(180), but the clk's
phase depends on the clk rate. So if the clk rate changed, the phase is 
changed as well. This isn't good to the IP should sample the data based
on the phase shift but never get notified that the phase is changed.


>>
>>>
>>> Am I right? If yes, which option is more reasonable?
>>
>>
> 
> 
> 
> 
