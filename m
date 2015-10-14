Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1444682610-21482-6-git-send-email-maxime.ripard@free-electrons.com>
References: <1444682610-21482-1-git-send-email-maxime.ripard@free-electrons.com>
 <1444682610-21482-6-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 14 Oct 2015 17:25:13 +0800
Message-ID: <CAGb2v65joK2FBA3L4EQpYdkM6wEdXRqi_N0a0uD0Wi8yX3WLrg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: sunxi: mod1 clock support
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, linux-sunxi <linux-sunxi@googlegroups.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 13, 2015 at 4:43 AM, Maxime Ripard
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
>  drivers/clk/sunxi/clk-a10-mod1.c | 81 ++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-a10-mod1.c
>
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 70a449a419e6..cb4c299214ce 100644
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
> index 000000000000..099dbdab7afe
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-a10-mod1.c
> @@ -0,0 +1,81 @@
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
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
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
> +       of_clk_parent_fill(node, parents, SUN4I_MOD1_MAX_PARENTS);

          i =3D of_clk_parent_fill(node, parents, SUN4I_MOD1_MAX_PARENTS); =
?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

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
> 2.5.3
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
