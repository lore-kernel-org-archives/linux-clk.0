Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <2250536.aM833QY2s7@phil>
References: <1459368249-13241-23-git-send-email-boris.brezillon@free-electrons.com>
 <a5efa7d7-ceb5-e6b0-b2d1-2d79cd20265f@rock-chips.com> <20170804160701.4d9f404d@bbrezillon>
 <2250536.aM833QY2s7@phil>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Aug 2017 09:22:56 -0700
Message-ID: <CAD=FV=U=_sOyUipGnujWMnMn19Og87JYbbaKOza=0p5-5GpHog@mail.gmail.com>
Subject: Re: [v5,22/46] pwm: rockchip: avoid glitches on already running PWMs
To: Heiko Stuebner <heiko@sntech.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	"David.Wu" <david.wu@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?B?6buE5rab?= <huangtao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>, =?UTF-8?B?5byg552b?= <zhangqing@rock-chips.com>,
	=?UTF-8?B?6K645YmR576k?= <jay.xu@rock-chips.com>,
	Brian Norris <briannorris@chromium.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Fri, Aug 4, 2017 at 7:48 AM, Heiko Stuebner <heiko@sntech.de> wrote:
>> > We found a issue recently, if the pwm0 is not enabled at uboot and pwm2
>> > is enabled at uboot, the PWM clock will be disabled at pwm0's probe. It
>> > is true to close the pwm clock, and the pwm2 can't work during a while,
>> > until the pwm2 probe, because the pwm0 and pwm2 are the same clock for
>> > their work. In fact, the pwm0 can not know the pwm2's status.
>> >
>> > So we need to get all the PWMs state in a public place where it's early
>> > than the PWM probe, if that's the way it is. Then keep the PWM clk
>> > enabled if theis is one PWM appears to be up and running. The place
>> > maybe in the clock core init, like adding pwm clock as critial one.
>> >
>> > Another way is that we don't enable pwm clock firstly at PWM probe,
>> > because whether or not the PWM state has been enabled in the Uboot, like
>> > other modules, our chip default PWM clock registers are enabled at the
>> > beginning, read the PWM registers directly to know the PWM state. Then
>> > if the PWM state is enabled, call the enable_clk(pc->clk) to add the
>> > clock count=1. If the PWM state is disabled, we do nothing. After all
>> > the PWMs are probed and all modules are probed, the clock core will gate
>> > the PWM clock if the clock count is 0, and keep clk enabled if the clock
>> > count is not 0.
>> >
>> > How do you feel about it?
>>
>> Ouch. That's indeed hard to solve in a clean way. I may have
>> something to suggest but I'm not sure clk maintainers will like it: what
>> if we make clk_disable() and clk_unprepare() just decrement the refcount
>> before the disable-unused-clks procedure has been executed (see
>> proposed patch below)? This way all clks that have been enabled by the
>> bootloader will stay in such state until all drivers have had a chance
>> to retain them (IOW, call clk_prepare()+clk_enable()).
>>
>> BTW, I think the problem you're describing here is not unique to PWM
>> devices, it's just that now, some PWM drivers are smart and try to keep
>> clks enabled to prevent glitches.
>
> Actually, Mike had patches that introduced so called "handoff" clocks [0].
> Clocks that were handled as critical until some driver picked them up.
>
> It's not exactly the same as your change and still would require
> intervention from clock-drivers to mark clocks in such a way.

Right.  As you're saying handoff isn't enough because in this case a
driver _has_ picked up the clock.  The whole issue is that it's a
shared clock between the 4 PLLs.  One driver already claimed the
clock, enabled it, and disabled it.  Really something would need to
know that another driver in the future might want to also pick up the
clock.


> So I really also like your approach, as it would make clock wiggling
> during early boot safe for everyone involved :-) .
>
> And both seem to cater to slightly different use-cases as well.

One worry I have about not truly disabling any clocks at boot time is
that it could break someone who relies on a clock being disabled.  I'm
not 100% sure that any of these would really affect someone, but...

...there is one example case I know of where you absolutely need a
clock to stop on command (AKA it wouldn't be OK to defer till late
init).  That case is for SD Card Tuning.  When you're doing a voltage
switch the actual transition is keyed off the card clock stopping.
That would break if there was a situation where clk_disable() didn't
actually do what it was supposed to.  This is a bit of a contrived
case and probably isn't 100% relevant (I think dw_mmc, for instance,
stops the card clock directly through the dw_mmc IP block and it's
invisible to the common clock framework), but it illustrates the point
that there could plausibly be cases where deferring a clk_disable()
might be unwise.

I suppose, though, that it would be possible to distinguish those two
cases via a 2nd API call.  AKA:

clk_disable() -- disable the clock eventually
clk_disable_sync() -- disable the clock but don't defer.  Still won't
actually disable if someone else explicitly holds a reference.

---

If changing the API is bad, another thought for trying to solve this
problem is that PWM regulators already need to be handled by special
case SoC-specific code in a few different places (though, admittedly,
much of this is firmware code) .  Thus, maybe a not-too-ugly solution
is to treat PWM as special case:

In the Rockchip SoC clock driver, do a clk_get() of the PWM clock at
early init time.
In the Rockchip SoC clock driver, register to be notified for late
initcall and do a clk_put() of the PWM clock

The above acknowledges that:

* The PWM clock is a bit special because it might be used by PWM
regulators, thus it's very important not to glitch it at boot.

* It's OK for the PWM clock to be on even if clients say it should be
disabled (since there are 4 PWMs sharing this single clock this seems
like a pretty safe bet).

---

One last thought I had that everyone will probably hate (I kinda
dislike it myself): you could introduce 4 "fake" PWM child clocks are
just "divide by 1" clocks (aka they are no-ops).  Thus:

At pwm0 probe, we'll

* enable the fake pwm0 clock, which will pass the enable up to the
real pwm0 clock (which is already on).

* disable the fake pwm0 clock, which will pass the disable up.  Oops.
...but maybe this is an easier problem to solve?  ...maybe we can say
that parent clocks are special and we can defer this disable until
late init.  AKA: an explicit clk_enable() / clk_disable() still
disables a clock but an enable/disable just because your child got
enabled/disabled can be deferred.

Like I said, this is probably too confusing and a bad idea...


-Doug
