Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Nov 2016 15:26:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: pxa: transfer CPU clock setting from
 pxa2xx-cpufreq
Message-ID: <20161102222658.GU16026@codeaurora.org>
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
 <1477225170-19019-6-git-send-email-robert.jarzmik@free.fr>
 <20161102005637.GV16026@codeaurora.org>
 <87y411zxua.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87y411zxua.fsf@belgarion.home>
List-ID: <linux-clk.vger.kernel.org>

On 11/02, Robert Jarzmik wrote:
> Stephen Boyd <sboyd@codeaurora.org> writes:
> 
> > On 10/23, Robert Jarzmik wrote:
> >> diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
> >> index 29cee9e8d4d9..7184819b7415 100644
> >> --- a/drivers/clk/pxa/clk-pxa.c
> >> +++ b/drivers/clk/pxa/clk-pxa.c
> >> +void pxa2xx_core_turbo_switch(bool on)
> >> +{
> >> +	unsigned long flags;
> >> +	unsigned int unused, clkcfg;
> >> +
> >> +	local_irq_save(flags);
> >> +
> >> +	asm("mrc\tp14, 0, %0, c6, c0, 0" : "=r" (clkcfg));
> >
> > \t is odd style, but I guess this is copied from somewhere?
> Yeah ... and yes, that \t is indeed ugly now I look at it. A space could be more
> welcome ...
> 
> > Should it be volatile? Or is it ok for the clkcfg value to be
> > cached here?
> 
> I don't see how it could be cached ... The asm statement produces a result used
> afterwards, I don't think the compiler can optimize that out. I would have
> understood if this was in a loop, but here I don't see.
> 
> Note that I'm not reluctant to add it, I just want to check which optimization
> case we're talking about to see if I'm missing something.
> 

I'm a bit rusty on asm volatile semantics but I seem to recall
that a non-volatile asm statement can be combined/merged,
reordered, etc. by the compiler. I suppose if this was in the
cpufreq driver already then changing it in this patch is not a
good idea. If anything, a follow up patch if we determine it's
actually a bug.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
