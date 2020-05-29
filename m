Return-Path: <SRS0=l6vu=7L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ED0C433E1
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 07:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B6AF2151B
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 07:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgE2HjR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 May 2020 03:39:17 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:53255 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgE2HjO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 May 2020 03:39:14 -0400
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MRmsG-1jYYH41cmw-00TC0E for <linux-clk@vger.kernel.org>; Fri, 29 May 2020
 09:39:12 +0200
Received: by mail-qk1-f180.google.com with SMTP id q8so1347639qkm.12
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2020 00:39:12 -0700 (PDT)
X-Gm-Message-State: AOAM5306AF0Q7QyWYHwiRhKBsND1i0Rc0uA8S1bswV83Qrap2PMmzUKg
        bL+xjlrqgJQbK8JIqvQY0PDZQCvOOxsTwaOIETA=
X-Google-Smtp-Source: ABdhPJxQKYd4FlNgNoz2isNi0ebCTB3nvWDUEuOZMHLr8f8WtGdScxnBe7hCE28C3sqQ+FdC/w/xyW9EOP1Ihhx9Ghk=
X-Received: by 2002:a37:554:: with SMTP id 81mr6509274qkf.394.1590737951276;
 Fri, 29 May 2020 00:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200527181307.2482167-1-robh@kernel.org> <CAK8P3a27RkBkt5mnBeVJ-67MnJi29Dc+jYL2Q8JskaZ1W_XrKg@mail.gmail.com>
 <CAL_JsqJ83UJ0Roy_NJBLXuvhPG2zBDod8ZgSGrEtpKSnYPtowQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJ83UJ0Roy_NJBLXuvhPG2zBDod8ZgSGrEtpKSnYPtowQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 29 May 2020 09:38:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2S-8fvyiKTk+o876r1XMV6C=HipiRutSWSe0P2rdL4Xg@mail.gmail.com>
Message-ID: <CAK8P3a2S-8fvyiKTk+o876r1XMV6C=HipiRutSWSe0P2rdL4Xg@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: Fix kconfig dependency on COMMON_CLK_VERSATILE
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8HC9sS9M0wo7KFoCPxvtTIjjG4LG9CHguERYtiTjcCXqaVzV7wh
 T5h2u+cHxZJbjvFpWn1fHAeV9bG4ipivGmdsSYUSj6H8OjRHClQJ02Oc9gjHA21m2+tdKec
 KUObrTDgfO4NwNekTHcyBr867LH0TSKWmXDP0n+vO+++9O/KQxIGgTa38QLHvBeKCm5Dqjf
 nKdGvPnrp4/41qQy3f4PQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:466u57s88ls=:eR+hro1dB3x+bTqWEGbdAl
 50TahiqmOYdGp6VnOUFzOKrCuri4CQBvXkkQSAJkqmh1HRc6ye0oK9Zus9ImFSSSEy0BHk/x0
 5Qj+8gkg5pVnht7lZHZ4NMXs3vYbKMMHNV7hDgUGYGNZhOrNgikiEc46f1b63iOtmDOw3NHzp
 ALYjOUvkdBk49NcwZK6LdV8xPclS14PWKAj9zgGCnlIzRFXsI+RkhHnQnzljNRvYcc/NaCqYE
 fMfxz4wbvh5daOII5RzoPxDSkKI1bRR37lVvKtUbabj5PsTMiCW74raFgBZmf09+O4JUEESOp
 GQbnLy0Gw8lgqAF8bONDbNEHItsEmhExFiXvuP9BqNz+Ki7dJVJRXto7XCc2GJIeTlgFQ5Gil
 JBeZjTYdqZ79OtCfWkTTtS3+HkMSxyHU6rOxQWq3RCGQnsbZZDsA+Equr6VgTsw+LCtIRK9YR
 bS7LYv9pPf/OAzdUuIaBuawX9oKErn/mh/R/uqrGuk6veD3n9xwxL69y6Md6emVWkIUoBTviT
 OeJgXij3MUwobnA7Y7PgyVTRxMIzTBxPs+r13TC9ioY3G9s0G1oJphA+Zl6OG1H6TXx1pyIHO
 0ipPgIZp1Hw3PMOYOIsybJdAGm6Hq7mtlrIfuEGa/3rsr5oSZSsSVmlR4QTEQearpCn1WeBQQ
 5842kZYjflROVQ1YaJ5enQ410uZ9FGU6cZLrzD14JhoB9ZqiSi3QYD//R6tfyk80E/rF3d0c1
 TrFuxXr/FJ+BxQWeocHaKVOjWRuxDjAlTz6bfuQiuW6u4/4eejtUZ2PbQB5ZYnUwQr1nOepRf
 0YXjxsZ1LA/1AgzcJ2Q71BzqySKbLZ6+4zm8MrdQdEJ+yUMaa0=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 28, 2020 at 11:29 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, May 28, 2020 at 5:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, May 27, 2020 at 8:13 PM Rob Herring <robh@kernel.org> wrote:
> > > diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
> > > index a0ed412e8396..8c1b0e8e8d32 100644
> > > --- a/drivers/clk/versatile/Kconfig
> > > +++ b/drivers/clk/versatile/Kconfig
> > > @@ -1,11 +1,8 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >
> > > -menuconfig COMMON_CLK_VERSATILE
> > > -       bool "Clock driver for ARM Reference designs" if COMPILE_TEST
> > > -       default y if ARCH_INTEGRATOR || ARCH_REALVIEW || \
> > > -               ARCH_VERSATILE || ARCH_VEXPRESS
> > > -
> > > -if COMMON_CLK_VERSATILE
> > > +menu "Clock driver for ARM Reference designs"
> > > +       depends on ARCH_INTEGRATOR || ARCH_REALVIEW || \
> > > +               ARCH_VERSATILE || ARCH_VEXPRESS || COMPILE_TEST
> > >
> >
> > I've applied this version now but added ARCH_ZYNQ as an additional
> > dependency to work around one of the warnings we got earlier.
>
> That's just spreading a copy-n-paste error. Why don't you apply the
> Zynq patch I referenced if Michal never did?

Sorry I completely missed the reference from your previous email.
I've applied that patch on top now, reverting the change I did in the
process.

I had noticed that the Zynq Kconfig seemed rather odd, by my interpretation
was that it had been added intentionally in order to use an existing clk
controller driver for configurable logic on Zynq that was not part of the
main DT file. As Michal already confirmed that it was just a mistake, I
agree it should be removed.

      Arnd
