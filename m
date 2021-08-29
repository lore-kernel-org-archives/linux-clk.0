Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58751C432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 18:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29F326023D
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 18:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbhH2SWA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 14:22:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:46520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230116AbhH2SWA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 14:22:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9857F60F23;
        Sun, 29 Aug 2021 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630261267;
        bh=czcZYeudvGrHNtyY+3AKjidl86q1c22Pt5FJS9v8xf8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gqfmLKFN186gOgU/e0akuBnzpeQfNjskHK69Pegpq70uulcvAH8UJuKLakHyRnosO
         J7z5vpCC+MMNiV6nZPXgDMosKmx2moULMOtaymUO4KhjMs5Km22LD0yrcW76E/82jO
         11JCjvyZmoShwkOG2ojFLp8/HLxYqCpMX+JfhqOWZbBPmsDkA3khriSPpdZGCoqHvB
         IkQSc3qcCEjaUEq9z/MhcRIUzC21pECiq8RJxm+3aEffV5CR085BjPwVhQFp6GfUCT
         aROHMFa0iVAbPEISOlOI5dVWecA5TExRk0A1wD7s4ykqwumJnqs5jemzZS8u/ZM6U/
         f6u5TzTAh/jIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210528134308.649769-3-daire.mcnamara@microchip.com>
References: <20210528134308.649769-1-daire.mcnamara@microchip.com> <20210528134308.649769-3-daire.mcnamara@microchip.com>
Subject: Re: [PATCH v5 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     palmer@dabbelt.com, cyril.jean@microchip.com,
        padmarao.begari@microchip.com, lewis.hanly@microchip.com,
        conor.dooley@microchip.com, david.abdurachmanov@gmail.com,
        Daire McNamara <daire.mcnamara@microchip.com>
To:     daire.mcnamara@microchip.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Sun, 29 Aug 2021 11:21:06 -0700
Message-ID: <163026126640.2676726.12043033959839521381@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting daire.mcnamara@microchip.com (2021-05-28 06:43:08)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index a588d56502d4..ab604dd02acf 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -388,6 +388,7 @@ source "drivers/clk/keystone/Kconfig"
>  source "drivers/clk/mediatek/Kconfig"
>  source "drivers/clk/meson/Kconfig"
>  source "drivers/clk/mstar/Kconfig"
> +source "drivers/clk/microchip/Kconfig"

'i' comes before 's'.

>  source "drivers/clk/mvebu/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index b22ae4f81e0b..fb87a18ae8ec 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -89,7 +89,7 @@ obj-$(CONFIG_ARCH_KEYSTONE)           +=3D keystone/
>  obj-$(CONFIG_MACH_LOONGSON32)          +=3D loongson1/
>  obj-y                                  +=3D mediatek/
>  obj-$(CONFIG_ARCH_MESON)               +=3D meson/
> -obj-$(CONFIG_MACH_PIC32)               +=3D microchip/
> +obj-y                                  +=3D microchip/
>  ifeq ($(CONFIG_COMMON_CLK), y)
>  obj-$(CONFIG_ARCH_MMP)                 +=3D mmp/
>  endif
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> new file mode 100644
> index 000000000000..f5edc7b3c07c
> --- /dev/null
> +++ b/drivers/clk/microchip/Kconfig
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config MCHP_CLK_MPFS
> +       bool "Clk driver for PolarFire SoC"
> +       depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST

Should also have
=09
	default CONFIG_MACH_PIC32

here to keep things working for olddefconfig?

> +       help
> +         Supports Clock Configuration for PolarFire SoC
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk=
-mpfs.c
> new file mode 100644
> index 000000000000..541f88181877
> --- /dev/null
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Daire McNamara,<daire.mcnamara@microchip.com>
> + * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
> + */
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <dt-bindings/clock/microchip,mpfs-clock.h>
> +
> +/* address offset of control registers */
> +#define REG_CLOCK_CONFIG_CR    0x08u
> +#define REG_SUBBLK_CLOCK_CR    0x84u
> +#define REG_SUBBLK_RESET_CR    0x88u
> +
> +struct mpfs_clock_data {
> +       void __iomem *base;
> +       struct clk_hw_onecell_data hw_data;
> +};
> +
> +struct mpfs_cfg_clock {
> +       unsigned int id;
> +       const char *name;
> +       u8 shift;
> +       u8 width;
> +       const struct clk_div_table *table;
> +       unsigned long flags;
> +};
> +
> +struct mpfs_cfg_hw_clock {
> +       struct mpfs_cfg_clock cfg;
> +       void __iomem *sys_base;
> +       /* lock is used to prevent multiple writes */
> +       spinlock_t *lock;
> +       struct clk_hw hw;
> +       struct clk_init_data init;
> +};
> +
> +#define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock,=
 hw)
