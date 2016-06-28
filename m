Return-Path: <sboyd@codeaurora.org>
Date: Tue, 28 Jun 2016 11:04:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] clk: fixed-factor: Convert into a module platform
 driver
Message-ID: <20160628180438.GD1521@codeaurora.org>
References: <1466499688-28625-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1466499688-28625-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/21, Ricardo Ribalda Delgado wrote:
> @@ -145,23 +146,24 @@ EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
>  /**
>   * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
>   */
> -void __init of_fixed_factor_clk_setup(struct device_node *node)
> +struct clk *_of_fixed_factor_clk_setup(struct device_node *node)
>  {
>  	struct clk *clk;
>  	const char *clk_name = node->name;
>  	const char *parent_name;
>  	u32 div, mult;
> +	int ret;
>  
>  	if (of_property_read_u32(node, "clock-div", &div)) {
>  		pr_err("%s Fixed factor clock <%s> must have a clock-div property\n",
>  			__func__, node->name);
> -		return;
> +		return ERR_PTR(-EIO);
>  	}
>  
>  	if (of_property_read_u32(node, "clock-mult", &mult)) {
>  		pr_err("%s Fixed factor clock <%s> must have a clock-mult property\n",
>  			__func__, node->name);
> -		return;
> +		return ERR_PTR(-EIO);
>  	}
>  
>  	of_property_read_string(node, "clock-output-names", &clk_name);
> @@ -169,10 +171,71 @@ void __init of_fixed_factor_clk_setup(struct device_node *node)
>  
>  	clk = clk_register_fixed_factor(NULL, clk_name, parent_name, 0,
>  					mult, div);
> -	if (!IS_ERR(clk))
> -		of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +	if (IS_ERR(clk))
> +		return clk;
> +
> +	ret = of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +	if (ret) {
> +		clk_unregister(clk);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return clk;
> +}
> +
> +void __init of_fixed_factor_clk_setup(struct device_node *node)
> +{
> +	if (!_of_fixed_factor_clk_setup(node))
> +		of_node_set_flag(node, OF_POPULATED);

Almost, except that this flag should be set in the common clk
framework and not in each driver. The large majority of cases
will want that. Only a few will want to clear it, and then we can
hide that fact by having a different CLK_OF_DECLARE macro for
them that indicates this. I see these potential users right now,
please double check.

drivers/clk/axis/clk-artpec6.c
drivers/clk/nxp/clk-lpc18xx-creg.c
drivers/clk/samsung/clk-exynos3250.c
drivers/clk/sunxi/clk-mod0.c
drivers/clk/sunxi/clk-sun8i-apb0.c
drivers/clk/ti/clk-dra7-atl.c

This is what I'm talking about. I wonder if there's a better way
to avoid making a closure with macros to set the populated bit.
It would be nice if we had a return value from the init callback,
but we don't.

----8<----
diff --git a/drivers/clk/axis/clk-artpec6.c b/drivers/clk/axis/clk-artpec6.c
index ffc988b098e4..5c196ea2478b 100644
--- a/drivers/clk/axis/clk-artpec6.c
+++ b/drivers/clk/axis/clk-artpec6.c
@@ -113,7 +113,7 @@ static void of_artpec6_clkctrl_setup(struct device_node *np)
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clkdata->clk_data);
 }
 
-CLK_OF_DECLARE(artpec6_clkctrl, "axis,artpec6-clkctrl",
+CLK_OF_DECLARE_DRIVER(artpec6_clkctrl, "axis,artpec6-clkctrl",
 	       of_artpec6_clkctrl_setup);
 
 static int artpec6_clkctrl_probe(struct platform_device *pdev)
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 95b80aeb8c9d..4b808726b25b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3387,6 +3387,8 @@ void __init of_clk_init(const struct of_device_id *matches)
 					&clk_provider_list, node) {
 			if (force || parent_ready(clk_provider->np)) {
 
+				/* Don't populate platform devices */
+				of_node_set_flag(clk_provider->np, OF_POPULATED);
 				clk_provider->clk_init_cb(clk_provider->np);
 				of_clk_set_defaults(clk_provider->np, true);
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index fb39d5add173..abf71c46ca25 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -777,6 +777,14 @@ extern struct of_device_id __clk_of_table;
 
 #define CLK_OF_DECLARE(name, compat, fn) OF_DECLARE_1(clk, name, compat, fn)
 
+#define CLK_OF_DECLARE_DRIVER(name, compat, fn) \
+	static void name##_of_clk_init_driver(struct device_node *np) \
+	{							  \
+		of_node_clear_flag(np, OF_POPULATED);		  \
+		fn(np);						  \
+	}							  \
+	OF_DECLARE_1(clk, name, compat, name##_of_clk_init_driver)
+
 #ifdef CONFIG_OF
 int of_clk_add_provider(struct device_node *np,
 			struct clk *(*clk_src_get)(struct of_phandle_args *args,

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
