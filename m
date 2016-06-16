Return-Path: <sboyd@codeaurora.org>
Date: Wed, 15 Jun 2016 17:47:41 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, s.hauer@pengutronix.de,
	jeremy.kerr@canonical.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: fixed-factor: Convert into a module platform
 driver
Message-ID: <20160616004741.GR28218@codeaurora.org>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
 <1465381201-11537-3-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465381201-11537-3-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/08, Ricardo Ribalda Delgado wrote:
>  	if (of_property_read_u32(node, "clock-mult", &mult)) {
>  		pr_err("%s Fixed factor clock <%s> must have a clock-mult property\n",
>  			__func__, node->name);
> -		return;
> +		return ERR_PTR(-EIO);
>  	}
>  
>  	of_property_read_string(node, "clock-output-names", &clk_name);
> @@ -171,8 +172,67 @@ void __init of_fixed_factor_clk_setup(struct device_node *node)
>  					mult, div);
>  	if (!IS_ERR(clk))
>  		of_clk_add_provider(node, of_clk_src_simple_get, clk);

What if this fails now?

> +
> +	return clk;
> +}
> +
[..]
> +
> +static const struct of_device_id of_fixed_factor_clk_ids[] = {
> +	{
> +		.compatible = "fixed-factor-clock",
> +	},
> +	{ },
> +};

Nitpick: Do it this way:

  static const struct of_device_id of_fixed_factor_clk_ids[] = {
	{ .compatible = "fixed-factor-clock" },
	{ }
  };

> +MODULE_DEVICE_TABLE(of, of_fixed_factor_clk_ids);
> +
> +static struct platform_driver of_fixed_factor_clk_driver = {
> +	.driver = {
> +		.name = "of_fixed_factor_clk",
> +		.of_match_table = of_fixed_factor_clk_ids,
> +	},
> +	.probe = of_fixed_factor_clk_probe,
> +	.remove = of_fixed_factor_clk_remove,
> +};
> +
> +module_platform_driver(of_fixed_factor_clk_driver);
> +

This should be builtin_platform_driver() because these are obj-y
right now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
