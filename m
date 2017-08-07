Return-Path: <zhangqing@rock-chips.com>
Message-ID: <59881A27.5020701@rock-chips.com>
Date: Mon, 07 Aug 2017 15:43:35 +0800
From: Elaine Zhang <zhangqing@rock-chips.com>
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "David.Wu" <david.wu@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?B?J+m7hOa2myc=?= <huangtao@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 =?UTF-8?B?6K645YmR576k?= <jay.xu@rock-chips.com>,
 Doug Anderson <dianders@chromium.org>,
 Brian Norris <briannorris@chromium.org>,
 linux-rockchip@lists.infradead.org,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [v5,22/46] pwm: rockchip: avoid glitches on already running PWMs
References: <1459368249-13241-23-git-send-email-boris.brezillon@free-electrons.com> <a5efa7d7-ceb5-e6b0-b2d1-2d79cd20265f@rock-chips.com> <20170804160701.4d9f404d@bbrezillon> <2250536.aM833QY2s7@phil>
In-Reply-To: <2250536.aM833QY2s7@phil>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 08/04/2017 10:48 PM, Heiko Stuebner wrote:
> Hi,
>
> Am Freitag, 4. August 2017, 16:07:01 CEST schrieb Boris Brezillon:
>> +Stephen, Mike and the linux-clk ML.
>>
>> On Fri, 4 Aug 2017 20:45:04 +0800
>> "David.Wu" <david.wu@rock-chips.com> wrote:
>>
>>> Hi Boris & Heiko,
>>>
>>> 在 2016/3/31 4:03, Boris BREZILLON 写道:
>>>> +	/* Keep the PWM clk enabled if the PWM appears to be up and running. */
>>>> +	pwm_get_state(pc->chip.pwms, &pstate);
>>>> +	if (!pstate.enabled)
>>>> +		clk_disable(pc->clk);
>>>
>>> We found a issue recently, if the pwm0 is not enabled at uboot and pwm2
>>> is enabled at uboot, the PWM clock will be disabled at pwm0's probe. It
>>> is true to close the pwm clock, and the pwm2 can't work during a while,
>>> until the pwm2 probe, because the pwm0 and pwm2 are the same clock for
>>> their work. In fact, the pwm0 can not know the pwm2's status.
>>>
>>> So we need to get all the PWMs state in a public place where it's early
>>> than the PWM probe, if that's the way it is. Then keep the PWM clk
>>> enabled if theis is one PWM appears to be up and running. The place
>>> maybe in the clock core init, like adding pwm clock as critial one.
>>>
>>> Another way is that we don't enable pwm clock firstly at PWM probe,
>>> because whether or not the PWM state has been enabled in the Uboot, like
>>> other modules, our chip default PWM clock registers are enabled at the
>>> beginning, read the PWM registers directly to know the PWM state. Then
>>> if the PWM state is enabled, call the enable_clk(pc->clk) to add the
>>> clock count=1. If the PWM state is disabled, we do nothing. After all
>>> the PWMs are probed and all modules are probed, the clock core will gate
>>> the PWM clock if the clock count is 0, and keep clk enabled if the clock
>>> count is not 0.
>>>
>>> How do you feel about it?
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
>
> So I really also like your approach, as it would make clock wiggling
> during early boot safe for everyone involved :-) .
>
> And both seem to cater to slightly different use-cases as well.
>
>
> Heiko
>
> [0] https://lwn.net/Articles/675658/

Boris patch is better.
If use the CLK_ENABLE_HAND_OFF flag for pwm clk, the pwm driver can't 
disable pwm clk by own.(Because the enable count >0)

Boris patch is not merged into the master branch. Whether there is a 
plan to merge?

