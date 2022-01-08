Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4F5C433F5
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jan 2022 01:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiAHBGK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jan 2022 20:06:10 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:47768 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiAHBGK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jan 2022 20:06:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C28BB827B9;
        Sat,  8 Jan 2022 01:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D40C36AEB;
        Sat,  8 Jan 2022 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641603966;
        bh=Bqhbr8068qZCYO2lyleN+FcwCvwVL+rmswn5Uy4qlzs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZLsb5TdyxTqfWqZz4Q7FLWBHbTeCxaHPtkRVZwb/RcXi74s4kZH4f/240I1nAuW8A
         RYhQiFQ+eTKx+Axpxsi4ntlkxY4kngrfiRMKdPG9UcVQtfWBw7OeKmXrGorxJzl8tn
         ZB14VUdHMYFd+//IU9oek+LanoIYKnEjMRdWdRoaUJRRpS5hggJrU7YCrXvbsLwDxU
         oYoCQd2vWwbQmEnZ9+GBL9bHeBy3/k5FJ/s4z20pPNeOwW5pwiGwetPUVYdQtwSBtU
         gM9tuyu48rjbEnmNLzqHu+AKxMsE7Cznv0N8AgjsDSSP7JgxV+WO/WgI1mztdxrttx
         0UgJHo942BZ2g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211214120213.15649-3-povik@protonmail.com>
References: <20211214120213.15649-1-povik@protonmail.com> <20211214120213.15649-3-povik@protonmail.com>
Subject: Re: [PATCH 2/2] clk: clk-apple-nco: Add driver for Apple NCO
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        kettenis@openbsd.org, marcan@marcan.st, sven@svenpeter.dev,
        Martin =?utf-8?q?Povi=C5=A1er?= <povik@protonmail.com>
To:     Martin =?utf-8?q?Povi=C5=A1er?= <povik@protonmail.com>
Date:   Fri, 07 Jan 2022 17:06:05 -0800
User-Agent: alot/0.9.1
Message-Id: <20220108010606.D0D40C36AEB@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Povi=C5=A1er (2021-12-14 04:02:55)
> Add a common clock driver for NCO blocks found on Apple SoCs where they
> are typically the generators of audio clocks.
>=20
> Signed-off-by: Martin Povi=C5=A1er <povik@protonmail.com>
> ---
>  drivers/clk/Kconfig         |   9 ++
>  drivers/clk/Makefile        |   1 +
>  drivers/clk/clk-apple-nco.c | 299 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 309 insertions(+)
>  create mode 100644 drivers/clk/clk-apple-nco.c
>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c5b3dc97396a..d2b3d40de29d 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -390,6 +390,15 @@ config COMMON_CLK_K210
>         help
>           Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>=20
> +config COMMON_CLK_APPLE_NCO

Please try to keep this sorted by Kconfig name. I know it isn't very
well done right now but it would be better than adding it here at the
end.

> +       bool "Clock driver for Apple SoC NCOs"
> +       depends on ARCH_APPLE || COMPILE_TEST
> +       default ARCH_APPLE
> +       help
> +         This driver supports NCO (Numerically Controlled Oscillator) bl=
ocks
> +         found on Apple SoCs such as t8103 (M1). The blocks are typically
> +         generators of audio clocks.
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
> diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
> new file mode 100644
> index 000000000000..152901f6a40d
> --- /dev/null
> +++ b/drivers/clk/clk-apple-nco.c
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple NCO (Numerically Controlled Oscillator) clock driver
> + *
> + * Driver for an SoC block found on t8103 (M1) and other Apple chips
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +
> +#define NCO_CHANNEL_STRIDE     0x4000
> +
> +#define REG_CTRL       0
> +#define CTRL_ENABLE    BIT(31)
> +#define REG_DIV                4
> +#define DIV_FINE       GENMASK(1, 0)
> +#define DIV_COARSE     GENMASK(12, 2)
> +#define REG_INC1       8
> +#define REG_INC2       12
> +#define REG_ACCINIT    16
> +
> +struct nco_tables;
> +
> +struct nco_channel {
> +       void __iomem *base;
> +       struct nco_tables *tbl;
> +       struct clk_hw hw;
> +};
> +
> +#define to_nco_channel(_hw) container_of(_hw, struct nco_channel, hw)
> +
> +#define LFSR_POLY      0xa01
> +#define LFSR_INIT      0x7ff
> +#define LFSR_LEN       11
> +#define LFSR_PERIOD    ((1 << LFSR_LEN) - 1)
> +#define LFSR_TBLSIZE   (1 << LFSR_LEN)
> +
> +/* The minimal attainable coarse divisor (first value in table) */
> +#define COARSE_DIV_OFFSET 2
> +
> +struct nco_tables {
> +       u16 fwd[LFSR_TBLSIZE];
> +       u16 inv[LFSR_TBLSIZE];
> +};
> +
> +static int nco_enable(struct clk_hw *hw);
> +static void nco_disable(struct clk_hw *hw);
> +static int nco_is_enabled(struct clk_hw *hw);
> +
> +static void nco_compute_tables(struct nco_tables *tbl)
> +{
> +       int i;
> +       u32 state =3D LFSR_INIT;
> +
> +       /*
> +        * Go through the states of a galois LFSR and build
> +        * a coarse divisor translation table.
> +        */
> +       for (i =3D LFSR_PERIOD; i > 0; i--) {
> +               if (state & 1)
> +                       state =3D (state >> 1) ^ (LFSR_POLY >> 1);
> +               else
> +                       state =3D (state >> 1);
> +               tbl->fwd[i] =3D state;
> +               tbl->inv[state] =3D i;
> +       }
> +
> +       /* Zero value is special-cased */
> +       tbl->fwd[0] =3D 0;
> +       tbl->inv[0] =3D 0;
> +}
> +
> +static bool nco_div_check(int div)

