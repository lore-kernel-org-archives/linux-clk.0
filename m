Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF44C64EC4
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 14:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjCIOID (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Mar 2023 09:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjCIOHj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Mar 2023 09:07:39 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79338A2C06
        for <linux-clk@vger.kernel.org>; Thu,  9 Mar 2023 06:06:34 -0800 (PST)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 16D62445B5
        for <linux-clk@vger.kernel.org>; Thu,  9 Mar 2023 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678370792;
        bh=TgMelgrb/VLkpH6kwv9lPEQ4dt1XAT9+KiTGTm5i5/c=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=YJGXRjilLgc8bP6qril5wP5NswQaPR+vGxFgU4PzAtvCcuhbLvEtE7BazU4PxjEcY
         K48CWoOXsqHvWq6QLvyWxzgO1eshd7vwOpy4PUde2qM7MKR/9Io5nL5cj5dsDF2qQI
         xX1Oo6Zh2NuySfwpTQd57ZKxVt4b5tncXez3rfEfJgfjEak4H0Hvfzwzxo/J6wYyRR
         Xw0rePDW8QdyMtHuBmILhTRJ/mdgQhNhS76JhOFFFgsDnE4cEvv+s62tRBXe3MjBPN
         CK/w9sJewhhJeIoQt3mqyP+jGMGlk7yBqEerJsZWkT/ycI+E3r6HB3/9hrMrEjRtlw
         R/GhRct1l1mwg==
Received: by mail-qk1-f197.google.com with SMTP id dm13-20020a05620a1d4d00b00742a22c4239so1261210qkb.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Mar 2023 06:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgMelgrb/VLkpH6kwv9lPEQ4dt1XAT9+KiTGTm5i5/c=;
        b=G9kgE935YU84ZEcecTslYsRClORLSjZwJBOBjQNS4wylm2ZhFTQGh87J7/2olLEs6Z
         AC8WHvnIbBa/BUeG/QbB4F1T/x1AroAdsIKCezhJGn6GEidO0KTrAQWzZMXowMUuhqu8
         qO7+iX4p62PFZshkmcCGK9tQdjiBKRl0cBh0sEXCB3bSak5cj7XFO6Q83mV/2fTdH3UO
         hKjTbJVmXlVAspucB7AdZ5iyoRnORYnn1z+GsWGXpThocaW3Yy/0xXZre5DUzmJgG30h
         oF6IVBt+QgObNKDSrs1uZi7fGYSEt4lSQJz76W9eb84dWv06OwnC70jBpa9cPbh9bcrs
         WRAA==
X-Gm-Message-State: AO0yUKUxlxZPbykmiDTH/45SZYQqAL7PY2EDU7sl1UK7k3i0KLEUGrol
        gBQWxKfA9q8Skn8BOFaUVHduiv0L2kPZrlAxWNAKx8p4FNcM9Rq982DAk4xAAp5vHXC9p938Eqg
        obEERy0tHZp39D74XDcwMxdMvKMn3q74gDwKyFwp9hNql1dfS6t0Puw==
X-Received: by 2002:a05:620a:d4d:b0:742:83ee:f569 with SMTP id o13-20020a05620a0d4d00b0074283eef569mr4858490qkl.13.1678370789723;
        Thu, 09 Mar 2023 06:06:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+ABJAfbsKbyBYTfNj8osraItDCdyOTOpNmYDJbKIB/zNyDVGBmaDT/KnGUKXMOamd6DWcbCpCildmbTpuYCcw=
X-Received: by 2002:a05:620a:d4d:b0:742:83ee:f569 with SMTP id
 o13-20020a05620a0d4d00b0074283eef569mr4858475qkl.13.1678370789479; Thu, 09
 Mar 2023 06:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-13-hal.feng@starfivetech.com> <CAJM55Z8H4qmy_BiD0SHW-w5ifzhzokdO-QxpUUz9aeUd+htrZg@mail.gmail.com>
 <8c30220a-abef-7518-cb44-abcea91408e2@starfivetech.com> <49ab1072-98ba-f364-9b66-68658566e732@starfivetech.com>
In-Reply-To: <49ab1072-98ba-f364-9b66-68658566e732@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 9 Mar 2023 15:06:13 +0100
Message-ID: <CAJM55Z9YGjD+1haWcXEZNkHnWNRZckdBmTTykTt7QZV_LUohgQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] clk: starfive: Add StarFive JH7110 always-on
 clock driver
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

 On Thu, 9 Mar 2023 at 10:44, Hal Feng <hal.feng@starfivetech.com> wrote:
> On Tue, 28 Feb 2023 10:42:35 +0800, Hal Feng wrote:
> > On Sun, 26 Feb 2023 18:34:52 +0100, Emil Renner Berthing wrote:
> >> On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
> >>> From: Emil Renner Berthing <kernel@esmil.dk>
> >>>
> >>> Add driver for the StarFive JH7110 always-on clock controller
> >>> and register an auxiliary device for always-on reset controller
> >>> which is named as "reset-aon".
> >>>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> >>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >>> ---
> >>>  drivers/clk/starfive/Kconfig                  |  11 ++
> >>>  drivers/clk/starfive/Makefile                 |   1 +
> >>>  .../clk/starfive/clk-starfive-jh7110-aon.c    | 156 ++++++++++++++++++
> >>>  3 files changed, 168 insertions(+)
> >>>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-aon.c
> >>>
> >>> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> >>> index 4640d0665d1c..2aa664f2cdee 100644
> >>> --- a/drivers/clk/starfive/Kconfig
> >>> +++ b/drivers/clk/starfive/Kconfig
> >>> @@ -31,3 +31,14 @@ config CLK_STARFIVE_JH7110_SYS
> >>>         help
> >>>           Say yes here to support the system clock controller on the
> >>>           StarFive JH7110 SoC.
> >>> +
> >>> +config CLK_STARFIVE_JH7110_AON
> >>> +       tristate "StarFive JH7110 always-on clock support"
> >>> +       depends on CLK_STARFIVE_JH7110_SYS
> >>> +       select AUXILIARY_BUS
> >>> +       select CLK_STARFIVE_JH71X0
> >>> +       select RESET_STARFIVE_JH7110
> >>> +       default CLK_STARFIVE_JH7110_SYS
> >>
> >> As far as I can tell the JH7110 boots fine without this driver and it
> >> already depends on the _SYS driver above, so please do
> >>
> >> default m if SOC_STARFIVE
> >
> > OK. Will fix it.
>
> Hi, Emil,
>
> The AON clock driver provides clocks for gmac0 which is used frequently.
> So I think it would be more convenient if we set "default y" here.

You're right that if we default y for the ethernet driver then the aon
clock/reset should also default y. Personally I don't think we should
default y for every ethernet driver that might be used on some
supported risc-v platform, but I see now that
arch/riscv/config/defconfig already contains CONFIG_MACB=y,
CONFIG_E1000E=y, CONFIG_R8169=y and CONFIG_MICROSEMI_PHY=y, so maybe
I'm wrong or just too late.

> Best regards,
> Hal
