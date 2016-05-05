Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33610 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753836AbcEELxP (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2016 07:53:15 -0400
Received: by mail-io0-f193.google.com with SMTP id x35so9254931ioi.0
        for <linux-clk@vger.kernel.org>; Thu, 05 May 2016 04:53:15 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 5 May 2016 13:53:14 +0200
Message-ID: <CAGhQ9VxsyWq=GK5RnCzspV3=6NbDNH6pJhf3uZqdNPCsP9VzmQ@mail.gmail.com>
Subject: clk-lpc18xx-creg - scheduling while atomic
From: Joachim Eastwood <manabian@gmail.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

I just tried next/master on my lpc18xx platform and got a 'scheduling
while atomic' on the msleep in clk_creg_32k_prepare. This does not
occur on 4.6-rc1. See below for backtrace.

According to Documentation/clk.txt, Part 6 - Locking, sleeping is
allowed in prepare functions. Changing the msleep to an mdelay makes
the problem go away.

So any ideas to what is going on?


regards,
Joachim Eastwood


BUG: scheduling while atomic: swapper/0/0x00000002
CPU: 0 PID: 0 Comm: swapper Not tainted
4.6.0-rc6-next-20160505-00001-g5c8320450d1c #826
Hardware name: NXP LPC18xx/43xx (Device Tree)
[<2800be81>] (unwind_backtrace) from [<2800b22f>] (show_stack+0xb/0xc)
[<2800b22f>] (show_stack) from [<2801ea21>] (__schedule_bug+0x2d/0x44)
[<2801ea21>] (__schedule_bug) from [<281dc937>] (__schedule+0x3b/0x268)
[<281dc937>] (__schedule) from [<281dcbbb>] (schedule+0x57/0x64)
[<281dcbbb>] (schedule) from [<281de8ef>] (schedule_timeout+0xfb/0x120)
[<281de8ef>] (schedule_timeout) from [<28030fcd>] (msleep+0xf/0x12)
[<28030fcd>] (msleep) from [<28165a6d>] (clk_creg_32k_prepare+0x1f/0x24)
[<28165a6d>] (clk_creg_32k_prepare) from [<281620d5>]
(clk_core_prepare+0x1d/0x36)
[<281620d5>] (clk_core_prepare) from [<2816340b>] (clk_register+0x22f/0x318)
[<2816340b>] (clk_register) from [<282b06c9>] (lpc18xx_creg_clk_init+0x55/0x84)
[<282b06c9>] (lpc18xx_creg_clk_init) from [<282b0149>] (of_clk_init+0xc1/0x12c)
[<282b0149>] (of_clk_init) from [<282a665d>] (time_init+0x15/0x20)
[<282a665d>] (time_init) from [<282a457d>] (start_kernel+0x169/0x274)
[<282a457d>] (start_kernel) from [<28008025>] (0x28008025)
bad: scheduling from the idle thread!
CPU: 0 PID: 0 Comm: swapper Tainted: G W
4.6.0-rc6-next-20160505-00001-g5c8320450d1c #826
