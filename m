Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AEAC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 02:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F1B064E05
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 02:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhBKCfQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 21:35:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:53222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229564AbhBKCfP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Feb 2021 21:35:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 540D664E05;
        Thu, 11 Feb 2021 02:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613010874;
        bh=c75z1/HHs/VuwDHMvf8aKv6HXdHEhj23dCdJC6u8XJY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RB6BDfkwfsc8ZU9EUxx0QrmPxypCyQ2IbjLRIE3uCXnTB76Sqe0+lQWD5swKg8zrQ
         QWjJ5LlCNbS3FpTRmrz3sKZfUuVXIXBQl/MMe3tvOOqz1BbhjdUQL+cFq8gMlvyHZj
         LJjWHi9747PLlv8m5aenuK5fQYUaCAhTC7XYxXj9eTUhOVBk2emf3jI4Hbi2EUbvTK
         Axs7NjJNlXmazi0yoRE6eClCM60UVgoqnscKZsWEdniRIKrtkTSa9kNEwwpyaON6J6
         pBQQKCMHmCzqxC+cdB/jaiqyY7qE22oIF11xbI7G1FE39lel8cFKgNBjn12H+f7TDS
         PPm3AVFVjpufQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210210050230.131281-2-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com> <20210210050230.131281-2-damien.lemoal@wdc.com>
Subject: Re: [PATCH v19 01/17] clk: Add RISC-V Canaan Kendryte K210 clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
        Sean Anderson <seanga2@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org
Date:   Wed, 10 Feb 2021 18:34:33 -0800
Message-ID: <161301087300.1254594.18438542581140302342@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Damien Le Moal (2021-02-09 21:02:14)
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
> This new driver with the compatible string "canaan,k210-clk" implements
> support for the full clock structure of the K210 SoC. Since it is
> required for the correct operation of the SoC, this driver is
> selected by default for compilation when the SOC_CANAAN option is
> selected.
>=20
> With this change, the k210-sysctl driver is turned into a simple
> platform driver which enables its power bus clock and triggers
> populating its child nodes. The sysctl driver retains the SOC early
> initialization code, but the implementation now relies on the new
> function k210_clk_early_init() provided by the new clk-k210 driver.
>=20
> The clock structure implemented and many of the coding ideas for the
> driver come from the work by Sean Anderson on the K210 support for the
> U-Boot project.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---

No change log :/

Minor nitpicks but otherwise

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

>  drivers/clk/Kconfig              |    7 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/clk-k210.c           | 1007 ++++++++++++++++++++++++++++++
>  drivers/soc/canaan/Kconfig       |   18 +-
>  drivers/soc/canaan/Makefile      |    2 +-
>  drivers/soc/canaan/k210-sysctl.c |  205 ++----
>  include/soc/canaan/k210-sysctl.h |    2 +
>  7 files changed, 1064 insertions(+), 178 deletions(-)
>  create mode 100644 drivers/clk/clk-k210.c
>=20
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> new file mode 100644
> index 000000000000..6c84abf5b2e3
> --- /dev/null
> +++ b/drivers/clk/clk-k210.c
> @@ -0,0 +1,1007 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +#define pr_fmt(fmt)     "k210-clk: " fmt
> +
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_clk.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/clk-provider.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>

Some people sort this alphabetically, up to you.

