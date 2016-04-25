Return-Path: <sboyd@codeaurora.org>
Date: Mon, 25 Apr 2016 15:27:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: fix member type of struct clk_hw_onecell_data
Message-ID: <20160425222702.GC29990@codeaurora.org>
References: <1461552642-10732-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461552642-10732-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/25, Masahiro Yamada wrote:
> We cannot assign any value to an array type variable.  So,
> 
>   hw_data->hws = kcalloc(hw_data->num, sizeof(struct clk_hw *),
>                          GFP_KERNEL);
> 
> fails with "invalid use of flexible array member" error.

That's good. We don't want assignment to the hws member of this
structure to happen from an allocation like kcalloc.

> 
> There are two ways to fix this issue.
> 
> [1] Make it a double-pointer
>   struct clk_hw_onecell_data {
>           size_t num;
>           struct clk_hw **hws;
>   };
> 
> This works as struct clk_onecell_data does.

True we could go back to the old style with two allocations.

> 
> [2] Make it a zero-sized array
>   struct clk_hw_onecell_data {
>           size_t num;
>           struct clk_hw *hws[0];
>   };
> 
> This allows one-shot memory allocation like this:
> 
>   hw_data = kmalloc(sizeof(*hw_data) + clk_num * sizeof(struct clk_hw *),
>                     GFP_KERNEL);
> 

Good, that was possible before this patch wasn't it?

> This commit adopts [2] because it looks like Stephen's intention
> (he moved hws[] to the bottom of struct clk_hw_onecell_data).
> 
> Fixes: 0861e5b8cf80 ("clk: Add clk_hw OF clk providers")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

> 
>  include/linux/clk-provider.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index fd2ccd5..1850e25 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -769,7 +769,7 @@ struct clk_onecell_data {
>  
>  struct clk_hw_onecell_data {
>  	size_t num;
> -	struct clk_hw *hws[];
> +	struct clk_hw *hws[0];

I'm totally lost now. Isn't a flex array with [] or with [0] the
same? The latter being a GCC extension while the former being a
C99 standard?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
