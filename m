Return-Path: <sboyd@codeaurora.org>
Date: Tue, 2 Jan 2018 18:25:42 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: David Lechner <david@lechnology.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: fix reentrancy of clk_enable() on UP systems
Message-ID: <20180103022542.GV7997@codeaurora.org>
References: <1514309062-1768-1-git-send-email-david@lechnology.com>
 <20171227022154.GA7997@codeaurora.org>
 <40787e8b-94af-6b0f-a409-53caeb9c4c01@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40787e8b-94af-6b0f-a409-53caeb9c4c01@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, David Lechner wrote:
> On 12/26/2017 08:21 PM, Stephen Boyd wrote:
> >On 12/26, David Lechner wrote:
> >>Reentrant calls to clk_enable() are not working on UP systems. This is
> >>caused by the fact spin_trylock_irqsave() always returns true when
> >>CONFIG_SMP=n (and CONFIG_DEBUG_SPINLOCK=n) which causes the reference
> >>counting to not work correctly when clk_enable_lock() is called twice
> >>before clk_enable_unlock() is called (this happens when clk_enable()
> >>is called from within another clk_enable()).
> >>
> >>This introduces a new set of clk_enable_lock() and clk_enable_unlock()
> >>functions for UP systems that doesn't use spinlocks but effectively does
> >>the same thing as the SMP version of the functions.
> >>
> >>Signed-off-by: David Lechner <david@lechnology.com>
> >>---
> >>
> >>Previous discussion of this issue for reference:
> >>* https://patchwork.kernel.org/patch/10108437/
> >>* https://patchwork.kernel.org/patch/10115483/
> >>
> >>
> >>  drivers/clk/clk.c | 39 +++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 39 insertions(+)
> >>
> >>diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >>index bb1b1f9..259a77f 100644
> >>--- a/drivers/clk/clk.c
> >>+++ b/drivers/clk/clk.c
> >>@@ -136,6 +136,8 @@ static void clk_prepare_unlock(void)
> >>  	mutex_unlock(&prepare_lock);
> >>  }
> >>+#ifdef CONFIG_SMP
> >>+
> >>  static unsigned long clk_enable_lock(void)
> >>  	__acquires(enable_lock)
> >>  {
> >>@@ -170,6 +172,43 @@ static void clk_enable_unlock(unsigned long flags)
> >>  	spin_unlock_irqrestore(&enable_lock, flags);
> >>  }
> >>+#else
> >>+
> >>+static unsigned long clk_enable_lock(void)
> >>+	__acquires(enable_lock)
> >>+{
> >>+	unsigned long flags;
> >>+
> >>+	local_irq_save(flags);
> >>+	preempt_disable();
> >
> >Well we certainly don't want to do both irq save and preemption
> >disabling.
> 
> If you don't mind humoring my ignorance, why not? This is exactly
> what spin_lock_irqsave() does on a UP system, which is where I got
> if from. I'm not arguing that is is right or wrong, just hoping to
> learn something.

Ah you're right. I was thinking that we don't need to disable
preemption because we've already disabled irqs so we can't be
preempted out but I believe this is done this way so that when we
reenable irqs on the unlock path we have preemption disabled and
hardirqs can run immediately after we enable irqs and then the
task can be preempted after irqs run and preemption is enabled.

> 
> >Really all we need to do is save away the current
> >flags to restore them them later. On UP systems, we would do that
> >on each call to this function. On SMP systems, we would actually
> >test the enable_owner and up the enable_refcnt outside of the
> >locked section because if spin_trylock_irqsave() returns a 0, we
> >have restored the irq flags to whatever they were before, and
> >then we test enable_owner. So I suppose if it was safe on SMP to
> >test enable_owner and up the refcnt without holding any sort of
> >lock then it's also safe on UP, because current is a "special"
> >variable.
> >
> >Does this ugly hack do the trick?
> 
> Yes, it does the trick, but the local_save_flags() seems pointless.
> On the first call, enable_owner == NULL, so spin_lock_irqsave() is
> called, which writes over the flags variable. For any later calls
> where enable_owner == current, the flags variable is not used in
> clk_enable_unlock() - the reference count is just decreased. The
> flags variable is only used in clk_enable_unlock() in the release of
> the last reference, in which the flags variable will be the one set
> by spin_lock_irqsave() in clk_enable_lock().

Ok, fair enough. I was trying to replicate the behavior on SMP
where we return the flags if we're already holding the lock. It's
nice to always return the current state of the flags because then
we can easily nest the lock calls multiple times in the same
function without worrying about the flags value becoming junk. We
don't have that problem now, but it wouldn't be very obvious that
flags is overwritten if we nested the calls at some point.

This avoids the semicolon stuff, probably deserves a comment
though.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e24968fa31db..55933eda1981 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -143,10 +143,13 @@ static unsigned long clk_enable_lock(void)
 {
 	unsigned long flags;
 
-	if (!spin_trylock_irqsave(&enable_lock, flags)) {
+	if (!IS_ENABLED(CONFIG_SMP) ||
+	    !spin_trylock_irqsave(&enable_lock, flags)) {
 		if (enable_owner == current) {
 			enable_refcnt++;
 			__acquire(enable_lock);
+			if (!IS_ENABLED(CONFIG_SMP))
+				local_save_flags(flags);
 			return flags;
 		}
 		spin_lock_irqsave(&enable_lock, flags);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
