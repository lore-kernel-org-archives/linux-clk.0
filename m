Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 09:45:09 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 2/3] clk: let of_clk_get_parent_name() fail for invalid
 clock-indices
Message-ID: <20151120174509.GQ32672@codeaurora.org>
References: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
 <1448004981-11133-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448004981-11133-2-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Masahiro Yamada wrote:
> Currently, of_clk_get_parent_name() returns a wrong parent clock name
> when "clock-indices" property exists and the given index is not found
> in the property.  In this case, NULL should be returned.
> 
> For example,
> 
>         oscillator {
>                 compatible = "myclocktype";
>                 #clock-cells = <1>;
>                 clock-indices = <1>, <3>;
>                 clock-output-names = "clka", "clkb";
>         };
> 
> Currently, of_clk_get_parent_name(np, 0) returns "clka", but should
> return NULL because "clock-indices" does not contain <0>.

What is np pointing at? Something like:

	consumer {
		clocks = <&oscillator 0>;
	};

Which would be invalid DT because oscillator doesn't have an
output for index 0?

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> @@ -3068,17 +3065,20 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>  		return NULL;
>  
>  	index = clkspec.args_count ? clkspec.args[0] : 0;
> -	count = 0;
>  
>  	/* if there is an indices property, use it to transfer the index
>  	 * specified into an array offset for the clock-output-names property.
>  	 */
> -	of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
> -		if (index == pv) {
> -			index = count;
> -			break;
> -		}
> -		count++;
> +	list = of_get_property(clkspec.np, "clock-indices", &len);
> +	if (list) {
> +		len /= sizeof(*list);
> +		for (i = 0; i < len; i++)
> +			if (index == be32_to_cpup(list++)) {
> +				index = i;
> +				break;
> +			}
> +		if (i == len)
> +			return NULL;
>  	}

Why can't we leave everything in place and check count == len at
the end? i.e.

	of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
		if (index == pv) {
			index = count;
			break;
		}
		count++;
	}

	if (count == of_property_count_u32_elems(clkspec.np, "clock-indices"))
		return NULL

?
	
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
