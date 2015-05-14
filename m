Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1430565879-28113-6-git-send-email-maxime.ripard@free-electrons.com>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-6-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 14 May 2015 21:43:19 +0800
Message-ID: <CAGb2v65RTFcKAYOsgJo0A8jPKRfuSvHyiX-7KG_qvjMy0uBbZQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] clk: sunxi: mod1 clock support
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 2, 2015 at 7:24 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> From: Emilio L=C3=B3pez <emilio@elopez.com.ar>
>
> The module 1 type of clocks consist of a gate and a mux and are used on
> the audio blocks to mux and gate the PLL2 outputs for AC97, IIS or
> SPDIF. This commit adds support for them on the sunxi clock driver.
>
> Signed-off-by: Emilio L=C3=B3pez <emilio@elopez.com.ar>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/clk/sunxi/Makefile       |  1 +
>  drivers/clk/sunxi/clk-a10-mod1.c | 85 ++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-a10-mod1.c
>
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 6fa845e13067..960eeabc375f 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -5,6 +5,7 @@
>  obj-y +=3D clk-sunxi.o clk-factors.o
>  obj-y +=3D clk-a10-codec.o
>  obj-y +=3D clk-a10-hosc.o
> +obj-y +=3D clk-a10-mod1.o
>  obj-y +=3D clk-a10-pll2.o
>  obj-y +=3D clk-a20-gmac.o
>  obj-y +=3D clk-mod0.o
> diff --git a/drivers/clk/sunxi/clk-a10-mod1.c b/drivers/clk/sunxi/clk-a10=
-mod1.c
> new file mode 100644
> index 000000000000..6fc1b7a6de00
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-a10-mod1.c
> @@ -0,0 +1,85 @@
> +/*
> + * Copyright 2013 Emilio L=C3=B3pez
> + *
> + * Emilio L=C3=B3pez <emilio@elopez.com.ar>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +static DEFINE_SPINLOCK(mod1_lock);
> +
> +#define SUN4I_MOD1_ENABLE      31
> +#define SUN4I_MOD1_MUX         16
> +#define SUN4I_MOD1_MUX_WIDTH   2
> +#define SUN4I_MOD1_MAX_PARENTS 4
> +
> +static void __init sun4i_mod1_clk_setup(struct device_node *node)
> +{
> +       struct clk *clk;
> +       struct clk_mux *mux;
> +       struct clk_gate *gate;
> +       const char *parents[4];
> +       const char *clk_name =3D node->name;
> +       void __iomem *reg;
> +       int i =3D 0;
> +
> +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +       if (IS_ERR(reg))
> +               return;
> +
> +       mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
> +       if (!mux)
> +               goto err_unmap;
> +
> +       gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> +       if (!gate)
> +               goto err_free_mux;
> +
> +       of_property_read_string(node, "clock-output-names", &clk_name);
> +       reg =3D of_iomap(node, 0);

Is this left over from some change?

ChenYu

> +
> +       while (i < SUN4I_MOD1_MAX_PARENTS &&
> +              (parents[i] =3D of_clk_get_parent_name(node, i)) !=3D NULL=
)
> +               i++;
> +
> +       gate->reg =3D reg;
> +       gate->bit_idx =3D SUN4I_MOD1_ENABLE;
> +       gate->lock =3D &mod1_lock;
> +       mux->reg =3D reg;
> +       mux->shift =3D SUN4I_MOD1_MUX;
> +       mux->mask =3D BIT(SUN4I_MOD1_MUX_WIDTH) - 1;
> +       mux->lock =3D &mod1_lock;
> +
> +       clk =3D clk_register_composite(NULL, clk_name, parents, i,
> +                                    &mux->hw, &clk_mux_ops,
> +                                    NULL, NULL,
> +                                    &gate->hw, &clk_gate_ops, 0);
> +       if (IS_ERR(clk))
> +               goto err_free_gate;
> +
> +       of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +       return;
> +
> +err_free_gate:
> +       kfree(gate);
> +err_free_mux:
> +       kfree(mux);
> +err_unmap:
> +       iounmap(reg);
> +}
> +CLK_OF_DECLARE(sun4i_mod1, "allwinner,sun4i-a10-mod1-clk",
> +              sun4i_mod1_clk_setup);
> --
> 2.3.6
>
