Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Oct 2015 15:26:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: lpc18xx-ccu: fix potential system hang when
 disabling unused clocks
Message-ID: <20151019222644.GC19782@codeaurora.org>
References: <1440527643-2960-1-git-send-email-manabian@gmail.com>
 <1440527643-2960-2-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440527643-2960-2-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/25, Joachim Eastwood wrote:
> CCU branch clock register must only be accessed while the base
> (parent) clock is running. Access with a disabled base clock
> will cause the system to hang. Fix this issue by adding code
> that check if the parent clock is running in the is_enabled
> clk_ops callback.
> 
> This hang would occur when disabling unused clocks after AMBA
> runtime pm had already disabled some of the clocks.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---
> 
> No changes from v1.
> 
>  drivers/clk/nxp/clk-lpc18xx-ccu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/nxp/clk-lpc18xx-ccu.c b/drivers/clk/nxp/clk-lpc18xx-ccu.c
> index eeaee97da110..1845476e635e 100644
> --- a/drivers/clk/nxp/clk-lpc18xx-ccu.c
> +++ b/drivers/clk/nxp/clk-lpc18xx-ccu.c
> @@ -180,6 +180,20 @@ static void lpc18xx_ccu_gate_disable(struct clk_hw *hw)
>  static int lpc18xx_ccu_gate_is_enabled(struct clk_hw *hw)
>  {
>  	struct clk_gate *gate = to_clk_gate(hw);
> +	struct clk *parent;
> +
> +	/*
> +	 * The branch clock registers are only accessible
> +	 * if the base (parent) clock is enabled. Register
> +	 * access with a disabled base clock will hang the
> +	 * system.
> +	 */
> +	parent = clk_get_parent(hw->clk);

Why not use provider APIs (clk_hw_get_parent and we could add a
clk_hw_is_enabled)? I also wonder why we don't just read the
register directly here instead of going through the framework to
find out if the parent is enabled?

It may also make sense to "optimize" the disable unused code to
do a depth first search for a disabled clock and then disable
clocks from the leaves to the root. That would avoid this problem
right?

> +	if (IS_ERR(parent))
> +		return 0;
> +
> +	if (!__clk_is_enabled(parent))
> +		return 0;
>  
>  	return clk_readl(gate->reg) & LPC18XX_CCU_RUN;
>  }
> -- 
> 1.8.0
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
