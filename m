Return-Path: <ce3a@gmx.de>
Message-ID: <5589E545.8040502@gmx.de>
Date: Wed, 24 Jun 2015 01:01:25 +0200
From: Sergej Sawazki <ce3a@gmx.de>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@linaro.org, jsarha@ti.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] clk: add gpio controlled clock multiplexer
References: <1433706264-30008-1-git-send-email-ce3a@gmx.de> <20150619001916.GB22132@codeaurora.org>
In-Reply-To: <20150619001916.GB22132@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On Thu, 18 Jun 2015 17:19:16 -0700, Stephen Boyd wrote:
> On 06/07, Sergej Sawazki wrote:
>>
>>   .../devicetree/bindings/clock/gpio-mux-clock.txt   |  19 ++
>>   drivers/clk/Makefile                               |   2 +-
>>   drivers/clk/clk-gpio-gate.c                        | 207 -------------
>>   drivers/clk/clk-gpio.c                             | 332 +++++++++++++++++++++
>
> Please don't rename the file in the same commit. First, rename
> the file to clk-gpio.c in one patch, and then add the code for
> the gate in another patch. I applied this patch and undid the
> file rename so I could actually review the changes...
>

Sorry for the inconvenience. I will keep that in mind for v4.

>>   #include <linux/clk-provider.h>
>> -#include <linux/module.h>
>> +#include <linux/export.h>
>>   #include <linux/slab.h>
>> -#include <linux/gpio.h>
>> -#include <linux/gpio/consumer.h>
>
> Seems like an odd removal. Aren't we a gpio consumer?
>

You are right. We are using the gpiod_ functions. I will fix it in v4.

>>   	gpiod_set_value(clk->gpiod, 1);
>> +	pr_debug("%s: %s\n", __clk_get_name(hw->clk), __func__);
>
> Looks like debugging noise, please remove.
>

OK.

>>   	gpiod_set_value(clk->gpiod, 0);
>> +	pr_debug("%s: %s\n", __clk_get_name(hw->clk), __func__);
>
> Ditto.
>

OK.

>> +	gpiod_set_value(clk->gpiod, index);
>> +	pr_debug("%s: %s: index = %d\n",
>> +			__clk_get_name(hw->clk), __func__, index);
>> +
>
> More debug noise? Please remove.
>

OK.

>> +/**
>> + * Register functions for gpio controlled clocks
>> + */
>
> This is not kernel-doc. Just lose the comment.
>

OK.

>> @@ -88,69 +128,107 @@ struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
>>   		err = devm_gpio_request_one(dev, gpio, gpio_flags, name);
>>   	else
>>   		err = gpio_request_one(gpio, gpio_flags, name);
>> -
>>   	if (err) {
>> -		pr_err("%s: %s: Error requesting clock control gpio %u\n",
>> -		       __func__, name, gpio);
>> +		if (err != -EPROBE_DEFER)
>> +			pr_err("%s: %s: Error requesting GPIO %u\n",
>> +					name, __func__, gpio);
>
> These sorts of cleanups could be another patch too after or
> before the file is renamed.
>

I will add it to the v4 patch series.

>> +	if (!IS_ERR(clk)) {
>> +		pr_debug("%s: %s: Successful registration\n", name, __func__);
>
> More noise. Please remove.
>

OK.

>> +/**
>> + * clk_register_gpio - register a gpip clock with the clock framework
>
> s/gpip/gpio/
>

Thanks.

> Needs a () after function name?

To be consistent with the clk_register() comment in clk-provider.h,
I think we should not have a () here. What do you think?

>>
>> -	clk = clk_register_gpio_gate(NULL, clk_name, parent_name, gpio,
>> -					of_flags & OF_GPIO_ACTIVE_LOW, 0);
>> +	parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
>> +	if (!parent_names) {
>> +		kfree(parent_names);
>
> Huh? Didn't alloc just fail?
>

Oops, thanks.

>> + * Setup functions for gpio controlled clocks
>
> Maybe drop this comment too.
>

OK.

>> +CLK_OF_DECLARE(gpio_mux_clk, "gpio-mux-clock", of_gpio_mux_clk_setup);
>>   #endif
>
> Actually I really hate this whole probe defer workaround that we
> have here. It seems like it would be a better approach to turn
> this file into a platform driver that has the two compatibles
> "gpio-gate-clock" and "gpio-mux-clock". Then we can defer probe
> of the driver until the gpio provider is available. It would also
> require us to fix the framework to properly support probe defer
> though, so we shouldn't do this right now. Instead we should do
> it after we fix the framework.
>

Many thanks for your feedback.

Sergej
