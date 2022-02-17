Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C188C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 17 Feb 2022 23:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiBQX4c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 18:56:32 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:48026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiBQX4b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 18:56:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6ED74F460;
        Thu, 17 Feb 2022 15:56:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 265E5618EC;
        Thu, 17 Feb 2022 23:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819AEC340E8;
        Thu, 17 Feb 2022 23:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645141539;
        bh=hLs9DRhrN1ZZI/uFeTO4EYWxM9Wx/WcVI+n0TQZgMTs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=csuPtoW2gbgERIVyJot2S7I4cb2yubYmzupT9ACHbkwPkM/mZjQ+cVCYzCz2rYFRY
         k2bHkIRGbzuMzlVBB6ujx+0Eez9JodvA+VL+NFZhkIGLbPVSp3myOR57p52T2xQgrJ
         rwmCe2Ag4bTqudiYp6GppB+2JfezXTXpFA5eO5iK26sXehfolVzP+YGOfwU71VTS2w
         +1YqoVsJmg30u70lZDJjlSuFdwAe0oruttcQgq+khzqsqUh0ELe1pFTz+xl9abqg8M
         ET1xiKiOq5hd24uFdzXwgJ9X1BwsTK4yRlF0/940n+XQ3xyOvcQeh89e5RzFsytpcL
         1d9y8VCh+CgVw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220213173310.152230-2-marex@denx.de>
References: <20220213173310.152230-1-marex@denx.de> <20220213173310.152230-2-marex@denx.de>
Subject: Re: [PATCH 2/2] clk: rs9: Add Renesas 9-series PCIe clock generator driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Thu, 17 Feb 2022 15:45:36 -0800
User-Agent: alot/0.10
Message-Id: <20220217234539.819AEC340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-13 09:33:10)
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 6a98291350b64..3ec27842ec779 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_COMMON_CLK_STM32MP157)   +=3D clk-stm32mp1=
.o
>  obj-$(CONFIG_COMMON_CLK_TPS68470)      +=3D clk-tps68470.o
>  obj-$(CONFIG_CLK_TWL6040)              +=3D clk-twl6040.o
>  obj-$(CONFIG_ARCH_VT8500)              +=3D clk-vt8500.o
> +obj-$(CONFIG_COMMON_CLK_RS9_PCIE)      +=3D clk-renesas-pcie.o

Is there a reason it doesn't go into drivers/clk/renesas?

>  obj-$(CONFIG_COMMON_CLK_VC5)           +=3D clk-versaclock5.o
>  obj-$(CONFIG_COMMON_CLK_WM831X)                +=3D clk-wm831x.o
>  obj-$(CONFIG_COMMON_CLK_XGENE)         +=3D clk-xgene.o
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pci=
e.c
> new file mode 100644
> index 0000000000000..0ad132cbe41b8
> --- /dev/null
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -0,0 +1,336 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for Renesas 9-series PCIe clock generator driver
> + *
> + * The following series can be supported:
> + *   - 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ
> + * Currently supported:
> + *   - 9FGV0241
> + *
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <linux/clk.h>

Drop this include please.

> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>

Is this used? If not please remove.

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>

Is this used? If not please remove.

> +#include <linux/rational.h>

Is this used? If not please remove.

> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define RS9_REG_OE                             0x0
> +#define RS9_REG_OE_DIF_OE(n)                   BIT((n) + 1)
> +#define RS9_REG_SS                             0x1
> +#define RS9_REG_SS_AMP_0V6                     0x0
> +#define RS9_REG_SS_AMP_0V7                     0x1
> +#define RS9_REG_SS_AMP_0V8                     0x2
> +#define RS9_REG_SS_AMP_0V9                     0x3
> +#define RS9_REG_SS_AMP_MASK                    0x3
> +#define RS9_REG_SS_SSC_100                     0
> +#define RS9_REG_SS_SSC_M025                    (1 << 3)
> +#define RS9_REG_SS_SSC_M050                    (3 << 3)
> +#define RS9_REG_SS_SSC_MASK                    (3 << 3)
> +#define RS9_REG_SS_SSC_LOCK                    BIT(5)
> +#define RS9_REG_SR                             0x2
> +#define RS9_REG_SR_2V0_DIF(n)                  0
> +#define RS9_REG_SR_3V0_DIF(n)                  BIT((n) + 1)
> +#define RS9_REG_SR_DIF_MASK(n)         BIT((n) + 1)
> +#define RS9_REG_REF                            0x3
> +#define RS9_REG_REF_OE                         BIT(4)
> +#define RS9_REG_REF_OD                         BIT(5)
> +#define RS9_REG_REF_SR_SLOWEST                 0
> +#define RS9_REG_REF_SR_SLOW                    (1 << 6)
> +#define RS9_REG_REF_SR_FAST                    (2 << 6)
> +#define RS9_REG_REF_SR_FASTER                  (3 << 6)
> +#define RS9_REG_VID                            0x5
> +#define RS9_REG_DID                            0x6
> +#define RS9_REG_BCP                            0x7
> +
> +/* Supported Renesas 9-series models. */
> +enum rs9_model {
> +       RENESAS_9FGV0241,
> +};
> +
> +/* Structure to describe features of a particular 9-series model */
> +struct rs9_chip_info {
> +       const enum rs9_model    model;
> +       unsigned int            num_clks;
> +};
> +
> +struct rs9_driver_data {
> +       struct i2c_client       *client;
> +       struct regmap           *regmap;
> +       const struct rs9_chip_info *chip_info;
> +       struct clk              *pin_xin;
> +       struct clk_hw           *clk_dif[2];
> +       u8                      pll_amplitude;
> +       u8                      pll_ssc;
> +       u8                      clk_dif_sr;
> +};
> +
> +/*
> + * Renesas 9-series i2c regmap
> + */
> +static const struct regmap_range rs9_readable_ranges[] =3D {
> +       regmap_reg_range(RS9_REG_OE, RS9_REG_REF),
> +       regmap_reg_range(RS9_REG_VID, RS9_REG_BCP),
> +};
> +
> +static const struct regmap_access_table rs9_readable_table =3D {
> +       .yes_ranges =3D rs9_readable_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(rs9_readable_ranges),
> +};
> +
> +static const struct regmap_range rs9_writeable_ranges[] =3D {
> +       regmap_reg_range(RS9_REG_OE, RS9_REG_REF),
> +       regmap_reg_range(RS9_REG_BCP, RS9_REG_BCP),
> +};
> +
> +static const struct regmap_access_table rs9_writeable_table =3D {
> +       .yes_ranges =3D rs9_writeable_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(rs9_writeable_ranges),
> +};
> +
> +static const struct regmap_config rs9_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .cache_type =3D REGCACHE_RBTREE,
> +       .max_register =3D 0x8,

That's a huge cache!

> +       .rd_table =3D &rs9_readable_table,
> +       .wr_table =3D &rs9_writeable_table,
> +};
> +
> +static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
> +{
> +       struct i2c_client *client =3D rs9->client;
> +       unsigned char *name =3D "DIF0";
> +       struct device_node *np;
> +       int ret;
> +       u32 sr;
> +
> +       /* Set defaults */
> +       rs9->clk_dif_sr &=3D ~RS9_REG_SR_DIF_MASK(idx);
> +       rs9->clk_dif_sr |=3D RS9_REG_SR_3V0_DIF(idx);
> +
> +       name[3] +=3D idx;
> +       np =3D of_get_child_by_name(client->dev.of_node, name);
> +       if (!np)
> +               return 0;
> +
> +       /* Output clock slew rate */
> +       ret =3D of_property_read_u32(np, "renesas,slew-rate", &sr);

Put of_node_put(np) here please

> +       if (!ret) {
> +               if (sr =3D=3D 2000000) {            /* 2V/ns */
> +                       rs9->clk_dif_sr &=3D ~RS9_REG_SR_DIF_MASK(idx);
> +                       rs9->clk_dif_sr |=3D RS9_REG_SR_2V0_DIF(idx);
> +               } else if (sr =3D=3D 3000000) {     /* 3V/ns (default) */
> +                       rs9->clk_dif_sr &=3D ~RS9_REG_SR_DIF_MASK(idx);
> +                       rs9->clk_dif_sr |=3D RS9_REG_SR_3V0_DIF(idx);
> +               } else
> +                       ret =3D dev_err_probe(&client->dev, -EINVAL,
> +                                           "Invalid renesas,slew-rate va=
lue\n");
> +       }
> +
> +       of_node_put(np);
> +
> +       return ret;
> +}
> +
> +static int rs9_get_common_config(struct rs9_driver_data *rs9)
> +{
> +       struct i2c_client *client =3D rs9->client;
> +       struct device_node *np =3D client->dev.of_node;
> +       unsigned int amp, ssc;
> +       int ret;
> +
> +       /* Set defaults */
> +       rs9->pll_amplitude =3D RS9_REG_SS_AMP_0V7;
> +       rs9->pll_ssc =3D RS9_REG_SS_SSC_100;
> +
> +       /* Output clock amplitude */
> +       ret =3D of_property_read_u32(np, "renesas,out-amplitude", &amp);
> +       if (!ret) {
> +               if (amp =3D=3D 600000)      /* 0.6V */
> +                       rs9->pll_amplitude =3D RS9_REG_SS_AMP_0V6;
> +               else if (amp =3D=3D 700000) /* 0.7V (default) */
> +                       rs9->pll_amplitude =3D RS9_REG_SS_AMP_0V7;
> +               else if (amp =3D=3D 800000) /* 0.8V */
> +                       rs9->pll_amplitude =3D RS9_REG_SS_AMP_0V8;
> +               else if (amp =3D=3D 900000) /* 0.9V */
> +                       rs9->pll_amplitude =3D RS9_REG_SS_AMP_0V9;
> +               else
> +                       return dev_err_probe(&client->dev, -EINVAL,
> +                                            "Invalid renesas,out-amplitu=
de value\n");
> +       }
> +
> +       /* Output clock spread spectrum */
> +       ret =3D of_property_read_u32(np, "renesas,out-spread-spectrum", &=
ssc);
> +       if (!ret) {
> +               if (ssc =3D=3D 100000)      /* 100% ... no spread (defaul=
t) */
> +                       rs9->pll_ssc =3D RS9_REG_SS_SSC_100;
> +               else if (ssc =3D=3D 99750)  /* -0.25% ... down spread */
> +                       rs9->pll_ssc =3D RS9_REG_SS_SSC_M025;
> +               else if (ssc =3D=3D 99500)  /* -0.50% ... down spread */
> +                       rs9->pll_ssc =3D RS9_REG_SS_SSC_M050;
> +               else
> +                       return dev_err_probe(&client->dev, -EINVAL,
> +                                            "Invalid renesas,out-spread-=
spectrum value\n");
> +       }
> +
> +       return 0;
> +}
> +
> +static void rs9_update_config(struct rs9_driver_data *rs9)
> +{
> +       int i;
> +
> +       /* If amplitude is non-default, update it. */
> +       if (rs9->pll_amplitude !=3D RS9_REG_SS_AMP_0V7) {
> +               regmap_update_bits(rs9->regmap, RS9_REG_SS, RS9_REG_SS_AM=
P_MASK,
> +                                  rs9->pll_amplitude);
> +       }
> +
> +       /* If SSC is non-default, update it. */
> +       if (rs9->pll_ssc !=3D RS9_REG_SS_SSC_100) {
> +               regmap_update_bits(rs9->regmap, RS9_REG_SS, RS9_REG_SS_SS=
C_MASK,
> +                                  rs9->pll_ssc);
> +       }
> +
> +       for (i =3D 0; i < rs9->chip_info->num_clks; i++) {
> +               if (rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i))
> +                       continue;
> +
> +               regmap_update_bits(rs9->regmap, RS9_REG_SR, RS9_REG_SR_3V=
0_DIF(i),
> +                                  rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i=
));
> +       }
> +}
> +
> +static struct clk_hw *
> +rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct rs9_driver_data *rs9 =3D data;
> +       unsigned int idx =3D clkspec->args[0];
> +
> +       return rs9->clk_dif[idx];
> +}
> +
> +static const struct of_device_id clk_rs9_of_match[];

