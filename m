Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: David Lechner <david@lechnology.com>, Stephen Boyd <sboyd@kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20180525181150.17873-7-david@lechnology.com>
Cc: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org,
 brgl@bgdev.pl
References: <20180525181150.17873-1-david@lechnology.com>
 <20180525181150.17873-7-david@lechnology.com>
Message-ID: <20180530194559.982.42844@harbor.lan>
Subject: Re: [PATCH 6/9] clk: davinci: pll: allow dev == NULL
Date: Wed, 30 May 2018 12:46:02 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi David,

Quoting David Lechner (2018-05-25 11:11:47)
> This modifies the TI Davinci PLL clock driver to allow for the case
> when dev =3D=3D NULL. On some (most) SoCs that use this driver, the PLL
> clock needs to be registered during early boot because it is used
> for clocksource/clkevent and there will be no platform device available.

A lot of this stuff feels like a step backwards. E.g:

> diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
> index 23a24c944f1d..2eb981e61185 100644
> --- a/drivers/clk/davinci/pll.c
> +++ b/drivers/clk/davinci/pll.c
> @@ -11,6 +11,7 @@
>  =

>  #include <linux/clk-provider.h>
>  #include <linux/clk.h>
> +#include <linux/clk/davinci.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> @@ -223,6 +224,7 @@ static const struct clk_ops dm365_pll_ops =3D {
>  =

>  /**
>   * davinci_pll_div_register - common *DIV clock implementation
> + * @dev: The PLL platform device or NULL
>   * @name: the clock name
>   * @parent_name: the parent clock name
>   * @reg: the *DIV register
> @@ -240,17 +242,21 @@ static struct clk *davinci_pll_div_register(struct =
device *dev,
>         const struct clk_ops *divider_ops =3D &clk_divider_ops;
>         struct clk_gate *gate;
>         struct clk_divider *divider;
> +       struct clk *clk;
> +       int ret;
>  =

> -       gate =3D devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
> +       gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
>         if (!gate)
>                 return ERR_PTR(-ENOMEM);
>  =

>         gate->reg =3D reg;
>         gate->bit_idx =3D DIV_ENABLE_SHIFT;
>  =

> -       divider =3D devm_kzalloc(dev, sizeof(*divider), GFP_KERNEL);
> -       if (!divider)
> -               return ERR_PTR(-ENOMEM);
> +       divider =3D kzalloc(sizeof(*divider), GFP_KERNEL);
> +       if (!divider) {
> +               ret =3D -ENOMEM;
> +               goto err_free_gate;
> +       }
>  =

>         divider->reg =3D reg;
>         divider->shift =3D DIV_RATIO_SHIFT;

Oh no my poor devm_ helpers!

I understand that we need to support early boot drivers better, so this
patch can be merged.

However I'm curious if you're tracking Bartosz's early_platform_driver
efforts? Converting to that if it is ever merged would likely be
cleaner:

https://lkml.kernel.org/r/20180511162028.20616-1-brgl@bgdev.pl

Best regards,
Mike
