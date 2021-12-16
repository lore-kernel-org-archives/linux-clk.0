Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAE0C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 10:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbhLPKML (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 05:12:11 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:41961 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbhLPKML (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 05:12:11 -0500
Received: by mail-ua1-f45.google.com with SMTP id p37so46209988uae.8;
        Thu, 16 Dec 2021 02:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h0Jd7QHWdpTSXqFdvSKplAEdh0g+7XhZxN+Ex1eRXZk=;
        b=w2tULguR0q66wTlENRuxaR0CrVj9ajntYKD21PFX3sG4kH1ezRHR9UgVWj55uGwASt
         Fx3BZJ2dJFEF+HtcT8MCQVIcb+l3mcjcuk8hfudZmQFUsPbVLKlL+HfLPvaRoqDmNS08
         T6D/FV3L+FzxpPs6Eq6TLeTYVdVre8qO5MCUqfwcm+1YvzIClY+uXNoSEAcqEOq+aGlm
         blyIDDv0KmRkjfgChCuMTOfE/zCzT1+z28hSTyMg3DcT/3Ip+lE0Qdj2Zn8us762KEVt
         wXfldfU1siph3erC2T+Fr6us6UEWLQzcayUH/+HzN5LHwPMhz/qbtuuyjJ2LWUqMY1fp
         sBFA==
X-Gm-Message-State: AOAM532hFIU+ietgJdv7pQ/xgVushoYPcLie2YLWt+v4dhY0k/a8RAFc
        fwLCd7+yJhowtMoOVIUMz2FQPRlqyClXdQ==
X-Google-Smtp-Source: ABdhPJxQgocX2OfdlUE0Ni//PsUjz9pYhrH/c3wGWdIAfnWowvNO0g7VOmj/W3gz+R69VkGkrGN0SQ==
X-Received: by 2002:a05:6102:3a62:: with SMTP id bf2mr5463025vsb.14.1639649530513;
        Thu, 16 Dec 2021 02:12:10 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id l24sm1006225vkk.37.2021.12.16.02.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 02:12:09 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id u40so13035269uad.1;
        Thu, 16 Dec 2021 02:12:09 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id o16mr5205173vst.5.1639649529208;
 Thu, 16 Dec 2021 02:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20211216094304.24461-1-conor.dooley@microchip.com> <20211216094304.24461-3-conor.dooley@microchip.com>
In-Reply-To: <20211216094304.24461-3-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Dec 2021 11:11:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWz+rrJ6b7uy8EhecT4vACtKSKv3GtkjtQdfG5K+nkxHg@mail.gmail.com>
Message-ID: <CAMuHMdWz+rrJ6b7uy8EhecT4vACtKSKv3GtkjtQdfG5K+nkxHg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        david.abdurachmanov@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
        daire.mcnamara@microchip.com, cyril.jean@microchip.com,
        Padmarao Bengari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Conor,

On Thu, Dec 16, 2021 at 10:41 AM <conor.dooley@microchip.com> wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
> Add support for clock configuration on Microchip PolarFire SoC
>
> Co-developed-by: Padmarao Bengari <padmarao.begari@microchip.com>
> Signed-off-by: Padmarao Bengari <padmarao.begari@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/clk/microchip/clk-mpfs.c

> +static void mpfs_clk_unregister_cfg(struct device *dev, struct clk_hw *hw)
> +{
> +       devm_clk_hw_unregister(dev, hw);

Just call devm_clk_hw_unregister() directly from the caller?

> +}

> +static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
> +                                 unsigned int num_clks, struct mpfs_clock_data *data)
> +{
> +       struct clk_hw *hw;
> +       struct clk *clk_parent;
> +       void __iomem *sys_base = data->base;
> +       unsigned int i, id;
> +
> +       for (i = 0; i < num_clks; i++) {
> +               struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
> +
> +               clk_parent = devm_clk_get(dev, NULL);

Please get the clock once, in mpfs_clk_probe()...

> +               if (IS_ERR(clk_parent))
> +                       return -EPROBE_DEFER;

... and propagate the actual error.

> +
> +               cfg_hw->cfg.parent = __clk_get_hw(clk_parent);
> +               cfg_hw->hw.init = CLK_HW_INIT_HW(cfg_hw->cfg.name, cfg_hw->cfg.parent,
> +                                                &mpfs_clk_cfg_ops, cfg_hw->cfg.flags);
> +               hw = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
> +               if (IS_ERR(hw)) {
> +                       dev_err(dev, "failed to register clock %s\n", cfg_hw->cfg.name);
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

> +static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
> +       CLK_PERIPH(CLK_ENVM, "clk_periph_envm", PARENT_CLK(AHB), 0, CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", PARENT_CLK(AHB), 1, 0),
> +       CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
> +       CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
> +       CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(AHB), 4, 0),
> +       CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
> +       CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),
> +       CLK_PERIPH(CLK_MMUART3, "clk_periph_mmuart3", PARENT_CLK(AHB), 8, 0),
> +       CLK_PERIPH(CLK_MMUART4, "clk_periph_mmuart4", PARENT_CLK(AHB), 9, 0),
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
> +       CLK_PERIPH(CLK_DDRC, "clk_periph_ddrc", PARENT_CLK(AHB), 23, CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AHB), 24, CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AHB), 25, CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AHB), 26, CLK_IS_CRITICAL),
> +       CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AHB), 27, CLK_IS_CRITICAL),

Why were the ficN clocks changed to critical clocks?
it seemed to work fine without that before?

> +       CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AHB), 28, 0),
> +       CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
> +};
> +
> +static void mpfs_clk_unregister_periph(struct device *dev, struct clk_hw *hw)
> +{
> +       devm_clk_hw_unregister(dev, hw);

Just call devm_clk_hw_unregister() directly from the caller?

> +}

The above are minor comments, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
