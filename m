Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
Message-ID: <554A1576.8070007@linaro.org>
Date: Wed, 06 May 2015 08:21:58 -0500
From: Alex Elder <elder@linaro.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
 Mike Turquette <mturquette@linaro.org>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Tim Kryger <tim.kryger@linaro.org>
Subject: Re: [PATCH 04/19] clk: bcm/kona: Silence sparse warnings
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org> <1430897996-11597-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-5-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/06/2015 02:39 AM, Stephen Boyd wrote:
> drivers/clk/bcm/clk-kona.c:1243:16: warning: odd constant _Bool cast (ffffffffffffffea becomes 1)
> 
> Cc: Alex Elder <elder@linaro.org>
> Cc: Tim Kryger <tim.kryger@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Looks good.
Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/clk/bcm/clk-kona.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
> index a0ef4f75d457..79a98506c433 100644
> --- a/drivers/clk/bcm/clk-kona.c
> +++ b/drivers/clk/bcm/clk-kona.c
> @@ -1240,7 +1240,7 @@ static bool __kona_clk_init(struct kona_clk *bcm_clk)
>  	default:
>  		BUG();
>  	}
> -	return -EINVAL;
> +	return false;
>  }
>  
>  /* Set a CCU and all its clocks into their desired initial state */
> 
