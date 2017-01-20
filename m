Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqy1BkAFCQ8S9HdoPyNh1SsSPvM8TmU3RR0jJx8xcvxEA@mail.gmail.com>
References: <20170113150842.30250-1-linus.walleij@linaro.org> <CAPDyKFqy1BkAFCQ8S9HdoPyNh1SsSPvM8TmU3RR0jJx8xcvxEA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Jan 2017 16:10:13 +0100
Message-ID: <CACRpkdaC+JwtmsJbaNN0nC3d4C5TuOxmp0PxgXWq60AEqa_8aA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: ux500: Convert ABx500 clocks to use OF probing
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 20, 2017 at 3:18 PM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On 13 January 2017 at 16:08, Linus Walleij <linus.walleij@linaro.org> wrote:
>> These clocks have been broken for a long time unfortunately, a
>> hurdle of misc problems made them stop working at some point
>> breaking USB and audio on Ux500.
>>
>> The platform as such and all "regular" clocks are migrated to
>> OF/device tree, so let's migrate also this driver.
>>
>> With this patch and the corresponding DTS fixes, and a bunch
>> of probe deferral fixes, audio starts working again on Ux500.
>
> Nice!
>
> [...]
>
>>
>>         /* ab8500_sysclk3 */
>>         clk = clk_reg_sysctrl_gate(dev , "ab8500_sysclk3", "ab8500_sysclk",
>>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_SYSCLKBUF3REQ,
>>                 AB8500_SYSULPCLKCTRL1_SYSCLKBUF3REQ, 0, 0);
>> -       clk_register_clkdev(clk, "sysclk", "cg1960_core.0");
>> +       ab8500_clks[AB8500_SYSCLK_BUF3] = clk;
>
> The lookup is removed in this change, is it already described in the DTS?

The cg1960 GPS and the AV8100 HDMI encoder (referred to
as I2C device 0-0070) does not have upstream drivers or device
tree bindings, so they were never referenced anywhere actually.

But both are trivial to add to the DTS the day they have an upstream
driver.

Yours,
Linus Walleij
