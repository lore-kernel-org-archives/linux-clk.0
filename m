Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B13C6379F
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 15:33:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbjBUPdf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 10:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjBUPde (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 10:33:34 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F240022027
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 07:33:28 -0800 (PST)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9980F3F588
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676993606;
        bh=L4Qq5cpBFpgwagp9AE1jw12RMdS+BYeFZ1I210i8/Rk=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=tIn4P7WfzB0P9PQ6E14pCgKRJfLZQf046YMb9vPEMDvYYOS9DpQKPVlpsxwxfUpAj
         N2XHrF1nBqJpYVsnvUl6I94qOY2I6Lon4CiQRi97ZxnXWbYmcccE1YvS7jws4JQaP3
         /LoitP73GZ+NP6vaqQZmckXTKppUMbYZ/XtU+mrfv79z6XAUXzwUf+wXatspbTv2Q2
         KG1scrl0mSjOQ7L4hTkd5GTea6rTVQLvbmgiS/VCVIUuSNFYYf1KsYRP7xqHg/LkBa
         bbvlMeYStUwjUKzRwnHdeQQaFYkdZCPcfRKAaa2w24aJI8/uqEjQ9F2vTh8x+vsz7C
         s7VO/DZq24ErQ==
Received: by mail-qv1-f69.google.com with SMTP id pv11-20020ad4548b000000b0056e96f4fd64so2077389qvb.15
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 07:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4Qq5cpBFpgwagp9AE1jw12RMdS+BYeFZ1I210i8/Rk=;
        b=pkeF/VwvWERrrxebI14fV1WfAykS84+8Jm8mA722tX+AOwyisni4sRjdk8UCYOIrzi
         GPTcnGQpX9nbXarGN/qeSSm6dnoh2OsU8IVA97cdcD/pa7I8pfgXG5yShjfKD9vxhQye
         2Kc8CUu3uCzf0ck2hDGHysEppcrpXhByPElW7ppqnszFgkKXAXeTXAQYYj0ULM0hp5ow
         jWbkhDfPKu1OkJMouXRanHBUmzGJl6U1UTBEVG1qY2jTYWcG/0eM6zZSy4skffmpqzya
         jsye2h8Fg9QWOuySvwksPM8fBuEcGX14E/t/TrUjZEuwfzPwfkyaelStnMx8ab76tL8L
         DImg==
X-Gm-Message-State: AO0yUKWTJQC0pe+i+It2EYWmy3BrJJZuplMzy5q0n6XHUR65/pjsyX1u
        ePs2HRS2cbp7uhJtRV+LR6RdNIjvsb4zOpJjvUgdFyh4xukUeEL7EvYL6wZWnCvld4r45ErOFRL
        pdHsg2mlpQ7Mwo5nilZUdULwlbX2Zp+c5xS4ftd7kJEG12uauHZLz0w==
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id y16-20020a0cd990000000b00570fc874f2cmr844736qvj.83.1676993605488;
        Tue, 21 Feb 2023 07:33:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+eeC9t2mpELInJfxD7Yobd/u+LgOJZpX5mua0EuSfRFqXwkek8mhoYknpGc56WgnZGZ/ArALCDKxPQQlhlND4=
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id
 y16-20020a0cd990000000b00570fc874f2cmr844729qvj.83.1676993605220; Tue, 21 Feb
 2023 07:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20230221024645.127922-1-hal.feng@starfivetech.com> <20230221024645.127922-14-hal.feng@starfivetech.com>
In-Reply-To: <20230221024645.127922-14-hal.feng@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Tue, 21 Feb 2023 16:33:09 +0100
Message-ID: <CAJM55Z_O9K=sCRXga9pMOXk9YjXc1v_V0e5S-8xN9Mi8gvHzvg@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] reset: starfive: Add StarFive JH7110 reset driver
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> Add auxiliary driver to support StarFive JH7110 system
> and always-on resets.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/reset/starfive/Kconfig                |  8 +++
>  drivers/reset/starfive/Makefile               |  1 +
>  .../reset/starfive/reset-starfive-jh7110.c    | 64 +++++++++++++++++++
>  .../reset/starfive/reset-starfive-jh71x0.h    |  6 ++
>  4 files changed, 79 insertions(+)
>  create mode 100644 drivers/reset/starfive/reset-starfive-jh7110.c
>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index 9d15c4110e40..fab1a081af17 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -10,3 +10,11 @@ config RESET_STARFIVE_JH7100
>         default SOC_STARFIVE
>         help
>           This enables the reset controller driver for the StarFive JH7100 SoC.
> +
> +config RESET_STARFIVE_JH7110
> +       bool "StarFive JH7110 Reset Driver"
> +       depends on AUXILIARY_BUS && CLK_STARFIVE_JH7110_SYS
> +       select RESET_STARFIVE_JH71X0
> +       default CLK_STARFIVE_JH7110_SYS
> +       help
> +         This enables the reset controller driver for the StarFive JH7110 SoC.
> diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
> index f6aa12466fad..7a44b66fb9d5 100644
> --- a/drivers/reset/starfive/Makefile
> +++ b/drivers/reset/starfive/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_RESET_STARFIVE_JH71X0)            += reset-starfive-jh71x0.o
>
>  obj-$(CONFIG_RESET_STARFIVE_JH7100)            += reset-starfive-jh7100.o
> +obj-$(CONFIG_RESET_STARFIVE_JH7110)            += reset-starfive-jh7110.o
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> new file mode 100644
> index 000000000000..83577d1b7fc6
> --- /dev/null
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Reset driver for the StarFive JH7110 SoC
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +
> +#include "reset-starfive-jh71x0.h"
> +
> +#include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +static int jh7110_reset_probe(struct auxiliary_device *adev,
> +                             const struct auxiliary_device_id *id)
> +{
> +       struct reset_info *info = (struct reset_info *)(id->driver_data);
> +       void __iomem **base = (void __iomem **)dev_get_drvdata(adev->dev.parent);

Hi Hal,

I saw the kernel test robot complain about this, but I still wonder if
the extra level of indirection is really needed. Isn't it enough to
just add the explicit casts, so

dev_set_drvdata(priv->dev, (void *)priv->base);

in the clock drivers and here just

void __iomem *base = (void __iomem *)dev_get_drvdata(adev->dev.parent);

> +
> +       if (!info || !base)
> +               return -ENODEV;
> +
> +       return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
> +                                             *base + info->assert_offset,
> +                                             *base + info->status_offset,
> +                                             NULL,
> +                                             info->nr_resets,
> +                                             NULL);
> +}
> +
> +static const struct reset_info jh7110_sys_info = {
> +       .nr_resets = JH7110_SYSRST_END,
> +       .assert_offset = 0x2F8,
> +       .status_offset = 0x308,
> +};
> +
> +static const struct reset_info jh7110_aon_info = {
> +       .nr_resets = JH7110_AONRST_END,
> +       .assert_offset = 0x38,
> +       .status_offset = 0x3C,
> +};
> +
> +static const struct auxiliary_device_id jh7110_reset_ids[] = {
> +       {
> +               .name = "clk_starfive_jh71x0.reset-sys",
> +               .driver_data = (kernel_ulong_t)&jh7110_sys_info,
> +       },
> +       {
> +               .name = "clk_starfive_jh71x0.reset-aon",
> +               .driver_data = (kernel_ulong_t)&jh7110_aon_info,
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, jh7110_reset_ids);
> +
> +static struct auxiliary_driver jh7110_reset_driver = {
> +       .probe          = jh7110_reset_probe,
> +       .id_table       = jh7110_reset_ids,
> +};
> +module_auxiliary_driver(jh7110_reset_driver);
> +
> +MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JH7110 reset driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
> index db7d39a87f87..e485472e1adc 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -6,6 +6,12 @@
>  #ifndef __RESET_STARFIVE_JH71X0_H
>  #define __RESET_STARFIVE_JH71X0_H
>
> +struct reset_info {
> +       unsigned int nr_resets;
> +       unsigned int assert_offset;
> +       unsigned int status_offset;
> +};

As far as I can tell this struct isn't used anywhere but in
reset-starfive-jh7110.c. If so just move it there, and in any case
please call it something less generic like struct jh7110_reset_info.

> +
>  int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
>                                    void __iomem *assert, void __iomem *status,
>                                    const u32 *asserted, unsigned int nr_resets,
> --
> 2.38.1
>
