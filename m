Return-Path: <david@lechnology.com>
Subject: Re: [PATCH] clk: fix reentrancy of clk_enable() on UP systems
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
References: <1514309062-1768-1-git-send-email-david@lechnology.com>
 <20171227022154.GA7997@codeaurora.org>
From: David Lechner <david@lechnology.com>
Message-ID: <40787e8b-94af-6b0f-a409-53caeb9c4c01@lechnology.com>
Date: Thu, 28 Dec 2017 22:26:59 -0600
MIME-Version: 1.0
In-Reply-To: <20171227022154.GA7997@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 12/26/2017 08:21 PM, Stephen Boyd wrote:
> On 12/26, David Lechner wrote:
>> Reentrant calls to clk_enable() are not working on UP systems. This is
>> caused by the fact spin_trylock_irqsave() always returns true when
>> CONFIG_SMP=n (and CONFIG_DEBUG_SPINLOCK=n) which causes the reference
>> counting to not work correctly when clk_enable_lock() is called twice
>> before clk_enable_unlock() is called (this happens when clk_enable()
>> is called from within another clk_enable()).
>>
>> This introduces a new set of clk_enable_lock() and clk_enable_unlock()
>> functions for UP systems that doesn't use spinlocks but effectively does
>> the same thing as the SMP version of the functions.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
>> ---
>>
>> Previous discussion of this issue for reference:
>> * https://patchwork.kernel.org/patch/10108437/
>> * https://patchwork.kernel.org/patch/10115483/
>>
>>
>>   drivers/clk/clk.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index bb1b1f9..259a77f 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -136,6 +136,8 @@ static void clk_prepare_unlock(void)
>>   	mutex_unlock(&prepare_lock);
>>   }
>>   
>> +#ifdef CONFIG_SMP
>> +
>>   static unsigned long clk_enable_lock(void)
>>   	__acquires(enable_lock)
>>   {
>> @@ -170,6 +172,43 @@ static void clk_enable_unlock(unsigned long flags)
>>   	spin_unlock_irqrestore(&enable_lock, flags);
>>   }
>>   
>> +#else
>> +
>> +static unsigned long clk_enable_lock(void)
>> +	__acquires(enable_lock)
>> +{
>> +	unsigned long flags;
>> +
>> +	local_irq_save(flags);
>> +	preempt_disable();
> 
> Well we certainly don't want to do both irq save and preemption
> disabling.

If you don't mind humoring my ignorance, why not? This is exactly what 
spin_lock_irqsave() does on a UP system, which is where I got if from. 
I'm not arguing that is is right or wrong, just hoping to learn something.

> Really all we need to do is save away the current
> flags to restore them them later. On UP systems, we would do that
> on each call to this function. On SMP systems, we would actually
> test the enable_owner and up the enable_refcnt outside of the
> locked section because if spin_trylock_irqsave() returns a 0, we
> have restored the irq flags to whatever they were before, and
> then we test enable_owner. So I suppose if it was safe on SMP to
> test enable_owner and up the refcnt without holding any sort of
> lock then it's also safe on UP, because current is a "special"
> variable.
> 
> Does this ugly hack do the trick?

Yes, it does the trick, but the local_save_flags() seems pointless. On 
the first call, enable_owner == NULL, so spin_lock_irqsave() is called, 
which writes over the flags variable. For any later calls where 
enable_owner == current, the flags variable is not used in 
clk_enable_unlock() - the reference count is just decreased. The flags 
variable is only used in clk_enable_unlock() in the release of the last 
reference, in which the flags variable will be the one set by 
spin_lock_irqsave() in clk_enable_lock().

> I really dislike the semi-colon
> barf, but I fail to see another way out of this right now.
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b56c11f51baf..77b2c5bbba68 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -141,7 +141,8 @@ static unsigned long clk_enable_lock(void)
>   {
>   	unsigned long flags;
>   
> -	if (!spin_trylock_irqsave(&enable_lock, flags)) {
> +	if ((!IS_ENABLED(CONFIG_SMP) && ({local_save_flags(flags); 1;})) ||
> +	    !spin_trylock_irqsave(&enable_lock, flags)) {
>   		if (enable_owner == current) {
>   			enable_refcnt++;
>   			__acquire(enable_lock);
> 
