Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <20170821173955.30b0f5a2@bbrezillon>
References: <1459368249-13241-23-git-send-email-boris.brezillon@free-electrons.com>
 <a5efa7d7-ceb5-e6b0-b2d1-2d79cd20265f@rock-chips.com> <20170804160701.4d9f404d@bbrezillon>
 <2250536.aM833QY2s7@phil> <CAD=FV=U=_sOyUipGnujWMnMn19Og87JYbbaKOza=0p5-5GpHog@mail.gmail.com>
 <20170821173955.30b0f5a2@bbrezillon>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Aug 2017 09:49:52 -0700
Message-ID: <CAD=FV=V6MvyO5XygsYCzDahG1C8ZX4+LuXebkhRuWPOzOx1RsQ@mail.gmail.com>
Subject: Re: [v5,22/46] pwm: rockchip: avoid glitches on already running PWMs
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Heiko Stuebner <heiko@sntech.de>, "David.Wu" <david.wu@rock-chips.com>,
	Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?6buE5rab?= <huangtao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>, =?UTF-8?B?5byg552b?= <zhangqing@rock-chips.com>,
	=?UTF-8?B?6K645YmR576k?= <jay.xu@rock-chips.com>,
	Brian Norris <briannorris@chromium.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Mon, Aug 21, 2017 at 8:39 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Doug,
>
> Sorry for the late reply.
>
> Le Fri, 4 Aug 2017 09:22:56 -0700,
> Doug Anderson <dianders@chromium.org> a =C3=A9crit :
>
>> Hi,
>>
>> On Fri, Aug 4, 2017 at 7:48 AM, Heiko Stuebner <heiko@sntech.de> wrote:
>> >> > We found a issue recently, if the pwm0 is not enabled at uboot and =
pwm2
>> >> > is enabled at uboot, the PWM clock will be disabled at pwm0's probe=
. It
>> >> > is true to close the pwm clock, and the pwm2 can't work during a wh=
ile,
>> >> > until the pwm2 probe, because the pwm0 and pwm2 are the same clock =
for
>> >> > their work. In fact, the pwm0 can not know the pwm2's status.
>> >> >
>> >> > So we need to get all the PWMs state in a public place where it's e=
arly
>> >> > than the PWM probe, if that's the way it is. Then keep the PWM clk
>> >> > enabled if theis is one PWM appears to be up and running. The place
>> >> > maybe in the clock core init, like adding pwm clock as critial one.
>> >> >
>> >> > Another way is that we don't enable pwm clock firstly at PWM probe,
>> >> > because whether or not the PWM state has been enabled in the Uboot,=
 like
>> >> > other modules, our chip default PWM clock registers are enabled at =
the
>> >> > beginning, read the PWM registers directly to know the PWM state. T=
hen
>> >> > if the PWM state is enabled, call the enable_clk(pc->clk) to add th=
e
>> >> > clock count=3D1. If the PWM state is disabled, we do nothing. After=
 all
>> >> > the PWMs are probed and all modules are probed, the clock core will=
 gate
>> >> > the PWM clock if the clock count is 0, and keep clk enabled if the =
clock
>> >> > count is not 0.
>> >> >
>> >> > How do you feel about it?
>> >>
>> >> Ouch. That's indeed hard to solve in a clean way. I may have
>> >> something to suggest but I'm not sure clk maintainers will like it: w=
hat
>> >> if we make clk_disable() and clk_unprepare() just decrement the refco=
unt
>> >> before the disable-unused-clks procedure has been executed (see
>> >> proposed patch below)? This way all clks that have been enabled by th=
e
>> >> bootloader will stay in such state until all drivers have had a chanc=
e
>> >> to retain them (IOW, call clk_prepare()+clk_enable()).
>> >>
>> >> BTW, I think the problem you're describing here is not unique to PWM
>> >> devices, it's just that now, some PWM drivers are smart and try to ke=
ep
>> >> clks enabled to prevent glitches.
>> >
>> > Actually, Mike had patches that introduced so called "handoff" clocks =
[0].
>> > Clocks that were handled as critical until some driver picked them up.
>> >
>> > It's not exactly the same as your change and still would require
>> > intervention from clock-drivers to mark clocks in such a way.
>>
>> Right.  As you're saying handoff isn't enough because in this case a
>> driver _has_ picked up the clock.  The whole issue is that it's a
>> shared clock between the 4 PLLs.  One driver already claimed the
>> clock, enabled it, and disabled it.  Really something would need to
>> know that another driver in the future might want to also pick up the
>> clock.
>>
>>
>> > So I really also like your approach, as it would make clock wiggling
>> > during early boot safe for everyone involved :-) .
>> >
>> > And both seem to cater to slightly different use-cases as well.
>>
>> One worry I have about not truly disabling any clocks at boot time is
>> that it could break someone who relies on a clock being disabled.  I'm
>> not 100% sure that any of these would really affect someone, but...
>>
>> ...there is one example case I know of where you absolutely need a
>> clock to stop on command (AKA it wouldn't be OK to defer till late
>> init).  That case is for SD Card Tuning.  When you're doing a voltage
>> switch the actual transition is keyed off the card clock stopping.
>> That would break if there was a situation where clk_disable() didn't
>> actually do what it was supposed to.  This is a bit of a contrived
>> case and probably isn't 100% relevant (I think dw_mmc, for instance,
>> stops the card clock directly through the dw_mmc IP block and it's
>> invisible to the common clock framework), but it illustrates the point
>> that there could plausibly be cases where deferring a clk_disable()
>> might be unwise.
>
> Right, I didn't consider this use case, but some drivers might rely on
> the fact that clk_disable() disables the clk right away instead of
> deferring it.
>
>>
>> I suppose, though, that it would be possible to distinguish those two
>> cases via a 2nd API call.  AKA:
>>
>> clk_disable() -- disable the clock eventually
>> clk_disable_sync() -- disable the clock but don't defer.  Still won't
>> actually disable if someone else explicitly holds a reference.
>
> Actually, I'd recommend keeping the existing behavior for clk_disable()
> and adding a new function called clk_disable_async() (or
> clk_disable_deferrable()). This way we do not break existing users that
> rely on clk_disable() synchronicity and force users that actually allow
> deferring clk gating to explicitly state it.

Yeah, there's a tradeoff.  Your solution is definitely safer and
causes less short term churn.  ...but it's at the expense of some
inconsistency between various similar APIs (some APIs the "default" is
sync and some the "default" is async).  Although I guess if there's
one consistent thing about the kernel APIs it's that they're
inconsistent.  :-P

Is anyone volunteering to do this?  Do we want anyone with actual
"approval" authority to chime in?

-Doug
