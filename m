Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 16:50:51 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 10/16] clk: move checking .git_parent to
 __clk_core_init()
Message-ID: <20160202005051.GO4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-11-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-11-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> The .git_parent is mandatory for multi-parent clocks.  Move the check

s/git/get/

Same for the subject.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index e6e10f5..4ad0a36 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1677,13 +1677,6 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
>  		goto out;
>  	}
>  
> -	if (!core->ops->get_parent) {
> -		WARN(!core->ops->get_parent,
> -			"%s: multi-parent clocks must implement .get_parent\n",
> -			__func__);
> -		goto out;
> -	}
> -
>  	/*
>  	 * Do our best to cache parent clocks in core->parents.  This prevents
>  	 * unnecessary and expensive lookups.  We don't set core->parent here;
> @@ -2315,6 +2308,11 @@ static int __clk_core_init(struct clk_core *core)
>  		goto out;
>  	}
>  
> +	if (core->num_parents > 1 && !core->ops->get_parent) {
> +		pr_err("%s: %s must implement .get_parent as it has multi parents\n",
> +		       __func__, core->name);
> +	}
> +

This would seem to allow a case where we may deref a null
get_parent op if it isn't set and we call __clk_init_parent().
The next patch removes that case by restructuring
__clk_init_parent(), so we should just combine these two patches
together and that theoretical problem goes away.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
