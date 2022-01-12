Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D6AC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jan 2022 02:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236678AbiALCrX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jan 2022 21:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236450AbiALCrX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jan 2022 21:47:23 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145CDC06173F
        for <linux-clk@vger.kernel.org>; Tue, 11 Jan 2022 18:47:22 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g11so3306149lfu.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Jan 2022 18:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9h8RrxrLrGfAoig5CzbnoZVT45pfxdSprD8t2BD+og0=;
        b=f14U+/r3vVy+0H0xi4EdR7uTzna3DaR1Ny7njiV7ekxtpZoY3SIDGM0ItHJL4dAZmF
         9uvaQFJTt+kP1H9WF9kB8dMvbBSJm3DuNLhOrAjdJ4p2vbSqxIHX6lfGcHf/fmu2gC0R
         tXoORim/OpT2ruh73Fn7YGs83QIQ/HscBR0d+Ec+4lrA5gqubymjtHVpFyBXynKffWZh
         6d2GnJxJCDboYk9bcyDM54KtVW5GVX12WMzQ49/MkVFQeSUV5LanNB7afnVzlOc+4VVx
         PYwioJI02WBm4JmC2JpxIurlqQloy/wnVTierXvd+JBY2Fl5Ks7w9PzREhxuHbCa69Jl
         fTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9h8RrxrLrGfAoig5CzbnoZVT45pfxdSprD8t2BD+og0=;
        b=UnP5DrssSSk1fWoyyP5mdMgD8sT8tw+JzRM5WoX/Fnrg5LqLMwzmtnxX3AnBlrf6bi
         p3HZRMGUrYc0FN0l+sWmLVVm6+QClqPw59H5mipwO4bFXppGALfcHfsQFlikLtkkX96e
         tyHmfGuXPa5D1VAAVY2cPJY6FUp+lkbc8+D2wUcjyS91Pe+vYZjbNTTc+L7G7lfmqMRO
         CbVvkZ79QP9j2ufi/Hz7Paf0gpmbTv7WEQRTUGN48VzYTxCvE9rvojgU9cf+ko5PzJpw
         egtUATSiq7de+HnaGeXGe7XqyX6X5VTMKs5HpOifjwYoMStoMakvSPdl2sjVQk4y89+Q
         nbiQ==
X-Gm-Message-State: AOAM531HkWu8pAFmpNFNGoH3j5qZEFZ3NPbdHQeNx72J9zrs67GWtPpC
        s1f+XqJn+akjar4sW0MuF7CERiRIKI5842GtcAhM5A==
X-Google-Smtp-Source: ABdhPJwhqy2ej44d/EZpTsHzZrwRPWxHt++5EAxncMr4zCSgUycrj1TLuaKU455Ay1wbh9o3cP8dpWQS4roHNtAZZEY=
X-Received: by 2002:a05:6512:280c:: with SMTP id cf12mr5527764lfb.5.1641955639490;
 Tue, 11 Jan 2022 18:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20220107090715.2601-1-zong.li@sifive.com> <YdwBWmF8OJYab7qS@google.com>
 <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com> <Yd1OvFZ4pKw+aTgv@google.com>
In-Reply-To: <Yd1OvFZ4pKw+aTgv@google.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 12 Jan 2022 10:47:09 +0800
Message-ID: <CANXhq0oK-NewS9mn-b4a60D7t+fMSbT6=Mnw7st_njxGY1DJCg@mail.gmail.com>
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

On Tue, Jan 11, 2022 at 5:32 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 11 Jan 2022, Zong Li wrote:
>
> > On Mon, Jan 10, 2022 at 5:50 PM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > Please improve the subject line.
> > >
> > > If this is a straight revert, the subject line should reflect that.
> > >
> > > If not, you need to give us specific information regarding the purpos=
e
> > > of this patch.  Please read the Git log for better, more forthcoming
> > > examples.
> > >
> >
> > It seems to me that this patch is not a straight revert, it provides
> > another way to fix the original build warnings, just like
> > '487dc7bb6a0c' tried to do. I guess the commit message has described
> > what the original warnings is and what the root cause is, it also
> > mentioned what is changed in this patch. I'm a bit confused whether we
> > need to add fixes tag, it looks like that it might cause some
> > misunderstanding?
>
> I think it's the patch description and subject that is causing the
> misunderstanding.
>

