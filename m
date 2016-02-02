Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 16:23:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 06/16] clk: move core->parents allocation to
 clk_register()
Message-ID: <20160202002353.GM4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-7-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-7-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> @@ -2343,26 +2331,15 @@ static int __clk_core_init(struct clk_core *core)
>  				__func__, core->name);
>  
>  	/*
> -	 * Allocate an array of struct clk *'s to avoid unnecessary string
> -	 * look-ups of clk's possible parents.  This can fail for clocks passed
> -	 * in to clk_init during early boot; thus any access to core->parents[]
> -	 * must always check for a NULL pointer and try to populate it if
> -	 * necessary.
> +	 * clk_core_lookup returns NULL for parents that have not been
> +	 * clk_init'd; thus any access to clk->parents[] must check
> +	 * for a NULL pointer.  We can always perform lazy lookups for
> +	 * missing parents later on.
>  	 */
> -	if (core->num_parents > 1) {
> -		core->parents = kcalloc(core->num_parents,
> -					sizeof(*core->parents), GFP_KERNEL);
> -		/*
> -		 * clk_core_lookup returns NULL for parents that have not been
> -		 * clk_init'd; thus any access to clk->parents[] must check
> -		 * for a NULL pointer.  We can always perform lazy lookups for
> -		 * missing parents later on.
> -		 */
> -		if (core->parents)
> -			for (i = 0; i < core->num_parents; i++)
> -				core->parents[i] =
> -					clk_core_lookup(core->parent_names[i]);
> -	}
> +	if (core->parents)

Do we even need this check? From what I can tell it's always true
now even when core->num_parents == 0. Plus we can always do the
for loop and terminate early when core->num_parents == 0.

> +		for (i = 0; i < core->num_parents; i++)
> +			core->parents[i] =
> +				clk_core_lookup(core->parent_names[i]);
>  
>  	core->parent = __clk_init_parent(core);
>  nfo.html

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
