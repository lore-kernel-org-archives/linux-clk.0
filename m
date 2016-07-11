Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, "Chen-Yu Tsai" <wens@csie.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160711203448.18062-1-maxime.ripard@free-electrons.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>
References: <20160711203448.18062-1-maxime.ripard@free-electrons.com>
Message-ID: <146827299405.73491.10992289511594199294@resonance>
Subject: Re: [PATCH 1/2] clk: sunxi-ng: h3: Fix audio clock divider offset
Date: Mon, 11 Jul 2016 14:36:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2016-07-11 13:34:47)
> The code had a typo and got the wrong offset for the hardcoded divider, f=
ix
> that.
> =

> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Reported-by: Jean-Francois Moine <moinejf@free.fr>
> Reported-by: Chen-Yu Tsai <wens@csie.org>

Applied.

Regards,
Mike

> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/c=
cu-sun8i-h3.c
> index bcc0a95549d3..9af359544110 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> @@ -817,8 +817,8 @@ static void __init sun8i_h3_ccu_setup(struct device_n=
ode *node)
>  =

>         /* Force the PLL-Audio-1x divider to 4 */
>         val =3D readl(reg + SUN8I_H3_PLL_AUDIO_REG);
> -       val &=3D ~GENMASK(4, 0);
> -       writel(val | 3, reg + SUN8I_H3_PLL_AUDIO_REG);
> +       val &=3D ~GENMASK(19, 16);
> +       writel(val | (3 << 16), reg + SUN8I_H3_PLL_AUDIO_REG);
>  =

>         sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
>  }
> -- =

> 2.9.0
>=20
