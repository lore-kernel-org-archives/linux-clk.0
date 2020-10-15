Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF4AC433DF
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 12:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D150E22255
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 12:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602766367;
	bh=GCDqbACDibPFDnTO9hIskMWe7bQNhBOv7fmbMJLH9lY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=cVaef6/uAbK73eGd4G33+9fcsPTE4ZvHjSOa/r4Y65hcjlQ98fKEWYcCK6yRDJKkc
	 ejHjJiJwumf0KdQlR971+FhJxzC/kpSqJZcUFZLeRdRZ2yav4zr4GYPHk1jMwsvKPx
	 SAIbQxSLw8kGnif3IGSY1z9D07x3AQ+HZiD70ZKQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgJOMwr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Oct 2020 08:52:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:52008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgJOMwr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Oct 2020 08:52:47 -0400
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B43622254;
        Thu, 15 Oct 2020 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602766364;
        bh=GCDqbACDibPFDnTO9hIskMWe7bQNhBOv7fmbMJLH9lY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ikrfAesE00lB6oymIRA9Un82Cx9S0RQ9jQpBOzl+7xBWF0CNZMzvr2bwEcgYnHjXF
         t3axoF+JxXbmlwWpgA4koRcOia1gusMQnqIzT4QVGXMdbpUMY02AiZ9iX7zMZx4xpY
         URmxLScpGKxIIGqDXI08jJa/tp6zAIz6y3avu+ls=
Received: by mail-ed1-f48.google.com with SMTP id t20so2931937edr.11;
        Thu, 15 Oct 2020 05:52:44 -0700 (PDT)
X-Gm-Message-State: AOAM530S6SgmdPhgApch9u9feQiky4SLUofZQ1wkFB1UYkNlq+ziCH1x
        RCBJFD6QLoHREw424s1laYL/knAmBMqcW+s5waI=
X-Google-Smtp-Source: ABdhPJxT/CHpXw6ovekSBMHvG5Lxi3fbk0hngerorlDAd57QdARrPTXN2ERKWd90D2W4UrVMdh+IrrHuyDLHFAVKjl0=
X-Received: by 2002:a50:8b62:: with SMTP id l89mr4384366edl.132.1602766362211;
 Thu, 15 Oct 2020 05:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201015114725.23137-1-daire.mcnamara@microchip.com> <20201015114725.23137-3-daire.mcnamara@microchip.com>
In-Reply-To: <20201015114725.23137-3-daire.mcnamara@microchip.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 15 Oct 2020 14:52:30 +0200
X-Gmail-Original-Message-ID: <CAJKOXPduq7OSeSD9nbJG+DFK4n-WUzvED2s9d7pUNTA0+ya1Ww@mail.gmail.com>
Message-ID: <CAJKOXPduq7OSeSD9nbJG+DFK4n-WUzvED2s9d7pUNTA0+ya1Ww@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] CLK: microchip: Add driver for Microchip PolarFire SoC
To:     daire.mcnamara@microchip.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, padmarao.begari@microchip.com,
        david.abdurachmanov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 15 Oct 2020 at 14:25, <daire.mcnamara@microchip.com> wrote:
>
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
>     Add support for clock configuration on Microchip PolarFire SoC
>
>     Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  drivers/clk/Kconfig                           |   5 +
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/microchip/Makefile                |   1 +
>  drivers/clk/microchip/clk-pfsoc.c             | 424 ++++++++++++++++++
>  .../dt-bindings/clock/microchip,pfsoc-clock.h |  45 ++
>  5 files changed, 476 insertions(+)
>  create mode 100644 drivers/clk/microchip/clk-pfsoc.c
>  create mode 100644 include/dt-bindings/clock/microchip,pfsoc-clock.h
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 4026fac9fac3..5ba96ba3028a 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -359,6 +359,11 @@ config COMMON_CLK_FIXED_MMIO
>         help
>           Support for Memory Mapped IO Fixed clocks
>
> +config MCHP_CLK_PFSOC
> +        bool "Clk driver for PolarFire SoC"