Maybe nco_div_out_of_range()? And then invert the logic below.

> +{
> +       int coarse =3D div / 4;
> +       return coarse >=3D COARSE_DIV_OFFSET &&
> +               coarse < COARSE_DIV_OFFSET + LFSR_TBLSIZE;
> +}
> +
> +static u32 nco_div_translate(struct nco_tables *tbl, int div)
> +{
> +       int coarse =3D div / 4;

Why signed types?

> +
> +       if (WARN_ON(!nco_div_check(div)))
> +               return 0;
> +
> +       return FIELD_PREP(DIV_COARSE, tbl->fwd[coarse - COARSE_DIV_OFFSET=
]) |
> +                       FIELD_PREP(DIV_FINE, div % 4);
> +}
> +
> +static int nco_div_translate_inv(struct nco_tables *tbl, int regval)
> +{
> +       int coarse, fine;

Why signed types?

> +
> +       coarse =3D tbl->inv[FIELD_GET(DIV_COARSE, regval)] + COARSE_DIV_O=
FFSET;
> +       fine =3D FIELD_GET(DIV_FINE, regval);
> +
> +       return coarse * 4 + fine;
> +}
> +
> +static int nco_set_rate(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long parent_rate)
> +{
> +       struct nco_channel *chan =3D to_nco_channel(hw);
> +       u32 div;
> +       s32 inc1, inc2;
> +       bool was_enabled;
> +
> +       was_enabled =3D nco_is_enabled(hw);
> +       nco_disable(hw);

Does anything prevent a clk_enable() call from racing with this?

> +
> +       div =3D 2 * parent_rate / rate;
> +       inc1 =3D 2 * parent_rate - div * rate;
> +       inc2 =3D -((s32) (rate - inc1));
> +
> +       if (!nco_div_check(div))
> +               return -EINVAL;

Did we just fail and leave the clk disabled?

> +
> +       div =3D nco_div_translate(chan->tbl, div);
> +
> +       writel_relaxed(div,  chan->base + REG_DIV);
> +       writel_relaxed(inc1, chan->base + REG_INC1);
> +       writel_relaxed(inc2, chan->base + REG_INC2);
> +       writel_relaxed(1 << 31, chan->base + REG_ACCINIT);
> +
> +       if (was_enabled)
> +               nco_enable(hw);
> +
> +       return 0;
> +}
> +
> +static unsigned long nco_recalc_rate(struct clk_hw *hw,
> +                               unsigned long parent_rate)
> +{
> +       struct nco_channel *chan =3D to_nco_channel(hw);
> +       u32 div;
> +       s32 inc1, inc2, incbase;
> +
> +       div =3D nco_div_translate_inv(chan->tbl,
> +                       readl_relaxed(chan->base + REG_DIV));
> +
> +       inc1 =3D readl_relaxed(chan->base + REG_INC1);
> +       inc2 =3D readl_relaxed(chan->base + REG_INC2);
> +
> +       /*
> +        * We don't support wraparound of accumulator
> +        * nor the edge case of both increments being zero
> +        */
> +       if (inc1 < 0 || inc2 > 0 || (inc1 =3D=3D 0 && inc2 =3D=3D 0))
> +               return 0;
> +
> +       /* Scale both sides of division by incbase to maintain precision =
*/
> +       incbase =3D inc1 - inc2;
> +
> +       return div_u64(((u64) parent_rate) * 2 * incbase,
> +                       ((u64) div) * incbase + inc1);
> +}
> +
> +static long nco_round_rate(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long *parent_rate)
> +{
> +       unsigned long lo =3D *parent_rate / (COARSE_DIV_OFFSET + LFSR_TBL=
SIZE) + 1;
> +       unsigned long hi =3D *parent_rate / COARSE_DIV_OFFSET;
> +
> +       return clamp(rate, lo, hi);
> +}
> +
> +static int nco_enable(struct clk_hw *hw)
> +{
> +       struct nco_channel *chan =3D to_nco_channel(hw);
> +       u32 val;
> +
> +       val =3D readl_relaxed(chan->base + REG_CTRL);
> +       writel_relaxed(val | CTRL_ENABLE, chan->base + REG_CTRL);

Nitpick, newline here.

> +       return 0;
> +}
> +
> +static void nco_disable(struct clk_hw *hw)
> +{
> +       struct nco_channel *chan =3D to_nco_channel(hw);
> +       u32 val;
> +
> +       val =3D readl_relaxed(chan->base + REG_CTRL);
> +       writel_relaxed(val & ~CTRL_ENABLE, chan->base + REG_CTRL);
> +}
> +
> +static int nco_is_enabled(struct clk_hw *hw)
> +{
> +       struct nco_channel *chan =3D to_nco_channel(hw);
> +
> +       return (readl_relaxed(chan->base + REG_CTRL) & CTRL_ENABLE) !=3D =
0;
> +}
> +
> +static const struct clk_ops nco_ops =3D {
> +       .set_rate =3D nco_set_rate,
> +       .recalc_rate =3D nco_recalc_rate,
> +       .round_rate =3D nco_round_rate,
> +       .enable =3D nco_enable,
> +       .disable =3D nco_disable,
> +       .is_enabled =3D nco_is_enabled,
> +};
> +
> +static int apple_nco_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +       struct clk_init_data init;
> +       struct clk_hw_onecell_data *onecell_data;
> +       const char *parent_name;
> +       void __iomem *regs;
> +       struct nco_tables *tbl;
> +       int nchannels;
> +       int ret, i;
> +
> +       ret =3D of_property_read_u32(np, "apple,nchannels", &nchannels);
> +       if (ret) {
> +               dev_err(&pdev->dev, "missing or invalid apple,nchannels p=
roperty\n");
> +               return -EINVAL;
> +       }
> +
> +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
> +
> +       if (of_clk_get_parent_count(np) !=3D 1)
> +               return -EINVAL;
> +       parent_name =3D of_clk_get_parent_name(np, 0);

Use clk_parent_data instead please.

> +       if (!parent_name)
> +               return -EINVAL;
> +
> +       onecell_data =3D devm_kzalloc(&pdev->dev, struct_size(onecell_dat=
a, hws,
> +                                                       nchannels), GFP_K=
ERNEL);
> +       if (!onecell_data)
> +               return -ENOMEM;
> +       onecell_data->num =3D nchannels;
> +
> +       tbl =3D devm_kzalloc(&pdev->dev, sizeof(*tbl), GFP_KERNEL);
> +       if (!tbl)
> +               return -ENOMEM;
> +       nco_compute_tables(tbl);
> +
> +       for (i =3D 0; i < nchannels; i++) {
> +               struct nco_channel *chan;
> +
> +               chan =3D devm_kzalloc(&pdev->dev, sizeof(*chan), GFP_KERN=
EL);
> +               if (!chan)
> +                       return -ENOMEM;
> +               chan->base =3D regs + NCO_CHANNEL_STRIDE*i;
> +               chan->tbl =3D tbl;
> +
> +               memset(&init, 0, sizeof(init));
> +               init.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +                                               "%s-%d", np->name, i);
> +               init.ops =3D &nco_ops;
> +               init.num_parents =3D 1;
> +               init.parent_names =3D &parent_name;
> +               init.flags =3D 0;
> +
> +               chan->hw.init =3D &init;
> +               ret =3D devm_clk_hw_register(&pdev->dev, &chan->hw);
> +               if (ret)
> +                       return ret;
> +
> +               onecell_data->hws[i] =3D &chan->hw;
> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell=
_get,
> +                                                       onecell_data);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id apple_nco_ids[] =3D {
> +       { .compatible =3D "apple,nco" },
> +       { },

Nitpick, drop the comma so nothing can come after.

> +};
> +MODULE_DEVICE_TABLE(of, apple_nco_ids)
> +
> +static struct platform_driver apple_nco_driver =3D {
> +       .driver =3D {
> +               .name =3D "apple-nco",
> +               .of_match_table =3D apple_nco_ids,
> +       },
> +       .probe =3D apple_nco_probe,
> +};
> +module_platform_driver(apple_nco_driver);
