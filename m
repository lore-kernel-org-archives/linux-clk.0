Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <5591B9AC.7060003@broadcom.com>
Date: Mon, 29 Jun 2015 14:33:32 -0700
From: Ray Jui <rjui@broadcom.com>
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Dan Carpenter <dan.carpenter@oracle.com>
CC: <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Scott Branden <sbranden@broadcom.com>,
	<linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH 2/2] clk: iproc: fix bit manipulation arithmetic
References: <1435613410-18698-1-git-send-email-rjui@broadcom.com> <1435613410-18698-3-git-send-email-rjui@broadcom.com>
In-Reply-To: <1435613410-18698-3-git-send-email-rjui@broadcom.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

+ Michael's new email

On 6/29/2015 2:30 PM, Ray Jui wrote:
> A 32-bit variable should be type casted to 64-bit before arithmetic
> operation and assigning it to a 64-bit variable
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> ---
>  drivers/clk/bcm/clk-iproc-pll.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
> index a8d971b..2dda4e8 100644
> --- a/drivers/clk/bcm/clk-iproc-pll.c
> +++ b/drivers/clk/bcm/clk-iproc-pll.c
> @@ -366,7 +366,7 @@ static unsigned long iproc_pll_recalc_rate(struct clk_hw *hw,
>  	val = readl(pll->pll_base + ctrl->ndiv_int.offset);
>  	ndiv_int = (val >> ctrl->ndiv_int.shift) &
>  		bit_mask(ctrl->ndiv_int.width);
> -	ndiv = ndiv_int << ctrl->ndiv_int.shift;
> +	ndiv = (u64)ndiv_int << ctrl->ndiv_int.shift;
>  
>  	if (ctrl->flags & IPROC_CLK_PLL_HAS_NDIV_FRAC) {
>  		val = readl(pll->pll_base + ctrl->ndiv_frac.offset);
> @@ -374,7 +374,8 @@ static unsigned long iproc_pll_recalc_rate(struct clk_hw *hw,
>  			bit_mask(ctrl->ndiv_frac.width);
>  
>  		if (ndiv_frac != 0)
> -			ndiv = (ndiv_int << ctrl->ndiv_int.shift) | ndiv_frac;
> +			ndiv = ((u64)ndiv_int << ctrl->ndiv_int.shift) |
> +				ndiv_frac;
>  	}
>  
>  	val = readl(pll->pll_base + ctrl->pdiv.offset);
> 
