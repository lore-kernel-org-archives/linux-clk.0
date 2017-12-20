Return-Path: <david@lechnology.com>
Subject: Re: [PATCH] clk: fix spin_lock/unlock imbalance on bad clk_enable()
 reentrancy
To: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <1513122223-14932-1-git-send-email-david@lechnology.com>
 <32ca585d-c51d-1c85-42ba-85f0b1df0a60@lechnology.com>
 <f6df34ba-b553-5b10-8a36-f5a043722aa6@lechnology.com>
 <151372258747.45969.10121622799666696251@resonance>
 <3ad110cf-95ba-0d0b-53ee-f1fa2d37d7fa@lechnology.com>
 <151379785862.37313.908268542576551305@resonance>
From: David Lechner <david@lechnology.com>
Message-ID: <d8801fdd-8f1f-e0a2-799b-03245009f234@lechnology.com>
Date: Wed, 20 Dec 2017 14:33:24 -0600
MIME-Version: 1.0
In-Reply-To: <151379785862.37313.908268542576551305@resonance>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 12/20/2017 01:24 PM, Michael Turquette wrote:
> Quoting David Lechner (2017-12-20 10:53:27)
>> On 12/19/2017 04:29 PM, Michael Turquette wrote:
>>> Hi David,
>>>
>>> Quoting David Lechner (2017-12-15 08:29:56)
>>>> On 12/12/2017 10:14 PM, David Lechner wrote:
>>>>> On 12/12/2017 05:43 PM, David Lechner wrote:
>>>>>> If clk_enable() is called in reentrant way and spin_trylock_irqsave() is
>>>>>> not working as expected, it is possible to get a negative enable_refcnt
>>>>>> which results in a missed call to spin_unlock_irqrestore().
>>>>>>
>>>>>> It works like this:
>>>>>>
>>>>>> 1. clk_enable() is called.
>>>>>> 2. clk_enable_unlock() calls spin_trylock_irqsave() and sets
>>>>>>       enable_refcnt = 1.
>>>>>> 3. Another clk_enable() is called before the first has returned
>>>>>>       (reentrant), but somehow spin_trylock_irqsave() is returning true.
>>>>>>       (I'm not sure how/why this is happening yet, but it is happening
>>>>>> to me
>>>>>>       with arch/arm/mach-davinci clocks that I am working on).
>>>>>
>>>>> I think I have figured out that since CONFIG_SMP=n and
>>>>> CONFIG_DEBUG_SPINLOCK=n on my kernel that
>>>>>
>>>>> #define arch_spin_trylock(lock)({ barrier(); (void)(lock); 1; })
>>>>>
>>>>> in include/linux/spinlock_up.h is causing the problem.
>>>>>
>>>>> So, basically, reentrancy of clk_enable() is broken for non-SMP systems,
>>>>> but I'm not sure I know how to fix it.
>>>>>
>>>>>
>>>>
>>>> Here is what I came up with for a fix. If it looks reasonable, I will
>>>> resend as a proper patch.
>>>>
>>>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>>>> index bb1b1f9..53fad5f 100644
>>>> --- a/drivers/clk/clk.c
>>>> +++ b/drivers/clk/clk.c
>>>> @@ -136,12 +136,23 @@ static void clk_prepare_unlock(void)
>>>>            mutex_unlock(&prepare_lock);
>>>>     }
>>>>
>>>> +#ifdef CONFIG_SMP
>>>> +#define NO_SMP 0
>>>> +#else
>>>> +#define NO_SMP 1
>>>> +#endif
>>>> +
>>>>     static unsigned long clk_enable_lock(void)
>>>>            __acquires(enable_lock)
>>>>     {
>>>> -       unsigned long flags;
>>>> +       unsigned long flags = 0;
>>>>
>>>> -       if (!spin_trylock_irqsave(&enable_lock, flags)) {
>>>> +       /*
>>>> +        * spin_trylock_irqsave() always returns true on non-SMP system
>>>> (unless
>>>
>>> Ugh, wrapped lines in patch make me sad.
>>
>> Sorry, I was being lazy. :-/
>>
>>>
>>>> +        * spin lock debugging is enabled) so don't call
>>>> spin_trylock_irqsave()
>>>> +        * unless we are on an SMP system.
>>>> +        */
>>>> +       if (NO_SMP || !spin_trylock_irqsave(&enable_lock, flags)) {
>>>
>>> I'm not sure that this looks reasonable. The inverse logic (NO_SMP = 0
>>> being equivalent to SMP = 1) just makes things harder to read for no
>>> reason.
>>>
>>> More to the point, did you fix your enable/disable call imbalance? If
>>> so, did you test that fix without this patch? I'd like to know if fixing
>>> the enable/disable imbalance is Good Enough. I'd prefer to take only
>>> that change and not this patch.
>>
>> Without this patch, the imbalance in calls to spin lock/unlock are
>> fixed, but I still get several WARN_ONCE_ON() because the reference
>> count becomes negative, so I would not call it Good Enough.
> 
> Several WARN_ON_ONCE? Have you narrowed down exactly which conditions in
> the lock/unlock path are firing?
> 
> Also, I wasn't referring to the lock/unlock imbalance in my email above.
> I was referring to the enable count mismatch. Have you fixed that bug? I
> assume it's an incorrect clk consumer driver causing it.
> 

OK, explaining from the beginning once again. This bug was discovered 
because we need to call clk_enable() in a reentrant way on a non SMP 
system on purpose (by design, not by chance). The call path is this:

1. clk_enable() is called.

int clk_enable(struct clk *clk)
{
	if (!clk)
		return 0;

	return clk_core_enable_lock(clk->core);
}

2.  Which in turn calls clk_core_enable_lock()


static int clk_core_enable_lock(struct clk_core *core)
{
	unsigned long flags;
	int ret;

	flags = clk_enable_lock();
	ret = clk_core_enable(core);
	clk_enable_unlock(flags);

	return ret;
}

3. Which calls clk_enable_lock()

static unsigned long clk_enable_lock(void)
	__acquires(enable_lock)
{
	unsigned long flags = 0;

	if (!spin_trylock_irqsave(&enable_lock, flags)) {
		if (enable_owner == current) {
			enable_refcnt++;
			__acquire(enable_lock);
			return flags;
		}
		spin_lock_irqsave(&enable_lock, flags);
	}
	WARN_ON_ONCE(enable_owner != NULL);
	WARN_ON_ONCE(enable_refcnt != 0);
	enable_owner = current;
	enable_refcnt = 1;
	return flags;
}

4. spin_trylock_irqsave() returns true, enable_owner was NULL and 
enable_refcnt was 0, so no warnings. When the function exits, 
enable_owner == current and enable_refcnt ==1.

5. Now we are back in clk_core_enable_lock() and clk_core_enable() is 
called.

static int clk_core_enable(struct clk_core *core)
{
	int ret = 0;

	lockdep_assert_held(&enable_lock);

	if (!core)
		return 0;

	if (WARN_ON(core->prepare_count == 0))
		return -ESHUTDOWN;

	if (core->enable_count == 0) {
		ret = clk_core_enable(core->parent);

		if (ret)
			return ret;

		trace_clk_enable_rcuidle(core);

		if (core->ops->enable)
			ret = core->ops->enable(core->hw);

		trace_clk_enable_complete_rcuidle(core);

		if (ret) {
			clk_core_disable(core->parent);
			return ret;
		}
	}

	core->enable_count++;
	return 0;
}

6. This results in calling the callback core->ops->enable(), which in 
this case is the following function. This clock has to enable another 
clock temporarily in order for this clock to start.

static void usb20_phy_clk_enable(struct davinci_clk *clk)
{
	u32 val;
	u32 timeout = 500000; /* 500 msec */

	val = readl(DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP2_REG));

	/* Starting USB 2.O PLL requires that the USB 2.O PSC is
	 * enabled. The PSC can be disabled after the PLL has locked.
	 */
	clk_enable(usb20_clk);

	/*
	 * Turn on the USB 2.0 PHY, but just the PLL, and not OTG. The
	 * USB 1.1 host may use the PLL clock without USB 2.0 OTG being
	 * used.
	 */
	val &= ~(CFGCHIP2_RESET | CFGCHIP2_PHYPWRDN);
	val |= CFGCHIP2_PHY_PLLON;

	writel(val, DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP2_REG));

	while (--timeout) {
		val = readl(DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP2_REG));
		if (val & CFGCHIP2_PHYCLKGD)
			goto done;
		udelay(1);
	}

	pr_err("Timeout waiting for USB 2.0 PHY clock good\n");
