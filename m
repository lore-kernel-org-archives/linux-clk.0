Return-Path: <sboyd@codeaurora.org>
Date: Fri, 5 Jun 2015 18:39:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: qcom: Add support for RCGs with shared
 branches
Message-ID: <20150606013957.GH29237@codeaurora.org>
References: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
 <1433508036-28644-4-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433508036-28644-4-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/05, Georgi Djakov wrote:
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index cb17fd4b193f..60563adad21d 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -47,6 +47,8 @@
>  #define N_REG			0xc
>  #define D_REG			0x10
>  
> +#define XO_FREQ			19200000

Hm.. we don't know that XO is always going to be 19.2 MHz.

> +
>  static int clk_rcg2_is_enabled(struct clk_hw *hw)
>  {
>  	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> @@ -308,6 +310,68 @@ const struct clk_ops clk_rcg2_ro_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg2_ro_ops);
>  
> +static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
> +				    unsigned long parent_rate)
> +{
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	const char *name = __clk_get_name(hw->clk);
> +	int ret, count;
> +	unsigned int cmd = CMD_ROOT_EN;
> +
> +	/* force enable RCG */
> +	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
> +				 cmd, cmd);
> +	if (ret)
> +		return ret;
> +
> +	/* wait for RCG to turn ON */
> +	for (count = 500; count > 0; count--) {
> +		ret = clk_rcg2_is_enabled(hw);
> +		if (ret)
> +			break;
> +		udelay(1);
> +	}
> +	if (!count)
> +		pr_err("%s: RCG did not turn on\n", name);
> +
> +	/* set clock rate */
> +	ret = __clk_rcg2_set_rate(hw, rate);
> +	if (ret)
> +		return ret;
> +
> +	/* clear force enable RCG */
> +	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
> +				 cmd, ~cmd);

The last argument could just be 0, save an instruction.

> +	if (ret)
> +		return ret;
> +
> +	return 0;

This function will become more complicated.

> +}
> +
> +static int clk_rcg2_shared_enable(struct clk_hw *hw)
> +{
> +	unsigned long rate = __clk_get_rate(hw->clk);
> +
> +	return clk_rcg2_shared_set_rate(hw, rate, 0);

And we shouldn't configure the clock to be at any rate besides XO
speed while the clock is off because the other processors may not
be requesting enough voltage to support the clock at whatever
rate we've chosen. So we need to make set_rate() into a caching
operation when the clock is disabled in software's view.

> +}
> +
> +static void clk_rcg2_shared_disable(struct clk_hw *hw)
> +{
> +	/* switch to XO, which is always-on */
> +	clk_rcg2_shared_set_rate(hw, XO_FREQ, 0);

Maybe here we should just "know" that the XO frequency is either
the lowest entry in the frequency table or that it's source 0 and
make up some fake frequency struct to pass around.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
