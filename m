Return-Path: <shawnguo@kernel.org>
Date: Wed, 2 Mar 2016 10:42:00 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/41] clk: imx: Remove CLK_IS_ROOT
Message-ID: <20160302024200.GX22051@tiger>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-5-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858826-28541-5-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 01, 2016 at 10:59:49AM -0800, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>

> ---
>  drivers/clk/imx/clk.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index c94ac5c26226..d942f5748d08 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -87,7 +87,7 @@ struct clk *imx_clk_fixup_mux(const char *name, void __iomem *reg,
>  
>  static inline struct clk *imx_clk_fixed(const char *name, int rate)
>  {
> -	return clk_register_fixed_rate(NULL, name, NULL, CLK_IS_ROOT, rate);
> +	return clk_register_fixed_rate(NULL, name, NULL, 0, rate);
>  }
>  
>  static inline struct clk *imx_clk_divider(const char *name, const char *parent,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> 
