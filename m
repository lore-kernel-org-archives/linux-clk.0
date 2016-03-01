Return-Path: <boris.brezillon@free-electrons.com>
Date: Tue, 1 Mar 2016 23:15:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/41] clk: at91: Remove CLK_IS_ROOT
Message-ID: <20160301231544.55c502f1@bbrezillon>
In-Reply-To: <1456858826-28541-2-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
	<1456858826-28541-2-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Tue,  1 Mar 2016 10:59:46 -0800
Stephen Boyd <sboyd@codeaurora.org> wrote:

> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/clk/at91/clk-main.c | 2 +-
>  drivers/clk/at91/clk-slow.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
> index b85f43529396..b9bdfd8e4e6f 100644
> --- a/drivers/clk/at91/clk-main.c
> +++ b/drivers/clk/at91/clk-main.c
> @@ -315,7 +315,7 @@ at91_clk_register_main_rc_osc(struct at91_pmc *pmc,
>  	init.ops = &main_rc_osc_ops;
>  	init.parent_names = NULL;
>  	init.num_parents = 0;
> -	init.flags = CLK_IS_ROOT | CLK_IGNORE_UNUSED;
> +	init.flags = CLK_IGNORE_UNUSED;
>  
>  	osc->hw.init = &init;
>  	osc->pmc = pmc;
> diff --git a/drivers/clk/at91/clk-slow.c b/drivers/clk/at91/clk-slow.c
> index 67b304726d06..402b45d38d25 100644
> --- a/drivers/clk/at91/clk-slow.c
> +++ b/drivers/clk/at91/clk-slow.c
> @@ -251,7 +251,7 @@ at91_clk_register_slow_rc_osc(void __iomem *sckcr,
>  	init.ops = &slow_rc_osc_ops;
>  	init.parent_names = NULL;
>  	init.num_parents = 0;
> -	init.flags = CLK_IS_ROOT | CLK_IGNORE_UNUSED;
> +	init.flags = CLK_IGNORE_UNUSED;
>  
>  	osc->hw.init = &init;
>  	osc->sckcr = sckcr;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
