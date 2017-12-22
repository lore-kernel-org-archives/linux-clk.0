Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 17:39:15 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: David Lechner <david@lechnology.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: fix spin_lock/unlock imbalance on bad clk_enable()
 reentrancy
Message-ID: <20171222013915.GC7997@codeaurora.org>
References: <1513122223-14932-1-git-send-email-david@lechnology.com>
 <32ca585d-c51d-1c85-42ba-85f0b1df0a60@lechnology.com>
 <f6df34ba-b553-5b10-8a36-f5a043722aa6@lechnology.com>
 <151372258747.45969.10121622799666696251@resonance>
 <3ad110cf-95ba-0d0b-53ee-f1fa2d37d7fa@lechnology.com>
 <151379785862.37313.908268542576551305@resonance>
 <d8801fdd-8f1f-e0a2-799b-03245009f234@lechnology.com>
 <749e4759-3511-92d4-a19a-0f72c31b1ee6@lechnology.com>
 <20171220230009.GI7997@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171220230009.GI7997@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/20, Stephen Boyd wrote:
> On 12/20, David Lechner wrote:
> > On 12/20/2017 02:33 PM, David Lechner wrote:
> > 
> > 
> > So, the question I have is: what is the actual "correct" behavior of
> > spin_trylock_irqsave()? Is it really supposed to always return true
> > when CONFIG_DEBUG_SPINLOCK=n and CONFIG_SMP=n or is this a bug?
> 
> Thanks for doing the analysis in this thread.
> 
> When CONFIG_DEBUG_SPINLOCK=n and CONFIG_SMP=n, spinlocks are
> compiler barriers, that's it. So even if it is a bug to always
> return true, I fail to see how we can detect that a spinlock is
> already held in this configuration and return true or false.
> 
> I suppose the best option is to make clk_enable_lock() and
> clk_enable_unlock() into nops or pure owner/refcount/barrier
> updates when CONFIG_SMP=n. We pretty much just need the barrier
> semantics when there's only a single CPU.
> 

How about this patch? It should make the trylock go away on UP
configs and then we keep everything else for refcount and
ownership. We would test enable_owner outside of any
irqs/preemption disabled section though. That needs a think.

---8<----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3526bc068f30..b6f61367aa8d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -143,7 +143,8 @@ static unsigned long clk_enable_lock(void)
 {
 	unsigned long flags;
 
-	if (!spin_trylock_irqsave(&enable_lock, flags)) {
+	if (!IS_ENABLED(CONFIG_SMP) ||
+	    !spin_trylock_irqsave(&enable_lock, flags)) {
 		if (enable_owner == current) {
 			enable_refcnt++;
 			__acquire(enable_lock);


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
