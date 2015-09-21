Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1442854444-4460-2-git-send-email-l.stach@pengutronix.de>
References: <1442854444-4460-1-git-send-email-l.stach@pengutronix.de>
	<1442854444-4460-2-git-send-email-l.stach@pengutronix.de>
Date: Mon, 21 Sep 2015 14:56:33 -0300
Message-ID: <CAOMZO5CDnRjxzcnxCDgXKN5SVkCxGqR5dMaectdPvVzpsb9=bQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: imx: add common logic to detect early UART usage
From: Fabio Estevam <festevam@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 21, 2015 at 1:53 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
> Both earlycon and eralyprintk depend on the bootloader setup UART

s/eralyprintk/earlyprintk

> clocks being retained. This patch adds the common logic to detect such
> situations and make the information available to the clock drivers, as
> well as adding the facilities to disable those clocks at the end of
> the kernel init.

> +void __init imx_register_uart_clocks(struct clk ** const clks[])
> +{
> +       if (imx_keep_uart_clocks) {
> +               int i;
> +
> +               imx_uart_clocks = clks;
> +               for (i = 0; imx_uart_clocks[i]; i++)
> +                       clk_prepare_enable(*imx_uart_clocks[i]);

It would be better to check the return value from clk_prepare_enable()
and propagate it in the case of error.

> +
> +static int __init imx_clk_disable_uart(void)
> +{
> +       if (imx_keep_uart_clocks && imx_uart_clocks) {
> +               int i;
> +
> +               for (i = 0; imx_uart_clocks[i]; i++)
> +                       clk_disable_unprepare(*imx_uart_clocks[i]);
> +       }
> +
> +       return 0;

This function could be made 'void' instead.
