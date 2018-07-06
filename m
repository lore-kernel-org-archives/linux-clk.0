Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1530773721-14668-3-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
 Taniya Das <tdas@codeaurora.org>
References: <1530773721-14668-1-git-send-email-tdas@codeaurora.org>
 <1530773721-14668-3-git-send-email-tdas@codeaurora.org>
Message-ID: <153092037708.143105.10977459810239534218@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 2/2] clk: qcom: Add lpass clock controller driver for SDM845
Date: Fri, 06 Jul 2018 16:39:37 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-07-04 23:55:21)
> diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc=
-sdm845.c
> new file mode 100644
> index 0000000..5285b26
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscc-sdm845.c
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,lpass-sdm845.h>
> +
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "common.h"
> +
> +static struct clk_branch gcc_lpass_q6_axi_clk =3D {
> +       .halt_reg =3D 0x0,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x0,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_lpass_q6_axi_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_lpass_sway_clk =3D {
> +       .halt_reg =3D 0x8,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x8,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_lpass_sway_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch lpass_audio_wrapper_aon_clk =3D {
> +       .halt_reg =3D 0x098,
> +       .halt_check =3D BRANCH_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x098,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_audio_wrapper_aon_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch lpass_q6ss_ahbm_aon_clk =3D {
> +       .halt_reg =3D 0x12000,
> +       .halt_check =3D BRANCH_VOTED,

I'll take your word for it.

> +       .clkr =3D {
> +               .enable_reg =3D 0x12000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_q6ss_ahbm_aon_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch lpass_q6ss_ahbs_aon_clk =3D {
> +       .halt_reg =3D 0x1f000,
> +       .halt_check =3D BRANCH_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x1f000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_q6ss_ahbs_aon_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch lpass_qdsp6ss_xo_clk =3D {
> +       .halt_reg =3D 0x18,
> +       .halt_check =3D BRANCH_HALT_SKIP,

Why? Hint, add a comment.

> +       .clkr =3D {
> +               .enable_reg =3D 0x18,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_qdsp6ss_xo_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch lpass_qdsp6ss_sleep_clk =3D {
> +       .halt_reg =3D 0x1c,
> +       .halt_check =3D BRANCH_HALT_SKIP,

Why? Hint, add a comment.

> +       .clkr =3D {
> +               .enable_reg =3D 0x1c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_qdsp6ss_sleep_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch lpass_qdsp6ss_core_clk =3D {
> +       .halt_reg =3D 0x0,
> +       .halt_check =3D BRANCH_HALT_SKIP,

Again.

> +       .clkr =3D {
> +               .enable_reg =3D 0x0,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_qdsp6ss_core_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct regmap_config lpass_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .val_bits       =3D 32,
> +       .fast_io        =3D true,
> +};
> +
> +static struct clk_regmap *lpass_gcc_sdm845_clocks[] =3D {
> +       [GCC_LPASS_Q6_AXI_CLK] =3D &gcc_lpass_q6_axi_clk.clkr,
> +       [GCC_LPASS_SWAY_CLK] =3D &gcc_lpass_sway_clk.clkr,
> +};
> +
> +static const struct qcom_cc_desc lpass_gcc_sdm845_desc =3D {
> +       .config =3D &lpass_regmap_config,
> +       .clks =3D lpass_gcc_sdm845_clocks,
> +       .num_clks =3D ARRAY_SIZE(lpass_gcc_sdm845_clocks),
> +};
> +
> +static struct clk_regmap *lpass_cc_sdm845_clocks[] =3D {
> +       [LPASS_AUDIO_WRAPPER_AON_CLK] =3D &lpass_audio_wrapper_aon_clk.cl=
kr,
> +       [LPASS_Q6SS_AHBM_AON_CLK] =3D &lpass_q6ss_ahbm_aon_clk.clkr,
> +       [LPASS_Q6SS_AHBS_AON_CLK] =3D &lpass_q6ss_ahbs_aon_clk.clkr,

So it's kinda sad that these lists have holes in them and we just waste
space forever the more we add. How about using the same linear array,
but indexing into the array with different offsets based on the start of
the numberspace for those clks? It would mean that adding new clks
wouldn't work, so add all the clks now instead of later.

Otherwise, maybe we need to add support for qcom_cc_desc having two
cells and then indicating which first cell to map into? So the binding
would look like:

	<&lpasscc 0 GCC_LPASS_Q6_AXI_CLK>

	<&lpasscc 1 LPASS_Q6SS_AHBM_AON_CLK>

and our lookup function would need to be different for the multi-cell
thing, but otherwise works and avoids the hole and adding numbers later
problem.

> +};
> +
> +static const struct qcom_cc_desc lpass_cc_sdm845_desc =3D {
> +       .config =3D &lpass_regmap_config,
> +       .clks =3D lpass_cc_sdm845_clocks,
> +       .num_clks =3D ARRAY_SIZE(lpass_cc_sdm845_clocks),
> +};
> +
> +static struct clk_regmap *lpass_qdsp6ss_sdm845_clocks[] =3D {
> +       [LPASS_QDSP6SS_XO_CLK] =3D &lpass_qdsp6ss_xo_clk.clkr,
> +       [LPASS_QDSP6SS_SLEEP_CLK] =3D &lpass_qdsp6ss_sleep_clk.clkr,
> +       [LPASS_QDSP6SS_CORE_CLK] =3D &lpass_qdsp6ss_core_clk.clkr,
> +};
> +
> +static const struct qcom_cc_desc lpass_qdsp6ss_sdm845_desc =3D {
> +       .config =3D &lpass_regmap_config,
> +       .clks =3D lpass_qdsp6ss_sdm845_clocks,
> +       .num_clks =3D ARRAY_SIZE(lpass_qdsp6ss_sdm845_clocks),
> +};
> +
> +static int lpass_clocks_sdm845_probe(struct platform_device *pdev, int i=
ndex,
> +                                    const struct qcom_cc_desc *desc)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +       struct regmap *regmap;
> +       struct resource res;
> +       void __iomem *base;
> +
> +       if (of_address_to_resource(np, index, &res))

Just use platform device APIs instead please.

> +               return -ENOMEM;
> +
> +       base =3D devm_ioremap(&pdev->dev, res.start, resource_size(&res));

And devm_ioremap_resource().

> +       if (IS_ERR(base))
> +               return -ENOMEM;
> +
> +       regmap =3D devm_regmap_init_mmio(&pdev->dev, base, desc->config);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return qcom_cc_really_probe(pdev, desc, regmap);
> +}
> +
> +/* LPASS CC clock controller */
> +static const struct of_device_id lpass_cc_sdm845_match_table[] =3D {
> +       { .compatible =3D "qcom,sdm845-lpasscc" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, lpass_cc_sdm845_match_table);
> +
> +static int lpass_cc_sdm845_probe(struct platform_device *pdev)
> +{
> +       const struct qcom_cc_desc *desc;
> +       struct device_node *np;
> +       int ret, index;
> +
> +       np =3D pdev->dev.of_node;
> +
> +       lpass_regmap_config.name =3D "lpass_gcc";
> +       desc =3D &lpass_gcc_sdm845_desc;
> +       index =3D of_property_match_string(np, "reg-names", "lpass_gcc");
> +
> +       ret =3D lpass_clocks_sdm845_probe(pdev, index, desc);
> +       if (ret)
> +               return ret;
> +
> +       lpass_regmap_config.name =3D "lpass_cc";
> +       desc =3D &lpass_cc_sdm845_desc;
> +       index =3D of_property_match_string(np, "reg-names", "lpass_cc");
> +
> +       ret =3D lpass_clocks_sdm845_probe(pdev, index, desc);
> +       if (ret)
> +               return ret;
> +
> +       lpass_regmap_config.name =3D "lpass_qdsp6ss";
> +       desc =3D &lpass_qdsp6ss_sdm845_desc;
> +       index =3D of_property_match_string(np, "reg-names", "lpass_qdsp6s=
s");

We shouldn't need to do this. Just index them by number and specify that
the order has to be exactly that order. reg-names is supposed to be
optional.

> +
> +       ret =3D lpass_clocks_sdm845_probe(pdev, index, desc);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

Just 'return lpass_clocks_sdm845_probe()'.
