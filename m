Return-Path: <sboyd@codeaurora.org>
Date: Thu, 15 Oct 2015 11:09:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151015180903.GG4558@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
 <20151014170922.3027008a@free-electrons.com>
 <20151014182138.GD26883@codeaurora.org>
 <20151014221733.65507871@free-electrons.com>
 <20151014210859.GB4558@codeaurora.org>
 <20151015104326.6f7e907c@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151015104326.6f7e907c@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/15, Thomas Petazzoni wrote:
> Stephen,
> 
> On Wed, 14 Oct 2015 14:08:59 -0700, Stephen Boyd wrote:
> 
> > Here's that untested patch, which we can throw into clk-next for
> > v4.4
> 
> It almost worked, but not completely. The issue is that by the time you
> call of_clk_get(np, index), index is no longer equal to the value
> passed as argument to of_clk_get_parent_name(), it has been modified to
> indicate the index of the *parent* clock.
> 
> So, after changing your patch to:
[...]
> It does work properly for me, on top of 4.3-rc5, without any change to
> my Device Tree files.

Good catch! Except we don't need to do all that complicated
stuff, right? We can use of_clk_get_from_provider() instead.

---8<----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 16b86a551bcb..648fb2c8904d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3088,7 +3088,7 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 		 * registered, we return the node name as the name of
 		 * the clock as long as #clock-cells = 0.
 		 */
-		clk = of_clk_get(np, index);
+		clk = of_clk_get_from_provider(clkspec);
 		if (IS_ERR(clk)) {
 			if (clkspec.args_count == 0)
 				clk_name = clkspec.np->name;

> 
> So, what is the plan now ?
> 
>  - Have the minimal fix in drivers/clk/mvebu/clk-cpu.c for 4.3.

Yep.

> 
>  - Have the patch improving the of_clk_get_parent_name() logic merged
>    in 4.4 + a revert of the fix done for 4.3 in clk-cpu.c. Unless maybe
>    you don't want to clutter the core of the clock framework to handle
>    this specific case?

Assuming that the patch doesn't cause problems for other
platforms, then I think we'll go with this approach.

> 
>  - Add the clock-output-names to the Marvell EBU Device Tree files, so
>    that in a couple of kernel releases we can remove the hacks and rely
>    on the generic logic of of_clk_get_parent_name().
> 

Naw, let's not change any DT files for this.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
