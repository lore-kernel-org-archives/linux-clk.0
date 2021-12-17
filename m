Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660F7C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 00:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhLQAuF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 19:50:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhLQAuE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 19:50:04 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE45C06173F
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 16:50:03 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id s20so523496vkm.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 16:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vl85UXIit3TIRb2ymMVxHwpC9u9xdrSW91+paUDgSN0=;
        b=duqyeaUHQBzLD52wIiydGrGC2oyy4uqZrpPOBRN+8H1AO5vvXpVvIkGli6XtP8P3TI
         1S2fndLHDjBje3AfMdJ3LHxJMhFyu4suQR78Gcx2NLSl+Bb5niwRt9P9LqS8CXaHmDi4
         5iNZMpDXDgfaJ7TbYKb/NFN25Vqw+t836zpMiuUoljxUo3pNn1yowcMq8WVMZski45y4
         tOR+mM9WhflisonozTdmAeNV4EKKBZb3p3u6E2k3maI7jtXGtVwR8ko9648AFUA+a5bE
         +2rdOVvhbTZkCVgeYVV8XtLYLq+mCm6IExP3JnvaV3jNS5/yUVP4jZcf/dNik7QG8DAF
         XGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vl85UXIit3TIRb2ymMVxHwpC9u9xdrSW91+paUDgSN0=;
        b=elKr7ry7n+lYb33NAoTJg8vd8ys1bI9wzwRSc25Hnx013N+mCxHdTt4ou97Xo+4EZt
         d9L43iptwACeSYqjwN4Ase8uu8ZEhxKoH69Jmor+zvToXid064IEmlFFa5rnn/gY8gyu
         RmYlWe1N4MgSlIRMVuV2f5LU9Ytc7Lrkm2hrE0Tc5SX6sV3pWmifSsIhiQ238RLpVWEQ
         F+ZeZCLm8/XgDAZiIezVszUbZVF89pvyjj3tTZdPw9jkQdk3sD4IHqS93016ljLvyYum
         rJeAh9CRhrlV68W8UbpE4/7xTHzbybBhy0fYc1B8ibeJ1kFILmV/HRLLHtQKdiYxR9Ga
         QuOg==
X-Gm-Message-State: AOAM533gNe/QoAIXRGs9/fFTz/MDadeQDexOJN3W6K313hYN3IxEHMu9
        gb2+fxFLx96F4Il3N+Sooc3G3Q7hS23x9Xy9ycqYkg==
X-Google-Smtp-Source: ABdhPJwnNXczPxAyQGL0JVZoJtWfIEz5rAUElbIOw96rnz1W3Cel/D7Jq+MOvVqHlEcF5howTnnC7fxOVXRdJ4C7ECo=
X-Received: by 2002:a05:6122:2158:: with SMTP id m24mr256841vkd.1.1639702202870;
 Thu, 16 Dec 2021 16:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-8-semen.protsenko@linaro.org> <b998809c-9d33-cd42-ebfd-7cce620a6ed8@canonical.com>
In-Reply-To: <b998809c-9d33-cd42-ebfd-7cce620a6ed8@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 17 Dec 2021 02:49:51 +0200
Message-ID: <CAPLW+4=KLUnNo1xYqqiZqi2+QPi0mKgFmnRk3+1Tw-OS_Bb03w@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: exynos: Add initial E850-96 board support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 15 Dec 2021 at 19:04, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 15/12/2021 17:09, Sam Protsenko wrote:
> > E850-96 is a 96boards development board manufactured by WinLink. It
> > incorporates Samsung Exynos850 SoC, and is compatible with 96boards
> > mezzanine boards [1], as it follows 96boards standards.
> >
> > This patch adds minimal support for E850-96 board. Next features are
> > enabled in board dts file and verified with minimal BusyBox rootfs:
> >
> >  * User buttons
> >  * LEDs
> >  * Serial console
> >  * Watchdog timers
> >  * RTC
> >  * eMMC
> >
> > [1] https://www.96boards.org/products/mezzanine/
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  arch/arm64/boot/dts/exynos/Makefile           |   3 +-
> >  .../boot/dts/exynos/exynos850-e850-96.dts     | 157 ++++++++++++++++++
> >  2 files changed, 159 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> >
> > diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> > index b41e86df0a84..803548ccc537 100644
> > --- a/arch/arm64/boot/dts/exynos/Makefile
> > +++ b/arch/arm64/boot/dts/exynos/Makefile
> > @@ -3,4 +3,5 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
> >       exynos5433-tm2.dtb      \
> >       exynos5433-tm2e.dtb     \
> >       exynos7-espresso.dtb    \
> > -     exynosautov9-sadk.dtb
> > +     exynosautov9-sadk.dtb   \
> > +     exynos850-e850-96.dtb
> > diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> > new file mode 100644
> > index 000000000000..fd611906d81c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> > @@ -0,0 +1,157 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * WinLink E850-96 board device tree source
> > + *
> > + * Copyright (C) 2018 Samsung Electronics Co., Ltd.
> > + * Copyright (C) 2021 Linaro Ltd.
> > + *
> > + * Device tree source file for WinLink's E850-96 board which is based on
> > + * Samsung Exynos850 SoC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "exynos850.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +
> > +#define BOARD_ID     0x0
> > +#define BOARD_REV    0x2
> > +
> > +/ {
> > +     model = "WinLink E850-96 board";
> > +     compatible = "winlink,e850-96", "samsung,exynos850";
> > +     board_id = <BOARD_ID>;
> > +     board_rev = <BOARD_REV>;
> > +
> > +     chosen {
> > +             stdout-path = &serial_0;
> > +     };
> > +
>
> You did not define memory node. Do you expect bootloader to fill it?
> Does it change between different boards?
>

Yeah, bootloader fills it. But now I can see it's probably better to
specify it explicitly specify it in dts. Will do in v2.

>
> Best regards,
> Krzysztof
