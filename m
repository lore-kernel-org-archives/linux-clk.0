Return-Path: <jy0922.shim@samsung.com>
Message-id: <55555614.9030800@samsung.com>
Date: Fri, 15 May 2015 11:12:36 +0900
From: Joonyoung Shim <jy0922.shim@samsung.com>
MIME-version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 haojian.zhuang@gmail.com, james.hogan@imgtec.com
Subject: Re: [PATCH 2/2] clk: divider: fix to set parent rate from
 CLK_DIVIDER_READ_ONLY flag
References: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
 <1428392806-14538-2-git-send-email-jy0922.shim@samsung.com>
 <20150512232549.16410.5974@quantum> <20150512235727.GB14873@codeaurora.org>
In-reply-to: <20150512235727.GB14873@codeaurora.org>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi Michael,

On 05/13/2015 08:57 AM, Stephen Boyd wrote:
> On 05/12, Michael Turquette wrote:
>> Quoting Joonyoung Shim (2015-04-07 00:46:46)
>>> The round_rate callback function will returns alway same parent clk rate
>>> of divider with CLK_DIVIDER_READ_ONLY flag. If be used
>>> CLK_SET_RATE_PARENT flag with CLK_DIVIDER_READ_ONLY flag, then never
>>> change parent clk rate anymore.
>>>
>>> From this case, this patch allows to change parent clk rate.
>>>
>>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>>> ---
>>>  drivers/clk/clk-divider.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
>>> index ce34d29a..37e285e 100644
>>> --- a/drivers/clk/clk-divider.c
>>> +++ b/drivers/clk/clk-divider.c
>>> @@ -352,6 +352,11 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>>>                 bestdiv = readl(divider->reg) >> divider->shift;
>>>                 bestdiv &= div_mask(divider->width);
>>>                 bestdiv = _get_div(divider->table, bestdiv, divider->flags);
>>> +
>>> +               if ((__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT))
>>> +                       *prate = __clk_round_rate(__clk_get_parent(hw->clk),
>>> +                                                 rate);
>>> +
>>>                 return DIV_ROUND_UP(*prate, bestdiv);
>>>         }
>>>  
>>> -- 
>>> 1.9.1
>>>
>>
>> Hello Joonyoung Shim,
>>
>> Thanks for reporting the bug and providing a fix!
>>
>> I've come up with an alternative solution to this. This patch should
>> replace both of your patches. Can you test this and see if it fixes the
>> problem for you?
>>

Yes, it works.

>> Thanks,
>> Mike
>>
>>
>>
>> From 655dddad2700a30aaa397cd804422e0d9195efad Mon Sep 17 00:00:00 2001
>> From: Michael Turquette <mturquette@linaro.org>
>> Date: Tue, 12 May 2015 16:13:46 -0700
>> Subject: [PATCH] clk: divider: support read-only dividers
>>
>> An arbitrary clock rate divider may be set out of reset, or perhaps by
>> the bootloader or something other than Linux. In these cases we may want
>> to know the frequency of the clock signal, but we do not want to allow
>> Linux to change it.
>>
>> The CLK_DIVIDER_READ_ONLY flag was intended to express this, but the
>> functionality was missing in the code. Add read-only clk_ops for divider
>> clocks to handle this case.
>>
>> For hardware with fixed dividers it is still best to use the
>> fixed-factor clock type.
>>
>> Reported-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> Signed-off-by: Michael Turquette <mturquette@linaro.org>
>> ---
>>  drivers/clk/clk-divider.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
>> index 25006a8..5d2de26 100644
>> --- a/drivers/clk/clk-divider.c
>> +++ b/drivers/clk/clk-divider.c
>> @@ -412,6 +412,11 @@ const struct clk_ops clk_divider_ops = {
>>  };
>>  EXPORT_SYMBOL_GPL(clk_divider_ops);
>>  
>> +const struct clk_ops clk_divider_ro_ops = {
>> +	.recalc_rate = clk_divider_recalc_rate,
>> +};
>> +EXPORT_SYMBOL_GPL(clk_divider_ro_ops);
>> +
>>  static struct clk *_register_divider(struct device *dev, const char *name,
>>  		const char *parent_name, unsigned long flags,
>>  		void __iomem *reg, u8 shift, u8 width,
>> @@ -437,7 +442,10 @@ static struct clk *_register_divider(struct device *dev, const char *name,
>>  	}
>>  
>>  	init.name = name;
>> -	init.ops = &clk_divider_ops;
>> +	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
>> +		init.ops = &clk_divider_ro_ops;
>> +	else
>> +		init.ops = &clk_divider_ops;
>>  	init.flags = flags | CLK_IS_BASIC;
>>  	init.parent_names = (parent_name ? &parent_name: NULL);
>>  	init.num_parents = (parent_name ? 1 : 0);
>> -- 
> 
> Isn't this sort of reverting commit e6d5e7d90be9 (clk-divider:
> Fix READ_ONLY when divider > 1, 2014-11-14)? 
> 

So i had abandoned to retry commit e6d5e7d90be9.

Thanks.
