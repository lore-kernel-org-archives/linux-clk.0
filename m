Return-Path: <sboyd@codeaurora.org>
Date: Thu, 17 Nov 2016 15:04:20 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Stephen Boyd <stephen.boyd@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] clk: efm32gg: Pass correct type to hw provider
 registration
Message-ID: <20161117230420.GQ25626@codeaurora.org>
References: <20161116190932.21767-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20161116190932.21767-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/16, Stephen Boyd wrote:
> Dan Carpenter reports that we're passing a pointer to a pointer
> here when we should just be passing a pointer. Pass the right
> pointer so that the of_clk_hw_onecell_get() sees the appropriate
> data pointer on its end.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Fixes: 9337631f52a8 ("clk: efm32gg: Migrate to clk_hw based OF and registration APIs")
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
