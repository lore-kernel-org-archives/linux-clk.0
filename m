Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:34715 "EHLO
	mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753786AbcEEQAh (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2016 12:00:37 -0400
Received: by mail-io0-f171.google.com with SMTP id 190so88964040iow.1
        for <linux-clk@vger.kernel.org>; Thu, 05 May 2016 09:00:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <572B62AC.1020205@mleia.com>
References: <CAGhQ9VxsyWq=GK5RnCzspV3=6NbDNH6pJhf3uZqdNPCsP9VzmQ@mail.gmail.com>
	<572B62AC.1020205@mleia.com>
Date: Thu, 5 May 2016 18:00:36 +0200
Message-ID: <CAGhQ9VyBcyRZSRowzpiAWnUBywiu_fDMEYWOXYEykDgLWnU0mA@mail.gmail.com>
Subject: Re: clk-lpc18xx-creg - scheduling while atomic
From: Joachim Eastwood <manabian@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 5 May 2016 at 17:11, Vladimir Zapolskiy <vz@mleia.com> wrote:
> Hi Joachim,
>
> On 05.05.2016 14:53, Joachim Eastwood wrote:
>> Hi,
>>
>> I just tried next/master on my lpc18xx platform and got a 'scheduling
>> while atomic' on the msleep in clk_creg_32k_prepare. This does not
>> occur on 4.6-rc1. See below for backtrace.
>>
>> According to Documentation/clk.txt, Part 6 - Locking, sleeping is
>> allowed in prepare functions. Changing the msleep to an mdelay makes
>> the problem go away.
>>
>> So any ideas to what is going on?
>>
>
> the bug description resembles a recent problem on iMX7, you may find
> details from "clk: imx: do not sleep if IRQ's are still disabled"
> thread, the same sleeping clk_core_prepare() from time_init(), while
> sleeping is not allowed until the timer is ready.

Thanks alot, Vladimir!
That sheed more light on the problem.

Doing a partial revert of 32b9b10961860 ("clk: Allow clocks to be
marked as CRITICAL") also fixes the problem. 32b9b10961860 makes it
possible to call clk prepare, which is allowed to sleep, when clocks
are first created from of_clk_init(). of_clk_init() is called very
early where it's not allow to sleep at all[1].

What do you suggest, Stephen?
Calling prepare() from __clk_core_init() doesn't seem like a good idea
to me. I think the core clk handing of critical clocks needs to change
here.


regards,
Joachim Eastwood


[1] https://lkml.org/lkml/2016/4/27/233

>> BUG: scheduling while atomic: swapper/0/0x00000002
>> CPU: 0 PID: 0 Comm: swapper Not tainted
>> 4.6.0-rc6-next-20160505-00001-g5c8320450d1c #826
>> Hardware name: NXP LPC18xx/43xx (Device Tree)
>> [<2800be81>] (unwind_backtrace) from [<2800b22f>] (show_stack+0xb/0xc)
>> [<2800b22f>] (show_stack) from [<2801ea21>] (__schedule_bug+0x2d/0x44)
>> [<2801ea21>] (__schedule_bug) from [<281dc937>] (__schedule+0x3b/0x268)
>> [<281dc937>] (__schedule) from [<281dcbbb>] (schedule+0x57/0x64)
>> [<281dcbbb>] (schedule) from [<281de8ef>] (schedule_timeout+0xfb/0x120)
>> [<281de8ef>] (schedule_timeout) from [<28030fcd>] (msleep+0xf/0x12)
>> [<28030fcd>] (msleep) from [<28165a6d>] (clk_creg_32k_prepare+0x1f/0x24)
>> [<28165a6d>] (clk_creg_32k_prepare) from [<281620d5>]
>> (clk_core_prepare+0x1d/0x36)
>> [<281620d5>] (clk_core_prepare) from [<2816340b>] (clk_register+0x22f/0x318)
>> [<2816340b>] (clk_register) from [<282b06c9>] (lpc18xx_creg_clk_init+0x55/0x84)
>> [<282b06c9>] (lpc18xx_creg_clk_init) from [<282b0149>] (of_clk_init+0xc1/0x12c)
>> [<282b0149>] (of_clk_init) from [<282a665d>] (time_init+0x15/0x20)
>> [<282a665d>] (time_init) from [<282a457d>] (start_kernel+0x169/0x274)
>> [<282a457d>] (start_kernel) from [<28008025>] (0x28008025)
>> bad: scheduling from the idle thread!
>> CPU: 0 PID: 0 Comm: swapper Tainted: G W
>> 4.6.0-rc6-next-20160505-00001-g5c8320450d1c #826
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
