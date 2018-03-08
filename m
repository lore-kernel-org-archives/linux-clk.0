Return-Path: <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>,
 linux-clk@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: Don't show the incorrect clock phase
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <1520495643-164458-1-git-send-email-shawn.lin@rock-chips.com>
 <1520503497.4264.12.camel@baylibre.com>
 <290e041d-7b53-9e62-92ce-33651ecb8a2f@rock-chips.com>
 <1520509048.4264.26.camel@baylibre.com>
 <1520509190.4264.28.camel@baylibre.com>
 <ceb696cb-9961-00c0-20ef-324c590fb0ed@rock-chips.com>
 <1520510633.4264.42.camel@baylibre.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <9a48303e-40c2-ef8e-488c-c23af05b87e6@rock-chips.com>
Date: Thu, 8 Mar 2018 20:11:58 +0800
MIME-Version: 1.0
In-Reply-To: <1520510633.4264.42.camel@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 2018/3/8 20:03, Jerome Brunet wrote:
> On Thu, 2018-03-08 at 19:46 +0800, Shawn Lin wrote:
>>>>> Good point!
>>>>>
>>>>> (1)So either we should update phase once its rate is updated, for
>>>>> instance, doing it in clk_change_rate, or
>>>>
>>>> I don't think this would be a good option. The phase depending on the rate is
>>>> just one example. I'm pretty sure one could come up with another example
>>>>
>>>>>
>>>>> (2)we should always try to get the actual phase here.
>>>>
>>>> If the callback is available, lets use it. I prefer this second option
>>>>
>>
>> okay.
>>
>>>>>
>>>>> If we do anyway call ->get_phase, we should never need core->phase since
>>>>> it doesn't reflect the actual phase maybe.
>>>>
>>>> The cached value is used by debugfs so it is still a valuable information. I
>>>> would keep it around for now.
>>>
>>> Oh ! and let's not forget that a clock driver is allowed to implement
>>> set_phase() w/o implementing get_phase() ... so you definitively want to keep
>>> the cached value around
>>>
>>
>> Yes, it's a little complicated. I just thought a case that, if the
>> driver need a fixed phase i.e. by call clk_set_phase(180), but the clk's
>> phase depends on the clk rate. So if the clk rate changed, the phase is
>> changed as well. This isn't good to the IP should sample the data based
>> on the phase shift but never get notified that the phase is changed.
> 
> I suppose this use case comes from the mmc (most phase users are mmc drivers) ?

Right.

> 
> The fact that you would want ,for your use case, to lock the phase whatever the
> rate changes seems like a choice. It makes sense for sure, but maybe not all
> driver would want to enforce that. I'm not sure we should bake that in the
> framework itself.
> 
> For such case, a solution could be to use clock notifiers to call
> clk_set_phase() on rate change,
> 
> OR
> 
> in the clock driver set_rate() callback, cache the phase at the beginning and
> call set_phase() again before returning.
> 
> Anyway, let's keep it simple for now and report the phase correctly. We can
> still deal these particular situations with some other patches.

Okay, I will update v2 based on your suggestion unless there are any
objections. But for sure, I will think more about these and check out
how to make this particular case works.

Thanks for your comment!

> 
> 
> 
> 
