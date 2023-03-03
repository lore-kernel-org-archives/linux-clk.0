Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CBBC64EC4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Mar 2023 09:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCCJDy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Mar 2023 04:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjCCJDx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Mar 2023 04:03:53 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E458C55524
        for <linux-clk@vger.kernel.org>; Fri,  3 Mar 2023 01:03:12 -0800 (PST)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 00C3F442D6
        for <linux-clk@vger.kernel.org>; Fri,  3 Mar 2023 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1677834118;
        bh=1fdYSbnfegEpIFhXxRIVjQdBaSYafoxwbjqBnHC8qQE=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=ZCXshi8FK/MORdYjZjWX4xuxfvw0z5rG1ZwQq0bsO9koUnQlDL5ChHxyL+upUJ/Nc
         PKbE6CWF3SQ28NjngEvK0PLPTPeZbPjpHnDbyFo2k1yf2KZSiA+8FIIfjz7ooDbZz+
         tvmpRv8NoZ3Uns7CD4glPn9EutTDNl2p7QgUKTbKGmxZtnMn3G+7mQ7KZgHUmSGyge
         jLx4x2MGGhKQxgU1TJlDRaF0QGcVTdYU5RIGoVkCEEoyzEx0RU4yeEsCzsXF8jvHLK
         fgL39UT2gg6KIWeNvzXPZcw4vJpUlJM4gX4G1OIQ0ig+d58K1SPAgZN/EZMJmEOV/m
         CPFB1FuBTaxCg==
Received: by mail-qt1-f200.google.com with SMTP id c11-20020ac85a8b000000b003bfdd43ac76so1127775qtc.5
        for <linux-clk@vger.kernel.org>; Fri, 03 Mar 2023 01:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677834115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fdYSbnfegEpIFhXxRIVjQdBaSYafoxwbjqBnHC8qQE=;
        b=uoZE9QyWASksphu10LEYMA1MR8Zd9f90UOzsdD+UaLfSsFdX45N7T6TxyJVdSvT4TM
         wphyS4h09jxQPOLHUk2paudzQjWGWFTY8j3lCYeMwVrQI1/tuPP2rX8Ei+anR0Ugsjtb
         yCx0OShxLJXiBw8Wob/05fmV8PTwufeWolfNxomhZET0gi8drUW1zn9yjg3y85MaaIAp
         KGE/NrICFQm3dsG+yf0ua4OeAE44dpBvH+ExK3SKqVjY1cOQ9nGU3xp2LQsZReHinULX
         ZYUIvTh/oPiVW2t9ZwfYWr5d7ZyWty+kn43ivZjdgjLjDBYzscYOFbVVd4+BoC+Ca+Z/
         8K/A==
X-Gm-Message-State: AO0yUKX1WyRE7qNcA3yM1GkNdt9TmHoASmppc3Ne8KYysnIEIhYL6G+I
        KSbUZ+uiCsWhHTuyWPQDPJycX5Vfa/0T2OeC8uNtEMFdhM6cNGWed5tOXqw6iYpEY5ym5WXkpdE
        07/44W8kguRvSqivoqqewBYRbkFt3SD8gDJsST46Lz/ALLPLkC+8UZdVF0eQ=
X-Received: by 2002:ae9:e809:0:b0:71f:b89c:69b7 with SMTP id a9-20020ae9e809000000b0071fb89c69b7mr200510qkg.7.1677834114776;
        Fri, 03 Mar 2023 01:01:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9aS0yQHa98N4TZMBvZ6PaKMvoWirXRWEpbxrBjnnTYnAXGf8Cm13H3MF/sSqim0kjjV2vRjH9tKS8jCPucbWY=
X-Received: by 2002:ae9:e809:0:b0:71f:b89c:69b7 with SMTP id
 a9-20020ae9e809000000b0071fb89c69b7mr200493qkg.7.1677834114467; Fri, 03 Mar
 2023 01:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-7-xingyu.wu@starfivetech.com> <CAJM55Z-D2s6FkQiR4_KSNkQ-QNHu3mLO_A8GBEY5XwVU5=VXAA@mail.gmail.com>
 <7d78d2a1-d552-f25d-557b-c90e6a33eccd@starfivetech.com>
