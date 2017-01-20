Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170113150842.30250-1-linus.walleij@linaro.org>
References: <20170113150842.30250-1-linus.walleij@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Jan 2017 15:18:45 +0100
Message-ID: <CAPDyKFqy1BkAFCQ8S9HdoPyNh1SsSPvM8TmU3RR0jJx8xcvxEA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: ux500: Convert ABx500 clocks to use OF probing
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 13 January 2017 at 16:08, Linus Walleij <linus.walleij@linaro.org> wrote:
> These clocks have been broken for a long time unfortunately, a
> hurdle of misc problems made them stop working at some point
> breaking USB and audio on Ux500.
>
> The platform as such and all "regular" clocks are migrated to
> OF/device tree, so let's migrate also this driver.
>
> With this patch and the corresponding DTS fixes, and a bunch
> of probe deferral fixes, audio starts working again on Ux500.

Nice!

[...]

>
>         /* ab8500_sysclk3 */
>         clk = clk_reg_sysctrl_gate(dev , "ab8500_sysclk3", "ab8500_sysclk",
>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_SYSCLKBUF3REQ,
>                 AB8500_SYSULPCLKCTRL1_SYSCLKBUF3REQ, 0, 0);
> -       clk_register_clkdev(clk, "sysclk", "cg1960_core.0");
> +       ab8500_clks[AB8500_SYSCLK_BUF3] = clk;

The lookup is removed in this change, is it already described in the DTS?

Kind regards
Uffe
