Return-Path: <sboyd@codeaurora.org>
Date: Mon, 3 Aug 2015 14:51:29 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] clk/ARM: delete the non-DT U8500 clock implementation
Message-ID: <20150803215129.GD21068@codeaurora.org>
References: <1438262352-29118-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438262352-29118-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/30, Linus Walleij wrote:
> This code is unused and not coming back. Let's kill it off.
> 
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Mike/Ulf: please ACK this so I can take this in through ARM
> SoC.
> ---
>  drivers/clk/ux500/Makefile              |   1 -
>  drivers/clk/ux500/u8500_clk.c           | 526 --------------------------------

There's a patch in -next against this file.

commit a162ca912cf792073b0b2450377fd1cd5d5c6cb5
Author: Stephen Boyd <sboyd@codeaurora.org>
Date:   Fri Jun 19 15:00:46 2015 -0700

    clk: ux500: Remove clk.h and clkdev.h includes

so I wonder why we need to take this patch through arm-soc? Would
an immutable branch from the clk tree work as well?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
