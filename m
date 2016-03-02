Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1456883885.24036.1.camel@mtksdaap41>
Subject: Re: [PATCH 05/41] clk: mediatek: Remove CLK_IS_ROOT
From: James Liao <jamesjj.liao@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Michael Turquette <mturquette@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Date: Wed, 2 Mar 2016 09:58:05 +0800
In-Reply-To: <1456858826-28541-6-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
	 <1456858826-28541-6-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2016-03-01 at 10:59 -0800, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: James Liao <jamesjj.liao@mediatek.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: James Liao <jamesjj.liao@mediatek.com>


Best regards,

James

> ---
>  drivers/clk/mediatek/clk-mtk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 352830369e0e..5ada644e6200 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -58,8 +58,8 @@ void __init mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_fixed_clk *rc = &clks[i];
>  
> -		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent,
> -				rc->parent ? 0 : CLK_IS_ROOT, rc->rate);
> +		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent, 0,
> +					      rc->rate);
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %ld\n",
