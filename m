Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 16:27:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: delete old RealView clock implementation
Message-ID: <20170602232722.GF20170@codeaurora.org>
References: <20170512074049.15139-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170512074049.15139-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 05/12, Linus Walleij wrote:
> The old RealView clock implementation is not used anymore
> (nothing in the kernel calls realview_clk_init()) as we have
> moved all clocks over to device tree. Delete it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