In-Reply-To: <7d78d2a1-d552-f25d-557b-c90e6a33eccd@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Fri, 3 Mar 2023 10:01:38 +0100
Message-ID: <CAJM55Z8C4je1OCJKMyBJXPvqvASaQ7RDtqUaFibBC6tdEr2PmQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] clk: starfive: Add StarFive JH7110
 Image-Signal-Process clock driver
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 3 Mar 2023 at 04:59, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> On 2023/3/2 23:39, Emil Renner Berthing wrote:
> > On Tue, 21 Feb 2023 at 09:36, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> >>
> >> Add driver for the StarFive JH7110 Image-Signal-Process clock controller.
> >>
> >> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >> ---
> >>  drivers/clk/starfive/Kconfig                  |  11 +
> >>  drivers/clk/starfive/Makefile                 |   1 +
> >>  .../clk/starfive/clk-starfive-jh7110-isp.c    | 254 ++++++++++++++++++
> >>  3 files changed, 266 insertions(+)
> >>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-isp.c
> >>
> >> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> >> index a462b6e53543..59499acb95f7 100644
> >> --- a/drivers/clk/starfive/Kconfig
> >> +++ b/drivers/clk/starfive/Kconfig
> >> @@ -53,3 +53,14 @@ config CLK_STARFIVE_JH7110_STG
> >>         help
> >>           Say yes here to support the System-Top-Group clock controller
> >>           on the StarFive JH7110 SoC.
> >> +
> >> +config CLK_STARFIVE_JH7110_ISP
> >> +       tristate "StarFive JH7110 Image-Signal-Process clock support"
> >> +       depends on CLK_STARFIVE_JH7110_SYS && JH71XX_PMU
> >> +       select AUXILIARY_BUS
> >> +       select CLK_STARFIVE_JH71X0
> >> +       select RESET_STARFIVE_JH7110
> >> +       default CLK_STARFIVE_JH7110_SYS
> >
> > default m if ARCH_STARFIVE
>
> Oh, the ISPCRG and VOUTCRG depend on SYSCRG because it need to enable core clock.
> So I should modify that:
>
> default m if CLK_STARFIVE_JH7110_SYS
>
> It that OK?

No, this symbol already has a "depends on CLK_STARFIVE_JH7110_SYS &&
JH71XX_PMU", so just do like the other drivers and default m if
ARCH_STARFIVE.

Btw. I don't see anything in the code depending on the PMU driver. Am
I just missing something could that dependency be removed?

