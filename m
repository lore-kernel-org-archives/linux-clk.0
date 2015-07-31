Return-Path: <sboyd@codeaurora.org>
Date: Thu, 30 Jul 2015 23:50:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile/impd1: switch order of CLCD clocks
Message-ID: <20150731065008.GU3159@codeaurora.org>
References: <1438172615-11276-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438172615-11276-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/29, Linus Walleij wrote:
> The CLCD clocks are registered in the wrong order: first the
> APB clock, then the pixelclock. This should be the other way
> around so the driver gets the pixelclock, not the APB clock,
> when it asks for the first clock for the block.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Is this because the consumer driver is calling clk_get() with a
NULL connection id for the pixelclock and then a more specific
connection id for the apb clk? Where's the consumer driver?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
