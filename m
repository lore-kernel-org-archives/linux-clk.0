Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Sun, 6 Sep 2015 22:23:15 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 2/8] clk: imx25: retain early UART clocks during
 kernel init
Message-ID: <20150906142315.GA30746@tiger>
References: <1441382419-4343-1-git-send-email-l.stach@pengutronix.de>
 <1441382419-4343-3-git-send-email-l.stach@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1441382419-4343-3-git-send-email-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 04, 2015 at 06:00:13PM +0200, Lucas Stach wrote:
> Make sure to keep UART clocks enabled during kernel init if
> earlyprintk or earlycon are active.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/clk/imx/clk-imx25.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx25.c b/drivers/clk/imx/clk-imx25.c
> index ec1a4c1dacf1..e55acea762fb 100644
> --- a/drivers/clk/imx/clk-imx25.c
> +++ b/drivers/clk/imx/clk-imx25.c
> @@ -86,6 +86,14 @@ enum mx25_clks {
>  
>  static struct clk *clk[clk_max];
>  
> +static struct clk **uart_clks[] __initdata = { &clk[uart_ipg_per],
> +					       &clk[uart1_ipg],
> +					       &clk[uart2_ipg],
> +					       &clk[uart3_ipg],
> +					       &clk[uart4_ipg],
> +					       &clk[uart5_ipg],
> +					       NULL };
> +

I prefer to code it like:

static struct clk **uart_clks[] __initdata = {
	&clk[uart_ipg_per],
	&clk[uart1_ipg],
	&clk[uart2_ipg],
	&clk[uart3_ipg],
	&clk[uart4_ipg],
	&clk[uart5_ipg],
	NULL
};

Other than that, I'm fine with the series.

Shawn

>  static int __init __mx25_clocks_init(unsigned long osc_rate,
>  				     void __iomem *ccm_base)
>  {
> @@ -233,6 +241,8 @@ static int __init __mx25_clocks_init(unsigned long osc_rate,
>  	 */
>  	clk_set_parent(clk[cko_sel], clk[ipg]);
>  
> +	imx_register_uart_clocks(uart_clks);
> +
>  	return 0;
>  }
>  
> -- 
> 2.5.0
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
