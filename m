Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F0FC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 10:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85C216137D
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 10:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhJTKQp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Oct 2021 06:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbhJTKQp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Oct 2021 06:16:45 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18C1C06161C
        for <linux-clk@vger.kernel.org>; Wed, 20 Oct 2021 03:14:30 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 204so11553301ljf.9
        for <linux-clk@vger.kernel.org>; Wed, 20 Oct 2021 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QiMTQ58eh6k+RoFQDoeKMOTh6l0LieHPuDnAznpsg44=;
        b=Ak7mnl4ktJ9Q9g0YN9Do6ztNqfvHUWymRcL+fRuyALFTnCWd5Mrmaaz+NWfjyPBXM7
         dta5+nXAyhHyf5iPzIOh6AeXVAjXIdoVMJNRD1qtFhVZMsBAh4XJRsJg6TkDNkBEingo
         4ZTMcQoDpkPKaUo3UsGHFdM25P1DMC0r0NNL82sc0zEZvjLpd67S9d8V3WD147aYoZzE
         Plw8eYoUt3/6H26JKB3GhBgFYV+CIr7OqiePzgx2BSDuAAUySuYc7O3DQ+WKcwbXrONJ
         7TFRLrQ6094qnpv0Z5iZ5pNyjNOiTipcP5JbAHa4HKZCiU5PBxDjcBmQPdpw7cCiIyvz
         0b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QiMTQ58eh6k+RoFQDoeKMOTh6l0LieHPuDnAznpsg44=;
        b=c3cWjN297fqh7Az1frpBMiAywQpe2QuSyqZQv5VVKhYZ1HtQsKDl+WkfNtBO/8fz7V
         0OSouvVabixayVigucvoF2jK4CU/R3TT6RbbHZfYBKhPJf2vTtOdJjFw/1KoZaS+CQVZ
         X4MXWMdN8QNTjOuaiyqNyeMVIX63nudAhNkiaY0LzW7iuHLStKsTDSKqdVUlc9CDw1Hs
         z3cNzfZEf5kwcXbo8Fn7cVOlUn50i/Om3D2ntPgV5U25Z6ULTQdnMCqWRZZIjMbhxEEs
         lowNto5xcrrp8IF59GWN+8ACxPnxuY9eaUOzLt9cNrHhsd6tbhylZl0Oq/14JV0Qgzmu
         vrqQ==
X-Gm-Message-State: AOAM531Xqgzv10POuytLRmY2hbOHrawOUKv+xOFLbWZGRgTfJnR4BxzJ
        rHZua6ZHWCnysH3FrDicFAR/SY1wmkwYlTtI3Pl02A==
X-Google-Smtp-Source: ABdhPJxRCg5BSXWhW8FqpBm7UAAA7zY/acz+192m4E9jNf3rumxB4X7FSwC8SA20zrchyTzuFguqgfPpQx/wM4wTrOc=
X-Received: by 2002:a2e:b550:: with SMTP id a16mr7319811ljn.229.1634724869053;
 Wed, 20 Oct 2021 03:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210921184803.1757916-1-linus.walleij@linaro.org> <20210921184803.1757916-2-linus.walleij@linaro.org>
In-Reply-To: <20210921184803.1757916-2-linus.walleij@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 Oct 2021 12:13:52 +0200
Message-ID: <CAPDyKFrOYROm5gWN5iXhKauS7P+ioc_9abDExxNJcZqn_BW-zg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] clk: ux500: Add driver for the reset portions of PRCC
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 21 Sept 2021 at 20:50, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The Ux500 PRCC (peripheral reset and clock controller) can also
> control reset of the IP blocks, not just clocks. As the PRCC is probed
> as a clock controller and we have other platforms implementing combined
> clock and reset controllers, follow this pattern and implement the PRCC
> rest controller as part of the clock driver.
>
> The reset controller needs to be selected from the machine as Ux500 has
> traditionally selected its mandatory subsystem prerequisites from there.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

