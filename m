Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:55:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	broonie@kernel.org, yibin.gong@nxp.com, rjw@rjwysocki.net,
	viresh.kumar@linaro.org, mturquette@baylibre.com,
	shawnguo@kernel.org, fabio.estevam@nxp.com, anson.huang@nxp.com,
	ping.bai@nxp.com, leonard.crestez@nxp.com, octavian.purdila@nxp.com
Subject: Re: [RFC PATCH 2/3] clk: add managed version of clk_bulk_get
Message-ID: <20170422025547.GT7065@codeaurora.org>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
 <1491969809-20154-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1491969809-20154-3-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/12, Dong Aisheng wrote:
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 1d05b66..3fc6010 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -278,11 +278,25 @@ struct clk *clk_get(struct device *dev, const char *id);
>   *
>   * clk_bulk_get should not be called from within interrupt context.
>   */
> -

Should be in previous patch?

>  int __must_check clk_bulk_get(struct device *dev, int num_clks,
>  			      struct clk_bulk_data *clks);
>  
>  /**
> + * devm_clk_bulk_get - managed get multiple clk consumers
> + * @dev: device for clock "consumer"
> + * @num_clks: the number of clk_bulk_data
> + * @clks: the clk_bulk_data table of consumer
> + *
> + * Return 0 on success, an errno on failure.
> + *
> + * This helper function allows drivers to get several regulator

s/regulator/clk/

> + * consumers in one operation with management, the clks will
> + * automatically be freed when the device is unbound.
> + */
> +int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,

Thanks for the __must_check. We need to add more __must_check to
clk APIs.

> +				   struct clk_bulk_data *clks);
> +
> +/**

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
