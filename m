Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A021DC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 05:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391372AbiAYFGG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 00:06:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S248779AbiAYEBG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 23:01:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6A5C06135B;
        Mon, 24 Jan 2022 16:48:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3304B81229;
        Tue, 25 Jan 2022 00:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E27C340E4;
        Tue, 25 Jan 2022 00:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643071698;
        bh=ESDksfB9DFc+X6z8mThYA9V8SIyW62Un1H/O9hsQAzk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZxCbeYWCzJmh23LqSZj17zi0neWswWiBwUnn/1nAesVgqtdxh7WkMzQN/GaYtqYB0
         GJSdxDp+SutC8hPIQIFPuorl82cOvubE/mFmCIMtq8eAePPj5V2qgsn0EW5vHh5w55
         uDtQ0PBMmHiZMkL5CyX31f8ZguUqmHHaw2wJM8kWOorK+NUiaSXJ2XoDUN4t3IRHxW
         JtYl9qeMMlKiIgAZDljvolIm2SnlkhcQWDIju3DwGoT7WmvtVFsO3lGpNhX7lk21sf
         b0BSJ/FJFth/XueDUH0T8Rcgfxe5Eg1VmaokYzra56fajC+ptMJsb00kTbx3CoGHoL
         FQ86pi5/8teEA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211216140022.16146-3-conor.dooley@microchip.com>
References: <20211216140022.16146-1-conor.dooley@microchip.com> <20211216140022.16146-3-conor.dooley@microchip.com>
Subject: Re: [PATCH v9 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        david.abdurachmanov@gmail.com, palmer@dabbelt.com,
        daire.mcnamara@microchip.com, cyril.jean@microchip.com,
        conor.dooley@microchip.com,
        Padmarao Bengari <padmarao.begari@microchip.com>
To:     conor.dooley@microchip.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 24 Jan 2022 16:48:16 -0800
User-Agent: alot/0.10
Message-Id: <20220125004818.83E27C340E4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting conor.dooley@microchip.com (2021-12-16 06:00:22)
> diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makef=
ile
> index f34b247e870f..0dce0b12eac4 100644
> --- a/drivers/clk/microchip/Makefile
> +++ b/drivers/clk/microchip/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_COMMON_CLK_PIC32) +=3D clk-core.o

Can you move this config to the microchip/Kconfig file?

> -obj-$(CONFIG_PIC32MZDA) +=3D clk-pic32mzda.o
> +
> +obj-$(CONFIG_COMMON_CLK_PIC32) +=3D clk-core.o
> +obj-$(CONFIG_PIC32MZDA)                +=3D clk-pic32mzda.o

Why did these two lines change? Please undo it.

> +obj-$(CONFIG_MCHP_CLK_MPFS)    +=3D clk-mpfs.o
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk=
-mpfs.c
> new file mode 100644
> index 000000000000..f9bcfa864b67
> --- /dev/null
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Daire McNamara,<daire.mcnamara@microchip.com>
> + * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
> + */
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>

Drop this include.

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
> +       const char *name;

Why is this needed?

> +       const struct clk_div_table *table;
> +       struct clk_hw *parent;

Why is this needed?

> +       unsigned long flags;
> +       unsigned int id;
> +       u8 shift;
> +       u8 width;
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
> +       const char *name;
> +       struct clk_hw *parent;

Why are these two needed?

> +       unsigned long flags;
> +       unsigned int id;
> +       u8 shift;
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
> +static const struct clk_div_table mpfs_div_cpu_axi_table[] =3D {
> +       { 0, 1 }, { 1, 2 }, { 2, 4 }, { 3, 8 },
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
> +       u32 val;
> +
> +       val =3D readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR) >> cfg->sh=
ift;
> +       val &=3D clk_div_mask(cfg->width);
> +
> +       return prate / (1u << val);
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
> +       u32 val;
> +       int divider_setting;
> +
> +       divider_setting =3D divider_get_val(rate, prate, cfg->table, cfg-=
>width, cfg_hw->cfg.flags);

I think these are clk_hw flags and not divider flags being passed as the
last argument? If so, that's wrong.

> +
> +       if (divider_setting < 0)
> +               return divider_setting;
> +
> +       spin_lock_irqsave(cfg_hw->lock, flags);
> +
> +       val =3D readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR);
> +       val &=3D ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
> +       val |=3D divider_setting << cfg->shift;
> +       writel_relaxed(val, base_addr + REG_CLOCK_CONFIG_CR);
> +
> +       spin_unlock_irqrestore(cfg_hw->lock, flags);
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
> +#define CLK_CFG(_id, _name, _shift, _width, _table, _flags) {           =
               \
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
> +       }
> +
> +static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] =3D {
> +       CLK_CFG(CLK_CPU, "clk_cpu", 0, 2, mpfs_div_cpu_axi_table, 0),
> +       CLK_CFG(CLK_AXI, "clk_axi", 2, 2, mpfs_div_cpu_axi_table, 0),
> +       CLK_CFG(CLK_AHB, "clk_ahb", 4, 2, mpfs_div_ahb_table, 0),
> +};
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

