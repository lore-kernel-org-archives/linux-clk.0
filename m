Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, afaerber@suse.de,
 mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180317100952.28538-5-manivannan.sadhasivam@linaro.org>
Cc: liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com,
 devicetree@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 daniel.thompson@linaro.org, amit.kucheria@linaro.org,
 viresh.kumar@linaro.org, hzhang@ucrobotics.com, bdong@ucrobotics.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, manivannanece23@gmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20180317100952.28538-1-manivannan.sadhasivam@linaro.org>
 <20180317100952.28538-5-manivannan.sadhasivam@linaro.org>
Message-ID: <152150774389.254778.79582051178250322@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5 04/12] clk: actions: Add common clock driver support
Date: Mon, 19 Mar 2018 18:02:23 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Manivannan Sadhasivam (2018-03-17 03:09:44)
> diff --git a/drivers/clk/actions/owl-common.c b/drivers/clk/actions/owl-c=
ommon.c
> new file mode 100644
> index 000000000000..a7cb698fdc86
> --- /dev/null
> +++ b/drivers/clk/actions/owl-common.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// OWL common clock driver
> +//
> +// Copyright (c) 2014 Actions Semi Inc.
> +// Author: David Liu <liuwei@actions-semi.com>
> +//
> +// Copyright (c) 2018 Linaro Ltd.
> +// Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +
> +#include "owl-common.h"
> +
> +static const struct regmap_config owl_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .val_bits       =3D 32,
> +       .max_register   =3D 0xffff,

Is that actually the end?

> +       .fast_io        =3D true,
> +};
> +
> +static void owl_clk_set_regmap(const struct owl_clk_desc *desc,
> +                        struct regmap *regmap)
> +{
> +       int i;
> +       struct owl_clk_common *clks;
> +
> +       for (i =3D 0; i < desc->num_clks; i++) {
> +               clks =3D desc->clks[i];
> +               if (!clks)
> +                       continue;
> +
> +               clks->regmap =3D regmap;
> +       }
> +}
> +
> +int owl_clk_regmap_init(struct platform_device *pdev,
> +                        const struct owl_clk_desc *desc)
> +{
> +       void __iomem *base;
> +       struct device_node *node =3D pdev->dev.of_node;
> +       struct regmap *regmap;
> +
> +       base =3D of_iomap(node, 0);

Please use platform device apis to find and map the ioresources.

> +       regmap =3D devm_regmap_init_mmio(&pdev->dev, base, &owl_regmap_co=
nfig);
> +       if (IS_ERR_OR_NULL(regmap)) {

Isn't it just IS_ERR() for regmap errors?

> +               pr_err("failed to init regmap\n");
> +               return PTR_ERR(regmap);
> +       }
> +
> +       owl_clk_set_regmap(desc, regmap);
> +
> +       return 0;
> +}
> +
> +int owl_clk_probe(struct device *dev, struct clk_hw_onecell_data *hw_clk=
s)
> +{
> +       int i, ret;
> +       struct clk_hw *hw;
> +
> +       for (i =3D 0; i < hw_clks->num; i++) {
> +
> +               hw =3D hw_clks->hws[i];
> +
> +               if (!hw)

Style: Stick that if to the assignment before.

> +                       continue;
> +
> +               ret =3D devm_clk_hw_register(dev, hw);
> +               if (ret) {
> +                       dev_err(dev, "Couldn't register clock %d - %s\n",
> +                               i, hw->init->name);
> +                       return ret;
> +               }
> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, h=
w_clks);
> +       if (ret)
> +               dev_err(dev, "Failed to add clock provider\n");
> +
> +       return ret;
> +}