> +#include <soc/canaan/k210-sysctl.h>
> +
> +#include <dt-bindings/clock/k210-clk.h>
> +
[...]
> +
> +/*
> + * PLL control register bits.
> + */
> +#define K210_PLL_CLKR          GENMASK(3, 0)
> +#define K210_PLL_CLKF          GENMASK(9, 4)
> +#define K210_PLL_CLKOD         GENMASK(13, 10)
> +#define K210_PLL_BWADJ         GENMASK(19, 14)
> +#define K210_PLL_RESET         (1 << 20)
> +#define K210_PLL_PWRD          (1 << 21)
> +#define K210_PLL_INTFB         (1 << 22)
> +#define K210_PLL_BYPASS                (1 << 23)
> +#define K210_PLL_TEST          (1 << 24)
> +#define K210_PLL_EN            (1 << 25)
> +#define K210_PLL_SEL           GENMASK(27, 26) /* PLL2 only */
> +
> +/*
> + * PLL lock register bits.
> + */
> +#define K210_PLL_LOCK          0
> +#define K210_PLL_CLEAR_SLIP    2
> +#define K210_PLL_TEST_OUT      3
> +
> +/*
> + * Clock selector register bits.
> + */
> +#define K210_ACLK_SEL          BIT(0)
> +#define K210_ACLK_DIV          GENMASK(2, 1)
> +
> +/*
> + * PLLs.
> + */
> +enum k210_pll_id {
> +       K210_PLL0, K210_PLL1, K210_PLL2, K210_PLL_NUM
> +};
> +
> +struct k210_pll {
> +       enum k210_pll_id id;
> +       struct k210_sysclk *ksc;
> +       void __iomem *base;
> +       void __iomem *reg;
> +       void __iomem *lock;
> +       u8 lock_shift;
> +       u8 lock_width;
> +       struct clk_hw hw;
> +};
> +#define to_k210_pll(_hw)       container_of(_hw, struct k210_pll, hw)
> +
> +/*
> + * PLLs configuration: by default PLL0 runs at 780 MHz and PLL1 at 299 M=
Hz.
> + * The first 2 SRAM banks depend on ACLK/CPU clock which is by default P=
LL0
> + * rate divided by 2. Set PLL1 to 390 MHz so that the third SRAM bank ha=
s the
> + * same clock as the first 2.
> + */
> +struct k210_pll_cfg {
> +       u32 reg;
> +       u8 lock_shift;
> +       u8 lock_width;
> +       u32 r;
> +       u32 f;
> +       u32 od;
> +       u32 bwadj;
> +};
> +
> +static struct k210_pll_cfg k210_plls_cfg[] =3D {

const?

> +       { K210_SYSCTL_PLL0,  0, 2, 0, 59, 1, 59 }, /* 780 MHz */
> +       { K210_SYSCTL_PLL1,  8, 1, 0, 59, 3, 59 }, /* 390 MHz */
> +       { K210_SYSCTL_PLL2, 16, 1, 0, 22, 1, 22 }, /* 299 MHz */
> +};
> +
> +/**
> + * struct k210_sysclk - sysclk driver data
> + * @regs: system controller registers start address
> + * @clk_lock: clock setting spinlock
> + * @plls: SoC PLLs descriptors
> + * @aclk: ACLK clock
> + * @clks: All other clocks
> + */
> +struct k210_sysclk {
> +       void __iomem                    *regs;
> +       spinlock_t                      clk_lock;
> +       struct k210_pll                 plls[K210_PLL_NUM];
> +       struct clk_hw                   aclk;
> +       struct k210_clk                 clks[K210_NUM_CLKS];
> +};
> +
> +#define to_k210_sysclk(_hw)    container_of(_hw, struct k210_sysclk, acl=
k)
> +
> +/*
> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
> + */
> +static void k210_aclk_set_selector(void __iomem *regs, u8 sel)
> +{
> +       u32 reg =3D readl(regs + K210_SYSCTL_SEL0);
> +
> +       if (sel)
> +               reg |=3D K210_ACLK_SEL;
> +       else
> +               reg &=3D K210_ACLK_SEL;
> +       writel(reg, regs + K210_SYSCTL_SEL0);
> +}
> +
> +static void k210_init_pll(void __iomem *regs, enum k210_pll_id pllid,

Should this have __init too?

> +                         struct k210_pll *pll)
> +{
> +       pll->id =3D pllid;
> +       pll->reg =3D regs + k210_plls_cfg[pllid].reg;
> +       pll->lock =3D regs + K210_SYSCTL_PLL_LOCK;
> +       pll->lock_shift =3D k210_plls_cfg[pllid].lock_shift;
> +       pll->lock_width =3D k210_plls_cfg[pllid].lock_width;
> +}
> +
> +static void k210_pll_wait_for_lock(struct k210_pll *pll)
[....]
> +
> +       init.name =3D k210_clk_cfgs[id].name;
> +       init.flags =3D flags;
> +       init.parent_data =3D parent_data;
> +       init.num_parents =3D num_parents;
> +       if (num_parents > 1)
> +               init.ops =3D &k210_clk_mux_ops;
> +       else
> +               init.ops =3D &k210_clk_ops;
> +
> +       kclk->id =3D id;
> +       kclk->ksc =3D ksc;
> +       kclk->hw.init =3D &init;
> +
> +       ret =3D of_clk_hw_register(np, &kclk->hw);
> +       if (ret) {
> +               pr_err("%pOFP: register clock %s failed\n",
> +                      np, k210_clk_cfgs[id].name);
> +               kclk->id =3D -1;
> +       }
> +}
> +
> +/*
> + * All muxed clocks have IN0 and PLL0 as parents.
> + */
> +static inline void __init k210_register_mux_clk(struct device_node *np,
> +                                               struct k210_sysclk *ksc, =
int id)
> +{
> +       const struct clk_parent_data parent_data[2] =3D {
> +               { /* .index =3D 0 for in0 */ },

It could be explicitly written instead of a comment, but OK.

> +               { .hw =3D &ksc->plls[K210_PLL0].hw }
> +       };
> +
> +       k210_register_clk(np, ksc, id, parent_data, 2, 0);
> +}
> +
> +static inline void __init k210_register_in0_child(struct device_node *np,

Maybe dropping inline would help to make shorter lines because it will
probably be inlined by the compiler anyway.

> +                                               struct k210_sysclk *ksc, =
int id)
> +{
> +       const struct clk_parent_data parent_data =3D {
> +               /* .index =3D 0 for in0 */
> +       };
> +
> +       k210_register_clk(np, ksc, id, &parent_data, 1, 0);
> +}
