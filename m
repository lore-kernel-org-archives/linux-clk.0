Return-Path: <david@lechnology.com>
Subject: Re: [PATCH] clk: fix spin_lock/unlock imbalance on bad clk_enable()
 reentrancy
From: David Lechner <david@lechnology.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <1513122223-14932-1-git-send-email-david@lechnology.com>
 <32ca585d-c51d-1c85-42ba-85f0b1df0a60@lechnology.com>
Message-ID: <f6df34ba-b553-5b10-8a36-f5a043722aa6@lechnology.com>
Date: Fri, 15 Dec 2017 10:29:56 -0600
MIME-Version: 1.0
In-Reply-To: <32ca585d-c51d-1c85-42ba-85f0b1df0a60@lechnology.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 12/12/2017 10:14 PM, David Lechner wrote:
> On 12/12/2017 05:43 PM, David Lechner wrote:
>> If clk_enable() is called in reentrant way and spin_trylock_irqsave() is
>> not working as expected, it is possible to get a negative enable_refcnt
>> which results in a missed call to spin_unlock_irqrestore().
>>
>> It works like this:
>>
>> 1. clk_enable() is called.
>> 2. clk_enable_unlock() calls spin_trylock_irqsave() and sets
>>     enable_refcnt = 1.
>> 3. Another clk_enable() is called before the first has returned
>>     (reentrant), but somehow spin_trylock_irqsave() is returning true.
>>     (I'm not sure how/why this is happening yet, but it is happening 
>> to me
>>     with arch/arm/mach-davinci clocks that I am working on).
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
> 
> 

Here is what I came up with for a fix. If it looks reasonable, I will 
resend as a proper patch.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index bb1b1f9..53fad5f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -136,12 +136,23 @@ static void clk_prepare_unlock(void)
         mutex_unlock(&prepare_lock);
  }

+#ifdef CONFIG_SMP
+#define NO_SMP 0
+#else
+#define NO_SMP 1
+#endif
+
  static unsigned long clk_enable_lock(void)
         __acquires(enable_lock)
  {
-       unsigned long flags;
+       unsigned long flags = 0;

-       if (!spin_trylock_irqsave(&enable_lock, flags)) {
+       /*
+        * spin_trylock_irqsave() always returns true on non-SMP system 
(unless
+        * spin lock debugging is enabled) so don't call 
spin_trylock_irqsave()
+        * unless we are on an SMP system.
+        */
+       if (NO_SMP || !spin_trylock_irqsave(&enable_lock, flags)) {
                 if (enable_owner == current) {
                         enable_refcnt++;
                         __acquire(enable_lock);