> >
> >> +       help
> >> +         Say yes here to support the Image-Signal-Process clock controller
> >> +         on the StarFive JH7110 SoC.
> >> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> >> index b81e97ee2659..76fb9f8d628b 100644
> >> --- a/drivers/clk/starfive/Makefile
> >> +++ b/drivers/clk/starfive/Makefile
> >> @@ -7,3 +7,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO) += clk-starfive-jh7100-audio.o
> >>  obj-$(CONFIG_CLK_STARFIVE_JH7110_SYS)  += clk-starfive-jh7110-sys.o
> >>  obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)  += clk-starfive-jh7110-aon.o
> >>  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)  += clk-starfive-jh7110-stg.o
> >> +obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)  += clk-starfive-jh7110-isp.o
> >> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
> >> new file mode 100644
> >> index 000000000000..b5bce1ac22e0
> >> --- /dev/null
> >> +++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
> >> @@ -0,0 +1,254 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * StarFive JH7110 Image-Signal-Process Clock Driver
> >> + *
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/io.h>
> >> +#include <linux/of.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/pm_runtime.h>
> >> +#include <linux/reset.h>
> >> +
> >> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> >> +
> >> +#include "clk-starfive-jh71x0.h"
> >> +
> >> +/* external clocks */
> >> +#define JH7110_ISPCLK_ISP_TOP_CORE             (JH7110_ISPCLK_END + 0)
> >> +#define JH7110_ISPCLK_ISP_TOP_AXI              (JH7110_ISPCLK_END + 1)
> >> +#define JH7110_ISPCLK_NOC_BUS_ISP_AXI          (JH7110_ISPCLK_END + 2)
> >> +#define JH7110_ISPCLK_DVP_CLK                  (JH7110_ISPCLK_END + 3)
> >> +#define JH7110_ISPCLK_EXT_END                  (JH7110_ISPCLK_END + 4)
> >> +
> >> +static const struct jh71x0_clk_data jh7110_ispclk_data[] = {
> >> +       /* syscon */
> >> +       JH71X0__DIV(JH7110_ISPCLK_DOM4_APB_FUNC, "dom4_apb_func", 15,
> >> +                   JH7110_ISPCLK_ISP_TOP_AXI),
> >> +       JH71X0__DIV(JH7110_ISPCLK_MIPI_RX0_PXL, "mipi_rx0_pxl", 8,
> >> +                   JH7110_ISPCLK_ISP_TOP_CORE),
> >> +       JH71X0__INV(JH7110_ISPCLK_DVP_INV, "dvp_inv", JH7110_ISPCLK_DVP_CLK),
> >> +       /* vin */
> >> +       JH71X0__DIV(JH7110_ISPCLK_M31DPHY_CFGCLK_IN, "m31dphy_cfgclk_in", 16,
> >> +                   JH7110_ISPCLK_ISP_TOP_CORE),
> >> +       JH71X0__DIV(JH7110_ISPCLK_M31DPHY_REFCLK_IN, "m31dphy_refclk_in", 16,
> >> +                   JH7110_ISPCLK_ISP_TOP_CORE),
> >> +       JH71X0__DIV(JH7110_ISPCLK_M31DPHY_TXCLKESC_LAN0, "m31dphy_txclkesc_lan0", 60,
> >> +                   JH7110_ISPCLK_ISP_TOP_CORE),
> >> +       JH71X0_GATE(JH7110_ISPCLK_VIN_PCLK, "vin_pclk", CLK_IGNORE_UNUSED,
> >> +                   JH7110_ISPCLK_DOM4_APB_FUNC),
> >> +       JH71X0__DIV(JH7110_ISPCLK_VIN_SYS_CLK, "vin_sys_clk", 8, JH7110_ISPCLK_ISP_TOP_CORE),
> >> +       JH71X0_GATE(JH7110_ISPCLK_VIN_PIXEL_CLK_IF0, "vin_pixel_clk_if0", CLK_IGNORE_UNUSED,
> >> +                   JH7110_ISPCLK_MIPI_RX0_PXL),
> >> +       JH71X0_GATE(JH7110_ISPCLK_VIN_PIXEL_CLK_IF1, "vin_pixel_clk_if1", CLK_IGNORE_UNUSED,
> >> +                   JH7110_ISPCLK_MIPI_RX0_PXL),
> >> +       JH71X0_GATE(JH7110_ISPCLK_VIN_PIXEL_CLK_IF2, "vin_pixel_clk_if2", CLK_IGNORE_UNUSED,
> >> +                   JH7110_ISPCLK_MIPI_RX0_PXL),
> >> +       JH71X0_GATE(JH7110_ISPCLK_VIN_PIXEL_CLK_IF3, "vin_pixel_clk_if3", CLK_IGNORE_UNUSED,
> >> +                   JH7110_ISPCLK_MIPI_RX0_PXL),
> >> +       JH71X0__MUX(JH7110_ISPCLK_VIN_CLK_P_AXIWR, "vin_clk_p_axiwr", 2,
> >> +                   JH7110_ISPCLK_MIPI_RX0_PXL,
> >> +                   JH7110_ISPCLK_DVP_INV),
> >> +       /* ispv2_top_wrapper */
> >> +       JH71X0_GMUX(JH7110_ISPCLK_ISPV2_TOP_WRAPPER_CLK_C, "ispv2_top_wrapper_clk_c",
> >> +                   CLK_IGNORE_UNUSED, 2,
> >> +                   JH7110_ISPCLK_MIPI_RX0_PXL,
> >> +                   JH7110_ISPCLK_DVP_INV),
> >> +};
> >
> > Are all the clocks marked CLK_IGNORE_UNUSED here critical or are they
> > just marked like so because the corresponding drivers don't yet claim
> > the clocks they need? Please mark the clocks that can never be turned
> > off CLK_IS_CRITICAL and remove the flag from the rest of the clocks.
>
> Thanks, I will test it carefully and modify it.
>
> >
> >> +struct isp_top_crg {
> >> +       struct clk_bulk_data *top_clks;
> >> +       struct reset_control *top_rsts;
> >> +       int top_clks_num;
> >> +       void __iomem *base;
> >> +};
> >> +
> >> +static struct clk_bulk_data jh7110_isp_top_clks[] = {
> >> +       { .id = "isp_top_core" },
> >> +       { .id = "isp_top_axi" }
> >> +};
> >> +
> >> +static struct isp_top_crg *top_crg_from(void __iomem **base)
> >> +{
> >> +       return container_of(base, struct isp_top_crg, base);
> >> +}
> >> +
> >> +static int jh7110_isp_top_crg_get(struct jh71x0_clk_priv *priv, struct isp_top_crg *top)
> >> +{
> >> +       int ret;
> >> +
> >> +       top->top_clks = jh7110_isp_top_clks;
> >> +       top->top_clks_num = ARRAY_SIZE(jh7110_isp_top_clks);
> >> +       ret = devm_clk_bulk_get(priv->dev, top->top_clks_num, top->top_clks);
> >> +       if (ret) {
> >> +               dev_err(priv->dev, "top clks get failed: %d\n", ret);
> >> +               return ret;
> >> +       }
> >> +
> >> +       /* The resets should be shared and other ISP modules will use its. */
> >> +       top->top_rsts = devm_reset_control_array_get_shared(priv->dev);
> >> +       if (IS_ERR(top->top_rsts)) {
> >> +               dev_err(priv->dev, "top rsts get failed\n");
> >> +               return PTR_ERR(top->top_rsts);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int jh7110_isp_top_crg_enable(struct isp_top_crg *top)
> >> +{
> >> +       int ret;
> >> +
> >> +       ret = clk_bulk_prepare_enable(top->top_clks_num, top->top_clks);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       return reset_control_deassert(top->top_rsts);
> >> +}
> >> +
> >> +static void jh7110_isp_top_crg_disable(struct isp_top_crg *top)
> >> +{
> >> +       clk_bulk_disable_unprepare(top->top_clks_num, top->top_clks);
> >> +}
> >> +
> >> +static struct clk_hw *jh7110_ispclk_get(struct of_phandle_args *clkspec, void *data)
> >> +{
> >> +       struct jh71x0_clk_priv *priv = data;
> >> +       unsigned int idx = clkspec->args[0];
> >> +
> >> +       if (idx < JH7110_ISPCLK_END)
> >> +               return &priv->reg[idx].hw;
> >> +
> >> +       return ERR_PTR(-EINVAL);
> >> +}
> >> +
> >> +static int jh7110_ispcrg_probe(struct platform_device *pdev)
> >> +{
> >> +       struct jh71x0_clk_priv *priv;
> >> +       struct isp_top_crg *top;
> >> +       unsigned int idx;
> >> +       int ret;
> >> +
> >> +       priv = devm_kzalloc(&pdev->dev,
> >> +                           struct_size(priv, reg, JH7110_ISPCLK_END),
> >> +                           GFP_KERNEL);
> >> +       if (!priv)
> >> +               return -ENOMEM;
> >> +
> >> +       top = devm_kzalloc(&pdev->dev, sizeof(*top), GFP_KERNEL);
> >> +       if (!top)
> >> +               return -ENOMEM;
> >> +
> >> +       spin_lock_init(&priv->rmw_lock);
> >> +       priv->dev = &pdev->dev;
> >> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> >> +       if (IS_ERR(priv->base))
> >> +               return PTR_ERR(priv->base);
> >> +
> >> +       top->base = priv->base;
> >> +       dev_set_drvdata(priv->dev, (void *)(&top->base));
> >> +
> >> +       pm_runtime_enable(priv->dev);
> >> +       ret = pm_runtime_get_sync(priv->dev);
> >> +       if (ret < 0) {
> >> +               dev_err(priv->dev, "failed to turn on power: %d\n", ret);
> >> +               return ret;
> >> +       }
> >> +
> >> +       ret = jh7110_isp_top_crg_get(priv, top);
> >> +       if (ret)
> >> +               goto err_clk;
> >> +
> >> +       ret = jh7110_isp_top_crg_enable(top);
> >> +       if (ret)
> >> +               goto err_clk;
> >> +
> >> +       for (idx = 0; idx < JH7110_ISPCLK_END; idx++) {
> >> +               u32 max = jh7110_ispclk_data[idx].max;
> >> +               struct clk_parent_data parents[4] = {};
> >> +               struct clk_init_data init = {
> >> +                       .name = jh7110_ispclk_data[idx].name,
> >> +                       .ops = starfive_jh71x0_clk_ops(max),
> >> +                       .parent_data = parents,
> >> +                       .num_parents =
> >> +                               ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> >> +                       .flags = jh7110_ispclk_data[idx].flags,
> >> +               };
> >> +               struct jh71x0_clk *clk = &priv->reg[idx];
> >> +               unsigned int i;
> >> +               char *fw_name[JH7110_ISPCLK_EXT_END - JH7110_ISPCLK_END] = {
> >> +                       "isp_top_core",
> >> +                       "isp_top_axi",
> >> +                       "noc_bus_isp_axi",
> >> +                       "dvp_clk"
> >> +               };
> >> +
> >> +               for (i = 0; i < init.num_parents; i++) {
> >> +                       unsigned int pidx = jh7110_ispclk_data[idx].parents[i];
> >> +
> >> +                       if (pidx < JH7110_ISPCLK_END)
> >> +                               parents[i].hw = &priv->reg[pidx].hw;
> >> +                       else
> >> +                               parents[i].fw_name = fw_name[pidx - JH7110_ISPCLK_END];
> >> +               }
> >> +
> >> +               clk->hw.init = &init;
> >> +               clk->idx = idx;
> >> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
> >> +
> >> +               ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> >> +               if (ret)
> >> +                       goto err_exit;
> >> +       }
> >> +
> >> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_ispclk_get, priv);
> >> +       if (ret)
> >> +               goto err_exit;
> >> +
> >> +       ret = jh7110_reset_controller_register(priv, "reset-isp", 3);
> >> +       if (ret)
> >> +               goto err_exit;
> >> +
> >> +       return 0;
> >> +
> >> +err_exit:
> >> +       jh7110_isp_top_crg_disable(top);
> >> +err_clk:
> >> +       pm_runtime_put_sync(priv->dev);
> >> +       pm_runtime_disable(priv->dev);
> >> +       return ret;
> >> +}
> >> +
> >> +static int jh7110_ispcrg_remove(struct platform_device *pdev)
> >> +{
> >> +       void __iomem **base = dev_get_drvdata(&pdev->dev);
> >> +       struct isp_top_crg *top = top_crg_from(base);
> >> +
> >> +       jh7110_isp_top_crg_disable(top);
> >> +       pm_runtime_disable(&pdev->dev);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct of_device_id jh7110_ispcrg_match[] = {
> >> +       { .compatible = "starfive,jh7110-ispcrg" },
> >> +       { /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, jh7110_ispcrg_match);
> >> +
> >> +static struct platform_driver jh7110_ispcrg_driver = {
> >> +       .probe = jh7110_ispcrg_probe,
> >> +       .remove = jh7110_ispcrg_remove,
> >> +       .driver = {
> >> +               .name = "clk-starfive-jh7110-isp",
> >> +               .of_match_table = jh7110_ispcrg_match,
> >> +       },
> >> +};
> >> +module_platform_driver(jh7110_ispcrg_driver);
> >> +
> >> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
> >> +MODULE_DESCRIPTION("StarFive JH7110 Image-Signal-Process clock driver");
> >> +MODULE_LICENSE("GPL");
> >> --
> >> 2.25.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Best regards,
> Xingyu Wu
