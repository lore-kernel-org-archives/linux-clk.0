Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D696CC433EF
	for <linux-clk@archiver.kernel.org>; Mon,  6 Dec 2021 15:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387651AbhLFP7R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Dec 2021 10:59:17 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:44736 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346412AbhLFP5P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 10:57:15 -0500
Received: by mail-ua1-f46.google.com with SMTP id p2so20454726uad.11;
        Mon, 06 Dec 2021 07:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cJkS2gZzNaIFGdP4L2F2Zuyclq6qbIs14NANwOO3b3s=;
        b=HTuXQJkxUGUeCWH4rAMS4cWpd3LsD9rTJzxz6KWJ1VW1v6Xi4XlbCc78gjezBqu8mE
         BPy7NLjI6QGgOV0hOOl3ooh6J1m5bBWvZZ0brSY5ujEMoteZmqPhQPiKo5jUoZgAhCbE
         DNWqbEl6t1v1hkrC6Qlcrya55kZcePEYbUB8d4Q+88UBcwNMtbgnVJW1yZVBPEdJ1gTH
         67rDzHb5CWpVm47QzM2/g2QjHkl+Yt3N+GTQjGy2texrpkaeRQ6kfiWiemYZtn12y2hj
         zqHN0ZDUbh1IdLwLUawffKjOjuBYh/vNRpBFEB0zAeY1vbYBwAVDewSNdPkPJLwGcpvt
         n4IA==
X-Gm-Message-State: AOAM533kORzCAimLf26jyGQDhZV2Bm0Ce3+iAw6Xw+PbDPvC+vb89yy2
        DLdMTNj0lCcKz5FaMDLvM7iaQq+4UNSHGg==
X-Google-Smtp-Source: ABdhPJzFKpsoDWihTQfOjAFiV6fmrO2iuwNPNktvIUV2aUX1CzTw0JMKrhAoiLBmUrKjyqJ55DaQ2A==
X-Received: by 2002:a67:e9c4:: with SMTP id q4mr36661869vso.19.1638806024469;
        Mon, 06 Dec 2021 07:53:44 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id v81sm4241424vsv.14.2021.12.06.07.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 07:53:44 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id 30so1882147uag.13;
        Mon, 06 Dec 2021 07:53:44 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr36844130vst.68.1638806023952;
 Mon, 06 Dec 2021 07:53:43 -0800 (PST)
MIME-Version: 1.0
References: <20211130140724.10750-1-conor.dooley@microchip.com> <20211130140724.10750-3-conor.dooley@microchip.com>
In-Reply-To: <20211130140724.10750-3-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 16:53:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=QNtz0rRLQv+=k+GGuSyKANFjGQ1YTKaKwcmzsvf5RA@mail.gmail.com>
Message-ID: <CAMuHMdV=QNtz0rRLQv+=k+GGuSyKANFjGQ1YTKaKwcmzsvf5RA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
To:     Conor Dooley <conor.dooley@microchip.com>,
        daire.mcnamara@microchip.com
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        david.abdurachmanov@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
        cyril.jean@microchip.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Conor, Daire,

On Tue, Nov 30, 2021 at 3:06 PM <conor.dooley@microchip.com> wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
> Add support for clock configuration on Microchip PolarFire SoC
>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

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

implicit gap of 4 bytes

> +       const char *name;
> +       u8 shift;
> +       u8 width;

implicit gap of 6 bytes

> +       const struct clk_div_table *table;
> +       unsigned long flags;

