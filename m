Return-Path: <stern+5ad477ca@rowland.harvard.edu>
Date: Sun, 8 Apr 2018 10:43:21 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
To: Marcin <marcin@ziemianowicz.com>
cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
    Nicolas Ferre <nicolas.ferre@microchip.com>,
    Alexandre Belloni <alexandre.belloni@bootlin.com>,
    Michael Turquette <mturquette@baylibre.com>,
    Stephen Boyd <sboyd@kernel.org>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
     <linux-clk@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
     <linux-kernel@vger.kernel.org>,  <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: at91: Added more information logging.
In-Reply-To: <20180408094330.GA51669@hak8or>
Message-ID: <Pine.LNX.4.44L0.1804081038420.20429-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Sun, 8 Apr 2018, Marcin wrote:

> I noticed that when debugging some USB clocking issue that there weren't
> many ways to tell what the state of the USB clocking system was. This
> adds a few logging statements to see what the relevant code is trying to
> do.
> 
> Signed-off-by: Marcin Ziemianowicz <marcin@ziemianowicz.com>

It seems like you have added more debugging lines than necessary.

> --- a/drivers/usb/host/ohci-at91.c
> +++ b/drivers/usb/host/ohci-at91.c
> @@ -70,11 +70,12 @@ static const struct ohci_driver_overrides ohci_at91_drv_overrides __initconst =
>  
>  /*-------------------------------------------------------------------------*/
>  
> -static void at91_start_clock(struct ohci_at91_priv *ohci_at91)
> +static void at91_start_clock(struct ohci_at91_priv *ohci_at91, struct device *dev)
>  {
>  	if (ohci_at91->clocked)
>  		return;
>  
> +	dev_dbg(dev, "Enabling hclk, iclk, and setting fclk to 48 Mhz\n");

Here you list all the clocks and give one frequency.

>  	clk_set_rate(ohci_at91->fclk, 48000000);
>  	clk_prepare_enable(ohci_at91->hclk);
>  	clk_prepare_enable(ohci_at91->iclk);

> @@ -104,12 +106,19 @@ static void at91_start_hc(struct platform_device *pdev)
>  	/*
>  	 * Start the USB clocks.
>  	 */
> -	at91_start_clock(ohci_at91);
> +	at91_start_clock(ohci_at91, &pdev->dev);
>  
>  	/*
>  	 * The USB host controller must remain in reset.
>  	 */
>  	writel(0, &regs->control);
> +
> +	/*
> +	 * Say what the clocks are set to.
> +	 */
> +	dev_dbg(&pdev->dev, "hclk set to: %lu hz\n", clk_get_rate(ohci_at91->hclk));
> +	dev_dbg(&pdev->dev, "iclk set to: %lu hz\n", clk_get_rate(ohci_at91->iclk));
> +	dev_dbg(&pdev->dev, "fclk set to: %lu hz\n", clk_get_rate(ohci_at91->fclk));

Here you list all the clocks a second time and give all the 
frequencies.

>  }
>  
>  static void at91_stop_hc(struct platform_device *pdev)

Alan Stern
