Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Murali Karicheri <m-karicheri2@ti.com>, robh+dt@kernel.org,
 pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
 galak@codeaurora.org, ssantosh@kernel.org, sboyd@codeaurora.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux@arm.linux.org.uk,
 linux-arm-kernel@lists.infradead.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1432915453-409-1-git-send-email-m-karicheri2@ti.com>
Cc: "Murali Karicheri" <m-karicheri2@ti.com>
References: <1432915453-409-1-git-send-email-m-karicheri2@ti.com>
Message-ID: <20150618223728.9112.75331@quantum>
Subject: Re: [PATCH 1/2] clk: keystone: add support for post divider register for
 main pll
Date: Thu, 18 Jun 2015 15:37:28 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Murali Karicheri (2015-05-29 09:04:12)
> Main PLL controller has post divider bits in a separate register in
> pll controller. Use the value from this register instead of fixed
> divider when available.
> =

> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>

Applied to clk-next.

Regards,
Mike

> ---
>  .../devicetree/bindings/clock/keystone-pll.txt       |  8 ++++----
>  drivers/clk/keystone/pll.c                           | 20 ++++++++++++++=
++++--
>  2 files changed, 22 insertions(+), 6 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/clock/keystone-pll.txt b/D=
ocumentation/devicetree/bindings/clock/keystone-pll.txt
> index 225990f..47570d2 100644
> --- a/Documentation/devicetree/bindings/clock/keystone-pll.txt
> +++ b/Documentation/devicetree/bindings/clock/keystone-pll.txt
> @@ -15,8 +15,8 @@ Required properties:
>  - compatible : shall be "ti,keystone,main-pll-clock" or "ti,keystone,pll=
-clock"
>  - clocks : parent clock phandle
>  - reg - pll control0 and pll multipler registers
> -- reg-names : control and multiplier. The multiplier is applicable only =
for
> -               main pll clock
> +- reg-names : control, multiplier and post-divider. The multiplier and
> +               post-divider registers are applicable only for main pll c=
lock
>  - fixed-postdiv : fixed post divider value. If absent, use clkod registe=
r bits
>                 for postdiv
>  =

> @@ -25,8 +25,8 @@ Example:
>                 #clock-cells =3D <0>;
>                 compatible =3D "ti,keystone,main-pll-clock";
>                 clocks =3D <&refclksys>;
> -               reg =3D <0x02620350 4>, <0x02310110 4>;
> -               reg-names =3D "control", "multiplier";
> +               reg =3D <0x02620350 4>, <0x02310110 4>, <0x02310108 4>;
> +               reg-names =3D "control", "multiplier", "post-divider";
>                 fixed-postdiv =3D <2>;
>         };
>  =

> diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
> index 0dd8a4b..4a375ea 100644
> --- a/drivers/clk/keystone/pll.c
> +++ b/drivers/clk/keystone/pll.c
> @@ -37,7 +37,8 @@
>   *     Main PLL or any other PLLs in the device such as ARM PLL, DDR PLL
>   *     or PA PLL available on keystone2. These PLLs are controlled by
>   *     this register. Main PLL is controlled by a PLL controller.
> - * @pllm: PLL register map address
> + * @pllm: PLL register map address for multiplier bits
> + * @pllod: PLL register map address for post divider bits
>   * @pll_ctl0: PLL controller map address
>   * @pllm_lower_mask: multiplier lower mask
>   * @pllm_upper_mask: multiplier upper mask
> @@ -53,6 +54,7 @@ struct clk_pll_data {
>         u32 phy_pllm;
>         u32 phy_pll_ctl0;
>         void __iomem *pllm;
> +       void __iomem *pllod;
>         void __iomem *pll_ctl0;
>         u32 pllm_lower_mask;
>         u32 pllm_upper_mask;
> @@ -102,7 +104,11 @@ static unsigned long clk_pllclk_recalc(struct clk_hw=
 *hw,
>                 /* read post divider from od bits*/
>                 postdiv =3D ((val & pll_data->clkod_mask) >>
>                                  pll_data->clkod_shift) + 1;
> -       else
> +       else if (pll_data->pllod) {
> +               postdiv =3D readl(pll_data->pllod);
> +               postdiv =3D ((postdiv & pll_data->clkod_mask) >>
> +                               pll_data->clkod_shift) + 1;
> +       } else
>                 postdiv =3D pll_data->postdiv;
>  =

>         rate /=3D (prediv + 1);
> @@ -172,12 +178,21 @@ static void __init _of_pll_clk_init(struct device_n=
ode *node, bool pllctrl)
>                 /* assume the PLL has output divider register bits */
>                 pll_data->clkod_mask =3D CLKOD_MASK;
>                 pll_data->clkod_shift =3D CLKOD_SHIFT;
> +
> +               /*
> +                * Check if there is an post-divider register. If not
> +                * assume od bits are part of control register.
> +                */
> +               i =3D of_property_match_string(node, "reg-names",
> +                                            "post-divider");
> +               pll_data->pllod =3D of_iomap(node, i);
>         }
>  =

>         i =3D of_property_match_string(node, "reg-names", "control");
>         pll_data->pll_ctl0 =3D of_iomap(node, i);
>         if (!pll_data->pll_ctl0) {
>                 pr_err("%s: ioremap failed\n", __func__);
> +               iounmap(pll_data->pllod);
>                 goto out;
>         }
>  =

> @@ -193,6 +208,7 @@ static void __init _of_pll_clk_init(struct device_nod=
e *node, bool pllctrl)
>                 pll_data->pllm =3D of_iomap(node, i);
>                 if (!pll_data->pllm) {
>                         iounmap(pll_data->pll_ctl0);
> +                       iounmap(pll_data->pllod);
>                         goto out;
>                 }
>         }
> -- =

> 1.9.1
>=20