done:
	clk_disable(usb20_clk);
}

7. The usb20_phy_clk_enable() calls clk_enable(). We have reentrancy 
because we have not returned from the first clk_enable() yet.

8. As before, clk_enable() calls clk_core_enable_lock()

9. Which calls clk_enable_lock().

static unsigned long clk_enable_lock(void)
	__acquires(enable_lock)
{
	unsigned long flags = 0;

	if (!spin_trylock_irqsave(&enable_lock, flags)) {
		if (enable_owner == current) {
			enable_refcnt++;
			__acquire(enable_lock);
			return flags;
		}
		spin_lock_irqsave(&enable_lock, flags);
	}
	WARN_ON_ONCE(enable_owner != NULL);
	WARN_ON_ONCE(enable_refcnt != 0);
	enable_owner = current;
	enable_refcnt = 1;
	return flags;
}

10. If this was running on an SMP system, spin_trylock_irqsave() would 
return false because we already hold the lock for enable_lock that we 
aquired in step 3 and everything would be OK. But this is not an SMP 
system, so spin_trylock_irqsave() always returns true. So the if block 
is skipped and we get a warning because enable_owner == current and then 
another warning because enable_refcnt == 1.

11. clk_enable_lock() returns back to clk_core_enable_lock().

12. clk_core_enable() is called. There is nothing notable about this call.

