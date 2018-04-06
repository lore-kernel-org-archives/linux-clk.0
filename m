Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180328025050.221585-2-yixun.lan@amlogic.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Rob Herring <robh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20180328025050.221585-1-yixun.lan@amlogic.com>
 <20180328025050.221585-2-yixun.lan@amlogic.com>
Message-ID: <152303996277.94378.9360089743935547432@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 1/6] clk: meson: aoclk: refactor common code into dedicated
 file
Date: Fri, 06 Apr 2018 11:39:22 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Yixun Lan (2018-03-27 19:50:45)
> diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aocl=
k.c
> index 9ec23ae9a219..5a922639a264 100644
> --- a/drivers/clk/meson/gxbb-aoclk.c
> +++ b/drivers/clk/meson/gxbb-aoclk.c
> @@ -165,38 +135,39 @@ static int gxbb_aoclkc_probe(struct platform_device=
 *pdev)
>                 return -ENODEV;
>         }
>  =

> -       /* Reset Controller */
> -       rstc->regmap =3D regmap;
> -       rstc->data =3D gxbb_aoclk_reset;
> -       rstc->reset.ops =3D &gxbb_aoclk_reset_ops;
> -       rstc->reset.nr_resets =3D ARRAY_SIZE(gxbb_aoclk_reset);
> -       rstc->reset.of_node =3D dev->of_node;
> -       ret =3D devm_reset_controller_register(dev, &rstc->reset);
> -
> -       /*
> -        * Populate regmap and register all clks
> -        */
> -       for (clkid =3D 0; clkid < ARRAY_SIZE(gxbb_aoclk_gate); clkid++) {
> -               gxbb_aoclk_gate[clkid]->map =3D regmap;
> -
> -               ret =3D devm_clk_hw_register(dev,
> -                                          gxbb_aoclk_onecell_data.hws[cl=
kid]);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         /* Specific clocks */
>         cec_32k_ao.regmap =3D regmap;
>         ret =3D devm_clk_hw_register(dev, &cec_32k_ao.hw);
> -       if (ret)
> +       if (ret) {
> +               dev_err(&pdev->dev, "clk cec_32k_ao register failed.\n");
>                 return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct meson_aoclk_data gxbb_aoclkc_data =3D {

Can this be const?

> +       .reset_reg      =3D AO_RTI_GEN_CNTL_REG0,
> +       .num_reset      =3D ARRAY_SIZE(gxbb_aoclk_reset),
> +       .reset          =3D gxbb_aoclk_reset,
> +       .num_clks       =3D ARRAY_SIZE(gxbb_aoclk_gate),
> +       .clks           =3D gxbb_aoclk_gate,
> +       .hw_data        =3D &gxbb_aoclk_onecell_data,
> +};
> +
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-ao=
clk.c
> new file mode 100644
> index 000000000000..36067c801f7b
> --- /dev/null
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Amlogic Meson-AXG Clock Controller Driver
> + *
> + * Copyright (c) 2016 BayLibre, SAS.
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + *
> + * Copyright (c) 2018 Amlogic, inc.
> + * Author: Qiufang Dai <qiufang.dai@amlogic.com>
> + * Author: Yixun Lan <yixun.lan@amlogic.com>
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/init.h>
> +#include <linux/of_device.h>
> +#include "clk-regmap.h"
> +#include "meson-aoclk.h"
> +
> +static int meson_aoclk_do_reset(struct reset_controller_dev *rcdev,
> +                              unsigned long id)
> +{
> +       struct meson_aoclk_reset_controller *rstc =3D
> +               container_of(rcdev, struct meson_aoclk_reset_controller, =
reset);
> +
> +       return regmap_write(rstc->regmap, rstc->data->reset_reg,
> +                           BIT(rstc->data->reset[id]));
> +}
> +
> +static const struct reset_control_ops meson_aoclk_reset_ops =3D {
> +       .reset =3D meson_aoclk_do_reset,
> +};
> +
> +int meson_aoclkc_probe(struct platform_device *pdev)
> +{
> +       struct meson_aoclk_reset_controller *rstc;
> +       struct meson_aoclk_data *data;
> +       struct device *dev =3D &pdev->dev;
> +       struct regmap *regmap;
> +       int ret, clkid;
> +
> +       data =3D (struct meson_aoclk_data *)
> +               of_device_get_match_data(dev);
> +       if (!data)
> +               return -ENODEV;
> +
> +       rstc =3D devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
> +       if (!rstc)
> +               return -ENOMEM;
> +
> +       regmap =3D syscon_node_to_regmap(of_get_parent(dev->of_node));
> +       if (IS_ERR(regmap)) {
> +               dev_err(dev, "failed to get regmap\n");
> +               return -ENODEV;
> +       }
> +
> +       /* Reset Controller */
> +       rstc->data =3D data;
> +       rstc->regmap =3D regmap;
> +       rstc->reset.ops =3D &meson_aoclk_reset_ops;
> +       rstc->reset.nr_resets =3D data->num_reset,
> +       rstc->reset.of_node =3D dev->of_node;
> +       ret =3D devm_reset_controller_register(dev, &rstc->reset);

Please check the return value here.

> +
> +       /*
> +        * Populate regmap and register all clks
> +        */
> +       for (clkid =3D 0; clkid < data->num_clks; clkid++) {
> +               data->clks[clkid]->map =3D regmap;
> +
> +               ret =3D devm_clk_hw_register(dev, data->hw_data->hws[clki=
d]);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> +               data->hw_data);

Use devm_ variant?

I suppose because code is moving in this patch that it would be better
to make improvements in another patch so that this patch is a pure code
movement change instead of a movement + improvement change.
