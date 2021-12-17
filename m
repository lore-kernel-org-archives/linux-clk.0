Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1374C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 15:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238615AbhLQP4h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Dec 2021 10:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235513AbhLQP4h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Dec 2021 10:56:37 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A57C061574
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 07:56:36 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id 30so5082367uag.13
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 07:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ElflHpQkLuzl8P2eAKJJkdqkTvJ6AItQbXCMpCRS8yg=;
        b=eIonsckjRxmhvgvt6jfEqbEqWnigVC/86CAxpO3iaqgtNloYFFgMbJo+PkICrcB/92
         XeSY5tlCEGsfQXjAI1PEJNm54M7adwN222B9Q8c/B1bPYcMaPP/dy1c8Bebyc0gsAG98
         YYkhcAz7hiza9paN+MluRgPMZse3uRvR2D8Ic2CT1/fKGE7GNzb7emkDp+xozCKEGwcY
         7RCq4zQTk2YaQ6uWAU7ucDw9PS2uQU1MK9Mx45uss4TPIefm2+Ay7ixorICNNC2cwx7c
         M3NtS4JZfssTg2rFjYrLGKnqoQNUXwUcUIwGmkIaGiK4MzdHj1NI9+V5EQkFBFerPPth
         8Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ElflHpQkLuzl8P2eAKJJkdqkTvJ6AItQbXCMpCRS8yg=;
        b=x6Fr7NIra2s0qrVBYLTmKRerK76b09w4W65BksYhRvFpsWPUvoBVNwXniyfkb0M002
         b4wG/06pazlQHWgWPxLh2k476DhtJAWc1skcjZhfBCcNRKKrDtFgWbXbQecSP5K7pX0F
         CqoJlxHIyshbZb2HtFXQNT8Zk/LbxMi7X50Op+F3ZCxMVDYlfMVL8MR3JHhutnPDHSNj
         sWG53DRaLRwG0FKt/Jlx5oF5SQiQlJf+d4RpjrABdDbKK766Ir8hF7wajnaDPMsg1tD6
         AhWdgAVMTvFvNVVIvGCAIEZR26NNvGBmwu+V0s0b2jKmAVnoHAwQXX3cL8bn5ND1wbP/
         VE1g==
X-Gm-Message-State: AOAM530noSH9jZ6g05kZmnycTYcfux2X749sMNjLZIHzVBkm8cVuVGkf
        kTXXIZ/3XqbZDhT90BrKB6MhzDiHyXpZgMRyJB6ohg==
X-Google-Smtp-Source: ABdhPJxreb5JlA/rQW3pI2rH7hhfpaWxc1ic4KV6Svi8Wq8H7Y90V8E8MrdFIqB90JJDjHgtHAOwoEmxNeheS6A3Lrs=
X-Received: by 2002:a05:6102:512:: with SMTP id l18mr1034560vsa.57.1639756595998;
 Fri, 17 Dec 2021 07:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-7-semen.protsenko@linaro.org> <8c1dbcda-ce01-81c9-b34a-f64b6f61c868@canonical.com>
 <CAPLW+4ndeokx3WiYaK_3ooe0J+BQe8Dx7QCecA7Deowk0AdxnA@mail.gmail.com> <73c5a527-2d5d-8524-b067-f9128055ff10@canonical.com>
In-Reply-To: <73c5a527-2d5d-8524-b067-f9128055ff10@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 17 Dec 2021 17:56:24 +0200
Message-ID: <CAPLW+4n+iVwhVB06vwBKxesaeuRo0kgXEZvqPQo6RbOiZO3Vbw@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: exynos: Add initial Exynos850 SoC support
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

On Fri, 17 Dec 2021 at 10:21, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 16/12/2021 20:40, Sam Protsenko wrote:
> > On Wed, 15 Dec 2021 at 18:47, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
>
> (...)
>
> >>> +             serial0 = &serial_0;
> >>> +             serial1 = &serial_1;
> >>> +             serial2 = &serial_2;
> >>> +             i2c0 = &i2c_0;
> >>> +             i2c1 = &i2c_1;
> >>> +             i2c2 = &i2c_2;
> >>> +             i2c3 = &i2c_3;
> >>> +             i2c4 = &i2c_4;
> >>> +             i2c5 = &i2c_5;
> >>> +             i2c6 = &i2c_6;
> >>> +             i2c7 = &hsi2c_0;
> >>> +             i2c8 = &hsi2c_1;
> >>> +             i2c9 = &hsi2c_2;
> >>> +             i2c10 = &hsi2c_3;
> >>> +             i2c11 = &hsi2c_4;
> >>> +     };
> >>> +
> >>> +     arm-pmu {
> >>> +             compatible = "arm,cortex-a55-pmu";
> >>> +             interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> >>> +                          <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> >>> +                          <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> >>> +                          <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
> >>> +                          <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> >>> +                          <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> >>> +                          <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> >>> +                          <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> >>> +             interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> >>> +                                  <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> >>> +     };
> >>> +
> >>> +     /* Main system clock (XTCXO); external, must be 26 MHz */
> >>> +     oscclk: clock-oscclk {
> >>> +             compatible = "fixed-clock";
> >>> +             clock-output-names = "oscclk";
> >>> +             #clock-cells = <0>;
> >>> +     };
> >>> +
> >>> +     /* RTC clock (XrtcXTI); external, must be 32.768 kHz */
> >>
> >> This clock is usually provided by PMIC, so instead I expect updating
> >> s2mps11-clk driver. It's not correct to mock it with fixed-clock, but in
> >> some cases might be needed. Then I would need an explanation and maybe a
> >> TODO note.
> >>
> >> I wonder if we already discussed this...
> >>
> >
> > Don't really remember discussing that. That's actually something new
> > for me :) I was planning to add PMIC support as a part of separate
> > activity later, it might not be so easy: S2MPU12 uses I3C connection.
> > And RTC clock is not handled even in downstream kernel. So I'll have
> > to implement that by PMIC datasheet. I'll keep some TODO comment for
> > now, hope it's ok with you?
>
> Assuming it is really coming from the PMIC (should be visible in the
> board schematics), it should be using s2mps11-clk. I am fine with
> keeping fixed-clock now + TODO note, but please move it to the board
> DTS. It's not the property of the SoC.
>

Yes, I checked, RTC clock is coming from PMIC. Moved "rtcclk" clock to
board file, and corresponding clock properties for "rtc" and "cmu_hsi"
nodes as well. Will send v4 soon.

> >
> >>> +     rtcclk: clock-rtcclk {> +               compatible = "fixed-clock";
> >>> +             clock-output-names = "rtcclk";
> >>> +             #clock-cells = <0>;
> >>> +     };
> >>> +
>
>
> Best regards,
> Krzysztof
