Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913C4C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jan 2022 09:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351755AbiASJid (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jan 2022 04:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235918AbiASJid (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jan 2022 04:38:33 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFB9C061574
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 01:38:32 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b14so6999915lff.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 01:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Onx2hI87TC4wX6JemWpXW0Jg/NStBBZEa3VU6PdGp68=;
        b=lZOWmPXn2kF4O11dqF/iCKALmTx/7VXlIYCI9O01VyaQ9cYDgi7n1Bvi92HzBR1t7A
         tFg9iAShqzU6O/Urew+abHzbPspsJjATU+44idhHTbe06uizSDJj+avMQnukpvS5Avr3
         rteFyIGZBsnxzIK40buVG0EnxyIj0tI4eBiCSTNuYgRSlCE+fZV/jQJ6lhBO/W4IsVpJ
         3cZB3T3dHvgxU3TLemcfyt1B74BRbjdMP9hdjL0BNrjb6DMLTyX6uS7bOBbBCiKWKKrW
         FT3wihUUsIfjTm+ar+0JdcB9YmzuJNn+HkNIkMsrqX0bNarsxjqAV595f8BE4C5LIRw1
         4f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Onx2hI87TC4wX6JemWpXW0Jg/NStBBZEa3VU6PdGp68=;
        b=OVKSQ4OteDR7UEy+PxzdkfjetjbWO43et++NeWEvoxWuHU5jKIOR5U/6H17n/7XxlT
         627HwGz5vYohZFvA374BKhIk2kuNaohrMuivIGOW+O+TO5D2bJzq1MKA1fobbycEcS7y
         yAPJuUJVMZgWNVCNcNaglYo+vM6q2WEl2h75/Ur9JDzD6/NNGdDUvS0a4c6Yq+GcUp7R
         YnJGTyz/9zh7lI3jQ2RZ5/k0jBOVZ0zAYZk+3WX6z4oIxNw/7xGTRtF1/cLqw2IZyftJ
         xOIlKHK8Xvat2uoH3ur0eQcw8N/X/kn4RJ2WVtXwhRS2e0vlxSxGWrq+cLuZwmapJct2
         eREQ==
X-Gm-Message-State: AOAM530nnf7Iw22WlC5WeOkUJWfOFLvGKM2u1loiLURCTuw3mnXKBUzX
        PBcaaLouVsFX3LkXLZ5/9lYZ9N5F7xqOQiJ0Tmutxg==
X-Google-Smtp-Source: ABdhPJwQ7L7i5DIb+RwAj47H1TKf9VcB4NlY/Pv97nMZiX/6PqGn8WUkvjTXIufs97qBp8gySMgm9fJonBrliVB9g5Y=
X-Received: by 2002:a05:6512:280c:: with SMTP id cf12mr26771197lfb.5.1642585110903;
 Wed, 19 Jan 2022 01:38:30 -0800 (PST)
MIME-Version: 1.0
References: <Yd1OvFZ4pKw+aTgv@google.com> <CANXhq0oK-NewS9mn-b4a60D7t+fMSbT6=Mnw7st_njxGY1DJCg@mail.gmail.com>
 <Yd6a3Gnmv2ox+Sec@google.com> <CANXhq0oTyHGOUTgLk2HWpSYurUKuz5SvuaF6C5xKjn5Frswayw@mail.gmail.com>
 <YeBftQu9YgfFelmw@google.com> <F0F4C6FB-2340-4ED1-921A-800795B298E7@jrtc27.com>
 <YeBr45vcM6woAKlc@google.com> <CANXhq0r1LO1--C7DOzTT5q-1PoALq0G_-itOjcMfM0VjC_T9eg@mail.gmail.com>
 <YeFLXFGV8/qMrq8F@google.com> <CANXhq0pjz3r_Er5XhrjbjP5mLsRXb79Ezd=ufNDdDSPU5EYqUA@mail.gmail.com>
 <YeGmBoCMZxCnqIbM@google.com> <CANXhq0qgDnJg6cBW4DuL0aJ8tS_vaW+Np2T6jKdEug-CR4qxWA@mail.gmail.com>
In-Reply-To: <CANXhq0qgDnJg6cBW4DuL0aJ8tS_vaW+Np2T6jKdEug-CR4qxWA@mail.gmail.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 19 Jan 2022 17:38:19 +0800
Message-ID: <CANXhq0r51r9GgBkqdZQumwKMbcG8vNQx5xvZmvaYd2rAGFjZ_w@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jessica Clarke <jrtc27@jrtc27.com>,
        Michael Turquette <mturquette@baylibre.com>,
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

On Sat, Jan 15, 2022 at 2:19 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Sat, Jan 15, 2022 at 12:34 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Fri, 14 Jan 2022, Zong Li wrote:
> >
> > > On Fri, Jan 14, 2022 at 6:07 PM Lee Jones <lee.jones@linaro.org> wrot=
e:
> > > >
> > > > On Fri, 14 Jan 2022, Zong Li wrote:
> > > >
> > > > > On Fri, Jan 14, 2022 at 2:13 AM Lee Jones <lee.jones@linaro.org> =
wrote:
> > > > > >
> > > > > > On Thu, 13 Jan 2022, Jessica Clarke wrote:
> > > > > >
> > > > > > > On 13 Jan 2022, at 17:21, Lee Jones <lee.jones@linaro.org> wr=
ote:
> > > > > > > >
> > > > > > > > On Thu, 13 Jan 2022, Zong Li wrote:
> > > > > > > >
> > > > > > > >> On Wed, Jan 12, 2022 at 5:09 PM Lee Jones <lee.jones@linar=
o.org> wrote:
> > > > > > > >>>
> > > > > > > >>> On Wed, 12 Jan 2022, Zong Li wrote:
> > > > > > > >>>
> > > > > > > >>>> On Tue, Jan 11, 2022 at 5:32 PM Lee Jones <lee.jones@lin=
aro.org> wrote:
> > > > > > > >>>>>
> > > > > > > >>>>> On Tue, 11 Jan 2022, Zong Li wrote:
> > > > > > > >>>>>
> > > > > > > >>>>>> On Mon, Jan 10, 2022 at 5:50 PM Lee Jones <lee.jones@l=
inaro.org> wrote:
> > > > > > > >>>>>>>
> > > > > > > >>>>>>> Please improve the subject line.
> > > > > > > >>>>>>>
> > > > > > > >>>>>>> If this is a straight revert, the subject line should=
 reflect that.
> > > > > > > >>>>>>>
> > > > > > > >>>>>>> If not, you need to give us specific information rega=
rding the purpose
> > > > > > > >>>>>>> of this patch.  Please read the Git log for better, m=
ore forthcoming
> > > > > > > >>>>>>> examples.
> > > > > > > >>>>>>>
> > > > > > > >>>>>>
> > > > > > > >>>>>> It seems to me that this patch is not a straight rever=
t, it provides
> > > > > > > >>>>>> another way to fix the original build warnings, just l=
ike
> > > > > > > >>>>>> '487dc7bb6a0c' tried to do. I guess the commit message=
 has described
> > > > > > > >>>>>> what the original warnings is and what the root cause =
is, it also
> > > > > > > >>>>>> mentioned what is changed in this patch. I'm a bit con=
fused whether we
> > > > > > > >>>>>> need to add fixes tag, it looks like that it might cau=
se some
> > > > > > > >>>>>> misunderstanding?
> > > > > > > >>>>>
> > > > > > > >>>>> I think it's the patch description and subject that is =
causing the
> > > > > > > >>>>> misunderstanding.
> > > > > > > >>>>>
> > > > > > > >>>>
> > > > > > > >>>> Yes, the subject should be made better.
> > > > > > > >>>>
> > > > > > > >>>>> Please help me with a couple of points and I'll help yo=
u draft
> > > > > > > >>>>> something up.
> > > > > > > >>>>>
> > > > > > > >>>>> Firstly, what alerted you to the problem you're attempt=
ing to solve?
> > > > > > > >>>>>
> > > > > > > >>>>
> > > > > > > >>>> I recently noticed the code was changed, I guess that I =
was missing
> > > > > > > >>>> something there. After tracking the log, I found that th=
ere is a build
> > > > > > > >>>> warning in the original implementation, and it was alrea=
dy fixed, but
> > > > > > > >>>> it seems to me that there are still some situations ther=
e, please help
> > > > > > > >>>> me to see the following illustration.
> > > > > > > >>>>
> > > > > > > >>>>>>>> --- a/drivers/clk/sifive/fu540-prci.c
> > > > > > > >>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.c
> > > > > > > >>>>>>>> @@ -20,7 +20,6 @@
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> #include <dt-bindings/clock/sifive-fu540-prci.h>
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> -#include "fu540-prci.h"
> > > > > > > >>>>>
> > > > > > > >>>>> How is this related to the issue/patch?
> > > > > > > >>>>>
> > > > > > > >>>>
> > > > > > > >>>> Let's go back to the version without '487dc7bb6a0c' fix.=
 The
> > > > > > > >>>> prci_clk_fu540 variable is defined in sifive-fu540-prci.=
h header,
> > > > > > > >>>> however, fu540-prci.c includes this header but doesn't u=
se this
> > > > > > > >>>> variable, so the warnings happen.
> > > > > > > >>>>
> > > > > > > >>>> The easiest way to do it is just removing this line, the=
n the warning
> > > > > > > >>>> could be fixed. But as the '487dc7bb6a0c' or this patch =
does, the code
> > > > > > > >>>> should be improved, the prci_clk_fu540 variable shouldn'=
t be defined
> > > > > > > >>>> in the header, it should be moved somewhere.
> > > > > > > >>>>
> > > > > > > >>>>>>>> +struct prci_clk_desc prci_clk_fu540 =3D {
> > > > > > > >>>>>>>> +     .clks =3D __prci_init_clocks_fu540,
> > > > > > > >>>>>>>> +     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu=
540),
> > > > > > > >>>>>>>> +};
> > > > > > > >>>>>
> > > > > > > >>>>>>>> diff --git a/drivers/clk/sifive/fu540-prci.h b/drive=
rs/clk/sifive/fu540-prci.h
> > > > > > > >>>>>>>> index c220677dc010..931d6cad8c1c 100644
> > > > > > > >>>>>>>> --- a/drivers/clk/sifive/fu540-prci.h
> > > > > > > >>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.h
> > > > > > > >>>>>>>> @@ -7,10 +7,6 @@
> > > > > > > >>>>>>>> +extern struct prci_clk_desc prci_clk_fu540;
> > > > > > > >>>>>
> > > > > > > >>>>>>>> diff --git a/drivers/clk/sifive/sifive-prci.c b/driv=
ers/clk/sifive/sifive-prci.c
> > > > > > > >>>>>>>> index 80a288c59e56..916d2fc28b9c 100644
> > > > > > > >>>>>>>> --- a/drivers/clk/sifive/sifive-prci.c
> > > > > > > >>>>>>>> +++ b/drivers/clk/sifive/sifive-prci.c
> > > > > > > >>>>>>>> @@ -12,11 +12,6 @@
> > > > > > > >>>>>>>> #include "fu540-prci.h"
> > > > > > > >>>>>>>> #include "fu740-prci.h"
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> -static const struct prci_clk_desc prci_clk_fu540 =
=3D {
> > > > > > > >>>>>>>> -     .clks =3D __prci_init_clocks_fu540,
> > > > > > > >>>>>>>> -     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu=
540),
> > > > > > > >>>>>>>> -};
> > > > > > > >>>>>>>> -
> > > > > > > >>>>>
> > > > > > > >>>>> I'm not sure if it's you or I that is missing the point=
 here, but
