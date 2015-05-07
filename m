Return-Path: <sboyd@codeaurora.org>
Message-ID: <554AB7E8.1040009@codeaurora.org>
Date: Wed, 06 May 2015 17:55:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Murilo Opsfelder Araujo <mopsfelder@gmail.com>,
 linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org, Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 2/2] drivers: clk: clk.c: Make clk_is_orphan() dependent
 of CONFIG_OF
References: <1430959861-14925-1-git-send-email-mopsfelder@gmail.com> <1430959861-14925-3-git-send-email-mopsfelder@gmail.com>
In-Reply-To: <1430959861-14925-3-git-send-email-mopsfelder@gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 05/06/15 17:51, Murilo Opsfelder Araujo wrote:
> The function clk_is_orphan() is called only by
> __of_clk_get_from_provider(), which depends on CONFIG_OF, so it does
> make sense the move.
>
> This change also gets rid of the following build message when CONFIG_OF
> is not set:
>
> drivers/clk/clk.c:2231:13: warning: ‘clk_is_orphan’ defined but not used [-Wunused-function]
>
> Signed-off-by: Murilo Opsfelder Araujo <mopsfelder@gmail.com>

The patch that introduces this problem is gone now.

> ---
>  drivers/clk/clk.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index a961eb6..d748aa2 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2228,14 +2228,6 @@ static inline void clk_debug_unregister(struct clk_core *core)
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> -static bool clk_is_orphan(const struct clk *clk)
> -{
> -	if (!clk)
> -		return false;
> -
> -	return clk->core->orphan;
> -}
> -
>  /**
>   * __clk_init - initialize the data structures in a struct clk
>   * @dev:	device initializing this clk, placeholder for now
> @@ -2950,6 +2942,14 @@ void of_clk_del_provider(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_clk_del_provider);
>  
> +static bool clk_is_orphan(const struct clk *clk)
> +{
> +	if (!clk)
> +		return false;
> +
> +	return clk->core->orphan;
> +}
> +
>  struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
>  				       const char *dev_id, const char *con_id)
>  {


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
