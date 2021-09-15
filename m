Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200E4C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 22:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03BB660E08
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 22:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbhIOWC3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Sep 2021 18:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbhIOWCX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Sep 2021 18:02:23 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A38C061766
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 15:01:03 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id k10so4201531vsp.12
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 15:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zGSJw2mijcD917fI6iH/7Zmw4K7gJ7WwhrleRMcWjCU=;
        b=LBVx6jNrGw1ARumMNWN8gjXgHRgv4QoeCFG8s+d30GDiNRCUhBeoZQEOGM7at5+ZxA
         YlEDaKkfE5T7wQapssiYzPc+0mfn6SZ/qKsDr+6dxxaaxJDNlXqE2cQyCaf8JsOeBJtt
         2DydeWngGgU1+3u/dMVj1mSx/JrPW/muOAaZpp14KzYOlfAwXayfBekr8wcM9P0lSs7e
         MC3kq/lnoI/L08K+K39Zbzny5g3GEjc5zqitkcDi5qmEajO+XqcXSXqoq59PE1cGB1G3
         7FT/N/gdr8LyRl0DqThGvCtJx3a/TTWQd2V9//rJqXUrkyyHVUq41e/kEEuFibfVoKuy
         ocWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zGSJw2mijcD917fI6iH/7Zmw4K7gJ7WwhrleRMcWjCU=;
        b=0eULARo2Irql5C3HzOkln8wsRNFS2zrehVtUuzk+kXkiP2fh/J0iLKFN3ZeAKxfLcB
         lSyQ1xeRKpA5IP096qvzu4mSR7K2P5xq9hT+DdRBaftICOY9xsOcTotzlXBgkMkhy7jZ
         tPvgS0JlCbHeWnOFtdyhl7JMazi9JS62haXXTP+3ZFblMkLKJDC4d7uCwXtk/2+Q6ve1
         24rzS0Zp2kEYO2+EUHrRNGBRwW9VXPW4eJtLkOVaJtv8Yibo82GRUoJVwzUu7oaKp1nx
         5Vl9qUc4rtyCaEvoQ8bU8bp6tns4eeUAxyHuAG9arslBnR9xIOmuC2ZHKjCkjprzOsQb
         uomQ==
X-Gm-Message-State: AOAM533lbIbsgRSbANi4fpU28Uf9B26SvglauxIRlvZWNygT5Jp/bl9z
        PV/om7QIm0PoKYWuP8RAM1ZXAIa+ZENtVzrDqQs/Dg==
X-Google-Smtp-Source: ABdhPJyOr8yGWQEsGudvQrYqjyuQgXeLh226eqUsm3m0MrCX91sh9IJVmTTEPi2a0+PjKOMEygDNsAmyA5u+GuSIjMo=
X-Received: by 2002:a67:d589:: with SMTP id m9mr2041213vsj.30.1631743262794;
 Wed, 15 Sep 2021 15:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-7-semen.protsenko@linaro.org> <1428bfc4-520f-9af3-5255-b17308881243@gmail.com>