> +
> +struct mpfs_periph_clock {
> +       unsigned int id;
> +       const char *name;
> +       u8 shift;
> +       unsigned long flags;
> +};
> +
> +struct mpfs_periph_hw_clock {
> +       struct mpfs_periph_clock periph;
> +       void __iomem *sys_base;
> +       /* lock is used to prevent multiple writes */
> +       spinlock_t *lock;
> +       struct clk_hw hw;
> +};
> +
> +#define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_=
clock, hw)
> +
> +/*
> + * mpfs_clk_lock prevents anything else from writing to the
> + * mpfs clk block while a software locked register is being written.
> + */
> +static DEFINE_SPINLOCK(mpfs_clk_lock);
> +
> +static struct clk_parent_data mpfs_cfg_parent[] =3D {
> +       { .fw_name =3D "msspllclk", .name =3D "msspllclk" },
> +};
> +
> +static const struct clk_div_table mpfs_div_cpu_axi_table[] =3D {
> +       { 0, 1 }, { 1, 2 }, { 2, 4 }, { 3, 8 },

Is this 1 << val? Do we need a table for that?

> +       { 0, 0 }
> +};
> +
> +static const struct clk_div_table mpfs_div_ahb_table[] =3D {
> +       { 1, 2 }, { 2, 4}, { 3, 8 },
> +       { 0, 0 }
> +};
> +
> +static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigne=
d long prate)
> +{
> +       struct mpfs_cfg_hw_clock *cfg_hw =3D to_mpfs_cfg_clk(hw);
> +       struct mpfs_cfg_clock *cfg =3D &cfg_hw->cfg;
> +       void __iomem *base_addr =3D cfg_hw->sys_base;
> +       unsigned long rate;
> +       u32 val;
> +
> +       val =3D readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR) >> cfg->sh=
ift;
> +       val &=3D clk_div_mask(cfg->width);
> +       rate =3D prate / (1u << val);
> +
> +       return rate;

return prate / (1u << val);

> +}
> +
> +static long mpfs_cfg_clk_round_rate(struct clk_hw *hw, unsigned long rat=
e, unsigned long *prate)
> +{
> +       struct mpfs_cfg_hw_clock *cfg_hw =3D to_mpfs_cfg_clk(hw);
> +       struct mpfs_cfg_clock *cfg =3D &cfg_hw->cfg;
> +
> +       return divider_round_rate(hw, rate, prate, cfg->table, cfg->width=
, cfg->flags);
> +}
> +
> +static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, =
unsigned long prate)
> +{
> +       struct mpfs_cfg_hw_clock *cfg_hw =3D to_mpfs_cfg_clk(hw);
> +       struct mpfs_cfg_clock *cfg =3D &cfg_hw->cfg;
> +       void __iomem *base_addr =3D cfg_hw->sys_base;
> +       unsigned long flags =3D 0;

Do we need to initialize flags?

> +       u32 val;
> +       int divider_setting;
> +
> +       divider_setting =3D divider_get_val(rate, prate, cfg->table, cfg-=
>width, cfg_hw->cfg.flags);
> +
> +       if (divider_setting < 0)
> +               return divider_setting;
> +
> +       if (cfg_hw->lock)

Does it need to be conditional?

> +               spin_lock_irqsave(cfg_hw->lock, flags);
> +       else
> +               __acquire(cfg_hw->lock);
> +
> +       val =3D readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR);
> +       val &=3D ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
> +       val |=3D divider_setting << cfg->shift;
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
> +static const struct clk_ops mpfs_clk_cfg_ops =3D {
> +       .recalc_rate =3D mpfs_cfg_clk_recalc_rate,
> +       .round_rate =3D mpfs_cfg_clk_round_rate,
> +       .set_rate =3D mpfs_cfg_clk_set_rate,
> +};
> +
> +#define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags) { \
> +               .cfg.id =3D _id,                                         =
                 \
