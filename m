Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 16:11:11 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 1/3] clk: ux500: move AB8500 sysclk over to PRCMU clk
 driver
Message-ID: <20170127001111.GN8801@codeaurora.org>
References: <20170113150747.30105-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170113150747.30105-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/13, Linus Walleij wrote:
> The AB8500 sysclk is just another PRCMU-controlled clock, there
> is no reason why it should be in the ABx500-controlled part of
> the clock implementation. Doing this and the corresponding device
> tree changes makes USB work on the Ux500 again.
> 
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-ux500 and merged into clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
