Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:47608 "EHLO mail.mleia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752377AbcEEPLn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 5 May 2016 11:11:43 -0400
Subject: Re: clk-lpc18xx-creg - scheduling while atomic
To: Joachim Eastwood <manabian@gmail.com>
References: <CAGhQ9VxsyWq=GK5RnCzspV3=6NbDNH6pJhf3uZqdNPCsP9VzmQ@mail.gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <572B62AC.1020205@mleia.com>
Date: Thu, 5 May 2016 18:11:40 +0300
MIME-Version: 1.0
In-Reply-To: <CAGhQ9VxsyWq=GK5RnCzspV3=6NbDNH6pJhf3uZqdNPCsP9VzmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Joachim,

On 05.05.2016 14:53, Joachim Eastwood wrote:
> Hi,
> 
> I just tried next/master on my lpc18xx platform and got a 'scheduling
> while atomic' on the msleep in clk_creg_32k_prepare. This does not
> occur on 4.6-rc1. See below for backtrace.
> 
> According to Documentation/clk.txt, Part 6 - Locking, sleeping is
> allowed in prepare functions. Changing the msleep to an mdelay makes
> the problem go away.
> 
> So any ideas to what is going on?
> 

the bug description resembles a recent problem on iMX7, you may find
details from "clk: imx: do not sleep if IRQ's are still disabled"
thread, the same sleeping clk_core_prepare() from time_init(), while
sleeping is not allowed until the timer is ready.

With best wishes,
Vladimir

> 
> BUG: scheduling while atomic: swapper/0/0x00000002
> CPU: 0 PID: 0 Comm: swapper Not tainted
> 4.6.0-rc6-next-20160505-00001-g5c8320450d1c #826
> Hardware name: NXP LPC18xx/43xx (Device Tree)
> [<2800be81>] (unwind_backtrace) from [<2800b22f>] (show_stack+0xb/0xc)
> [<2800b22f>] (show_stack) from [<2801ea21>] (__schedule_bug+0x2d/0x44)
> [<2801ea21>] (__schedule_bug) from [<281dc937>] (__schedule+0x3b/0x268)
> [<281dc937>] (__schedule) from [<281dcbbb>] (schedule+0x57/0x64)
> [<281dcbbb>] (schedule) from [<281de8ef>] (schedule_timeout+0xfb/0x120)
> [<281de8ef>] (schedule_timeout) from [<28030fcd>] (msleep+0xf/0x12)
> [<28030fcd>] (msleep) from [<28165a6d>] (clk_creg_32k_prepare+0x1f/0x24)
> [<28165a6d>] (clk_creg_32k_prepare) from [<281620d5>]
> (clk_core_prepare+0x1d/0x36)
> [<281620d5>] (clk_core_prepare) from [<2816340b>] (clk_register+0x22f/0x318)
> [<2816340b>] (clk_register) from [<282b06c9>] (lpc18xx_creg_clk_init+0x55/0x84)
> [<282b06c9>] (lpc18xx_creg_clk_init) from [<282b0149>] (of_clk_init+0xc1/0x12c)
> [<282b0149>] (of_clk_init) from [<282a665d>] (time_init+0x15/0x20)
> [<282a665d>] (time_init) from [<282a457d>] (start_kernel+0x169/0x274)
> [<282a457d>] (start_kernel) from [<28008025>] (0x28008025)
> bad: scheduling from the idle thread!
> CPU: 0 PID: 0 Comm: swapper Tainted: G W
> 4.6.0-rc6-next-20160505-00001-g5c8320450d1c #826
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
