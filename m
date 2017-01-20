Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFp_32VjpLqfpoOtWBgtFS=4i_=xv6SN-X13O8mMesca7g@mail.gmail.com>
References: <20170113150747.30105-1-linus.walleij@linaro.org> <CAPDyKFp_32VjpLqfpoOtWBgtFS=4i_=xv6SN-X13O8mMesca7g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Jan 2017 16:12:32 +0100
Message-ID: <CACRpkdbKNP+kVg8BhbfM+T=OYftd0QfHwP-1uYFdBR_=DcozNQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: ux500: move AB8500 sysclk over to PRCMU clk driver
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 20, 2017 at 3:08 PM, Ulf Hansson <ulf.hansson@linaro.org> wrote:

>> -       /* ab8500_sysclk */
>> -       clk = clk_reg_prcmu_gate("ab8500_sysclk", NULL, PRCMU_SYSCLK, 0);
>> -       clk_register_clkdev(clk, "sysclk", "ab8500-usb.0");
>> -       clk_register_clkdev(clk, "sysclk", "ab-iddet.0");
>> -       clk_register_clkdev(clk, "sysclk", "snd-soc-mop500.0");
>> -       clk_register_clkdev(clk, "sysclk", "shrm_bus");
>
> These lookups are removed in this change. Are there already existing
> name lookups already defined in the DTS?

The USB PHY and snd-soc-mop500 lookup are added in
a DTS patch in a separate series.

The ID detection and SHRM drivers are not upstream,
but can easily be bound in the device tree the day they are.

Yours,
Linus Walleij