In-Reply-To: <1428bfc4-520f-9af3-5255-b17308881243@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 16 Sep 2021 01:00:51 +0300
Message-ID: <CAPLW+4k8ZihQtnpYGULcS1uOP+9tvFi_yo27GadP3aa8KNC7aQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
To:     Chanwoo Choi <cwchoi00@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 15 Sept 2021 at 21:05, Chanwoo Choi <cwchoi00@gmail.com> wrote:
>
> Hi Sam,
>
> On 21. 9. 15. =EC=98=A4=EC=A0=84 12:56, Sam Protsenko wrote:
> > This is the initial implementation adding only basic clocks like UART,
> > MMC, I2C and corresponding parent clocks. Design is influenced by
> > Exynos7 and Exynos5433 clock drivers.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >   drivers/clk/samsung/Makefile        |   1 +
> >   drivers/clk/samsung/clk-exynos850.c | 700 +++++++++++++++++++++++++++=
+
> >   2 files changed, 701 insertions(+)
> >   create mode 100644 drivers/clk/samsung/clk-exynos850.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefil=
e
> > index 028b2e27a37e..c46cf11e4d0b 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)       +=3D clk-=
exynos5433.o
> >   obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) +=3D clk-exynos-audss.o
> >   obj-$(CONFIG_EXYNOS_CLKOUT) +=3D clk-exynos-clkout.o
> >   obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)       +=3D clk-exynos7.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynos850.o
> >   obj-$(CONFIG_S3C2410_COMMON_CLK)+=3D clk-s3c2410.o
> >   obj-$(CONFIG_S3C2410_COMMON_DCLK)+=3D clk-s3c2410-dclk.o
> >   obj-$(CONFIG_S3C2412_COMMON_CLK)+=3D clk-s3c2412.o
> > diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/=
clk-exynos850.c
> > new file mode 100644
> > index 000000000000..1028caa2102e
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos850.c
> > @@ -0,0 +1,700 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2021 Linaro Ltd.
> > + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> > + *
> > + * Common Clock Framework support for Exynos850 SoC.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +
> > +#include <dt-bindings/clock/exynos850.h>
> > +
> > +#include "clk.h"
> > +
> > +/* Gate register bits */
> > +#define GATE_MANUAL          BIT(20)
> > +#define GATE_ENABLE_HWACG    BIT(28)
> > +
> > +/* Gate register offsets range */
> > +#define GATE_OFF_START               0x2000
> > +#define GATE_OFF_END         0x2fff
> > +
> > +/**
> > + * exynos850_init_clocks - Set clocks initial configuration
> > + * @np:                      CMU device tree node with "reg" property =
(CMU addr)
> > + * @reg_offs:                Register offsets array for clocks to init
> > + * @reg_offs_len:    Number of register offsets in reg_offs array
> > + *
> > + * Set manual control mode for all gate clocks.
> > + */
> > +static void __init exynos850_init_clocks(struct device_node *np,
> > +             const unsigned long *reg_offs, size_t reg_offs_len)
> > +{
> > +     const __be32 *regaddr_p;
> > +     u64 regaddr;
> > +     u32 base;
> > +     size_t i;
> > +
> > +     /* Get the base address ("reg" property in dts) */
> > +     regaddr_p =3D of_get_address(np, 0, NULL, NULL);
> > +     if (!regaddr_p)
> > +             panic("%s: failed to get reg regaddr\n", __func__);
> > +
> > +     regaddr =3D of_translate_address(np, regaddr_p);
> > +     if (regaddr =3D=3D OF_BAD_ADDR || !regaddr)
> > +             panic("%s: bad reg regaddr\n", __func__);
> > +
> > +     base =3D (u32)regaddr;
> > +
> > +     for (i =3D 0; i < reg_offs_len; ++i) {
> > +             void __iomem *reg;
> > +             u32 val;
> > +
> > +             /* Modify only gate clock registers */
> > +             if (reg_offs[i] < GATE_OFF_START || reg_offs[i] > GATE_OF=
F_END)
> > +                     continue; > +
> > +             reg =3D ioremap(base + reg_offs[i], 4);
> > +             val =3D ioread32(reg);
> > +             val |=3D GATE_MANUAL;
> > +             val &=3D ~GATE_ENABLE_HWACG;
> > +             iowrite32(val, reg);
> > +             iounmap(reg);
>
> I understand your intention for disabling HWACG.
> But, it is not good to execute ioreamp/iounmap for each clock gate
> register. I think that we need to consider the more pretty method
> to initialize the clock register before clock registration.
>
> [snip]
>

Hi guys,

Thanks for the quick review! I'll address all your comments once I get
back from vacation (in two weeks), and will send v2.

> --
> Best Regards,
> Samsung Electronics
> Chanwoo Choi
