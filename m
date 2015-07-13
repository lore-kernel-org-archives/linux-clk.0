Return-Path: <viresh.kumar@linaro.org>
Return-Path: <viresh.kumar@linaro.org>
Date: Mon, 13 Jul 2015 08:03:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 25/45] clk: socfpga: Remove clk.h include
Message-ID: <20150713023343.GD10415@linux>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
 <1436571223-10959-26-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436571223-10959-26-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 10-07-15, 16:33, Stephen Boyd wrote:
> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Remove the include here because this is a
> provider driver.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/spear/spear1310_clock.c | 1 -
>  drivers/clk/spear/spear1340_clock.c | 1 -
>  drivers/clk/spear/spear3xx_clock.c  | 1 -
>  drivers/clk/spear/spear6xx_clock.c  | 1 -
>  4 files changed, 4 deletions(-)

I hope you have compiled it :)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
