Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1452531716-12149-1-git-send-email-festevam@gmail.com>
Cc: sboyd@codeaurora.org, shawnguo@kernel.org, kernel@pengutronix.de,
 csotoalonso@gmail.com, linux-clk@vger.kernel.org,
 "Fabio Estevam" <fabio.estevam@nxp.com>, stable@vger.kernel.org
References: <1452531716-12149-1-git-send-email-festevam@gmail.com>
Message-ID: <20160113201704.1168.94040@quark.deferred.io>
Subject: Re: [PATCH] clk: clk-imx25: Force LCDC IPG clock to be disabled
Date: Wed, 13 Jan 2016 12:17:04 -0800
List-ID: <linux-clk.vger.kernel.org>

Hi Fabio & company,

Quoting Fabio Estevam (2016-01-11 09:01:56)
> From: Fabio Estevam <fabio.estevam@nxp.com>
> =

> Currently when we boot the kernel on a mx25pdk the LCDC controller
> does not show the Linux logo on boot.
> =

> This problem is well explained by Sascha Hauer:
> =

> "Unfortunately this LCD controller does not have an enable bit. The
> controller starts directly when the clocks are enabled. If the clocks
> are enabled when the controller is not yet programmed with proper
> register values then it just goes into some undefined state. What I
> suspect is that the clocks already were enabled before driver probe,
> presumably by the bootloader, so the controller is already in undefined
> state when entering Linux. Now by dis/enabling the ipg clock you
> effectively reset the controller. Since you have programmed it with
> valid register values in the mean time it starts working after this
> reset."
> =

> So let's guarantee that the clock driver disables LCDC IPG clock at
> the beggining, so that we don't need to rely on the state the
> bootloader left this clock.
> =

> With this change the Linux logo can be seen on boot on a mx25pdk.
> =

> Cc: <stable@vger.kernel.org>
> Suggested-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

A couple of thoughts on this:

1) should you have a reset controller thingy for the LCDC? That might be
a better way to model what's going on.

2) is "resetting" the clock signal something generic that people need?
We could introduce a flag like CLK_RESET_AT_BOOT that calls uses the
top-level API to enable and then disable the clock at registration-time.

Of the two ideas, I prefer #1, so that you can reset the device at
boot-time using the reset framework.

Regards,
Mike

> ---
>  drivers/clk/imx/clk-imx25.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> =

> diff --git a/drivers/clk/imx/clk-imx25.c b/drivers/clk/imx/clk-imx25.c
> index c4c141c..f8619bb 100644
> --- a/drivers/clk/imx/clk-imx25.c
> +++ b/drivers/clk/imx/clk-imx25.c
> @@ -53,6 +53,8 @@
>  =

>  #define ccm(x) (ccm_base + (x))
>  =

> +#define LCDC_IPG       BIT(29)
> +
>  static struct clk_onecell_data clk_data;
>  =

>  static const char *cpu_sel_clks[] =3D { "mpll", "mpll_cpu_3_4", };
> @@ -99,6 +101,7 @@ static struct clk ** const uart_clks[] __initconst =3D=
 {
>  static int __init __mx25_clocks_init(unsigned long osc_rate,
>                                      void __iomem *ccm_base)
>  {
> +       unsigned int reg;
>         BUG_ON(!ccm_base);
>  =

>         clk[dummy] =3D imx_clk_fixed("dummy", 0);
> @@ -232,6 +235,20 @@ static int __init __mx25_clocks_init(unsigned long o=
sc_rate,
>  =

>         imx_check_clocks(clk, ARRAY_SIZE(clk));
>  =

> +       /*
> +        * The LCDC controller does not have an enable bit. The
> +        * controller starts directly when the clocks are enabled.
> +        * If the clocks are enabled when the controller is not yet
> +        * programmed with proper register values (enabled at the
> +        * bootloader, for example) then it just goes into some undefined
> +        * state.
> +        * To avoid this issue, let's directly access CGCR1 register
> +        * and disable the LCDC IPG clock.
> +        */
> +       reg =3D readl(ccm_base + CCM_CGCR1);
> +       reg &=3D ~LCDC_IPG;
> +       writel(reg, ccm_base + CCM_CGCR1);
> +
>         clk_prepare_enable(clk[emi_ahb]);
>  =

>         /* Clock source for gpt must be derived from AHB */
> -- =

> 1.9.1
>=20