> +               .cfg.name =3D _name,                                     =
                 \
> +               .cfg.shift =3D _shift,                                   =
                 \
> +               .cfg.width =3D _width,                                   =
                 \
> +               .cfg.table =3D _table,                                   =
                 \
> +               .hw.init =3D CLK_HW_INIT_PARENTS_DATA(_name, _parent, &mp=
fs_clk_cfg_ops,  \
> +                                                   _flags),             =
               \
> +       }
> +
> +static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] =3D {
> +       CLK_CFG(CLK_CPU, "clk_cpu", mpfs_cfg_parent, 0, 2, mpfs_div_cpu_a=
xi_table, 0),
> +       CLK_CFG(CLK_AXI, "clk_axi", mpfs_cfg_parent, 2, 2, mpfs_div_cpu_a=
xi_table, 0),
> +       CLK_CFG(CLK_AHB, "clk_ahb", mpfs_cfg_parent, 4, 2, mpfs_div_ahb_t=
able, 0),
> +};
> +
> +static void mpfs_clk_unregister_cfg(struct device *dev, struct clk_hw *h=
w)
> +{
> +       struct mpfs_cfg_hw_clock *cfg_hw =3D to_mpfs_cfg_clk(hw);
> +
> +       devm_clk_hw_unregister(dev, hw);
> +       kfree(cfg_hw);
> +}
> +
> +static struct clk_hw *mpfs_clk_register_cfg(struct device *dev,
> +                                           struct mpfs_cfg_hw_clock *cfg=
_hw,
> +                                           void __iomem *sys_base)
> +{
> +       struct clk_hw *hw;
> +       int err;
> +
> +       cfg_hw->sys_base =3D sys_base;
> +       cfg_hw->lock =3D &mpfs_clk_lock;
> +
> +       hw =3D &cfg_hw->hw;
> +       err =3D devm_clk_hw_register(dev, hw);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return hw;
> +}
> +
> +static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw=
_clock *cfg_hws,
> +                                 int num_clks, struct mpfs_clock_data *d=
ata)
> +{
> +       struct clk_hw *hw;
> +       void __iomem *sys_base =3D data->base;
> +       unsigned int i, id;
> +
> +       for (i =3D 0; i < num_clks; i++) {
> +               struct mpfs_cfg_hw_clock *cfg_hw =3D &cfg_hws[i];
> +
> +               hw =3D mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
> +               if (IS_ERR(hw)) {
> +                       dev_err(dev, "%s: failed to register clock %s\n",=
 __func__,
> +                               cfg_hw->cfg.name);
> +                       goto err_clk;
> +               }
> +
> +               id =3D cfg_hws[i].cfg.id;
> +               data->hw_data.hws[id] =3D hw;
> +       }
> +
> +       return 0;
> +
> +err_clk:
> +       while (i--)
> +               mpfs_clk_unregister_cfg(dev, data->hw_data.hws[cfg_hws[i]=
.cfg.id]);
> +
> +       return PTR_ERR(hw);
> +}
> +
> +static int mpfs_periph_clk_enable(struct clk_hw *hw)
> +{
> +       struct mpfs_periph_hw_clock *periph_hw =3D to_mpfs_periph_clk(hw);
> +       struct mpfs_periph_clock *periph =3D &periph_hw->periph;
> +       void __iomem *base_addr =3D periph_hw->sys_base;
> +       u32 reg, val;
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> +       val =3D reg & ~(1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +       val =3D reg | (1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> +
> +       return 0;
> +}
> +
> +static void mpfs_periph_clk_disable(struct clk_hw *hw)
> +{
> +       struct mpfs_periph_hw_clock *periph_hw =3D to_mpfs_periph_clk(hw);
> +       struct mpfs_periph_clock *periph =3D &periph_hw->periph;
> +       void __iomem *base_addr =3D periph_hw->sys_base;
> +       u32 reg, val;
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> +       val =3D reg | (1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +       val =3D reg & ~(1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> +}
> +
> +static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct mpfs_periph_hw_clock *periph_hw =3D to_mpfs_periph_clk(hw);
> +       struct mpfs_periph_clock *periph =3D &periph_hw->periph;
> +       void __iomem *base_addr =3D periph_hw->sys_base;
> +       u32 reg;
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> +       if ((reg & (1u << periph->shift)) =3D=3D 0u) {
> +               reg =3D readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +               if (reg & (1u << periph->shift))
> +                       return 1;
> +       }
> +
> +       return 0;
> +}
> +
> +static unsigned long mpfs_periph_clk_recalc_rate(struct clk_hw *hw, unsi=
gned long prate)
> +{
> +       return prate;
> +}

This is the default implementation, so it can be dropped.

> +
> +static const struct clk_ops mpfs_periph_clk_ops =3D {
> +       .enable =3D mpfs_periph_clk_enable,
> +       .disable =3D mpfs_periph_clk_disable,
> +       .is_enabled =3D mpfs_periph_clk_is_enabled,
> +       .recalc_rate =3D mpfs_periph_clk_recalc_rate,
> +};
> +
> +#define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {               =
               \
> +               .periph.id =3D _id,                                      =
                 \
> +               .periph.name =3D _name,                                  =
                 \
> +               .periph.shift =3D _shift,                                =
                 \
> +               .hw.init =3D CLK_HW_INIT_HW(_name, _parent, &mpfs_periph_=
clk_ops, \
> +                                         _flags),                       =
               \
> +       }
> +
> +#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].hw)
> +
> +static struct mpfs_periph_hw_clock mpfs_periph_clks[] =3D {
> +       CLK_PERIPH(CLK_ENVM, "clk_periph_envm", PARENT_CLK(AHB), 0, CLK_I=
S_CRITICAL),

Please add a comment explaining why it is critical. That way we know
what to do with the clk in the future.

> +       CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", PARENT_CLK(AHB), 1, 0),
> +       CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
> +       CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
> +       CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(AHB), 4, 0),
> +       CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5,=
 CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6,=
 0),
> +       CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7,=
 0),
