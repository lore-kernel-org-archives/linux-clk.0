Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH] clk: ti: Fix some errors found by static checkers
To: Tony Lindgren <tony@atomide.com>, Stephen Boyd <sboyd@codeaurora.org>
References: <1456858499-28035-1-git-send-email-sboyd@codeaurora.org>
 <20160301235532.GD4469@atomide.com>
CC: Michael Turquette <mturquette@baylibre.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <56D709E9.2050505@ti.com>
Date: Wed, 2 Mar 2016 17:42:33 +0200
MIME-Version: 1.0
In-Reply-To: <20160301235532.GD4469@atomide.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 03/02/2016 01:55 AM, Tony Lindgren wrote:
> * Stephen Boyd <sboyd@codeaurora.org> [160301 10:55]:
>> drivers/clk/ti/clk-814x.c:34:12: warning: symbol 'dm814x_adpll_early_init' was not declared. Should it be static?
>> drivers/clk/ti/clk-814x.c:58:12: warning: symbol 'dm814x_adpll_enable_init_clocks' was not declared. Should it be static?
>> drivers/clk/ti/adpll.c:465 ti_adpll_recalc_rate() warn: should '__readw(d->regs + 20) << 18' be a 64 bit type?
>> drivers/clk/ti/adpll.c:945 ti_adpll_probe() error: we previously assumed 'd->clocks' could be null (see line 921)
>>
>> The last one looks like a real bug because we don't return an
>> error on allocation failure.
>
> Yeah nice, that's a real bug:
>
> Tested-by: Tony Lindgren <tony@atomide.com>
>

Looks good to me also.

Acked-by: Tero Kristo <t-kristo@ti.com>
