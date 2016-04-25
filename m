Return-Path: <jun.nie@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20160422223601.GV13149@codeaurora.org>
References: <1461292356-26043-1-git-send-email-jun.nie@linaro.org>
	<20160422223601.GV13149@codeaurora.org>
Date: Mon, 25 Apr 2016 14:48:45 +0800
Message-ID: <CABymUCPKfXgxATdvYcMO7bYiNumcV1cmk_A6jtndMHknSTaUyQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Add is_enabled sanity check
From: Jun Nie <jun.nie@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-04-23 6:36 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 04/22, Jun Nie wrote:
>> If .enable and .disable is implemented, we must implement .is_enabled
>> per document. Otherwise, clk_disable_unused_subtree will not disable
>> the unused clock if the .is_enabled is not implemented, unecessary
>> power consumption happens on the clock as a result.
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> ---
>>  drivers/clk/clk.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index f13c3f4..5e63bee 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2526,6 +2526,10 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
>>       int i, ret;
>>       struct clk_core *core;
>>
>> +     if (hw->init->ops->enable && !hw->init->ops->is_enabled)
>> +             pr_warn("Warning: %s %s must implement .is_enabled\n",
>> +                     __func__, hw->init->name);
>> +
>>       core = kzalloc(sizeof(*core), GFP_KERNEL);
>>       if (!core) {
>>               ret = -ENOMEM;
>
> Please move this to the place we check for other clk ops sanity.
Agree.

> Also, any idea how many drivers are not implementing is_enabled
> but are implementing enable/disable?
With grep and manual search the result, more than 30 clk ops in less
than 20 files miss the is_enabled callback.
grep -rw -e ".enable" -e ".is_enabled" drivers/clk/ | sed '/\*/d' | sed '/(/d'

>
> Also, why isn't prepare/unprepare as important?
The table of  clock hardware characteristics in the Document does not
say these two callback are mandatory in any case. Maybe some platform
does not need to prepare clock in a thread context.

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