> +       CLK_PERIPH(CLK_MMUART3, "clk_periph_mmuart3", PARENT_CLK(AHB), 8,=
 0),
> +       CLK_PERIPH(CLK_MMUART4, "clk_periph_mmuart4", PARENT_CLK(AHB), 9,=
 0),
> +       CLK_PERIPH(CLK_SPI0, "clk_periph_spi0", PARENT_CLK(AHB), 10, 0),
> +       CLK_PERIPH(CLK_SPI1, "clk_periph_spi1", PARENT_CLK(AHB), 11, 0),
> +       CLK_PERIPH(CLK_I2C0, "clk_periph_i2c0", PARENT_CLK(AHB), 12, 0),
> +       CLK_PERIPH(CLK_I2C1, "clk_periph_i2c1", PARENT_CLK(AHB), 13, 0),
> +       CLK_PERIPH(CLK_CAN0, "clk_periph_can0", PARENT_CLK(AHB), 14, 0),
> +       CLK_PERIPH(CLK_CAN1, "clk_periph_can1", PARENT_CLK(AHB), 15, 0),
> +       CLK_PERIPH(CLK_USB, "clk_periph_usb", PARENT_CLK(AHB), 16, 0),
> +       CLK_PERIPH(CLK_RTC, "clk_periph_rtc", PARENT_CLK(AHB), 18, 0),
> +       CLK_PERIPH(CLK_QSPI, "clk_periph_qspi", PARENT_CLK(AHB), 19, 0),
> +       CLK_PERIPH(CLK_GPIO0, "clk_periph_gpio0", PARENT_CLK(AHB), 20, 0),
> +       CLK_PERIPH(CLK_GPIO1, "clk_periph_gpio1", PARENT_CLK(AHB), 21, 0),
> +       CLK_PERIPH(CLK_GPIO2, "clk_periph_gpio2", PARENT_CLK(AHB), 22, 0),
> +       CLK_PERIPH(CLK_DDRC, "clk_periph_ddrc", PARENT_CLK(AHB), 23, CLK_=
IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AHB), 24, 0),
> +       CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AHB), 25, 0),
> +       CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AHB), 26, 0),
> +       CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AHB), 27, 0),
> +       CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AHB), 28, =
0),
> +       CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
> +};
> +
> +static void mpfs_clk_unregister_periph(struct device *dev, struct clk_hw=
 *hw)