1. Did you indent it properly, like Kconfig syntax requires?
2. You miss any depends here so the driver will be selectable on all
configs and all platforms? It pollutes the kernel configuration
choices.
3. Anyway this should be probably in its own Kconfig under clk/microchip.

> +       help
> +         Supports Clock Configuration for PolarFire SoC
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index da8fcf147eb1..a3d4ad288053 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_MACH_LOONGSON32)         += loongson1/
>  obj-y                                  += mediatek/
>  obj-$(CONFIG_ARCH_MESON)               += meson/
>  obj-$(CONFIG_MACH_PIC32)               += microchip/
> +obj-$(CONFIG_MCHP_CLK_PFSOC)           += microchip/
>  ifeq ($(CONFIG_COMMON_CLK), y)
>  obj-$(CONFIG_ARCH_MMP)                 += mmp/
>  endif
> diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makefile
> index f34b247e870f..55156dd15596 100644
> --- a/drivers/clk/microchip/Makefile
> +++ b/drivers/clk/microchip/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_COMMON_CLK_PIC32) += clk-core.o
>  obj-$(CONFIG_PIC32MZDA) += clk-pic32mzda.o
> +obj-$(CONFIG_MCHP_CLK_PFSOC) += clk-pfsoc.o
> diff --git a/drivers/clk/microchip/clk-pfsoc.c b/drivers/clk/microchip/clk-pfsoc.c
> new file mode 100644
> index 000000000000..affd023ef084
> --- /dev/null
> +++ b/drivers/clk/microchip/clk-pfsoc.c
> @@ -0,0 +1,424 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Daire McNamara,<daire.mcnamara@microchip.com>
> + * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
> + */
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <dt-bindings/clock/microchip,pfsoc-clock.h>
> +
> +/* address offset of control registers */
> +#define REG_CLOCK_CONFIG_CR    0x08u
> +#define REG_SUBBLK_CLOCK_CR    0x84u
> +#define REG_SUBBLK_RESET_CR    0x88u
> +
> +/*
> + * pfsoc_clk_lock prevents anything else from writing to the
> + * pfsoc clk block while a software locked register is being written.
> + */
> +static DEFINE_SPINLOCK(pfsoc_clk_lock);
> +
> +static struct clk_parent_data pfsoc_cfg_parent[] = {
> +       { .fw_name = "msspllclk", .name = "msspllclk" },
> +};
> +
> +struct pfsoc_clock_data {
> +       void __iomem *reg;
> +       struct clk_hw_onecell_data hw_data;
> +};
> +
> +static const struct clk_div_table pfsoc_div_cpu_axi_table[] = {
> +       { 0, 1 }, { 1, 2 }, { 2, 4 }, { 3, 8 },
> +       { 0, 0 }
> +};
> +
> +static const struct clk_div_table pfsoc_div_ahb_table[] = {
> +       { 1, 2 }, { 2, 4}, { 3, 8 },
> +       { 0, 0 }
> +};
> +
> +struct pfsoc_cfg_clock {
> +       unsigned int id;
> +       const char *name;
> +       u8 shift;
> +       u8 width;
> +       const struct clk_div_table *table;
> +       unsigned long flags;
> +};
> +
> +struct pfsoc_cfg_hw_clock {
> +       struct pfsoc_cfg_clock cfg;
> +       void __iomem *sys_base;
> +       /* lock is used to prevent multiple writes */
> +       spinlock_t *lock;

Doesn't the core already provide you locking? Why do you need it?

> +       struct clk_hw hw;
> +       struct clk_init_data init;
> +};
> +
> +#define to_pfsoc_cfg_clk(_hw) container_of(_hw, struct pfsoc_cfg_hw_clock, hw)
> +
> +static unsigned long pfsoc_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
> +{
> +       struct pfsoc_cfg_hw_clock *cfg_hw = to_pfsoc_cfg_clk(hw);
> +       struct pfsoc_cfg_clock *cfg = &cfg_hw->cfg;
> +       void __iomem *base_addr = cfg_hw->sys_base;
> +       unsigned long rate;
> +       u32 val;
> +
> +       val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR) >> cfg->shift;
> +       val &= clk_div_mask(cfg->width);
> +       rate = prate / (1u << val);
> +
> +       return rate;
> +}
> +
> +static long pfsoc_cfg_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
> +{
> +       struct pfsoc_cfg_hw_clock *cfg_hw = to_pfsoc_cfg_clk(hw);
> +       struct pfsoc_cfg_clock *cfg = &cfg_hw->cfg;
> +
> +       return divider_round_rate(hw, rate, prate, cfg->table, cfg->width, cfg->flags);
> +}
> +
> +static int pfsoc_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
> +{
> +       struct pfsoc_cfg_hw_clock *cfg_hw = to_pfsoc_cfg_clk(hw);
> +       struct pfsoc_cfg_clock *cfg = &cfg_hw->cfg;
> +       void __iomem *base_addr = cfg_hw->sys_base;
> +       unsigned long flags = 0;
> +       u32 divider_setting, val;
> +
> +       divider_setting = divider_get_val(rate, prate, cfg->table, cfg->width, cfg_hw->cfg.flags);
> +
> +       if (divider_setting < 0)
> +               return divider_setting;
> +
> +       if (cfg_hw->lock)
> +               spin_lock_irqsave(cfg_hw->lock, flags);
> +       else
> +               __acquire(cfg_hw->lock);
> +
> +       val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR);
> +       val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
> +       val |= divider_setting << cfg->shift;
> +       writel_relaxed(val, base_addr + REG_CLOCK_CONFIG_CR);
> +
> +       if (cfg_hw->lock)
> +               spin_unlock_irqrestore(cfg_hw->lock, flags);
> +       else
> +               __release(cfg_hw->lock);
> +
> +       return 0;
> +}
> +
> +static const struct clk_ops pfsoc_clk_cfg_ops = {
> +       .recalc_rate = pfsoc_cfg_clk_recalc_rate,
> +       .round_rate = pfsoc_cfg_clk_round_rate,
> +       .set_rate = pfsoc_cfg_clk_set_rate,
> +};
> +
> +#define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags) { \
> +               .cfg.id = _id,                                                          \
> +               .cfg.name = _name,                                                      \
> +               .cfg.shift = _shift,                                                    \
> +               .cfg.width = _width,                                                    \
> +               .cfg.table = _table,                                                    \
> +               .hw.init = CLK_HW_INIT_PARENTS_DATA(_name, _parent, &pfsoc_clk_cfg_ops, \
> +                                                   _flags),                            \
> +       }
> +
> +static struct pfsoc_cfg_hw_clock pfsoc_cfg_clks[] = {
> +       CLK_CFG(CLK_CPU, "clk_cpu", pfsoc_cfg_parent, 0, 2, pfsoc_div_cpu_axi_table, 0),
> +       CLK_CFG(CLK_AXI, "clk_axi", pfsoc_cfg_parent, 2, 2, pfsoc_div_cpu_axi_table, 0),
> +       CLK_CFG(CLK_AHB, "clk_ahb", pfsoc_cfg_parent, 4, 2, pfsoc_div_ahb_table, 0),
> +};
> +
> +#define CPU_PARENT pfsoc_cfg_clks[0].hw
> +#define AXI_PARENT pfsoc_cfg_clks[1].hw
> +#define AHB_PARENT pfsoc_cfg_clks[2].hw
> +
> +static void pfsoc_clk_unregister_cfg(struct device *dev, struct clk_hw *hw)
> +{
> +       struct pfsoc_cfg_hw_clock *cfg_hw = to_pfsoc_cfg_clk(hw);
> +
> +       devm_clk_hw_unregister(dev, hw);
> +       kfree(cfg_hw);
> +}
> +
> +static struct clk_hw *pfsoc_clk_register_cfg(struct device *dev,
> +                                            struct pfsoc_cfg_hw_clock *cfg_hw,
> +                                            void __iomem *sys_base)
> +{
> +       struct clk_hw *hw;
> +       int err;
> +
> +       cfg_hw->sys_base = sys_base;
> +       cfg_hw->lock = &pfsoc_clk_lock;
> +
> +       hw = &cfg_hw->hw;
> +       err = devm_clk_hw_register(dev, hw);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return hw;
> +}
> +
> +static int pfsoc_clk_register_cfgs(struct device *dev, struct pfsoc_cfg_hw_clock *cfg_hws,
> +                                  int num_clks, struct pfsoc_clock_data *data)
> +{
> +       struct clk_hw *hw;
> +       void __iomem *sys_base = data->reg;
> +       unsigned int i, id;
> +
> +       for (i = 0; i < num_clks; i++) {
> +               struct pfsoc_cfg_hw_clock *cfg_hw = &cfg_hws[i];
> +
> +               hw = pfsoc_clk_register_cfg(dev, cfg_hw, sys_base);
> +               if (IS_ERR(hw)) {
> +                       pr_err("%s: failed to register clock %s\n", __func__,
> +                              cfg_hw->cfg.name);

dev_err, not pr_err.

> +                       goto err_clk;
> +               }
> +
> +               id = cfg_hws[i].cfg.id;
> +               data->hw_data.hws[id] = hw;
> +       }
> +
> +       return 0;
> +
> +err_clk:
> +       while (i--)
> +               pfsoc_clk_unregister_cfg(dev, data->hw_data.hws[cfg_hws[i].cfg.id]);
> +
> +       return PTR_ERR(hw);
> +}
> +
> +struct pfsoc_periph_clock {
> +       unsigned int id;
> +       const char *name;
> +       u8 shift;
> +       unsigned long flags;
> +};
> +
> +struct pfsoc_periph_hw_clock {
> +       struct pfsoc_periph_clock periph;
> +       void __iomem *sys_base;
> +       /* lock is used to prevent multiple writes */
> +       spinlock_t *lock;
> +       struct clk_hw hw;
> +};

