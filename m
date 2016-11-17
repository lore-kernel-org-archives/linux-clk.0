Return-Path: <sboyd@codeaurora.org>
Date: Thu, 17 Nov 2016 15:04:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jisheng Zhang <jszhang@marvell.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH] clk: berlin: Pass correct type to hw provider
 registration
Message-ID: <20161117230417.GP25626@codeaurora.org>
References: <20161116190847.21417-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161116190847.21417-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/16, Stephen Boyd wrote:
> Dan Carpenter reports that we're passing a pointer to a pointer
> here when we should just be passing a pointer. Pass the right
> pointer so that the of_clk_hw_onecell_get() sees the appropriate
> data pointer on its end.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Jisheng Zhang <jszhang@marvell.com>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Fixes: f6475e298297 ("clk: berlin: Migrate to clk_hw based registration and OF APIs")
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