> > > > > > > >>>>> prci_clk_fu540 is used within *this* file itself:
> > > > > > > >>>>>
> > > > > > > >>>>
> > > > > > > >>>> Here is another situation I mentioned at the beginning, =
if we'd like
> > > > > > > >>>> to put prci_clk_fu540 here, prci_clk_fu740 should be put=
 here as well.
> > > > > > > >>>> I guess you didn't do that because there is a bug in the=
 original
> > > > > > > >>>> code, fu740-prci.c misused the fu540-prci.h, so there is=
 no build
> > > > > > > >>>> warning on fu740. FU740 still works correctly by misusin=
g the
> > > > > > > >>>> fu540-prci.h header because fu740-prci.c doesn't actuall=
y use the
> > > > > > > >>>> prci_clk_fu740 variable, like fu540 we talked about earl=
ier.
> > > > > > > >>>>
> > > > > > > >>>>> static const struct of_device_id sifive_prci_of_match[]=
 =3D {
> > > > > > > >>>>>         {.compatible =3D "sifive,fu540-c000-prci", .dat=
a =3D &prci_clk_fu540},
> > > > > > > >>>>>         {.compatible =3D "sifive,fu740-c000-prci", .dat=
a =3D &prci_clk_fu740},
> > > > > > > >>>>>         {}
> > > > > > > >>>>> };
> > > > > > > >>>>>
> > > > > > > >>>>> So why are you moving it out to somewhere it is *not* u=
sed and making
> > > > > > > >>>>> it an extern?  This sounds like the opposite to what yo=
u'd want?
> > > > > > > >>>>
> > > > > > > >>>> The idea is that sifive-prci.c is the core and common pa=
rt of PRCI,
> > > > > > > >>>> and I'd like to separate the SoCs-dependent part into So=
Cs-dependent
> > > > > > > >>>> files, such as fu540-prci.c and fu740-prci.c. The goal i=
s if we add
> > > > > > > >>>> new SoCs in the future, we can just put the SoCs-depende=
nt data
> > > > > > > >>>> structure in the new C file, and do as minimum modificat=
ion as
> > > > > > > >>>> possible in the core file (i.e. sifive-prci.c). It might=
 also help us