Instead of having a struct member why not use the lock directly as it's
all local to this file?

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
> +                                 unsigned int num_clks, struct mpfs_cloc=
k_data *data,
> +                                 struct clk *clk_parent)
> +{
> +       struct clk_hw *hw;
> +       void __iomem *sys_base =3D data->base;
> +       unsigned int i, id;
> +
> +       for (i =3D 0; i < num_clks; i++) {
> +               struct mpfs_cfg_hw_clock *cfg_hw =3D &cfg_hws[i];
> +
> +               cfg_hw->cfg.parent =3D __clk_get_hw(clk_parent);
> +               cfg_hw->hw.init =3D CLK_HW_INIT_HW(cfg_hw->cfg.name, cfg_=
hw->cfg.parent,
> +                                                &mpfs_clk_cfg_ops, cfg_h=
w->cfg.flags);
> +               hw =3D mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
> +               if (IS_ERR(hw)) {
> +                       dev_err(dev, "failed to register clock %s\n", cfg=
_hw->cfg.name);
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
> +               devm_clk_hw_unregister(dev, data->hw_data.hws[cfg_hws[i].=
cfg.id]);

The same comments below apply here.

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
> +       unsigned long flags =3D 0;
> +
> +       spin_lock_irqsave(periph_hw->lock, flags);
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> +       val =3D reg & ~(1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +       val =3D reg | (1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> +
> +       spin_unlock_irqrestore(periph_hw->lock, flags);
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
> +       unsigned long flags =3D 0;

Don't initialize flags for spin_lock_irqsave().

> +
> +       spin_lock_irqsave(periph_hw->lock, flags);
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> +       val =3D reg | (1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
> +
> +       reg =3D readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +       val =3D reg & ~(1u << periph->shift);
> +       writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> +
> +       spin_unlock_irqrestore(periph_hw->lock, flags);
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

If it only returns the parent rate then this function can be omitted as
it's the default.

> +}
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

Why the double tab?

> +               .periph.name =3D _name,                                  =
                 \
> +               .periph.shift =3D _shift,                                =
                 \
> +               .periph.flags =3D _flags,                                =
                 \
> +               .periph.parent =3D _parent,                              =
                 \
> +}
> +
> +#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].hw)
> +
> +static struct mpfs_periph_hw_clock mpfs_periph_clks[] =3D {
> +       CLK_PERIPH(CLK_ENVM, "clk_periph_envm", PARENT_CLK(AHB), 0, CLK_I=
S_CRITICAL),

All CLK_IS_CRITICAL needs a comment why it's critical.

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
> +       CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AHB), 24, CLK_=
IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AHB), 25, CLK_=
IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AHB), 26, CLK_=
IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AHB), 27, CLK_=
IS_CRITICAL),
> +       CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AHB), 28, =
0),
> +       CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
> +};
> +
> +static struct clk_hw *mpfs_clk_register_periph(struct device *dev,

Just return an int.

> +                                              struct mpfs_periph_hw_cloc=
k *periph_hw,
> +                                              void __iomem *sys_base)
> +{
> +       struct clk_hw *hw;
> +       int err;
> +
> +       periph_hw->sys_base =3D sys_base;
> +       periph_hw->lock =3D &mpfs_clk_lock;
> +       hw =3D &periph_hw->hw;
> +       err =3D devm_clk_hw_register(dev, hw);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return hw;

	return devm_clk_hw_register(dev, &periph_hw->hw);

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
> +               periph_hw->hw.init =3D CLK_HW_INIT_HW(periph_hw->periph.n=
ame,
> +                                                   periph_hw->periph.par=
ent,
> +                                                   &mpfs_periph_clk_ops,
> +                                                   periph_hw->periph.fla=
gs);
> +               hw =3D mpfs_clk_register_periph(dev, periph_hw, sys_base);
> +               if (IS_ERR(hw)) {

I'd prefer this check for an int instead.

		if (ret) {
			dev_err_probe(dev, ....)
			return ret;

> +                       dev_err(dev, "failed to register clock %s\n", per=
iph_hw->periph.name);
> +                       goto err_clk;
> +               }
> +
> +               id =3D periph_hws[i].periph.id;
> +               data->hw_data.hws[id] =3D hw;

And then this can use &periph_hw->hw directly.

> +       }
> +
> +       return 0;
> +
> +err_clk:
> +       while (i--)
> +               devm_clk_hw_unregister(dev, data->hw_data.hws[periph_hws[=
i].periph.id]);

There's no need for this. Let the clk_hws get unregistered when driver
probe fails.

> +
> +       return PTR_ERR(hw);
> +}
> +
> +static int mpfs_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct mpfs_clock_data *clk_data;
> +       struct clk *clk_parent;
> +       struct resource *res;
> +       unsigned int num_clks;
> +       int ret;
> +
> +       //CLK_RESERVED is not part of cfg_clks nor periph_clks, so add 1

Use /* these style of comments */

> +       num_clks =3D ARRAY_SIZE(mpfs_cfg_clks) + ARRAY_SIZE(mpfs_periph_c=
lks) + 1;
> +
> +       clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hw_data.hws,=
 num_clks), GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       clk_data->base =3D devm_ioremap_resource(dev, res);

devm_platform_ioremap_resource()

> +       if (IS_ERR(clk_data->base))
> +               return PTR_ERR(clk_data->base);
> +
> +       clk_data->hw_data.num =3D num_clks;
> +
> +       clk_parent =3D devm_clk_get(dev, NULL);

Use clk_parent_data instead please.

> +       if (IS_ERR(clk_parent))
> +               return PTR_ERR(clk_parent);
> +
> +       ret =3D mpfs_clk_register_cfgs(dev, mpfs_cfg_clks, ARRAY_SIZE(mpf=
s_cfg_clks), clk_data,
> +                                    clk_parent);
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

Make dev_dbg() or remove. We have driver core debug prints that
duplicate this.

> +       return ret;
> +
> +err_clk:
> +       dev_err(dev, "failed to register MPFS core clocks\n");
> +       return ret;

Drop this goto zone please. The driver failing to probe message should
be pushed down into the respective functions instead of being generic
for the entire driver. Then the goto can be replaced with a simple
'return ret'.

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

An alias isn't required, please remove.
