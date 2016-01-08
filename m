Return-Path: <vz@mleia.com>
Message-ID: <568F0684.6060701@mleia.com>
Date: Fri, 08 Jan 2016 02:44:52 +0200
From: Vladimir Zapolskiy <vz@mleia.com>
MIME-Version: 1.0
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-clk@vger.kernel.org
CC: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 01/16] clk: remove unused first argument of
 __clk_init()
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com> <1451298191-30815-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1451298191-30815-2-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi,

the whole series looks very good, also I haven't found any regressions
(tested on imx6q and lpc32xx).

Please feel free to add

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

On 28.12.2015 12:22, Masahiro Yamada wrote:
> The "struct device *dev" is not used at all in this function.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/clk/clk.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 3fba5ac..897e5ae 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2286,13 +2286,12 @@ static inline void clk_debug_unregister(struct clk_core *core)
>  
>  /**
>   * __clk_init - initialize the data structures in a struct clk
> - * @dev:	device initializing this clk, placeholder for now
>   * @clk:	clk being initialized
>   *
>   * Initializes the lists in struct clk_core, queries the hardware for the
>   * parent and rate and sets them both.
>   */
> -static int __clk_init(struct device *dev, struct clk *clk_user)
> +static int __clk_init(struct clk *clk_user)
>  {
>  	int i, ret = 0;
>  	struct clk_core *orphan;
> @@ -2575,7 +2574,7 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
>  		goto fail_parent_names_copy;
>  	}
>  
> -	ret = __clk_init(dev, hw->clk);
> +	ret = __clk_init(hw->clk);
>  	if (!ret)
>  		return hw->clk;
>  
> 

--
With best wishes,
Vladimir