> > > > > > > >>>> to see all SoCs-dependent data in one file, then we don'=
t need to
> > > > > > > >>>> cross many files. Putting these two variables in sifive-=
pric.c is the
> > > > > > > >>>> right thing to do, but that is why I separate them and m=
ake them
> > > > > > > >>>> extern in this patch.
> > > > > > > >>>
> > > > > > > >>> I can see what you are doing, but I don't think this is t=
he right
> > > > > > > >>> thing to do.  Please put the struct in the same location =
as it's
> > > > > > > >>> referenced.
> > > > > > > >>
> > > > > > > >> If we decide to move them into sifive-prci.c (i.e. put it =
in where
> > > > > > > >> it's referenced.), I worried that we might need to move al=
l stuff
> > > > > > > >> which are in fu540-prci.c and fu740-prci.c. Because 'prci_=
clk_fu540'
> > > > > > > >> is referenced in sifive-prci.c, whereas '__prci_init_clock=
s_fu540' is
> > > > > > > >> used by 'prci_clk_fu540', and the almost things in fu540-p=
rci.c are
> > > > > > > >> used by '__prci_init_clocks_fu540'. It seems to be a littl=
e bit
> > > > > > > >> difficult to clearly decouple it for modularization which =
I want to
> > > > > > > >> do. What this patch does might be a accepted way, I hope t=
hat you can
> > > > > > > >> consider it again.
> > > > > > > >>
> > > > > > > >>>
> > > > > > > >>> And yes that should also be the case for prci_clk_fu740 a=
nd yes, it
> > > > > > > >>> was over-looked because it wasn't causing warnings at bui=
ld time for
> > > > > > > >>> whatever reason.
> > > > > > > >>>
> > > > > > > >>> IMHO, placing 'struct of_device_id' match tables in heade=
rs is also
> > > > > > > >>> odd and is likely the real cause of this strange situatio=
n.
> > > > > > > >>
> > > > > > > >> I couldn't see what are you pointing, do you mind give mor=
e details
> > > > > > > >> about it? It seems to me that the match table is put in C =
file (i.e.
> > > > > > > >> sifive-prci.c).
> > > > > > > >
> > > > > > > > Oh, sorry, it's a common source file, rather than a header.
> > > > > > > >
> > > > > > > > Okay, so I went and actually looked at the code this time.
> > > > > > > >
> > > > > > > > If I were you I would move all of the device specific struc=
ts and
> > > > > > > > tables into the device specific header files, then delete t=
he device
> > > > > > > > specific source (C) files entirely.
> > > > > > > >
> > > > > > > > There seems to be no good reason for carrying a common sour=
ce file as
> > > > > > > > well as a source file AND header file for each supported de=
vice.
> > > > > > > > IMHO, that's over-complicating things for no apparent gain.
> > > > > > >
> > > > > > > The reason it exists the way it does is that the driver uses =
the header
> > > > > > > files shipped and used for the device tree bindings, and they=
 give the
> > > > > > > same names to different constants (the first three constants =
are in
> > > > > > > fact the same so don=E2=80=99t clash, but PRCI_CLK_TLCLK is d=
ifferent between
> > > > > > > the two), so can=E2=80=99t both be in the same translation un=
it (at least not
> > > > > > > without some gross #undef=E2=80=99ing). In FreeBSD I took the=
 alternate
> > > > > > > approach of just defining our own FU540_ and FU740_ namespace=
d copies
> > > > > > > of the constants, as drivers do for most things anyway.
> > > > > >
> > > > > > That's a sensible approach.
> > > > > >
> > > > > > One which we use in Linux extensively.
> > > > >
> > > > > Thanks all for the review and suggestions, it is great to me to m=
ove
> > > > > all stuff into the specific headers, I only have one question the=
re,
> > > > > is it ok to put the definition of those data structures in header
> > > > > files? That is one of the changes we had done in v2 patch. If it'=
s
> > > > > good to you, I will do it in the next version. Thanks.
> > > >
> > > > Can you give me an example please?
> > > >
> > >
> > > Yes, for the simplest example, we don't usually define 'int a =3D 1' =
in
> > > header, we might just declare 'extern int a' in header files. If I
> > > understand correctly, we are going to move all stuff in fu540-prci.c
> > > into fu540-prci.h, so there will be many definitions of variable in
> > > fu540-prci.h. These headers will be used only in one file (i.e.
> > > sifive-prci.c), it might not cause strange behavior, but I'd like to
> > > make sure if it could be accepted and ok to all you guys before I
> > > sending the next version.
> >
> > Everything in fu540-prci.c is suitable for inclusion into a header
> > file.  The data there is just made up of populated tables.
> >
>
> Thanks for your reply. I will change them in the next version.
>

Thanks all for helping me to review and give me the suggestions. I
sent another patch set to refactor the code (i.e. [PATCH 0/4] Refactor
the PRCI driver to reduce the complexity). I'd like to drop this
patch, and move on to the new patch set.

Thanks.

> > --
> > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> > Principal Technical Lead - Developer Services
> > Linaro.org =E2=94=82 Open source software for Arm SoCs
> > Follow Linaro: Facebook | Twitter | Blog
