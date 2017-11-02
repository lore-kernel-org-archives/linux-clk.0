Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 01:21:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>, Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 2/2] clk: clk-gpio: Request GPIO descriptor as LOW
Message-ID: <20171102082117.GQ11011@codeaurora.org>
References: <20170924161919.24832-1-linus.walleij@linaro.org>
 <20170924161919.24832-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170924161919.24832-2-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/24, Linus Walleij wrote:
> Requesting the GPIOD_OUT_LOW low will make sure the GPIO is
> deasserted when requested. The gpiolib core will make sure that
> if the GPIO line is active low, it will be logically driven high
> when deasserted, see drivers/gpiolib.c gpiod_configure_flags().
> 
> Cc: Sergej Sawazki <ce3a@gmx.de>
> Cc: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
