Return-Path: <sboyd@codeaurora.org>
Date: Wed, 20 Dec 2017 16:23:47 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: David Lechner <david@lechnology.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: fix spin_lock/unlock imbalance on bad clk_enable()
 reentrancy
Message-ID: <20171220230009.GI7997@codeaurora.org>
References: <1513122223-14932-1-git-send-email-david@lechnology.com>
 <32ca585d-c51d-1c85-42ba-85f0b1df0a60@lechnology.com>
 <f6df34ba-b553-5b10-8a36-f5a043722aa6@lechnology.com>
 <151372258747.45969.10121622799666696251@resonance>
 <3ad110cf-95ba-0d0b-53ee-f1fa2d37d7fa@lechnology.com>
 <151379785862.37313.908268542576551305@resonance>
 <d8801fdd-8f1f-e0a2-799b-03245009f234@lechnology.com>
 <749e4759-3511-92d4-a19a-0f72c31b1ee6@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <749e4759-3511-92d4-a19a-0f72c31b1ee6@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/20, David Lechner wrote:
> On 12/20/2017 02:33 PM, David Lechner wrote:
> >
> >So, as you can see, we get 4 warnings here. There is no problem
> >with any clock provider or consumer (as far as I can tell). The
> >bug here is that spin_trylock_irqsave() always returns true on
> >non-SMP systems, which messes up the reference counting.
> >
> >usb20_phy_clk_enable() currently works because mach-davinci does
> >not use the common clock framework. However, I am trying to move
> >it to the common clock framework, which is how I discovered this
> >bug.
> 
> One more thing I mentioned previously, but is worth mentioning again
> in detail is that if you enable CONFIG_DEBUG_SPINLOCK, that changes
> the behavior of spin_trylock_irqsave() on non-SMP systems. It no
> longer always returns true and so everything works as expected in
> the call chain that I described previously.
> 
> The difference is that with CONFIG_DEBUG_SPINLOCK=n, we have
> 
> #define arch_spin_trylock(lock)	({ barrier(); (void)(lock); 1; })
> 
> But if CONFIG_DEBUG_SPINLOCK=y, then we have
> 
> static inline int arch_spin_trylock(arch_spinlock_t *lock)
> {
> 	char oldval = lock->slock;
> 
> 	lock->slock = 0;
> 	barrier();
> 
> 	return oldval > 0;
> }
> 
> This comes from include/linux/spinlock_up.h, which is included from
> include/linux/spinlock.h
> 
> #ifdef CONFIG_SMP
> # include <asm/spinlock.h>
> #else
> # include <linux/spinlock_up.h>
> #endif
> 
> 
> So, the question I have is: what is the actual "correct" behavior of
> spin_trylock_irqsave()? Is it really supposed to always return true
> when CONFIG_DEBUG_SPINLOCK=n and CONFIG_SMP=n or is this a bug?

Thanks for doing the analysis in this thread.

When CONFIG_DEBUG_SPINLOCK=n and CONFIG_SMP=n, spinlocks are
compiler barriers, that's it. So even if it is a bug to always
return true, I fail to see how we can detect that a spinlock is
already held in this configuration and return true or false.

I suppose the best option is to make clk_enable_lock() and
clk_enable_unlock() into nops or pure owner/refcount/barrier
updates when CONFIG_SMP=n. We pretty much just need the barrier
semantics when there's only a single CPU.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
