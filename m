Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Mon, 7 Sep 2015 20:52:04 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v3 1/8] clk: imx: add common logic to detect early UART
 usage
Message-ID: <20150907185204.GB14598@pengutronix.de>
References: <1441638573-6701-1-git-send-email-l.stach@pengutronix.de>
 <1441638573-6701-2-git-send-email-l.stach@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1441638573-6701-2-git-send-email-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Hello Lucas,

On Mon, Sep 07, 2015 at 05:09:26PM +0200, Lucas Stach wrote:
> Both earlycon and earlyprintk depend on the bootloader setup UART
> clocks being retained. This patch adds the common logic to detect such
> situations and make the information available to the clock drivers, as
> well as adding the facilities to disable those clocks at the end of
> the kernel init.
> =

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/clk/imx/clk.c | 38 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk.h |  1 +
>  2 files changed, 39 insertions(+)
> =

> diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> index df12b5307175..45a073dab435 100644
> --- a/drivers/clk/imx/clk.c
> +++ b/drivers/clk/imx/clk.c
> @@ -73,3 +73,41 @@ void imx_cscmr1_fixup(u32 *val)
>  	*val ^=3D CSCMR1_FIXUP;
>  	return;
>  }
> +
> +static int imx_keep_uart_clocks __initdata;
> +static struct clk ** const *imx_uart_clocks __initdata;
> +
> +static int __init imx_keep_uart_clocks_param(char *str)
> +{
> +	imx_keep_uart_clocks =3D 1;
> +
> +	return 0;
> +}
> +__setup_param("earlycon", imx_keep_uart_earlycon,
> +	      imx_keep_uart_clocks_param, 0);
> +__setup_param("earlyprintk", imx_keep_uart_earlyprintk,
> +	      imx_keep_uart_clocks_param, 0);
> +
> +void __init imx_register_uart_clocks(struct clk ** const clks[])
> +{
> +	if (imx_keep_uart_clocks) {
> +		int i;
> +
> +		imx_uart_clocks =3D clks;
> +		for (i =3D 0; imx_uart_clocks[i]; i++)
> +			clk_prepare_enable(*imx_uart_clocks[i]);
> +	}
> +}
> +
> +static int __init imx_clk_disable_uart(void)
> +{
> +	if (imx_keep_uart_clocks) {
> +		int i;
> +
> +		for (i =3D 0; imx_uart_clocks[i]; i++)
> +			clk_disable_unprepare(*imx_uart_clocks[i]);
> +	}
> +
> +	return 0;
> +}
> +late_initcall_sync(imx_clk_disable_uart);

I bet you didn't test if this works when earlyprintk (or earlycon) is
provided on the command line but imx_register_uart_clocks isn't called
(e.g. because this is a Samsung CPU running a multiarch kernel).

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
