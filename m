Return-Path: <sboyd@codeaurora.org>
Message-ID: <55BBB2FC.9030102@codeaurora.org>
Date: Fri, 31 Jul 2015 10:40:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Pawel Moll <pawel.moll@arm.com>
CC: Mike Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 24/26] clk: versatile: Convert to clk_hw based provider
 APIs
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>  <1438362246-6664-25-git-send-email-sboyd@codeaurora.org> <1438362482.2339.89.camel@arm.com>
In-Reply-To: <1438362482.2339.89.camel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/31/2015 10:08 AM, Pawel Moll wrote:
> On Fri, 2015-07-31 at 18:04 +0100, Stephen Boyd wrote:
>> We're removing struct clk from the clk provider API, so switch
>> this code to using the clk_hw based provider APIs.
>>
>> Cc: Pawel Moll <pawel.moll@arm.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> ---
>>   drivers/clk/versatile/clk-sp810.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
>> index 7fbe4d4bf35e..af653bfd4901 100644
>> --- a/drivers/clk/versatile/clk-sp810.c
>> +++ b/drivers/clk/versatile/clk-sp810.c
>> @@ -80,7 +80,7 @@ static int clk_sp810_timerclken_prepare(struct clk_hw *hw)
>>   {
>>   	struct clk_sp810_timerclken *timerclken = to_clk_sp810_timerclken(hw);
>>   	struct clk_sp810 *sp810 = timerclken->sp810;
>> -	struct clk *old_parent = __clk_get_parent(hw->clk);
>> +	struct clk_hw *old_parent = clk_hw_get_parent(hw);
>>   	struct clk *new_parent;
>>   
>>   	if (!sp810->refclk)
> Acked-by: Pawel Moll <pawel.moll@arm.com>
>
> (disclaimer: not tested ;-)
>

Oh yeah this patch is broken... better patch coming soon that will force 
usage of assigned-parents in DT.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
