Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1530186451-24648-2-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1530186451-24648-1-git-send-email-tdas@codeaurora.org>
 <1530186451-24648-2-git-send-email-tdas@codeaurora.org>
Message-ID: <153111984699.143105.18327452281843047622@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: Add support for RCG to register for DFS
Date: Mon, 09 Jul 2018 00:04:06 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-06-28 04:47:30)
> Dynamic Frequency switch is a feature of clock controller by which request
> from peripherals allows automatic switching frequency of input clock.
> There are various performance levels associated to a root clock generator.
> Register the root clock generators(RCG) to switch to use the dfs clock ops
> in the cases where DFS is enabled.
> The DFS clock ops would at runtime read the clock perf level registers to
> identify the frequencies supported and update the frequency table
> accordingly.

But nobody is really using the frequency table except for
clk_round_rate()? Can you add some comments into the commit text and the
code indicating how it works in hardware? I think the way it works is by
having DFS enabled in the clock controller, and then another register in
the QUP register space controls the index that the clk configures itself
for. But I'm not clear on if the RCG registers are updated when DFS
frequency is set, or if anything is visible from the clk controller
hardware besides being in DFS mode and the frequency plan.

> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 52208d4..25b0560 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -929,3 +938,208 @@ static void clk_rcg2_shared_disable(struct clk_hw *=
hw)
>         .set_rate_and_parent =3D clk_rcg2_shared_set_rate_and_parent,
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
> +
> +/* Common APIs to be used for DFS based RCGR */
> +static int clk_rcg2_calculate_m_and_n(struct clk_hw *hw, u32 *mode,
> +               unsigned long *prate, int level, struct freq_tbl *f)
> +{
> +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> +       struct clk_hw *phw;

Just 'p' for parent is good.

> +       u32 val, mask, cfg, m_off, n_off, offset;
> +       int i, ret, num_parents;
> +
> +       offset =3D SE_PERF_DFSR(level);
> +       ret =3D regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + offset, &cf=
g);
> +       if (ret)
> +               return ret;
> +
> +       mask =3D BIT(rcg->hid_width) - 1;
> +       f->pre_div =3D cfg & mask ? (cfg & mask) : 1;
> +
> +       *mode =3D cfg & CFG_MODE_MASK;
> +       *mode >>=3D CFG_MODE_SHIFT;
> +
> +       cfg &=3D CFG_SRC_SEL_MASK;
> +       cfg >>=3D CFG_SRC_SEL_SHIFT;
> +
> +       num_parents =3D clk_hw_get_num_parents(hw);
> +       for (i =3D 0; i < num_parents; i++) {
> +               if (cfg =3D=3D rcg->parent_map[i].cfg) {
> +                       f->src =3D rcg->parent_map[i].src;
> +                       phw =3D clk_hw_get_parent_by_index(&rcg->clkr.hw,=
 i);
> +                       *prate =3D clk_hw_get_rate(phw);
> +               }
> +       }
> +
> +       if (!*mode)
> +               return 0;
> +
> +       /* Calculate M & N values */
> +       m_off =3D SE_PERF_M_DFSR(level);
> +       n_off =3D SE_PERF_N_DFSR(level);
> +
> +       mask =3D BIT(rcg->mnd_width) - 1;
> +       ret =3D  regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + m_off, &va=
l);

Why weird space before regmap_read?