Keep all struct definitions at the beginning of the file, next to each
other. Do not spread them all over.

> +
> +#define to_pfsoc_periph_clk(_hw) container_of(_hw, struct pfsoc_periph_hw_clock, hw)
> +
> +static int pfsoc_periph_clk_enable(struct clk_hw *hw)
> +{
> +       struct pfsoc_periph_hw_clock *periph_hw = to_pfsoc_periph_clk(hw);
> +       struct pfsoc_periph_clock *periph = &periph_hw->periph;
> +       void __iomem *base_addr = periph_hw->sys_base;
> +       u32 reg, val;
> +
> +       reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> +       val = reg & ~(1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
> +
> +       reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +       val = reg | (1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> +
> +       return 0;
> +}
> +
> +static void pfsoc_periph_clk_disable(struct clk_hw *hw)
> +{
> +       struct pfsoc_periph_hw_clock *periph_hw = to_pfsoc_periph_clk(hw);
> +       struct pfsoc_periph_clock *periph = &periph_hw->periph;
> +       void __iomem *base_addr = periph_hw->sys_base;
> +       u32 reg, val;
> +
> +       reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> +       val = reg | (1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
> +
> +       reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +       val = reg & ~(1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> +}
> +
> +static int pfsoc_periph_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct pfsoc_periph_hw_clock *periph_hw = to_pfsoc_periph_clk(hw);
> +       struct pfsoc_periph_clock *periph = &periph_hw->periph;
> +       void __iomem *base_addr = periph_hw->sys_base;
> +       u32 reg;
> +
> +       reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> +       if ((reg & (1u << periph->shift)) == 0u) {
> +               reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +               if (reg & (1u << periph->shift))
> +                       return 1;

Everywhere here and before you use relaxed reads and writes so I
assume ordering of all these functions do not matter (assuming core's
clock will finally be a barrier)?

> +       }
> +
> +       return 0;
> +}
> +
> +static unsigned long pfsoc_periph_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
> +{
> +       return prate;
> +}
> +
> +static const struct clk_ops pfsoc_periph_clk_ops = {
> +       .enable = pfsoc_periph_clk_enable,
> +       .disable = pfsoc_periph_clk_disable,
> +       .is_enabled = pfsoc_periph_clk_is_enabled,
> +       .recalc_rate = pfsoc_periph_clk_recalc_rate,
> +};
> +
> +#define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {                      \
> +               .periph.id = _id,                                                       \
> +               .periph.name = _name,                                                   \
> +               .periph.shift = _shift,                                                 \
> +               .hw.init = CLK_HW_INIT_HW(_name, _parent, &pfsoc_periph_clk_ops,        \
> +                                         _flags),                                      \
> +       }
> +
> +static struct pfsoc_periph_hw_clock pfsoc_periph_clks[] = {
> +       CLK_PERIPH(CLK_ENVM, "clk_periph_envm", &AHB_PARENT, 0, CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", &AHB_PARENT, 1, 0),
> +       CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", &AHB_PARENT, 2, 0),
> +       CLK_PERIPH(CLK_MMC, "clk_periph_mmc", &AHB_PARENT, 3, 0),
> +       CLK_PERIPH(CLK_TIMER, "clk_periph_timer", &AHB_PARENT, 4, 0),
> +       CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", &AHB_PARENT, 5, 0),
> +       CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", &AHB_PARENT, 6, 0),
> +       CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", &AHB_PARENT, 7, 0),
> +       CLK_PERIPH(CLK_MMUART3, "clk_periph_mmuart3", &AHB_PARENT, 8, 0),
> +       CLK_PERIPH(CLK_MMUART4, "clk_periph_mmuart4", &AHB_PARENT, 9, 0),
> +       CLK_PERIPH(CLK_SPI0, "clk_periph_spi0", &AHB_PARENT, 10, 0),
> +       CLK_PERIPH(CLK_SPI1, "clk_periph_spi1", &AHB_PARENT, 11, 0),
> +       CLK_PERIPH(CLK_I2C0, "clk_periph_i2c0", &AHB_PARENT, 12, 0),
> +       CLK_PERIPH(CLK_I2C1, "clk_periph_i2c1", &AHB_PARENT, 13, 0),
> +       CLK_PERIPH(CLK_CAN0, "clk_periph_can0", &AHB_PARENT, 14, 0),
> +       CLK_PERIPH(CLK_CAN1, "clk_periph_can1", &AHB_PARENT, 15, 0),
> +       CLK_PERIPH(CLK_USB, "clk_periph_usb", &AHB_PARENT, 16, 0),
> +       CLK_PERIPH(CLK_RTC, "clk_periph_rtc", &AHB_PARENT, 18, 0),
> +       CLK_PERIPH(CLK_QSPI, "clk_periph_qspi", &AHB_PARENT, 19, 0),
> +       CLK_PERIPH(CLK_GPIO0, "clk_periph_gpio0", &AHB_PARENT, 20, 0),
> +       CLK_PERIPH(CLK_GPIO1, "clk_periph_gpio1", &AHB_PARENT, 21, 0),
> +       CLK_PERIPH(CLK_GPIO2, "clk_periph_gpio2", &AHB_PARENT, 22, 0),
> +       CLK_PERIPH(CLK_DDRC, "clk_periph_ddrc", &AHB_PARENT, 23, CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", &AHB_PARENT, 24, 0),
> +       CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", &AHB_PARENT, 25, 0),
> +       CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", &AHB_PARENT, 26, 0),
> +       CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", &AHB_PARENT, 27, 0),
> +       CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", &AHB_PARENT, 28, 0),
> +       CLK_PERIPH(CLK_CFM, "clk_periph_cfm", &AHB_PARENT, 29, 0),
> +};
> +
> +static void pfsoc_clk_unregister_periph(struct device *dev, struct clk_hw *hw)
> +{
> +       struct pfsoc_periph_hw_clock *periph_hw = to_pfsoc_periph_clk(hw);
> +
> +       devm_clk_hw_unregister(dev, hw);
> +       kfree(periph_hw);
> +}
> +
> +static struct clk_hw *pfsoc_clk_register_periph(struct device *dev,
> +                                               struct pfsoc_periph_hw_clock *periph_hw,
> +                                               void __iomem *sys_base)
> +{
> +       struct clk_hw *hw;
> +       int err;
> +
> +       periph_hw->sys_base = sys_base;
> +       periph_hw->lock = &pfsoc_clk_lock;
> +
> +       hw = &periph_hw->hw;
> +       err = devm_clk_hw_register(dev, hw);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return hw;
> +}
> +
> +static int pfsoc_clk_register_periphs(struct device *dev, struct pfsoc_periph_hw_clock *periph_hws,
> +                                     int num_clks, struct pfsoc_clock_data *data)
> +{
> +       struct clk_hw *hw;
> +       void __iomem *sys_base = data->reg;
> +       unsigned int i, id;
> +
> +       for (i = 0; i < num_clks; i++) {
> +               struct pfsoc_periph_hw_clock *periph_hw = &periph_hws[i];
> +
> +               hw = pfsoc_clk_register_periph(dev, periph_hw, sys_base);
> +               if (IS_ERR(hw)) {
> +                       pr_err("%s: failed to register clock %s\n", __func__,
> +                              periph_hw->periph.name);
> +                       goto err_clk;
> +               }
> +
> +               id = periph_hws[i].periph.id;
> +               data->hw_data.hws[id] = hw;
> +       }
> +
> +       return 0;
> +
> +err_clk:
> +       while (i--)
> +               pfsoc_clk_unregister_periph(dev, data->hw_data.hws[periph_hws[i].periph.id]);
> +
> +       return PTR_ERR(hw);
> +}
> +
> +static int pfsoc_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct pfsoc_clock_data *clk_data;
> +       struct resource *res;
> +       int num_clks;
> +       int ret;
> +
> +       num_clks = ARRAY_SIZE(pfsoc_cfg_clks) + ARRAY_SIZE(pfsoc_periph_clks);
> +
> +       clk_data = devm_kzalloc(dev, struct_size(clk_data, hw_data.hws, num_clks), GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       clk_data->reg = devm_ioremap_resource(dev, res);

Where is the return value check?

> +
> +       clk_data->hw_data.num = num_clks;
> +
> +       pfsoc_clk_register_cfgs(dev, pfsoc_cfg_clks, ARRAY_SIZE(pfsoc_cfg_clks), clk_data);

Where is the return value check?

> +
> +       pfsoc_clk_register_periphs(dev, pfsoc_periph_clks, ARRAY_SIZE(pfsoc_periph_clks), clk_data);

Where is the return value check?

> +
> +       ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, &clk_data->hw_data);
> +

Remove the empty line. if() always goes immediately after the actual statement.

> +       if (ret == 0)

if (!ret)

> +               dev_info(dev, "registered PFSOC core clocks\n");
> +       else
> +               dev_err(dev, "failed to register PFSOC core clocks\n");
> +
> +       return ret;
> +}
> +
> +static const struct of_device_id pfsoc_of_match[] = {
> +       { .compatible = "microchip,pfsoc-clkcfg", },
> +       {}
> +};
> +
> +static struct platform_driver pfsoc_clk_driver = {
> +       .probe = pfsoc_clk_probe,
> +       .driver = {
> +               .name = "microchip-pfsoc-clkcfg",
> +               .of_match_table = pfsoc_of_match,
> +       },
> +};
> +
> +static int __init clk_pfsoc_init(void)
> +{
> +       return platform_driver_register(&pfsoc_clk_driver);
> +}
> +core_initcall(clk_pfsoc_init);

Why not a module?

Best regards,
Krzysztof
