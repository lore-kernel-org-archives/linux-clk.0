Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 21:56:48 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151015215648.2024f611@free-electrons.com>
In-Reply-To: <20151015180903.GG4558@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
	<1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
	<20151014170922.3027008a@free-electrons.com>
	<20151014182138.GD26883@codeaurora.org>
	<20151014221733.65507871@free-electrons.com>
	<20151014210859.GB4558@codeaurora.org>
	<20151015104326.6f7e907c@free-electrons.com>
	<20151015180903.GG4558@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Stephen,

On Thu, 15 Oct 2015 11:09:03 -0700, Stephen Boyd wrote:

> Good catch! Except we don't need to do all that complicated
> stuff, right? We can use of_clk_get_from_provider() instead.
> 
> ---8<----
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 16b86a551bcb..648fb2c8904d 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3088,7 +3088,7 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>  		 * registered, we return the node name as the name of
>  		 * the clock as long as #clock-cells = 0.
>  		 */
> -		clk = of_clk_get(np, index);
> +		clk = of_clk_get_from_provider(clkspec);
>  		if (IS_ERR(clk)) {
>  			if (clkspec.args_count == 0)
>  				clk_name = clkspec.np->name;

I'll re-test this solution tomorrow, just to make sure.

> > So, what is the plan now ?
> > 
> >  - Have the minimal fix in drivers/clk/mvebu/clk-cpu.c for 4.3.
> 
> Yep.

I see in your other e-mail that you already applied the fix, so good.

> >  - Have the patch improving the of_clk_get_parent_name() logic merged
> >    in 4.4 + a revert of the fix done for 4.3 in clk-cpu.c. Unless maybe
> >    you don't want to clutter the core of the clock framework to handle
> >    this specific case?
> 
> Assuming that the patch doesn't cause problems for other
> platforms, then I think we'll go with this approach.

Ok. Can you send the patch "properly" so that I can give a formal
Tested-by ?

> >  - Add the clock-output-names to the Marvell EBU Device Tree files, so
> >    that in a couple of kernel releases we can remove the hacks and rely
> >    on the generic logic of of_clk_get_parent_name().
> > 
> 
> Naw, let's not change any DT files for this.

ACK.

Thanks for your help!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
