Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480F0C2D0E4
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 07:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9DC020731
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 07:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cJi+sHIc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbgKWHQu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Nov 2020 02:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgKWHQu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Nov 2020 02:16:50 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29983C061A4D
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2020 23:16:50 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id f16so14985831otl.11
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2020 23:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wLXgsyTqO2RarUvyH8ZTTAYF4WDtQk4zjdGgRXC7rCg=;
        b=cJi+sHIc9PIFYzVrxZIJR6TBDveCOPoJo7R9h9i35/0I1WcDW0tCvgyKeQNWpFHauV
         H1YjIY8kRymMFlnofU0cW6rqxYuTIw1VRpSCRiL36LNItAs2MfpGnwmTt+RMg5tY4XLg
         ciAXADVti0dmblXhg00sub5IbraSwBVnEfIyF7NizMX6kKjTbsv50O3SRm6+3FJx1qG6
         WnZEa7whuIHVCP2Kzz5OJuO2BLi+dEKi2ZV1CQxsmjh3viQ+bS0KKeKpey/gRXqdND+q
         mTsaphypJz0oRNOr2CqFWneCcMqa5zptoQYzGXRQvx7YTrhaCoTW5KvrTngH8glCvWSb
         pWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wLXgsyTqO2RarUvyH8ZTTAYF4WDtQk4zjdGgRXC7rCg=;
        b=jyckjFM+r/L8yAWewt0ifP8/xFwVQaVzVU7JKErfTsbnjOh52gESNJK1qouFjfJfAM
         bv0tHVxjCIAUQdJ4NllNva75pTdzoQYiAbZIKaQBMtfgo/5U2r4g3K/tYaxC1HeV7vJP
         nuHvzbXaPxtmy+aJCJRB3R9BD3cxQfn6DqbgdbBaJ8R7Ir02z9o+MB84FJVHVVniYIvI
         BV4xCMawOnYTxHP+XP7WzPRe/3mQXrvfLHCDAwUgnVWkwTYjOKAdw9YdtYh1qkDfPsmf
         TKtFCtM5Skg+hpsAXbplLF3lYSVuwXhYlPUAhT+iwIfgLxkSJ+PAYWv42K0usciTMM5K
         AYwQ==
X-Gm-Message-State: AOAM531DMSQkv/wJgflZ2VMYq0kSazPI10Rbd5Q3nmg8CaYIq4hinBRw
        ffsX87K7Sz7Sn6Mp/e31yEAv3w2hFmgiOCOx3+m6QQ==
X-Google-Smtp-Source: ABdhPJzVm9yG9nWXa/SZbEw2G6kXq7rqr9EqAzpThBAB7CTo/wwfjZlLxIvi+xA2Iol2Cfd/oLqW1289GKRfVU/RQNE=
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr22425313otq.166.1606115809393;
 Sun, 22 Nov 2020 23:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20201111100608.108842-3-zong.li@sifive.com> <mhng-ca3ea720-b6b1-4b6e-a58f-43fadd7f1c18@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-ca3ea720-b6b1-4b6e-a58f-43fadd7f1c18@palmerdabbelt-glaptop1>
From:   Zong Li <zong.li@sifive.com>
Date:   Mon, 23 Nov 2020 15:16:39 +0800
Message-ID: <CANXhq0r+TOu_=c+KpNYFu3xzFtfmORoyDR+8mRrXwRCgpGWe8A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] clk: sifive: Use common name for prci configuration
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Pragnesh Patel <pragnesh.patel@openfive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        Yash Shah <yash.shah@sifive.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Nov 21, 2020 at 9:29 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 11 Nov 2020 02:06:06 PST (-0800), zong.li@sifive.com wrote:
> > Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
> > patch is prepared for fu740 support.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> > ---
> >  arch/riscv/Kconfig.socs     | 2 +-
> >  drivers/clk/sifive/Kconfig  | 6 +++---
> >  drivers/clk/sifive/Makefile | 2 +-
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 8a55f6156661..3284d5c291be 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -5,7 +5,7 @@ config SOC_SIFIVE
> >       select SERIAL_SIFIVE if TTY
> >       select SERIAL_SIFIVE_CONSOLE if TTY
> >       select CLK_SIFIVE
> > -     select CLK_SIFIVE_FU540_PRCI
> > +     select CLK_SIFIVE_PRCI
> >       select SIFIVE_PLIC
> >       help
> >         This enables support for SiFive SoC platform hardware.
> > diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
> > index f3b4eb9cb0f5..ab48cf7e0105 100644
> > --- a/drivers/clk/sifive/Kconfig
> > +++ b/drivers/clk/sifive/Kconfig
> > @@ -8,12 +8,12 @@ menuconfig CLK_SIFIVE
> >
> >  if CLK_SIFIVE
> >
> > -config CLK_SIFIVE_FU540_PRCI
> > -     bool "PRCI driver for SiFive FU540 SoCs"
> > +config CLK_SIFIVE_PRCI
> > +     bool "PRCI driver for SiFive SoCs"
> >       select CLK_ANALOGBITS_WRPLL_CLN28HPC
> >       help
> >         Supports the Power Reset Clock interface (PRCI) IP block found in
> > -       FU540 SoCs.  If this kernel is meant to run on a SiFive FU540 SoC,
> > +       FU540 SoCs. If this kernel is meant to run on a SiFive FU540 SoC,
>
> This just removes the double-space.  Presumably in should also remove the
> "FU540", as this clock driver will now function for multiple SiFive SOCs?
>

I'd like to list the support SoCs here, so in the third patch, I list
the FU740 in the description as well. I would remove the SoC names if
it is better by using a generic term. What do you think about that?

> >         enable this driver.
> >
> >  endif
> > diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
> > index 627effe2ece1..fe3e2cb4c4d8 100644
> > --- a/drivers/clk/sifive/Makefile
> > +++ b/drivers/clk/sifive/Makefile
> > @@ -1,4 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-y += sifive-prci.o
> >
> > -obj-$(CONFIG_CLK_SIFIVE_FU540_PRCI)  += fu540-prci.o
> > +obj-$(CONFIG_CLK_SIFIVE_PRCI)        += fu540-prci.o
>
> Probably best to rename the source file as well.

I added fu740-prci.c in the third patch, these two files fu740-prci.c
and fu540-prci.c hold the soc-dependent code, and sifive-prci.c is the
core of this driver.