13. clk_enable_unlock() is called.

static void clk_enable_unlock(unsigned long flags)
	__releases(enable_lock)
{
	WARN_ON_ONCE(enable_owner != current);
	WARN_ON_ONCE(enable_refcnt == 0);

	if (--enable_refcnt) {
		__release(enable_lock);
		return;
	}
	enable_owner = NULL;
	spin_unlock_irqrestore(&enable_lock, flags);
}

14. enable_owner == current and enable_refcnt == 0, so no warnings. When 
the function returns, enable_onwer == NULL and enable_refcnt == 0.

15. clk_core_enable_lock() returns to clk_enable()

16. clk_enable() returns to usb20_phy_clk_enable()

17. usb20_phy_clk_enable() locks the PLL, then calls clk_disable()

void clk_disable(struct clk *clk)
{
	if (IS_ERR_OR_NULL(clk))
		return;

	clk_core_disable_lock(clk->core);
}

18. Which calls clk_core_disable_lock()

static void clk_core_disable_lock(struct clk_core *core)
{
	unsigned long flags;

	flags = clk_enable_lock();
	clk_core_disable(core);
	clk_enable_unlock(flags);
}

19. Which calls clk_enable_lock()

static unsigned long clk_enable_lock(void)
	__acquires(enable_lock)
{
	unsigned long flags = 0;

	if (!spin_trylock_irqsave(&enable_lock, flags)) {
		if (enable_owner == current) {
			enable_refcnt++;
			__acquire(enable_lock);
			return flags;
		}
		spin_lock_irqsave(&enable_lock, flags);
	}
	WARN_ON_ONCE(enable_owner != NULL);
	WARN_ON_ONCE(enable_refcnt != 0);
	enable_owner = current;
	enable_refcnt = 1;
	return flags;
}

20. spin_trylock_irqsave() always returns true, so skip the if block. 
enable_owner == NULL and enable_refcnt == 0, so no warnings. On return 
enable_owner == current and enable_refcnt == 1.

21. clk_core_disable() is called. Nothing notable about this.

22. clk_enable_unlock() is called.

static void clk_enable_unlock(unsigned long flags)
	__releases(enable_lock)
{
	WARN_ON_ONCE(enable_owner != current);
	WARN_ON_ONCE(enable_refcnt == 0);

	if (--enable_refcnt) {
		__release(enable_lock);
		return;
	}
	enable_owner = NULL;
	spin_unlock_irqrestore(&enable_lock, flags);
}

23. enable_owner == current and enable_refcnt == 1, so no warnings. On 
return enable_owner == NULL and enable_refcnt == 0.

24. clk_core_disable_lock() returns to clk_disable()

25. clk_disable() returns to usb20_phy_clk_enable()

26. usb20_phy_clk_enable() returns to clk_core_enable()

27. clk_core_enable() returns to clk_core_enable_lock()

28 clk_core_enable_lock() calls clk_enable_unlock()

static void clk_enable_unlock(unsigned long flags)
	__releases(enable_lock)
{
	WARN_ON_ONCE(enable_owner != current);
	WARN_ON_ONCE(enable_refcnt == 0);

	if (--enable_refcnt) {
		__release(enable_lock);
		return;
	}
	enable_owner = NULL;
	spin_unlock_irqrestore(&enable_lock, flags);
}

29. enable_owner == NULL, so we get a warning. enable_refcnt == 0, so we 
get another warning. --enable_refcnt != 0, so we return early in the if 
statement. on return, enable_onwer == NULL and enable_refcnt == -1.

30. clk_enable_unlock() returns to clk_core_enable_lock()

31. clk_core_enable_lock() returns to clk_enable(). This is the original 
clk_enable() from step 1, so we are done, but we have left enable_refcnt 
== -1. The next call to a clk_enable() will fix this and the warning 
will be suppressed because of WARN_ON_ONCE().



So, as you can see, we get 4 warnings here. There is no problem with any 
clock provider or consumer (as far as I can tell). The bug here is that 
spin_trylock_irqsave() always returns true on non-SMP systems, which 
messes up the reference counting.

usb20_phy_clk_enable() currently works because mach-davinci does not use 
the common clock framework. However, I am trying to move it to the 
common clock framework, which is how I discovered this bug.
