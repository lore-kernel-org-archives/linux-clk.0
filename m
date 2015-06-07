Return-Path: <ce3a@gmx.de>
Message-ID: <55749852.70909@gmx.de>
Date: Sun, 07 Jun 2015 21:15:30 +0200
From: Sergej Sawazki <ce3a@gmx.de>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@linaro.org, jsarha@ti.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: add gpio controlled clock multiplexer
References: <1432458082-18299-1-git-send-email-ce3a@gmx.de> <20150604214616.GS676@codeaurora.org>
In-Reply-To: <20150604214616.GS676@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On Thu, 4 Jun 2015 14:46:16 -0700, Stephen Boyd wrote:
> On 05/24, Sergej Sawazki wrote:
>> + * Gpio controlled clock multiplexer implementation
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>
> What's module.h used for? We need export.h for the
> EXPORT_SYMBOL_GPL usage though.
>

I will fix it in v3, thanks.

>> +#include <linux/slab.h>
>> +#include <linux/gpio.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/of_gpio.h>
>
> Do we need the of_gpio include? We can't get everything we need
> from gpio/consumer.h?
>

We need of_gpio.h because of of_gpio_flags, but we can delete
gpio.h and gpio/consumer.h.

>> +	struct clk_init_data init = { NULL };
>
> 	struct clk_init_data init = { }
>
> is preferred style.
>

OK.

>> +	if (dev)
>> +		clk_gpio_mux = devm_kzalloc(dev, sizeof(struct clk_gpio_mux),
>
> 	sizeof(*clk_gpio_mux)
>
> is preferred style
>

OK.

>> +				GFP_KERNEL);
>> +	else
>> +		clk_gpio_mux = kzalloc(sizeof(struct clk_gpio_mux), GFP_KERNEL);
>> +
>
> ditto.
>

OK.

>
> Please find a way to share most of this code with the other gpio
> based clock provider. Putting the two types of gpio clocks into the
> same file would probably work.
>

I will try and resend as v3. Thanks for you comments.

Sergej