My apologies for the delay!

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> ChangeLog v2->v3:
> - Rebase on v5.15-rc1
> - Add a small copyright header to the driver.
> - Move prcc_num_to_index() function from header to driver.
> - Parenthesis around macro arguments in PRCC_RESET_LINE()
> - Fix up debug prints to use %u for unsigned ints.
> - Write a comment about the 1 us delays coming from the vendor
>   code tree.
> - Drop rcdev->nr_resets as this is unused.
> - Fix kerneldoc in the struct u8500_prcc_reset
> ChangeLog v1->v2:
> - Rebase on v5.14-rc1
> - Cc Philipp Zabel
> ---
>  arch/arm/mach-ux500/Kconfig      |   1 +
>  drivers/clk/ux500/Makefile       |   3 +
>  drivers/clk/ux500/prcc.h         |  19 ++++
>  drivers/clk/ux500/reset-prcc.c   | 181 +++++++++++++++++++++++++++++++
>  drivers/clk/ux500/reset-prcc.h   |  23 ++++
>  drivers/clk/ux500/u8500_of_clk.c |  32 +++---
>  6 files changed, 246 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/clk/ux500/prcc.h
>  create mode 100644 drivers/clk/ux500/reset-prcc.c
>  create mode 100644 drivers/clk/ux500/reset-prcc.h
>
> diff --git a/arch/arm/mach-ux500/Kconfig b/arch/arm/mach-ux500/Kconfig
> index c1086ebe0050..24ed7f4a87a4 100644
> --- a/arch/arm/mach-ux500/Kconfig
> +++ b/arch/arm/mach-ux500/Kconfig
> @@ -29,6 +29,7 @@ menuconfig ARCH_U8500
>         select REGULATOR_DB8500_PRCMU
>         select REGULATOR_FIXED_VOLTAGE
>         select SOC_BUS
> +       select RESET_CONTROLLER
>         help
>           Support for ST-Ericsson's Ux500 architecture
>
> diff --git a/drivers/clk/ux500/Makefile b/drivers/clk/ux500/Makefile
> index 53fd29002401..c29b83df403e 100644
> --- a/drivers/clk/ux500/Makefile
> +++ b/drivers/clk/ux500/Makefile
> @@ -8,6 +8,9 @@ obj-y += clk-prcc.o
>  obj-y += clk-prcmu.o
>  obj-y += clk-sysctrl.o
>
> +# Reset control
> +obj-y += reset-prcc.o
> +
>  # Clock definitions
>  obj-y += u8500_of_clk.o
>
> diff --git a/drivers/clk/ux500/prcc.h b/drivers/clk/ux500/prcc.h
> new file mode 100644
> index 000000000000..5b6774d79506
> --- /dev/null
> +++ b/drivers/clk/ux500/prcc.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __PRCC_H
> +#define __PRCC_H
> +
> +#define PRCC_NUM_PERIPH_CLUSTERS 6
> +#define PRCC_PERIPHS_PER_CLUSTER 32
> +
> +/* CLKRST4 is missing making it hard to index things */
> +enum clkrst_index {
> +       CLKRST1_INDEX = 0,
> +       CLKRST2_INDEX,
> +       CLKRST3_INDEX,
> +       CLKRST5_INDEX,
> +       CLKRST6_INDEX,
> +       CLKRST_MAX,
> +};
> +
> +#endif
> diff --git a/drivers/clk/ux500/reset-prcc.c b/drivers/clk/ux500/reset-prcc.c
> new file mode 100644
> index 000000000000..fcd5d042806a
> --- /dev/null
> +++ b/drivers/clk/ux500/reset-prcc.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Reset controller portions for the U8500 PRCC
> + * Copyright (C) 2021 Linus Walleij <linus.walleij@linaro.org>
> + */
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/err.h>
> +#include <linux/types.h>
> +#include <linux/reset-controller.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +
> +#include "prcc.h"
> +#include "reset-prcc.h"
> +
> +#define to_u8500_prcc_reset(p) container_of((p), struct u8500_prcc_reset, rcdev)
> +
> +/* This macro flattens the 2-dimensional PRCC numberspace */
> +#define PRCC_RESET_LINE(prcc_num, bit) \
> +       (((prcc_num) * PRCC_PERIPHS_PER_CLUSTER) + (bit))
> +
> +/*
> + * Reset registers in each PRCC - the reset lines are active low
> + * so what you need to do is write a bit for the peripheral you
> + * want to put into reset into the CLEAR register, this will assert
> + * the reset by pulling the line low. SET take the device out of
> + * reset. The status reflects the actual state of the line.
> + */
> +#define PRCC_K_SOFTRST_SET             0x018
> +#define PRCC_K_SOFTRST_CLEAR           0x01c
> +#define PRCC_K_RST_STATUS              0x020
> +
> +static int prcc_num_to_index(unsigned int num)
> +{
> +       switch (num) {
> +       case 1:
> +               return CLKRST1_INDEX;
> +       case 2:
> +               return CLKRST2_INDEX;
> +       case 3:
> +               return CLKRST3_INDEX;
> +       case 5:
> +               return CLKRST5_INDEX;
> +       case 6:
> +               return CLKRST6_INDEX;
> +       }
> +       return -EINVAL;
> +}
> +
> +static void __iomem *u8500_prcc_reset_base(struct u8500_prcc_reset *ur,
> +                                          unsigned long id)
> +{
> +       unsigned int prcc_num, index;
> +
> +       prcc_num = id / PRCC_PERIPHS_PER_CLUSTER;
> +       index = prcc_num_to_index(prcc_num);
> +
> +       if (index > ARRAY_SIZE(ur->base))
> +               return NULL;
> +
> +       return ur->base[index];
> +}
> +
> +static int u8500_prcc_reset(struct reset_controller_dev *rcdev,
> +                           unsigned long id)
> +{
> +       struct u8500_prcc_reset *ur = to_u8500_prcc_reset(rcdev);
> +       void __iomem *base = u8500_prcc_reset_base(ur, id);
> +       unsigned int bit = id % PRCC_PERIPHS_PER_CLUSTER;
> +
> +       pr_debug("PRCC cycle reset id %lu, bit %u\n", id, bit);
> +
> +       /*
> +        * Assert reset and then release it. The one microsecond
> +        * delay is found in the vendor reference code.
> +        */
> +       writel(BIT(bit), base + PRCC_K_SOFTRST_CLEAR);
> +       udelay(1);
> +       writel(BIT(bit), base + PRCC_K_SOFTRST_SET);
> +       udelay(1);
> +
> +       return 0;
> +}
> +
> +static int u8500_prcc_reset_assert(struct reset_controller_dev *rcdev,
> +                                  unsigned long id)
> +{
> +       struct u8500_prcc_reset *ur = to_u8500_prcc_reset(rcdev);
> +       void __iomem *base = u8500_prcc_reset_base(ur, id);
> +       unsigned int bit = id % PRCC_PERIPHS_PER_CLUSTER;
> +
> +       pr_debug("PRCC assert reset id %lu, bit %u\n", id, bit);
> +       writel(BIT(bit), base + PRCC_K_SOFTRST_CLEAR);
> +
> +       return 0;
> +}
> +
> +static int u8500_prcc_reset_deassert(struct reset_controller_dev *rcdev,
> +                                    unsigned long id)
> +{
> +       struct u8500_prcc_reset *ur = to_u8500_prcc_reset(rcdev);
> +       void __iomem *base = u8500_prcc_reset_base(ur, id);
> +       unsigned int bit = id % PRCC_PERIPHS_PER_CLUSTER;
> +
> +       pr_debug("PRCC deassert reset id %lu, bit %u\n", id, bit);
> +       writel(BIT(bit), base + PRCC_K_SOFTRST_SET);
> +
> +       return 0;
> +}
> +
> +static int u8500_prcc_reset_status(struct reset_controller_dev *rcdev,
> +                                  unsigned long id)
> +{
> +       struct u8500_prcc_reset *ur = to_u8500_prcc_reset(rcdev);
> +       void __iomem *base = u8500_prcc_reset_base(ur, id);
> +       unsigned int bit = id % PRCC_PERIPHS_PER_CLUSTER;
> +       u32 val;
> +
> +       pr_debug("PRCC check status on reset line id %lu, bit %u\n", id, bit);
> +       val = readl(base + PRCC_K_RST_STATUS);
> +
> +       /* Active low so return the inverse value of the bit */
> +       return !(val & BIT(bit));
> +}
> +
> +static const struct reset_control_ops u8500_prcc_reset_ops = {
> +       .reset = u8500_prcc_reset,
> +       .assert = u8500_prcc_reset_assert,
> +       .deassert = u8500_prcc_reset_deassert,
> +       .status = u8500_prcc_reset_status,
> +};
> +
> +static int u8500_prcc_reset_xlate(struct reset_controller_dev *rcdev,
> +                                 const struct of_phandle_args *reset_spec)
> +{
> +       unsigned int prcc_num, bit;
> +
> +       if (reset_spec->args_count != 2)
> +               return -EINVAL;
> +
> +       prcc_num = reset_spec->args[0];
> +       bit = reset_spec->args[1];
> +
> +       if (prcc_num != 1 && prcc_num != 2 && prcc_num != 3 &&
> +           prcc_num != 5 && prcc_num != 6) {
> +               pr_err("%s: invalid PRCC %d\n", __func__, prcc_num);
> +               return -EINVAL;
> +       }
> +
> +       pr_debug("located reset line %d at PRCC %d bit %d\n",
> +                PRCC_RESET_LINE(prcc_num, bit), prcc_num, bit);
> +
> +       return PRCC_RESET_LINE(prcc_num, bit);
> +}
> +
> +void u8500_prcc_reset_init(struct device_node *np, struct u8500_prcc_reset *ur)
> +{
> +       struct reset_controller_dev *rcdev = &ur->rcdev;
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < CLKRST_MAX; i++) {
> +               ur->base[i] = ioremap(ur->phy_base[i], SZ_4K);
> +               if (!ur->base[i])
> +                       pr_err("PRCC failed to remap for reset base %d (%08x)\n",
> +                              i, ur->phy_base[i]);
> +       }
> +
> +       rcdev->owner = THIS_MODULE;
> +       rcdev->ops = &u8500_prcc_reset_ops;
> +       rcdev->of_node = np;
> +       rcdev->of_reset_n_cells = 2;
> +       rcdev->of_xlate = u8500_prcc_reset_xlate;
> +
> +       ret = reset_controller_register(rcdev);
> +       if (ret)
> +               pr_err("PRCC failed to register reset controller\n");
> +}
> diff --git a/drivers/clk/ux500/reset-prcc.h b/drivers/clk/ux500/reset-prcc.h
> new file mode 100644
> index 000000000000..353c9719f2e6
> --- /dev/null
> +++ b/drivers/clk/ux500/reset-prcc.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __RESET_PRCC_H
> +#define __RESET_PRCC_H
> +
> +#include <linux/reset-controller.h>
> +#include <linux/io.h>
> +
> +/**
> + * struct u8500_prcc_reset - U8500 PRCC reset controller state
> + * @rcdev: reset controller device
> + * @phy_base: the physical base address for each PRCC block
> + * @base: the remapped PRCC bases
> + */
> +struct u8500_prcc_reset {
> +       struct reset_controller_dev rcdev;
> +       u32 phy_base[CLKRST_MAX];
> +       void __iomem *base[CLKRST_MAX];
> +};
> +
> +void u8500_prcc_reset_init(struct device_node *np, struct u8500_prcc_reset *ur);
> +
> +#endif
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
> index 528c5bb397cc..6a52ba4183ec 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -10,10 +10,10 @@
>  #include <linux/of_address.h>
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/dbx500-prcmu.h>
> -#include "clk.h"
>
> -#define PRCC_NUM_PERIPH_CLUSTERS 6
> -#define PRCC_PERIPHS_PER_CLUSTER 32
> +#include "clk.h"
> +#include "prcc.h"
> +#include "reset-prcc.h"
>
>  static struct clk *prcmu_clk[PRCMU_NUM_CLKS];
>  static struct clk *prcc_pclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
> @@ -46,16 +46,6 @@ static struct clk *ux500_twocell_get(struct of_phandle_args *clkspec,
>         return PRCC_SHOW(clk_data, base, bit);
>  }
>
> -/* CLKRST4 is missing making it hard to index things */
> -enum clkrst_index {
> -       CLKRST1_INDEX = 0,
> -       CLKRST2_INDEX,
> -       CLKRST3_INDEX,
> -       CLKRST5_INDEX,
> -       CLKRST6_INDEX,
> -       CLKRST_MAX,
> -};
> -
>  static void u8500_clk_init(struct device_node *np)
>  {
>         struct prcmu_fw_version *fw_version;
> @@ -63,8 +53,20 @@ static void u8500_clk_init(struct device_node *np)
>         const char *sgaclk_parent = NULL;
>         struct clk *clk, *rtc_clk, *twd_clk;
>         u32 bases[CLKRST_MAX];
> +       struct u8500_prcc_reset *rstc;
>         int i;
>
> +       /*
> +        * We allocate the reset controller here so that we can fill in the
> +        * base addresses properly and pass to the reset controller init
> +        * function later on.
> +        */
> +       rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
> +       if (!rstc) {
> +               pr_err("could not allocate reset controller\n");
> +               return;
> +       }
> +
>         for (i = 0; i < ARRAY_SIZE(bases); i++) {
>                 struct resource r;
>
> @@ -73,6 +75,7 @@ static void u8500_clk_init(struct device_node *np)
>                         pr_err("failed to get CLKRST %d base address\n",
>                                i + 1);
>                 bases[i] = r.start;
> +               rstc->phy_base[i] = r.start;
>         }
>
>         /* Clock sources */
> @@ -563,6 +566,9 @@ static void u8500_clk_init(struct device_node *np)
>
>                 if (of_node_name_eq(child, "smp-twd-clock"))
>                         of_clk_add_provider(child, of_clk_src_simple_get, twd_clk);
> +
> +               if (of_node_name_eq(child, "prcc-reset-controller"))
> +                       u8500_prcc_reset_init(child, rstc);
>         }
>  }
>  CLK_OF_DECLARE(u8500_clks, "stericsson,u8500-clks", u8500_clk_init);
> --
> 2.31.1
>
