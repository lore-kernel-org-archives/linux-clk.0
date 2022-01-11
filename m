Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8DEC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jan 2022 03:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244792AbiAKDVu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jan 2022 22:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233848AbiAKDVu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jan 2022 22:21:50 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF963C061748
        for <linux-clk@vger.kernel.org>; Mon, 10 Jan 2022 19:21:49 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d3so25177407lfv.13
        for <linux-clk@vger.kernel.org>; Mon, 10 Jan 2022 19:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KfU7miV0uOjRWcNpVnQz4f+FJoHgEBgdho8tmS6nsfo=;
        b=KmGHSbHmSJgY+7pMcppIHWNFbaXw045712/Mf9tiHgUXluw5Z23uDoqgc28RKVF6/s
         Fry3q47gty8KC80gXjcPhH7jjfuPVjmI8/VxbnTmkcNhdjLv7fL7Eq98rdJF7C0tPxnD
         4ZukbOQVIy6F7Rr/UJ0f79P29WAKtedwsHoa2zfEmdk+ZCpck6bVWh/YCl162LkBKzMH
         uYFSFz8u+huvUfXFRhrksBWrcWnD2sVJhhKlDnUd+UBdbiJ0EzLA5fEwOUWtnvbeu7Cg
         IXWTJ9wsDG7kAVgUStj08LJz5YAfkAaj2iXysQklAdI9ZnTTzq/UuEIXV0jE9frGpIeC
         ZZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KfU7miV0uOjRWcNpVnQz4f+FJoHgEBgdho8tmS6nsfo=;
        b=KPzf52cSNpKIwqT9dqqJM4IDEkyWslm9Svxc//Xq1kjnvKJKHMZjn3YNqM5bXJYycL
         so15Wib5OTXzzgk2kOfa2XBMlU7lpmctDuuY8JABmabmKw6TDN81fa81zJJsSlpfi1Km
         8VImXRamWQ5DLgmpYI4KLCjmxfBFO66eJu/kBPejBUtNjQwKisOq26KoG0dZK5dJm2+Z
         Msf29l6D55s/tIjoL9aGKx5+TLd4wjFPvJFYuwZOn0OR4B0PV31hmmmqV0oAM7QI7o7Z
         ztEy27apI1gXSBVM54Ahyi1vFTM2e5QJWGZui72xt7RjqWb6ieJ34R1PiM+KB8qvOOzb
         V8eA==
X-Gm-Message-State: AOAM532Be9EvCuT5q2+4OHluTDBe1YyqfmPod5GwUu4FeU3oVoHvXSl+
        p6hVDxAvW7wFhRfi1Ifa6G7X6rATiF0cOqMjzpAHTIG6cgia4wb9
X-Google-Smtp-Source: ABdhPJxc2eSZgvuT7K2GkzKA9fRUl+Z+Z6vYLSVVcj3xCfFVpMwJRW26tIt173G49SpLoUQtxFZznCWR9Ts7qnLzjjM=
X-Received: by 2002:a05:6512:15a6:: with SMTP id bp38mr2014273lfb.116.1641871307866;
 Mon, 10 Jan 2022 19:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20220107090715.2601-1-zong.li@sifive.com> <YdwBWmF8OJYab7qS@google.com>
In-Reply-To: <YdwBWmF8OJYab7qS@google.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Tue, 11 Jan 2022 11:21:37 +0800
Message-ID: <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jan 10, 2022 at 5:50 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Please improve the subject line.
>
> If this is a straight revert, the subject line should reflect that.
>
> If not, you need to give us specific information regarding the purpose
> of this patch.  Please read the Git log for better, more forthcoming
> examples.
>

It seems to me that this patch is not a straight revert, it provides
another way to fix the original build warnings, just like
'487dc7bb6a0c' tried to do. I guess the commit message has described
what the original warnings is and what the root cause is, it also
mentioned what is changed in this patch. I'm a bit confused whether we
need to add fixes tag, it looks like that it might cause some
misunderstanding?

