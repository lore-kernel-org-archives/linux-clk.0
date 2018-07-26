Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180712211244.11428-3-yixun.lan@amlogic.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20180712211244.11428-1-yixun.lan@amlogic.com>
 <20180712211244.11428-3-yixun.lan@amlogic.com>
Message-ID: <153261840298.48062.2497103873681297587@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 2/2] clk: meson: add sub MMC clock controller driver
Date: Thu, 26 Jul 2018 08:20:02 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Yixun Lan (2018-07-12 14:12:44)
> diff --git a/drivers/clk/meson/mmc-clkc.c b/drivers/clk/meson/mmc-clkc.c
> new file mode 100644
> index 000000000000..36c4c7cd69a6
> --- /dev/null
> +++ b/drivers/clk/meson/mmc-clkc.c
> @@ -0,0 +1,367 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Amlogic Meson MMC Sub Clock Controller Driver
> + *
> + * Copyright (c) 2017 Baylibre SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + *
> + * Copyright (c) 2018 Amlogic, inc.
> + * Author: Yixun Lan <yixun.lan@amlogic.com>
> + */
> +
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/of_device.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,meson-mmc-clkc.h>
> +
> +#include "clkc.h"
> +
> +
> +static struct clk_regmap *
> +mmc_clkc_register_other_clk(struct device *dev, struct regmap *map,
> +                           char *suffix, char *parent_suffix,
> +                           unsigned long flags,
> +                           const struct clk_ops *ops, void *data)
> +{
> +       struct clk_init_data init;
> +       struct clk_regmap *clk;
> +       char *parent;
> +
> +       parent =3D kasprintf(GFP_KERNEL, "%s#%s", dev_name(dev), parent_s=
uffix);
> +       if (!parent)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.ops =3D ops;
> +       init.flags =3D flags;
> +       init.parent_names =3D (const char* const []){ parent, };

Can't this just be &parent?

> +       init.num_parents =3D 1;
> +
> +       clk =3D mmc_clkc_register_clk(dev, map, &init, suffix, data);
> +       if (IS_ERR(clk))
> +               dev_err(dev, "Core %s clock registration failed\n", suffi=
x);
> +
> +       kfree(parent);
> +       return clk;
> +}
> +
> +static int mmc_clkc_probe(struct platform_device *pdev)
> +{
> +       struct clk_hw_onecell_data *onecell_data;
> +       struct device *dev =3D &pdev->dev;
> +       struct mmc_clkc_data *data;
> +       struct regmap *map;
> +       struct clk_regmap *mux, *div, *core, *rx, *tx;
> +
> +       data =3D (struct mmc_clkc_data *)of_device_get_match_data(dev);

This cast is unnecessary. Pleas remove.
