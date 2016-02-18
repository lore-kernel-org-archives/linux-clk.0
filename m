Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT] clk: shmobile: div6: Fix .recalc_rate() using a stale divisor
Date: Thu, 18 Feb 2016 17:03:37 +0200
Message-ID: <2775267.6TSI7JQVto@avalon>
In-Reply-To: <1455805812-7147-1-git-send-email-geert+renesas@glider.be>
References: <1455805812-7147-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Thursday 18 February 2016 15:30:12 Geert Uytterhoeven wrote:
> cpg_div6_clock_set_rate() only programs the new divisor if the clock
> isn't stopped. If the clock is stopped, it will update the cached
> divisor value only, which will be programmed into the clock registers
> when enabling the clock later.
> 
> However, cpg_div6_clock_recalc_rate() reads the divisor from the clock
> registers instead of using the cached value, leading to an incorrect
> result if the clock is currently stopped.
> 
> Make cpg_div6_clock_recalc_rate() use the cached value to fix this.
> 
> Reported-by: Ramesh Shanmugasundaram
> <ramesh.shanmugasundaram@bp.renesas.com>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Ramesh: Can you please give this a try? Thanks!
> ---
>  drivers/clk/shmobile/clk-div6.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/shmobile/clk-div6.c
> b/drivers/clk/shmobile/clk-div6.c index 9999947694509d58..0627860233cbf97e
> 100644
> --- a/drivers/clk/shmobile/clk-div6.c
> +++ b/drivers/clk/shmobile/clk-div6.c
> @@ -82,9 +82,8 @@ static unsigned long cpg_div6_clock_recalc_rate(struct
> clk_hw *hw, unsigned long parent_rate)
>  {
>  	struct div6_clock *clock = to_div6_clock(hw);
> -	unsigned int div = (clk_readl(clock->reg) & CPG_DIV6_DIV_MASK) + 1;
> 
> -	return parent_rate / div;
> +	return parent_rate / clock->div;
>  }
> 
>  static unsigned int cpg_div6_clock_calc_div(unsigned long rate,

-- 
Regards,

Laurent Pinchart
