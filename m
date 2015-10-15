Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 10:43:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151015104326.6f7e907c@free-electrons.com>
In-Reply-To: <20151014210859.GB4558@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
	<1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
	<20151014170922.3027008a@free-electrons.com>
	<20151014182138.GD26883@codeaurora.org>
	<20151014221733.65507871@free-electrons.com>
	<20151014210859.GB4558@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Stephen,

On Wed, 14 Oct 2015 14:08:59 -0700, Stephen Boyd wrote:

> Here's that untested patch, which we can throw into clk-next for
> v4.4
> 
> -----8<----
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b005f666e3a1..16b86a551bcb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3055,6 +3055,7 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>  	u32 pv;
>  	int rc;
>  	int count;
> +	struct clk *clk;
>  
>  	if (index < 0)
>  		return NULL;
> @@ -3080,8 +3081,25 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>  
>  	if (of_property_read_string_index(clkspec.np, "clock-output-names",
>  					  index,
> -					  &clk_name) < 0)
> -		clk_name = clkspec.np->name;
> +					  &clk_name) < 0) {
> +		/*
> +		 * Best effort to get the name if the clock has been
> +		 * registered with the framework. If the clock isn't
> +		 * registered, we return the node name as the name of
> +		 * the clock as long as #clock-cells = 0.
> +		 */
> +		clk = of_clk_get(np, index);
> +		if (IS_ERR(clk)) {
> +			if (clkspec.args_count == 0)
> +				clk_name = clkspec.np->name;
> +			else
> +				clk_name = NULL;
> +		} else {
> +			clk_name = __clk_get_name(clk);
> +			clk_put(clk);
> +		}
> +	}
> +
>  
>  	of_node_put(clkspec.np);
>  	return clk_name;

It almost worked, but not completely. The issue is that by the time you
call of_clk_get(np, index), index is no longer equal to the value
passed as argument to of_clk_get_parent_name(), it has been modified to
indicate the index of the *parent* clock.

So, after changing your patch to:

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0ebcf44..60d2f62 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3052,9 +3052,11 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
        struct property *prop;
        const char *clk_name;
        const __be32 *vp;
+       int parent_index;
        u32 pv;
        int rc;
        int count;
+       struct clk *clk;
 
        if (index < 0)
                return NULL;
@@ -3064,14 +3066,14 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
        if (rc)
                return NULL;
 
-       index = clkspec.args_count ? clkspec.args[0] : 0;
+       parent_index = clkspec.args_count ? clkspec.args[0] : 0;
        count = 0;
 
        /* if there is an indices property, use it to transfer the index
         * specified into an array offset for the clock-output-names property.
         */
        of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
-               if (index == pv) {
+               if (parent_index == pv) {
                        index = count;
                        break;
                }
@@ -3079,9 +3081,26 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
        }
 
        if (of_property_read_string_index(clkspec.np, "clock-output-names",
-                                         index,
-                                         &clk_name) < 0)
-               clk_name = clkspec.np->name;
+                                         parent_index,
+                                         &clk_name) < 0) {
+               /*
+                * Best effort to get the name if the clock has been
+                * registered with the framework. If the clock isn't
+                * registered, we return the node name as the name of
+                * the clock as long as #clock-cells = 0.
+                */
+               clk = of_clk_get(np, index);
+               if (IS_ERR(clk)) {
+                       if (clkspec.args_count == 0)
+                               clk_name = clkspec.np->name;
+                       else
+                               clk_name = NULL;
+               } else {
+                       clk_name = __clk_get_name(clk);
+                       clk_put(clk);
+               }
+       }
+
 
        of_node_put(clkspec.np);
        return clk_name;

It does work properly for me, on top of 4.3-rc5, without any change to
my Device Tree files.

So, what is the plan now ?

 - Have the minimal fix in drivers/clk/mvebu/clk-cpu.c for 4.3.

 - Have the patch improving the of_clk_get_parent_name() logic merged
   in 4.4 + a revert of the fix done for 4.3 in clk-cpu.c. Unless maybe
   you don't want to clutter the core of the clock framework to handle
   this specific case?

 - Add the clock-output-names to the Marvell EBU Device Tree files, so
   that in a couple of kernel releases we can remove the hacks and rely
   on the generic logic of of_clk_get_parent_name().

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
