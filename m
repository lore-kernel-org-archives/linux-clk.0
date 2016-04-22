Return-Path: <sboyd@codeaurora.org>
Date: Fri, 22 Apr 2016 15:36:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Add is_enabled sanity check
Message-ID: <20160422223601.GV13149@codeaurora.org>
References: <1461292356-26043-1-git-send-email-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461292356-26043-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 04/22, Jun Nie wrote:
> If .enable and .disable is implemented, we must implement .is_enabled
> per document. Otherwise, clk_disable_unused_subtree will not disable
> the unused clock if the .is_enabled is not implemented, unecessary
> power consumption happens on the clock as a result.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/clk/clk.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f13c3f4..5e63bee 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2526,6 +2526,10 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
>  	int i, ret;
>  	struct clk_core *core;
>  
> +	if (hw->init->ops->enable && !hw->init->ops->is_enabled)
> +		pr_warn("Warning: %s %s must implement .is_enabled\n",
> +			__func__, hw->init->name);
> +
>  	core = kzalloc(sizeof(*core), GFP_KERNEL);
>  	if (!core) {
>  		ret = -ENOMEM;

Please move this to the place we check for other clk ops sanity.
Also, any idea how many drivers are not implementing is_enabled
but are implementing enable/disable?

Also, why isn't prepare/unprepare as important?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
