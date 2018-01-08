Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1515405846.5048.89.camel@baylibre.com>
Subject: Re: [PATCH 5/5] clk: qcom: use divider_ro_round_rate helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Sylvain
 Lemieux <slemieux.tyco@gmail.com>, Andy Gross <andy.gross@linaro.org>,
 David Brown <david.brown@linaro.org>
Date: Mon, 08 Jan 2018 11:04:06 +0100
In-Reply-To: <20180105170959.17266-6-jbrunet@baylibre.com>
References: <20180105170959.17266-1-jbrunet@baylibre.com>
	 <20180105170959.17266-6-jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-01-05 at 18:09 +0100, Jerome Brunet wrote:
> There is now an helper function to round the rate when the
> divider is read-only. Let's use it
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/qcom/clk-regmap-divider.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
> index 4e9b8c2c8980..114e36b97255 100644
> --- a/drivers/clk/qcom/clk-regmap-divider.c
> +++ b/drivers/clk/qcom/clk-regmap-divider.c
> @@ -28,22 +28,15 @@ static long div_round_ro_rate(struct clk_hw *hw, unsigned long rate,
>  {
>  	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
>  	struct clk_regmap *clkr = &divider->clkr;
> -	u32 div;
> +	u32 val;
>  	struct clk_hw *hw_parent = clk_hw_get_parent(hw);

forgot to remove this line.

>  
> -	regmap_read(clkr->regmap, divider->reg, &div);
> -	div >>= divider->shift;
> -	div &= BIT(divider->width) - 1;
> -	div += 1;
> -
> -	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> -		if (!hw_parent)
> -			return -EINVAL;
> -
> -		*prate = clk_hw_round_rate(hw_parent, rate * div);
> -	}
> +	regmap_read(clkr->regmap, divider->reg, &val);
> +	val >>= divider->shift;
> +	val &= BIT(divider->width) - 1;
>  
> -	return DIV_ROUND_UP_ULL((u64)*prate, div);
> +	return divider_ro_round_rate(hw, rate, prate, NULL, divider->width,
> +				     CLK_DIVIDER_ROUND_CLOSEST, val);
>  }
>  
>  static long div_round_rate(struct clk_hw *hw, unsigned long rate,
