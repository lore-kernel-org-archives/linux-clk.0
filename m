Return-Path: <Purna.Mandal@microchip.com>
Subject: Re: [PATCH] clk: microchip: Remove CLK_IS_ROOT
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	<mturquette@baylibre.com>
References: <20160601215521.31309-1-sboyd@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Ralf Baechle
	<ralf@linux-mips.org>, <linux-mips@linux-mips.org>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Message-ID: <574FBC18.8070608@microchip.com>
Date: Thu, 2 Jun 2016 10:24:48 +0530
MIME-Version: 1.0
In-Reply-To: <20160601215521.31309-1-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Return-Path: purna.mandal@microchip.com
List-ID: <linux-clk.vger.kernel.org>

On 06/02/2016 03:25 AM, Stephen Boyd wrote:

> This flag is a no-op now (see commit 47b0eeb3dc8a "clk: Deprecate
> CLK_IS_ROOT", 2016-02-02) so remove it.
>
> Cc: Purna Chandra Mandal <purna.mandal@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: <linux-mips@linux-mips.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>
> I'm going to send this to Linus tomorrow or Friday so we can finally
> remove this flag entirely.
>
>  drivers/clk/microchip/clk-pic32mzda.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchip/clk-pic32mzda.c
> index 020a29acc5b0..51f54380474b 100644
> --- a/drivers/clk/microchip/clk-pic32mzda.c
> +++ b/drivers/clk/microchip/clk-pic32mzda.c
> @@ -180,15 +180,15 @@ static int pic32mzda_clk_probe(struct platform_device *pdev)
>  
>  	/* register fixed rate clocks */
>  	clks[POSCCLK] = clk_register_fixed_rate(&pdev->dev, "posc_clk", NULL,
> -						CLK_IS_ROOT, 24000000);
> +						0, 24000000);
>  	clks[FRCCLK] =  clk_register_fixed_rate(&pdev->dev, "frc_clk", NULL,
> -						CLK_IS_ROOT, 8000000);
> +						0, 8000000);
>  	clks[BFRCCLK] = clk_register_fixed_rate(&pdev->dev, "bfrc_clk", NULL,
> -						CLK_IS_ROOT, 8000000);
> +						0, 8000000);
>  	clks[LPRCCLK] = clk_register_fixed_rate(&pdev->dev, "lprc_clk", NULL,
> -						CLK_IS_ROOT, 32000);
> +						0, 32000);
>  	clks[UPLLCLK] = clk_register_fixed_rate(&pdev->dev, "usbphy_clk", NULL,
> -						CLK_IS_ROOT, 24000000);
> +						0, 24000000);
>  	/* fixed rate (optional) clock */
>  	if (of_find_property(np, "microchip,pic32mzda-sosc", NULL)) {
>  		pr_info("pic32-clk: dt requests SOSC.\n");

Tested-by: Purna Chandra Mandal <purna.mandal@microchip.com>