> +{
> +       struct mpfs_periph_hw_clock *periph_hw =3D to_mpfs_periph_clk(hw);
> +
> +       devm_clk_hw_unregister(dev, hw);
> +       kfree(periph_hw);
> +}
> +
> +static struct clk_hw *mpfs_clk_register_periph(struct device *dev,
> +                                              struct mpfs_periph_hw_cloc=
k *periph_hw,
> +                                              void __iomem *sys_base)
> +{
> +       struct clk_hw *hw;
> +       int err;
> +
> +       periph_hw->sys_base =3D sys_base;
> +       periph_hw->lock =3D &mpfs_clk_lock;
> +
> +       hw =3D &periph_hw->hw;
> +       err =3D devm_clk_hw_register(dev, hw);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return hw;
> +}
> +
> +static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_per=
iph_hw_clock *periph_hws,
> +                                    int num_clks, struct mpfs_clock_data=
 *data)
> +{
> +       struct clk_hw *hw;
> +       void __iomem *sys_base =3D data->base;
> +       unsigned int i, id;
> +
> +       for (i =3D 0; i < num_clks; i++) {
> +               struct mpfs_periph_hw_clock *periph_hw =3D &periph_hws[i];
> +
> +               hw =3D mpfs_clk_register_periph(dev, periph_hw, sys_base);
> +               if (IS_ERR(hw)) {
> +                       dev_err(dev, "%s: failed to register clock %s\n",=
 __func__,
> +                               periph_hw->periph.name);
> +                       goto err_clk;
> +               }
> +
> +               id =3D periph_hws[i].periph.id;
> +               data->hw_data.hws[id] =3D hw;
> +       }
> +
> +       return 0;
> +
> +err_clk:
> +       while (i--)
> +               mpfs_clk_unregister_periph(dev, data->hw_data.hws[periph_=
hws[i].periph.id]);
> +
> +       return PTR_ERR(hw);
> +}
> +
> +static int mpfs_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct mpfs_clock_data *clk_data;
> +       struct resource *res;
> +       int num_clks;
> +       int ret;
> +
> +       num_clks =3D ARRAY_SIZE(mpfs_cfg_clks) + ARRAY_SIZE(mpfs_periph_c=
lks);
> +
> +       clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hw_data.hws,=
 num_clks), GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       clk_data->base =3D devm_ioremap_resource(dev, res);

Use devm_platform_ioremap_resource()?

> +       if (IS_ERR(clk_data->base))
> +               return PTR_ERR(clk_data->base);
> +
> +       clk_data->hw_data.num =3D num_clks;
> +
> +       ret =3D mpfs_clk_register_cfgs(dev, mpfs_cfg_clks, ARRAY_SIZE(mpf=
s_cfg_clks), clk_data);
> +       if (ret)
> +               goto err_clk;
> +
> +       ret =3D mpfs_clk_register_periphs(dev, mpfs_periph_clks, ARRAY_SI=
ZE(mpfs_periph_clks),
> +                                       clk_data);
> +       if (ret)
> +               goto err_clk;
> +
> +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, &=
clk_data->hw_data);
> +       if (ret)
> +               goto err_clk;
> +
> +       dev_info(dev, "registered MPFS core clocks\n");

Please no "I'm probed" messages. The driver core already has these
things.

> +       return ret;
> +
> +err_clk:
> +       dev_err(dev, "failed to register MPFS core clocks\n");
> +       return ret;
> +}
> +
> +static const struct of_device_id mpfs_clk_of_match_table[] =3D {
> +       { .compatible =3D "microchip,mpfs-clkcfg", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_clk_match_table);
> +
> +static struct platform_driver mpfs_clk_driver =3D {
> +       .probe =3D mpfs_clk_probe,
> +       .driver =3D {
> +               .name =3D "microchip-mpfs-clkcfg",
> +               .of_match_table =3D mpfs_clk_of_match_table,
> +       },
> +};
> +
> +static int __init clk_mpfs_init(void)
> +{
> +       return platform_driver_register(&mpfs_clk_driver);
> +}
> +core_initcall(clk_mpfs_init);
> +
> +static void __exit clk_mpfs_exit(void)
> +{
> +       platform_driver_unregister(&mpfs_clk_driver);
> +}
> +module_exit(clk_mpfs_exit);
> +
> +MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:clk-mpfs");
