Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1513345678.2261.60.camel@baylibre.com>
Subject: Re: [PATCH] clk: fix spin_lock/unlock imbalance on bad clk_enable()
 reentrancy
From: Jerome Brunet <jbrunet@baylibre.com>
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org
Date: Fri, 15 Dec 2017 14:47:58 +0100
In-Reply-To: <32ca585d-c51d-1c85-42ba-85f0b1df0a60@lechnology.com>
References: <1513122223-14932-1-git-send-email-david@lechnology.com>
	 <32ca585d-c51d-1c85-42ba-85f0b1df0a60@lechnology.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-12-12 at 22:14 -0600, David Lechner wrote:
> On 12/12/2017 05:43 PM, David Lechner wrote:
> > If clk_enable() is called in reentrant way and spin_trylock_irqsave() is
> > not working as expected, it is possible to get a negative enable_refcnt
> > which results in a missed call to spin_unlock_irqrestore().
> > 
> > It works like this:
> > 
> > 1. clk_enable() is called.
> > 2. clk_enable_unlock() calls spin_trylock_irqsave() and sets
> >     enable_refcnt = 1.
> > 3. Another clk_enable() is called before the first has returned
> >     (reentrant), but somehow spin_trylock_irqsave() is returning true.
> >     (I'm not sure how/why this is happening yet, but it is happening to me
> >     with arch/arm/mach-davinci clocks that I am working on).
> 
> I think I have figured out that since CONFIG_SMP=n and 
> CONFIG_DEBUG_SPINLOCK=n on my kernel that
> 
> #define arch_spin_trylock(lock)({ barrier(); (void)(lock); 1; })
> 
> in include/linux/spinlock_up.h is causing the problem.
> 
> So, basically, reentrancy of clk_enable() is broken for non-SMP systems, 
> but I'm not sure I know how to fix it.

Hi David,

Correct me if I'm wrong but, in uni-processor mode, a call to
spin_trylock_irqsave shall disable the preemption. see _raw_spin_trylock() in
spinlock_api_up.h:71

In this case I don't understand you could possibly get another call to
clk_enable() ? ... unless the implementation of your clock ops re-enable the
preemption or calls the scheduler.

> 
> 
> > 4. Because spin_trylock_irqsave() returned true, enable_lock has been
> >     locked twice without being unlocked and enable_refcnt = 1 is called
> >     instead of enable_refcnt++.
> > 5. After the inner clock is enabled clk_enable_unlock() is called which
> >     decrements enable_refnct to 0 and calls spin_unlock_irqrestore()
> > 6. The inner clk_enable() function returns.
> > 7. clk_enable_unlock() is called again for the outer clock. enable_refcnt
> >     is decremented to -1 and spin_unlock_irqrestore() is *not* called.
> > 8. The outer clk_enable() function returns.
> > 9. Unrelated code called later issues a BUG warning about sleeping in an
> >     atomic context because of the unbalanced calls for the spin lock.
> > 
> > This patch fixes the problem of unbalanced calls by calling
> > spin_unlock_irqrestore() if enable_refnct <= 0 instead of just checking if
> > it is == 0.

A negative ref is just illegal, which is why got this line:
WARN_ON_ONCE(enable_refcnt != 0);

If it ever happens, it means you've got a bug to fix some place else.
Unless I missed something, the fix proposed is not right.

> > 
> > The BUG warning about sleeping in an atomic context in the unrelated code
> > is eliminated with this patch, but there are still warnings printed from
> > clk_enable_unlock() and clk_enable_unlock() because of the reference
> > counting problems.
> > 
> > Signed-off-by: David Lechner <david@lechnology.com>
> > ---
> >   drivers/clk/clk.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 647d056..bb1b1f9 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -162,7 +162,7 @@ static void clk_enable_unlock(unsigned long flags)
> >   	WARN_ON_ONCE(enable_owner != current);
> >   	WARN_ON_ONCE(enable_refcnt == 0);
> >   
> > -	if (--enable_refcnt) {
> > +	if (--enable_refcnt > 0) {
> >   		__release(enable_lock);
> >   		return;
> >   	}
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
