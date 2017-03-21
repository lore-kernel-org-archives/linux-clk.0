Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>, sboyd@codeaurora.org,
 carlo@caione.org, khilman@baylibre.com
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1489411604-18700-4-git-send-email-narmstrong@baylibre.com>
Cc: "Neil Armstrong" <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1489411604-18700-1-git-send-email-narmstrong@baylibre.com>
 <1489411604-18700-4-git-send-email-narmstrong@baylibre.com>
Message-ID: <149014019624.54062.687648107621865354@resonance>
Subject: Re: [PATCH 3/5] clk: meson-gxbb: Add GXL/GXM GP0 Variant
Date: Tue, 21 Mar 2017 16:49:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Neil,

Quoting Neil Armstrong (2017-03-13 06:26:42)
> @@ -821,6 +893,7 @@ struct pll_params_table gxbb_gp0_params_table[] =3D {
>         &gxbb_hdmi_pll,
>         &gxbb_sys_pll,
>         &gxbb_gp0_pll,
> +       &gxl_gp0_pll,

Is there a reason for adding the pointer to this array here? It seems to
me that the gxbb_gp0_pll and gxl_gp0_pll are mutually exclusive, so
perhaps two different tables should be used?

>  };
>  =

>  static struct meson_clk_mpll *const gxbb_clk_mplls[] =3D {
> @@ -923,6 +996,10 @@ static int gxbb_clkc_probe(struct platform_device *p=
dev)
>         struct clk *parent_clk;
>         struct device *dev =3D &pdev->dev;
>  =

> +       /* Override GP0 clock for GXL/GXM */
> +       if (of_device_is_compatible(dev->of_node, "amlogic,gxl-clkc"))
> +               gxbb_hw_onecell_data.hws[CLKID_GP0_PLL] =3D &gxl_gp0_pll.=
hw;

Similarly, this above is a little ugly compared to dedicated tables for
each variant.

Regards,
Mike

> +
>         /*  Generic clocks and PLLs */
>         clk_base =3D of_iomap(dev->of_node, 0);
>         if (!clk_base) {
> @@ -996,6 +1073,7 @@ static int gxbb_clkc_probe(struct platform_device *p=
dev)
>  =

>  static const struct of_device_id gxbb_clkc_match_table[] =3D {
>         { .compatible =3D "amlogic,gxbb-clkc" },
> +       { .compatible =3D "amlogic,gxl-clkc" },
>         { }
>  };
>  =

> diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
> index 8ee2022..7f99bf6 100644
> --- a/drivers/clk/meson/gxbb.h
> +++ b/drivers/clk/meson/gxbb.h
> @@ -71,6 +71,8 @@
>  #define HHI_GP0_PLL_CNTL2              0x44 /* 0x11 offset in data sheet=
 */
>  #define HHI_GP0_PLL_CNTL3              0x48 /* 0x12 offset in data sheet=
 */
>  #define HHI_GP0_PLL_CNTL4              0x4c /* 0x13 offset in data sheet=
 */
> +#define        HHI_GP0_PLL_CNTL5               0x50 /* 0x14 offset in da=
ta sheet */
> +#define        HHI_GP0_PLL_CNTL1               0x58 /* 0x16 offset in da=
ta sheet */
>  =

>  #define HHI_XTAL_DIVN_CNTL             0xbc /* 0x2f offset in data sheet=
 */
>  #define HHI_TIMER90K                   0xec /* 0x3b offset in data sheet=
 */
> -- =

> 1.9.1
>=20