Yes, the subject should be made better.

> Please help me with a couple of points and I'll help you draft
> something up.
>
> Firstly, what alerted you to the problem you're attempting to solve?
>

I recently noticed the code was changed, I guess that I was missing
something there. After tracking the log, I found that there is a build
warning in the original implementation, and it was already fixed, but
it seems to me that there are still some situations there, please help
me to see the following illustration.

> > > > --- a/drivers/clk/sifive/fu540-prci.c
> > > > +++ b/drivers/clk/sifive/fu540-prci.c
> > > > @@ -20,7 +20,6 @@
> > > >
> > > >  #include <dt-bindings/clock/sifive-fu540-prci.h>
> > > >
> > > > -#include "fu540-prci.h"
>
> How is this related to the issue/patch?
>

Let's go back to the version without '487dc7bb6a0c' fix. The
prci_clk_fu540 variable is defined in sifive-fu540-prci.h header,
however, fu540-prci.c includes this header but doesn't use this
variable, so the warnings happen.

The easiest way to do it is just removing this line, then the warning
could be fixed. But as the '487dc7bb6a0c' or this patch does, the code
should be improved, the prci_clk_fu540 variable shouldn't be defined
in the header, it should be moved somewhere.

> > > > +struct prci_clk_desc prci_clk_fu540 =3D {
> > > > +     .clks =3D __prci_init_clocks_fu540,
> > > > +     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
> > > > +};
>
> > > > diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/f=
u540-prci.h
> > > > index c220677dc010..931d6cad8c1c 100644
> > > > --- a/drivers/clk/sifive/fu540-prci.h
> > > > +++ b/drivers/clk/sifive/fu540-prci.h
> > > > @@ -7,10 +7,6 @@
> > > > +extern struct prci_clk_desc prci_clk_fu540;
>
> > > > diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/=
sifive-prci.c
> > > > index 80a288c59e56..916d2fc28b9c 100644
> > > > --- a/drivers/clk/sifive/sifive-prci.c
> > > > +++ b/drivers/clk/sifive/sifive-prci.c
> > > > @@ -12,11 +12,6 @@
> > > >  #include "fu540-prci.h"
> > > >  #include "fu740-prci.h"
> > > >
> > > > -static const struct prci_clk_desc prci_clk_fu540 =3D {
> > > > -     .clks =3D __prci_init_clocks_fu540,
> > > > -     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
> > > > -};
> > > > -
>
> I'm not sure if it's you or I that is missing the point here, but
> prci_clk_fu540 is used within *this* file itself:
>

Here is another situation I mentioned at the beginning, if we'd like
to put prci_clk_fu540 here, prci_clk_fu740 should be put here as well.
I guess you didn't do that because there is a bug in the original
code, fu740-prci.c misused the fu540-prci.h, so there is no build
warning on fu740. FU740 still works correctly by misusing the
fu540-prci.h header because fu740-prci.c doesn't actually use the
prci_clk_fu740 variable, like fu540 we talked about earlier.

>  static const struct of_device_id sifive_prci_of_match[] =3D {
>          {.compatible =3D "sifive,fu540-c000-prci", .data =3D &prci_clk_f=
u540},
>          {.compatible =3D "sifive,fu740-c000-prci", .data =3D &prci_clk_f=
u740},
>          {}
>  };
>
> So why are you moving it out to somewhere it is *not* used and making
> it an extern?  This sounds like the opposite to what you'd want?

The idea is that sifive-prci.c is the core and common part of PRCI,
and I'd like to separate the SoCs-dependent part into SoCs-dependent
files, such as fu540-prci.c and fu740-prci.c. The goal is if we add
new SoCs in the future, we can just put the SoCs-dependent data
structure in the new C file, and do as minimum modification as
possible in the core file (i.e. sifive-prci.c). It might also help us
to see all SoCs-dependent data in one file, then we don't need to
cross many files. Putting these two variables in sifive-pric.c is the
right thing to do, but that is why I separate them and make them
extern in this patch.

Many thanks for your reply.

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
