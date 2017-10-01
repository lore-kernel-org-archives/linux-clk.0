Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170929225346.GN457@codeaurora.org>
References: <20170924161919.24832-1-linus.walleij@linaro.org>
 <20170924161919.24832-2-linus.walleij@linaro.org> <20170929225346.GN457@codeaurora.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 Oct 2017 16:50:19 +0200
Message-ID: <CACRpkdYD_zoyE7nXLZudhtWz-=JJnACe+s1UVOxvDH4vD8ypCA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: clk-gpio: Request GPIO descriptor as LOW
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Sergej Sawazki <ce3a@gmx.de>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sat, Sep 30, 2017 at 12:53 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 09/24, Linus Walleij wrote:
>> Requesting the GPIOD_OUT_LOW low will make sure the GPIO is
>> deasserted when requested. The gpiolib core will make sure that
>> if the GPIO line is active low, it will be logically driven high
>> when deasserted, see drivers/gpiolib.c gpiod_configure_flags().
>>
>> Cc: Sergej Sawazki <ce3a@gmx.de>
>> Cc: Jyri Sarha <jsarha@ti.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/clk/clk-gpio.c | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
>> index 9d057073e110..151513c655c3 100644
>> --- a/drivers/clk/clk-gpio.c
>> +++ b/drivers/clk/clk-gpio.c
>> @@ -109,14 +109,6 @@ static struct clk_hw *clk_register_gpio(struct device *dev, const char *name,
>>       if (!clk_gpio)
>>               return ERR_PTR(-ENOMEM);
>>
>> -     /*
>> -      * Set to disabled no matter what: NOTE if the GPIO line is active low
>> -      * the GPIO descriptor knows this and will set it high to deassert the
>> -      * line. This assumes the GPIO descriptor has been requested using
>> -      * GPIOD_ASIS by the callers so we need to initialize it as disabled here.
>> -      */
>> -     gpiod_set_value(gpiod, 0);
>> -
>
> Is there a reason why we split this patch out and then deleted
> the comment that was introduced in the previous patch? Why not
> combine these two patches into one?

I was worried about the semantic ordering here (in the old code this pulling
low happens at a different point in the sequence) so bisect would find that.

But maybe it's just me being overly cautious.

If you prefer, feel free to squash them when applying.

Yours,
Linus Walleij