> On Fri, 07 Jan 2022, Zong Li wrote:
>
> > This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> > Declare static const variable 'prci_clk_fu540' where it's used").
> > For fixing W=3D1 kernel build warning(s) about =E2=80=98prci_clk_fu540=
=E2=80=99 defined
> > but not used [-Wunused-const-variable=3D], the problem is that the C fi=
le
> > of fu540 and fu740 doesn't use these variables, but they includes the
> > header files.
>
> What exactly does this patch fix?  Does it fix a build warning?
>
> If so, please provide the line you are seeing.
>
> > We could refine the code by moving the definition of these
> > variables into fu540 and fu740 implementation respectively instead of
> > common core code, then we could still separate the SoCs-dependent data
> > in their own implementation.
> >
> > Fixes: 487dc7bb6a0c ("clk: sifive: fu540-prci: Declare static
> > const variable 'prci_clk_fu540' where it's used")
>
> This should be on one line.
>
> What exactly does it fix though?  Please provide more details.
>
> What about the warning that this patch was designed to fix?  Doesn't
> that return after this patch has been applied?
>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> >
> > ---
> > Changed in v3:
> >  - Rebase on v5.16-rc8
> >  - Add fixes tag
> >
> > Changed in v2:
> >  - Move definition of variable to C file from header
> > ---
> >  drivers/clk/sifive/fu540-prci.c  |  6 +++++-
> >  drivers/clk/sifive/fu540-prci.h  |  6 +-----
> >  drivers/clk/sifive/fu740-prci.c  |  6 +++++-
> >  drivers/clk/sifive/fu740-prci.h  | 11 +----------
> >  drivers/clk/sifive/sifive-prci.c |  5 -----
> >  5 files changed, 12 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540=
-prci.c
> > index 29bab915003c..5568bc26e36f 100644
> > --- a/drivers/clk/sifive/fu540-prci.c
> > +++ b/drivers/clk/sifive/fu540-prci.c
> > @@ -20,7 +20,6 @@
> >
> >  #include <dt-bindings/clock/sifive-fu540-prci.h>
> >
> > -#include "fu540-prci.h"
> >  #include "sifive-prci.h"
> >
> >  /* PRCI integration data for each WRPLL instance */
> > @@ -87,3 +86,8 @@ struct __prci_clock __prci_init_clocks_fu540[] =3D {
> >               .ops =3D &sifive_fu540_prci_tlclksel_clk_ops,
> >       },
> >  };
> > +
> > +struct prci_clk_desc prci_clk_fu540 =3D {
> > +     .clks =3D __prci_init_clocks_fu540,
> > +     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
> > +};
> > diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540=
-prci.h
> > index c220677dc010..931d6cad8c1c 100644
> > --- a/drivers/clk/sifive/fu540-prci.h
> > +++ b/drivers/clk/sifive/fu540-prci.h
> > @@ -7,10 +7,6 @@
> >  #ifndef __SIFIVE_CLK_FU540_PRCI_H
> >  #define __SIFIVE_CLK_FU540_PRCI_H
> >
> > -#include "sifive-prci.h"
> > -
> > -#define NUM_CLOCK_FU540      4
> > -
> > -extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
> > +extern struct prci_clk_desc prci_clk_fu540;
> >
> >  #endif /* __SIFIVE_CLK_FU540_PRCI_H */
> > diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740=
-prci.c
> > index 53f6e00a03b9..0ade3dcd24ed 100644
> > --- a/drivers/clk/sifive/fu740-prci.c
> > +++ b/drivers/clk/sifive/fu740-prci.c
> > @@ -8,7 +8,6 @@
> >
> >  #include <dt-bindings/clock/sifive-fu740-prci.h>
> >
> > -#include "fu540-prci.h"
> >  #include "sifive-prci.h"
> >
> >  /* PRCI integration data for each WRPLL instance */
> > @@ -132,3 +131,8 @@ struct __prci_clock __prci_init_clocks_fu740[] =3D =
{
> >               .ops =3D &sifive_fu740_prci_pcie_aux_clk_ops,
> >       },
> >  };
> > +
> > +struct prci_clk_desc prci_clk_fu740 =3D {
> > +     .clks =3D __prci_init_clocks_fu740,
> > +     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu740),
> > +};
> > diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740=
-prci.h
> > index 511a0bf7ba2b..5bc0e18f058c 100644
> > --- a/drivers/clk/sifive/fu740-prci.h
> > +++ b/drivers/clk/sifive/fu740-prci.h
> > @@ -7,15 +7,6 @@
> >  #ifndef __SIFIVE_CLK_FU740_PRCI_H
> >  #define __SIFIVE_CLK_FU740_PRCI_H
> >
> > -#include "sifive-prci.h"
> > -
> > -#define NUM_CLOCK_FU740      9
> > -
> > -extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
> > -
> > -static const struct prci_clk_desc prci_clk_fu740 =3D {
> > -     .clks =3D __prci_init_clocks_fu740,
> > -     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu740),
> > -};
> > +extern struct prci_clk_desc prci_clk_fu740;
> >
> >  #endif /* __SIFIVE_CLK_FU740_PRCI_H */
> > diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifi=
ve-prci.c
> > index 80a288c59e56..916d2fc28b9c 100644
> > --- a/drivers/clk/sifive/sifive-prci.c
> > +++ b/drivers/clk/sifive/sifive-prci.c
> > @@ -12,11 +12,6 @@
> >  #include "fu540-prci.h"
> >  #include "fu740-prci.h"
> >
> > -static const struct prci_clk_desc prci_clk_fu540 =3D {
> > -     .clks =3D __prci_init_clocks_fu540,
> > -     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
> > -};
> > -
> >  /*
> >   * Private functions
> >   */
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
