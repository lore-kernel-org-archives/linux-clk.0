Return-Path: <pawel.moll@arm.com>
Message-ID: <1430908303.3314.11.camel@arm.com>
Subject: Re: [PATCH 14/19] clk: versatile: Silence sparse warnings
From: Pawel Moll <pawel.moll@arm.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>
Date: Wed, 06 May 2015 11:31:43 +0100
In-Reply-To: <1430897996-11597-15-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
	 <1430897996-11597-15-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2015-05-06 at 08:39 +0100, Stephen Boyd wrote:
> drivers/clk/versatile/clk-sp810.c:159:29: error: incompatible types for operation (<=)
> drivers/clk/versatile/clk-sp810.c:159:29:    left side has type char const *<noident>
> drivers/clk/versatile/clk-sp810.c:159:29:    right side has type int
> drivers/clk/versatile/clk-sp810.c:159:53: error: incompatible types for operation (<=)
> drivers/clk/versatile/clk-sp810.c:159:53:    left side has type char const *<noident>
> drivers/clk/versatile/clk-sp810.c:159:53:    right side has type int
> rivers/clk/versatile/clk-sp810.c:138:13: warning: symbol 'clk_sp810_of_setup' was not declared. Should it be static?
> 
> Cc: Pawel Moll <pawel.moll@arm.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Pawel Moll <pawel.moll@arm.com>

> @@ -156,7 +156,7 @@ void __init clk_sp810_of_setup(struct device_node *node)
>  			"timclk");
>  	parent_names[1] = of_clk_get_parent_name(node, sp810->timclk_index);
>  
> -	if (parent_names[0] <= 0 || parent_names[1] <= 0) {
> +	if (!parent_names[0] || !parent_names[1]) {
>  		pr_warn("Failed to obtain parent clocks for SP810!\n");
>  		return;
>  	}

I stared at it (and at git blame output) and was thinking what was I
smoking typing the code... Fortunately mail history suggest that I had
"!parent..." in my original patch, and it was modified by Mike ;-) No
harm done :-)

Thanks for fixing this!

Pawel
