Return-Path: <shawnguo@kernel.org>
Date: Sun, 18 Sep 2016 08:17:23 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de,
	kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: imx6: initialize GPU clocks
Message-ID: <20160918001723.GC15478@tiger>
References: <1474017371-28966-1-git-send-email-l.stach@pengutronix.de>
 <1474017371-28966-2-git-send-email-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474017371-28966-2-git-send-email-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 16, 2016 at 11:16:11AM +0200, Lucas Stach wrote:
> Initialize the GPU clock muxes to sane inputs. Until now they have
> not been changed from their default values, which means that both
> GPU3D shader and GPU2D core were fed by clock inputs whose rates
> exceed the maximium allowed frequency of the cores by as much as
> 200MHz.
> 
> This fixes a severe GPU stability issue on i.MX6DL.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/clk/imx/clk-imx6q.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index 64c243173395..751c3e7d5843 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -633,6 +633,24 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
>  	if (IS_ENABLED(CONFIG_PCI_IMX6))
>  		clk_set_parent(clk[IMX6QDL_CLK_LVDS1_SEL], clk[IMX6QDL_CLK_SATA_REF_100M]);
>  
> +	/*
> +	 * Initialize the GPU clock muxes, so that the maximum specified clock
> +	 * rates for the respective SoC are not exceeded.
> +	 */
> +	if (clk_on_imx6dl()) {
> +		clk_set_parent(clk[IMX6QDL_CLK_GPU3D_CORE_SEL],
> +		               clk[IMX6QDL_CLK_PLL2_PFD1_594M]);
> +		clk_set_parent(clk[IMX6QDL_CLK_GPU2D_CORE_SEL],
> +		               clk[IMX6QDL_CLK_PLL2_PFD1_594M]);
> +	} else if (clk_on_imx6q()) {
> +		clk_set_parent(clk[IMX6QDL_CLK_GPU3D_CORE_SEL],
> +		               clk[IMX6QDL_CLK_MMDC_CH0_AXI]);
> +		clk_set_parent(clk[IMX6QDL_CLK_GPU3D_SHADER_SEL],
> +		               clk[IMX6QDL_CLK_PLL2_PFD1_594M]);
> +		clk_set_parent(clk[IMX6QDL_CLK_GPU2D_CORE_SEL],
> +		               clk[IMX6QDL_CLK_PLL3_USB_OTG]);
> +	}
> +

Can we handle these with assigned-clock-parents from device tree?

Shawn

>  	imx_register_uart_clocks(uart_clks);
>  }
>  CLK_OF_DECLARE(imx6q, "fsl,imx6q-ccm", imx6q_clocks_init);
> -- 
> 2.8.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