> +       if (ret) {
> +               pr_err("Failed to read M offset register\n");
> +               return ret;
> +       }
> +       val &=3D mask;
> +       f->m  =3D val;
> +
> +       ret =3D regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + n_off, &val=
);
> +       if (ret) {
> +               pr_err("Failed to read N offset register\n");
> +               return ret;
> +       }
> +       /* val ~(N-M) */
> +       val =3D ~val;
> +       val &=3D mask;
> +       val +=3D f->m;
> +       f->n =3D val;
> +
> +       return 0;
> +}
> +
> +static int clk_rcg2_dfs_populate_freq_table(struct clk_rcg2 *rcg)
> +{
> +       struct freq_tbl *dfs_freq_tbl;
> +       int i, j, ret =3D 0;
> +       unsigned long calc_freq, prate =3D 0;
> +       u32 mode =3D 0;
> +
> +       dfs_freq_tbl =3D kcalloc(MAX_PERF_LEVEL, sizeof(struct freq_tbl),

sizeof(*dfs_freq_tbl) or just call it freq_tbl. We know it's dfs
already.

> +                               GFP_KERNEL);
> +       if (!dfs_freq_tbl)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < MAX_PERF_LEVEL; i++) {
> +               ret =3D clk_rcg2_calculate_m_and_n(&rcg->clkr.hw, &mode, =
&prate,
> +                                                i, &dfs_freq_tbl[i]);

Why can't this function return the frequency? Or 0 if it failed for some
reason?

> +               if (ret) {
> +                       kfree(dfs_freq_tbl);
> +                       return ret;
> +               }
> +
> +               calc_freq =3D calc_rate(prate, dfs_freq_tbl[i].m,
> +                                       dfs_freq_tbl[i].n, mode,
> +                                       dfs_freq_tbl[i].pre_div);

Because this is not so good looking.

> +               /* Check for duplicate frequencies to end table */
> +               for (j =3D 0; j  < i; j++) {

Duplicate space after j here should be cleaned up.

> +                       if (dfs_freq_tbl[j].freq =3D=3D calc_freq)

Is it sometimes a duplicate frequency that came earlier in the table?
Why isn't this just a check for the same frequency in succession while
going through the table? Or even a frequency that's lower than the
previous one?

> +                               goto done;
> +               }
> +
> +               dfs_freq_tbl[i].freq =3D calc_freq;
> +       }
> +done:
> +       rcg->freq_tbl =3D dfs_freq_tbl;
> +
> +       return 0;
> +}
> +
> +static int clk_rcg2_dfs_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
> +{
> +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> +       int ret;
> +
> +       if (rcg->freq_tbl =3D=3D NULL) {

if (!rcg->freq_tbl) is preferred style.

> +               ret =3D clk_rcg2_dfs_populate_freq_table(rcg);
> +               if (ret) {
> +                       pr_err("Failed to update DFS tables\n");

Also print the clk name? Who knows which one this happens for otherwise.

> +                       return ret;
> +               }
> +       }
> +
> +       return clk_rcg2_shared_ops.determine_rate(hw, req);
> +}
> +
> +static int clk_rcg2_dfs_set_rate(struct clk_hw *hw, unsigned long rate,

We can't set the rate? =


> +                                   unsigned long prate)
> +{
> +       return 0;
> +}
> +
> +static unsigned long
> +clk_rcg2_dfs_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)

Huh? How will we know what frequency the clk is running at? We can't?

Why are these even implemented then? Just implement determine_rate() op
so that clk_round_rate() can be called in a loop to figure out the
frequency plan index? Or if the registers are actually updated when QUP
asks for an index, then recalc_rate() should be implemented and the
nocache flag should be added to the clk so we know to recalculate each
time clk_get_rate() is called.