>
>> --->8---
>>  From 47dcdc1bcc30b3ae1f76d33be824d2519a4dcca8 Mon Sep 17 00:00:00 2001
>> From: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Date: Fri, 4 Aug 2017 15:55:49 +0200
>> Subject: [PATCH] clk: Keep clocks in their initial state until
>>   clk_disable_unused() is called
>>
>> Some drivers are briefly preparing+enabling the clock in their
>> ->probe() hook and disable+unprepare them before leaving the function.
>>
>> This can be problem if a clock is shared between different devices, and
>> one of these devices is critical to the system. If this clock is
>> enabled/disabled by a non-critical device before the driver of the
>> critical one had a chance to enable+prepare it, there might be a short
>> period of time during which the critical device is not clocked.
>>
>> To solve this problem, we save the initial clock state (at registration
>> time) and prevent the clock from being disabled until kernel init is done
>> (which is when clk_disable_unused() is called).
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> ---
>>   drivers/clk/clk.c | 29 +++++++++++++++++++++++++++--
>>   1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index fc58c52a26b4..3f61374a364b 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -58,6 +58,8 @@ struct clk_core {
>>   	struct clk_core		*new_child;
>>   	unsigned long		flags;
>>   	bool			orphan;
>> +	bool			keep_enabled;
>> +	bool			keep_prepared;
>>   	unsigned int		enable_count;
>>   	unsigned int		prepare_count;
>>   	unsigned long		min_rate;
>> @@ -486,7 +488,7 @@ static void clk_core_unprepare(struct clk_core *core)
>>
>>   	trace_clk_unprepare(core);
>>
>> -	if (core->ops->unprepare)
>> +	if (core->ops->unprepare && !core->keep_prepared)
>>   		core->ops->unprepare(core->hw);
>>
>>   	trace_clk_unprepare_complete(core);
>> @@ -602,7 +604,7 @@ static void clk_core_disable(struct clk_core *core)
>>
>>   	trace_clk_disable_rcuidle(core);
>>
>> -	if (core->ops->disable)
>> +	if (core->ops->disable && !core->keep_enabled)
>>   		core->ops->disable(core->hw);
>>
>>   	trace_clk_disable_complete_rcuidle(core);
>> @@ -739,6 +741,12 @@ static void clk_unprepare_unused_subtree(struct clk_core *core)
>>   	hlist_for_each_entry(child, &core->children, child_node)
>>   		clk_unprepare_unused_subtree(child);
>>
>> +	/*
>> +	 * Reset the ->keep_prepared flag so that subsequent calls to
>> +	 * clk_unprepare() on this clk actually unprepare it.
>> +	 */
>> +	core->keep_prepared = false;
>> +
>>   	if (core->prepare_count)
>>   		return;
>>
>> @@ -770,6 +778,12 @@ static void clk_disable_unused_subtree(struct clk_core *core)
>>
>>   	flags = clk_enable_lock();
>>
>> +	/*
>> +	 * Reset the ->keep_enabled flag so that subsequent calls to
>> +	 * clk_disable() on this clk actually disable it.
>> +	 */
>> +	core->keep_enabled = false;
>> +
>>   	if (core->enable_count)
>>   		goto unlock_out;
>>
>> @@ -2446,6 +2460,17 @@ static int __clk_core_init(struct clk_core *core)
>>   		core->accuracy = 0;
>>
>>   	/*
>> +	 * We keep track of the initial clk status to keep clks in the state
>> +	 * they were left in by the bootloader until all drivers had a chance
>> +	 * to keep them prepared/enabled if they need to.
>> +	 */
>> +	if (core->ops->is_prepared && !clk_ignore_unused)
>> +		core->keep_prepared = core->ops->is_prepared(core->hw);
>> +
>> +	if (core->ops->is_enabled && !clk_ignore_unused)
>> +		core->keep_enabled = core->ops->is_enabled(core->hw);
>> +
>> +	/*
>>   	 * Set clk's phase.
>>   	 * Since a phase is by definition relative to its parent, just
>>   	 * query the current clock phase, or just assume it's in phase.
>>
>>
>
>
>
>
>