Why the forward declare?

> +
> +static int rs9_probe(struct i2c_client *client, const struct i2c_device_=
id *id)
> +{
> +       struct device_node *np =3D client->dev.of_node;
> +       unsigned char *name =3D "DIF0";
> +       struct rs9_driver_data *rs9;
> +       const char *parent_clk;
> +       struct clk_hw *hw;
> +       int i, ret;
> +
> +       rs9 =3D devm_kzalloc(&client->dev, sizeof(*rs9), GFP_KERNEL);
> +       if (!rs9)
> +               return -ENOMEM;
> +
> +       i2c_set_clientdata(client, rs9);
> +       rs9->client =3D client;
> +       rs9->chip_info =3D of_device_get_match_data(&client->dev);

Check for NULL? Use device_get_match_data()? Or does that not work for
i2c devices?

> +
> +       /* Fetch common configuration from DT (if specified) */
> +       ret =3D rs9_get_common_config(rs9);
> +       if (ret)
> +               return ret;
> +
> +       /* Fetch DIFx output configuration from DT (if specified) */
> +       for (i =3D 0; i < rs9->chip_info->num_clks; i++) {
> +               ret =3D rs9_get_output_config(rs9, i);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Mandatory XTal */

Oh it's mandatory here but not in the binding?

> +       parent_clk =3D of_clk_get_parent_name(np, 0);

Use clk_parent_data please.

> +       if (!parent_clk)
> +               return dev_err_probe(&client->dev, -EINVAL,
> +                                    "Missing XTal input clock\n");
> +
> +       rs9->regmap =3D devm_regmap_init_i2c(client, &rs9_regmap_config);
> +       if (IS_ERR(rs9->regmap))
> +               return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap),
> +                                    "Failed to allocate register map\n");
> +
> +       /* Register clock */
> +       for (i =3D 0; i < rs9->chip_info->num_clks; i++) {
> +               name[3]++;
> +               hw =3D clk_hw_register_fixed_factor(&client->dev, name,
> +                                                 parent_clk, 0, 4, 1);
> +               if (IS_ERR(hw))
> +                       return PTR_ERR(hw);
> +
> +               rs9->clk_dif[i] =3D hw;
> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(&client->dev, rs9_of_clk_get,=
 rs9);
> +       if (!ret)
> +               rs9_update_config(rs9);
> +
> +       return ret;
> +}