> +{
> +       return 0;
> +}
> +
> +const struct clk_ops clk_rcg2_dfs_ops =3D {

static?

> +       .is_enabled =3D clk_rcg2_is_enabled,
> +       .get_parent =3D clk_rcg2_get_parent,
> +       .recalc_rate =3D clk_rcg2_dfs_recalc_rate,
> +       .determine_rate =3D clk_rcg2_dfs_determine_rate,
> +       .set_rate =3D clk_rcg2_dfs_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_rcg2_dfs_ops);
> +
> +static int clk_rcg2_enable_dfs(struct clk_rcg2 *rcg, struct device *dev)
> +{
> +       struct regmap *regmap;
> +       struct clk_init_data *init;
> +       struct clk_rate_request req =3D { };
> +       u32 val;
> +       int ret;
> +
> +       regmap =3D dev_get_regmap(dev, NULL);
> +       if (!regmap)
> +               return -EINVAL;
> +
> +       init =3D kzalloc(sizeof(struct clk_init_data), GFP_KERNEL);

Use sizeof(*init) so type doesn't matter.

> +       if (!init)
> +               return -ENOMEM;
> +
> +       init->name =3D rcg->clkr.hw.init->name;
> +       init->ops =3D &clk_rcg2_shared_ops;

These should already be done statically.

> +       init->flags =3D rcg->clkr.hw.init->flags;
> +       init->parent_names =3D rcg->clkr.hw.init->parent_names;
> +       init->num_parents =3D rcg->clkr.hw.init->num_parents;
> +       rcg->clkr.hw.init =3D init;

In fact, the whole init structure should just be whatever is there
already.

> +
> +       ret =3D regmap_read(regmap, rcg->cmd_rcgr + SE_CMD_DFSR_OFFSET,
> +                         &val);
> +       if (ret) {
> +               dev_err(dev, "Failed to read DFS enable register\n");

For which clk? And do we even care? The regmap_read most likely never
fails.

> +               return -EINVAL;
> +       }
> +
> +       if (!(val & SE_CMD_DFS_EN))
> +               return 0;
> +
> +       init->ops =3D &clk_rcg2_dfs_ops;
> +       rcg->clkr.hw.init =3D init;

The clks were already registered. I don't know how this works.

> +       rcg->freq_tbl =3D NULL;
> +
> +       /*
> +        * In case the clocks are registered earlier than determine the d=
fs
> +        * rates.
> +        */
> +       if (__clk_lookup(rcg->clkr.hw.init->name))
> +               return clk_rcg2_dfs_determine_rate(&rcg->clkr.hw, &req);

Remove this. Do the DFS enabled probing before registering the clks.

> +
> +       return 0;
> +}
> +
> +int qcom_cc_register_rcg_dfs(struct platform_device *pdev,

Please don't pass the device. Pass the regmap.

> +                           struct clk_rcg2 **rcgs, int num_clks)
> +{
> +       int i, ret =3D 0;
> +
> +       for (i =3D 0; i < num_clks; i++) {
> +               ret =3D clk_rcg2_enable_dfs(rcgs[i], &pdev->dev);
> +               if (ret) {
> +                       const char *name =3D rcgs[i]->clkr.hw.init->name;
> +
> +                       dev_err(&pdev->dev,
> +                               "%s DFS frequencies update failed\n", nam=
e);
> +                       break;
> +               }
> +       }
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_cc_register_rcg_dfs);

> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 39ce64c..958d27c 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -1,15 +1,5 @@
> -/*
> - * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
> - *
> - * This software is licensed under the terms of the GNU General Public
> - * License version 2, as published by the Free Software Foundation, and
> - * may be copied, distributed, and modified under those terms.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - */
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2013-2014, The Linux Foundation. All rights reserved. */
> =

>  #include <linux/export.h>
>  #include <linux/module.h>
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 00196ee..52d2dce 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -1,15 +1,6 @@
> -/*
> - * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> - *
> - * This software is licensed under the terms of the GNU General Public
> - * License version 2, as published by the Free Software Foundation, and
> - * may be copied, distributed, and modified under those terms.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - */
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2014, 2018, The Linux Foundation. All rights reserved. =
*/
> +

Can you split these last two file hunks into another patch to update
common for SPDX? I can apply that without anything else.

>  #ifndef __QCOM_CLK_COMMON_H__
>  #define __QCOM_CLK_COMMON_H__
> =

> @@ -68,5 +59,4 @@ extern int qcom_cc_really_probe(struct platform_device =
*pdev,
>                                 struct regmap *regmap);
>  extern int qcom_cc_probe(struct platform_device *pdev,
>                          const struct qcom_cc_desc *desc);
> -

No.

>  #endif
> --
