Return-Path: <shawnguo@kernel.org>
Date: Wed, 2 Mar 2016 10:42:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 09/41] clk: mxs: Remove CLK_IS_ROOT
Message-ID: <20160302024227.GY22051@tiger>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-10-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858826-28541-10-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 01, 2016 at 10:59:54AM -0800, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>

> ---
>  drivers/clk/mxs/clk.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mxs/clk.h b/drivers/clk/mxs/clk.h
> index a4590956d2a2..5a264a486ad9 100644
> --- a/drivers/clk/mxs/clk.h
> +++ b/drivers/clk/mxs/clk.h
> @@ -38,7 +38,7 @@ struct clk *mxs_clk_frac(const char *name, const char *parent_name,
>  
>  static inline struct clk *mxs_clk_fixed(const char *name, int rate)
>  {
> -	return clk_register_fixed_rate(NULL, name, NULL, CLK_IS_ROOT, rate);
> +	return clk_register_fixed_rate(NULL, name, NULL, 0, rate);
>  }
>  
>  static inline struct clk *mxs_clk_gate(const char *name,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> 
