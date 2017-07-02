Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexey Firago <alexey_firago@mentor.com>, Michael Turquette <mturquette@baylibre.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/8] clk: vc5: Fix trivial typo
Date: Sun, 02 Jul 2017 11:20:46 +0300
Message-ID: <8820228.n1n3Vzy2c2@avalon>
In-Reply-To: <20170701200459.11505-2-marek.vasut+renesas@gmail.com>
References: <20170701200459.11505-1-marek.vasut+renesas@gmail.com> <20170701200459.11505-2-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

Thank you for the patch.

On Saturday 01 Jul 2017 22:04:52 Marek Vasut wrote:
> Fix trivial typo in vc5_clk_out_unprepare() , s/Enable/Disable/ .
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> on Salvator-XS with the display LVDS output.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/clk/clk-versaclock5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index 60bf4afb51bd..d835d48cf14d 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -520,7 +520,7 @@ static void vc5_clk_out_unprepare(struct clk_hw *hw)
>  	struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
>  	struct vc5_driver_data *vc5 = hwdata->vc5;
> 
> -	/* Enable the clock buffer */
> +	/* Disable the clock buffer */
>  	regmap_update_bits(vc5->regmap, VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
>  			   VC5_CLK_OUTPUT_CFG1_EN_CLKBUF, 0);
>  }

-- 
Regards,

Laurent Pinchart
