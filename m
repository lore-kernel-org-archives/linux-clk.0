Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: pxa: transfer CPU clock setting from pxa2xx-cpufreq
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
	<1477225170-19019-6-git-send-email-robert.jarzmik@free.fr>
	<20161102005637.GV16026@codeaurora.org>
Date: Wed, 02 Nov 2016 16:49:01 +0100
In-Reply-To: <20161102005637.GV16026@codeaurora.org> (Stephen Boyd's message
	of "Tue, 1 Nov 2016 17:56:37 -0700")
Message-ID: <87y411zxua.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 10/23, Robert Jarzmik wrote:
>> diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
>> index 29cee9e8d4d9..7184819b7415 100644
>> --- a/drivers/clk/pxa/clk-pxa.c
>> +++ b/drivers/clk/pxa/clk-pxa.c
>> @@ -15,9 +15,18 @@
>>  #include <linux/clkdev.h>
>>  #include <linux/of.h>
>>  
>> +#include <mach/pxa2xx-regs.h>
>> +#include <mach/smemc.h>
>
> This is unfortunate. It makes compile testing the drivers
> harder. Can this be fixed in the future?
Indeed.

I will try to attend to it today evening or tomorrow, and post a v2 for this
patch only.

>> +void pxa2xx_core_turbo_switch(bool on)
>> +{
>> +	unsigned long flags;
>> +	unsigned int unused, clkcfg;
>> +
>> +	local_irq_save(flags);
>> +
>> +	asm("mrc\tp14, 0, %0, c6, c0, 0" : "=r" (clkcfg));
>
> \t is odd style, but I guess this is copied from somewhere?
Yeah ... and yes, that \t is indeed ugly now I look at it. A space could be more
welcome ...

> Should it be volatile? Or is it ok for the clkcfg value to be
> cached here?

I don't see how it could be cached ... The asm statement produces a result used
afterwards, I don't think the compiler can optimize that out. I would have
understood if this was in a loop, but here I don't see.

Note that I'm not reluctant to add it, I just want to check which optimization
case we're talking about to see if I'm missing something.

>> diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
>> index 6a3009eec830..20fd87b36560 100644
>> --- a/drivers/clk/pxa/clk-pxa25x.c
>> +++ b/drivers/clk/pxa/clk-pxa25x.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/io.h>
>>  #include <linux/of.h>
>>  #include <mach/pxa2xx-regs.h>
>> +#include <mach/smemc.h>
>
> I guess things aren't getting any worse here for mach includes...
Good question ... I must check what happens when I build a kernel supporting at
the same time pxa25x, pxa27x and pxa3xx...

>> +	mdcnfg = __raw_readl(MDCNFG);
>
> Perhaps it should be readl_relaxed() instead? __raw_readl()
> doesn't byte-swap for endianess so it's usually wrong.
Most certainly, no point for a read-only-once register to have any kind of
barrier, nor is there a point if forcing a byte ordering.

>> -	asm("mrc\tp14, 0, %0, c6, c0, 0" : "=r" (clkcfg));
> Aha, found it.
:)

I'll rework the patch a bit. Let's hope I'll have it under control in the next
days so that the review can be done before you make your pull request for -next
cycle.

Cheers.

-- 
Robert