Hence you better move id, shift, and width to the end.

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
> +#define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
> +
> +struct mpfs_periph_clock {
> +       unsigned int id;

implicit gap of 4 bytes

> +       const char *name;
> +       u8 shift;

implicit gap of 7 bytes

> +       unsigned long flags;
> +};
> +
> +struct mpfs_periph_hw_clock {
> +       struct mpfs_periph_clock periph;
> +       void __iomem *sys_base;
> +       /* lock is used to prevent multiple writes */
> +       spinlock_t *lock;

This is not used?

> +       struct clk_hw hw;
> +};
> +
> +#define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_clock, hw)
> +
> +/*
> + * mpfs_clk_lock prevents anything else from writing to the
> + * mpfs clk block while a software locked register is being written.
> + */
> +static DEFINE_SPINLOCK(mpfs_clk_lock);
> +
> +static struct clk_parent_data mpfs_cfg_parent[] = {
> +       { .fw_name = "msspllclk", .name = "msspllclk" },

So you rely on the name of the fixed-clock reference clock? That is
very fragile. Please instead use devm_clk_get() to get the reference
clock from the "clocks" property of the clock-controller node.

> +static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
> +{
> +       struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> +       struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> +       void __iomem *base_addr = cfg_hw->sys_base;
> +       unsigned long rate;
> +       u32 val;
> +
> +       val = readl_relaxed(base_addr + REG_CLOCK_CONFIG_CR) >> cfg->shift;
> +       val &= clk_div_mask(cfg->width);
> +       rate = prate / (1u << val);
> +
> +       return rate;

return prate / (1u << val);

> +}

> +static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
> +{
> +       struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> +       struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> +       void __iomem *base_addr = cfg_hw->sys_base;
> +       unsigned long flags = 0;
> +       u32 val;
> +       int divider_setting;
> +
> +       divider_setting = divider_get_val(rate, prate, cfg->table, cfg->width, cfg_hw->cfg.flags);
> +
> +       if (divider_setting < 0)
> +               return divider_setting;
> +
> +       if (cfg_hw->lock)

Isn't this branch always taken?

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

> +static void mpfs_clk_unregister_cfg(struct device *dev, struct clk_hw *hw)
> +{
> +       struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> +
> +       devm_clk_hw_unregister(dev, hw);
> +       kfree(cfg_hw);

This is freeing a part of the big array allocated with devm_kzalloc()?

> +}
> +
> +static struct clk_hw *mpfs_clk_register_cfg(struct device *dev,
> +                                           struct mpfs_cfg_hw_clock *cfg_hw,
> +                                           void __iomem *sys_base)
> +{
> +       struct clk_hw *hw;
> +       int err;
> +
> +       cfg_hw->sys_base = sys_base;
> +       cfg_hw->lock = &mpfs_clk_lock;
> +
> +       hw = &cfg_hw->hw;
> +       err = devm_clk_hw_register(dev, hw);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return hw;
> +}
> +
> +static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
> +                                 int num_clks, struct mpfs_clock_data *data)

unsigned int num_clks

> +{
> +       struct clk_hw *hw;
> +       void __iomem *sys_base = data->base;
> +       unsigned int i, id;
> +
> +       for (i = 0; i < num_clks; i++) {
> +               struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
> +
> +               hw = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
> +               if (IS_ERR(hw)) {
> +                       dev_err(dev, "%s: failed to register clock %s\n", __func__,

I guess the __func__ can be dropped, as the clock name is unique?

> +                               cfg_hw->cfg.name);
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
> +               mpfs_clk_unregister_cfg(dev, data->hw_data.hws[cfg_hws[i].cfg.id]);
> +
> +       return PTR_ERR(hw);
> +}

> +static void mpfs_clk_unregister_periph(struct device *dev, struct clk_hw *hw)
> +{
> +       struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
> +
> +       devm_clk_hw_unregister(dev, hw);
> +       kfree(periph_hw);'

This is freeing a part of the big array allocated with devm_kzalloc()?

> +}

> +static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_clock *periph_hws,
> +                                    int num_clks, struct mpfs_clock_data *data)
> +{
> +       struct clk_hw *hw;
> +       void __iomem *sys_base = data->base;
> +       unsigned int i, id;
> +
> +       for (i = 0; i < num_clks; i++) {
> +               struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
> +
> +               hw = mpfs_clk_register_periph(dev, periph_hw, sys_base);
> +               if (IS_ERR(hw)) {
> +                       dev_err(dev, "%s: failed to register clock %s\n", __func__,

I guess the __func__ can be dropped, as the clock name is unique?


> +                               periph_hw->periph.name);
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
> +               mpfs_clk_unregister_periph(dev, data->hw_data.hws[periph_hws[i].periph.id]);
> +
> +       return PTR_ERR(hw);
> +}
> +
> +static int mpfs_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct mpfs_clock_data *clk_data;
> +       struct resource *res;
> +       int num_clks;

unsigned int

> +       int ret;
> +
> +       num_clks = ARRAY_SIZE(mpfs_cfg_clks) + ARRAY_SIZE(mpfs_periph_clks);

As mpfs_periph_clks[] lacks an entry for CLK_RESERVED, num_clks is
one too small...

> +
> +       clk_data = devm_kzalloc(dev, struct_size(clk_data, hw_data.hws, num_clks), GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       clk_data->base = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(clk_data->base))
> +               return PTR_ERR(clk_data->base);
> +
> +       clk_data->hw_data.num = num_clks;
> +
> +       ret = mpfs_clk_register_cfgs(dev, mpfs_cfg_clks, ARRAY_SIZE(mpfs_cfg_clks), clk_data);
> +       if (ret)
> +               goto err_clk;
> +
> +       ret = mpfs_clk_register_periphs(dev, mpfs_periph_clks, ARRAY_SIZE(mpfs_periph_clks),
> +                                       clk_data);

... and initializing CLK_CFM will write beyond the end of clk_data[].

> +       if (ret)
> +               goto err_clk;
> +
> +       ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, &clk_data->hw_data);
> +       if (ret)
> +               goto err_clk;
> +
> +       dev_info(dev, "registered MPFS core clocks\n");
> +       return ret;
> +
> +err_clk:
> +       dev_err(dev, "failed to register MPFS core clocks\n");
> +       return ret;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
