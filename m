Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EBFC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 15 Jan 2022 06:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbiAOGUH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Jan 2022 01:20:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiAOGUH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Jan 2022 01:20:07 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97703C061574
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 22:20:06 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m3so23202852lfu.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 22:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h6LUSN6SIoc/X+q4QG8UZeos2hBvfVtvYKc2NA3kPak=;
        b=gbDzpSxDYYBBTogDUqKOKwfDEznmahokVJSqlcmh7XtqCyc6CFKqdSStBkbopaXjy9
         UHdkwH1Ml4c9UMx55T4EreJ2WLaP+9miaiBS57Fp/v4L3oLH1qlK5t1m66HJNGY7MYdD
         v7QpbQSf/+fVVVABynUhb5T/eQ/ZHqEB8kaYy0Kwg+4G2/1RRBYjpzVXkskpKKLBPixS
         ZYHTsdNYJaWNXnXI+1dpLzGHZTcSBk7gthQDkFimbSJvfnEKgmbmre34/qpqrhchBhyN
         /xwn7DVQf6IjDk5M4P25QW+3+gkeFdNFJ5KZx24l1sOUXxLctLV+r/ymOen4lYe0R0sz
         80KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h6LUSN6SIoc/X+q4QG8UZeos2hBvfVtvYKc2NA3kPak=;
        b=kZaKdj0rmmnRxNYSesmNbVRDlt+JK8SsNp63araGuEXch+FREmdjv3AXDjSWEhgYJm
         GJ1AUpdxKw1NPG4HeDyaMHxYzatRimt4xE7vHTmKcOb9d/iPb19STGf54kWOQounH0eT
         Mwu9vp+t1Pj7ZRyBHXCQKUroZFssC1wB/6vBYqa8YyxlrHk6FrfCWh9Th7378wsH5hZU
         eLOQeBWz5Xq3LALsQ+HK9E5x+7temWHbhHMqXh5g8HH41hrzc4ohzAW4bVti7udHMnjo
         w8GhO8P2QGuREC1Hs1S/w08XkVTq4sci7qqjvM8B0DeUEV39rjNJj+9GNCF50Ed7z/sD
         to2Q==
X-Gm-Message-State: AOAM530v8T/SzBpixLSEPQ7qBXcgYDqZBs5gtNmtgnceY+V8QXp/kClh
        79zvn4dPhJxFwE/1qkP1CwWHLSd2B4dzB0tjJ1GjKQ==
X-Google-Smtp-Source: ABdhPJxuOe2nRjpEXRZjc6i3T6AakqX7y0BT1Fz4mvRn4AeFMhMpUQEcpcKjpBBN65NSMAvEkPoFnwOebsT+MCh6HYg=
X-Received: by 2002:ac2:4568:: with SMTP id k8mr3466389lfm.338.1642227604693;
 Fri, 14 Jan 2022 22:20:04 -0800 (PST)
MIME-Version: 1.0
References: <Yd1OvFZ4pKw+aTgv@google.com> <CANXhq0oK-NewS9mn-b4a60D7t+fMSbT6=Mnw7st_njxGY1DJCg@mail.gmail.com>
 <Yd6a3Gnmv2ox+Sec@google.com> <CANXhq0oTyHGOUTgLk2HWpSYurUKuz5SvuaF6C5xKjn5Frswayw@mail.gmail.com>
 <YeBftQu9YgfFelmw@google.com> <F0F4C6FB-2340-4ED1-921A-800795B298E7@jrtc27.com>
 <YeBr45vcM6woAKlc@google.com> <CANXhq0r1LO1--C7DOzTT5q-1PoALq0G_-itOjcMfM0VjC_T9eg@mail.gmail.com>
 <YeFLXFGV8/qMrq8F@google.com> <CANXhq0pjz3r_Er5XhrjbjP5mLsRXb79Ezd=ufNDdDSPU5EYqUA@mail.gmail.com>
 <YeGmBoCMZxCnqIbM@google.com>
In-Reply-To: <YeGmBoCMZxCnqIbM@google.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Sat, 15 Jan 2022 14:19:53 +0800
Message-ID: <CANXhq0qgDnJg6cBW4DuL0aJ8tS_vaW+Np2T6jKdEug-CR4qxWA@mail.gmail.com>
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

On Sat, Jan 15, 2022 at 12:34 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 14 Jan 2022, Zong Li wrote:
>
> > On Fri, Jan 14, 2022 at 6:07 PM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Fri, 14 Jan 2022, Zong Li wrote:
> > >
> > > > On Fri, Jan 14, 2022 at 2:13 AM Lee Jones <lee.jones@linaro.org> wr=
ote:
> > > > >
> > > > > On Thu, 13 Jan 2022, Jessica Clarke wrote:
> > > > >
> > > > > > On 13 Jan 2022, at 17:21, Lee Jones <lee.jones@linaro.org> wrot=
e:
> > > > > > >
> > > > > > > On Thu, 13 Jan 2022, Zong Li wrote:
> > > > > > >
> > > > > > >> On Wed, Jan 12, 2022 at 5:09 PM Lee Jones <lee.jones@linaro.=
org> wrote:
> > > > > > >>>
> > > > > > >>> On Wed, 12 Jan 2022, Zong Li wrote:
> > > > > > >>>
> > > > > > >>>> On Tue, Jan 11, 2022 at 5:32 PM Lee Jones <lee.jones@linar=
o.org> wrote:
> > > > > > >>>>>
> > > > > > >>>>> On Tue, 11 Jan 2022, Zong Li wrote:
> > > > > > >>>>>
> > > > > > >>>>>> On Mon, Jan 10, 2022 at 5:50 PM Lee Jones <lee.jones@lin=
aro.org> wrote:
> > > > > > >>>>>>>
> > > > > > >>>>>>> Please improve the subject line.
> > > > > > >>>>>>>
> > > > > > >>>>>>> If this is a straight revert, the subject line should r=
eflect that.
> > > > > > >>>>>>>
> > > > > > >>>>>>> If not, you need to give us specific information regard=
ing the purpose
> > > > > > >>>>>>> of this patch.  Please read the Git log for better, mor=
e forthcoming
> > > > > > >>>>>>> examples.
> > > > > > >>>>>>>
> > > > > > >>>>>>
> > > > > > >>>>>> It seems to me that this patch is not a straight revert,=
 it provides
> > > > > > >>>>>> another way to fix the original build warnings, just lik=
e
> > > > > > >>>>>> '487dc7bb6a0c' tried to do. I guess the commit message h=
as described
> > > > > > >>>>>> what the original warnings is and what the root cause is=
, it also
> > > > > > >>>>>> mentioned what is changed in this patch. I'm a bit confu=
sed whether we
> > > > > > >>>>>> need to add fixes tag, it looks like that it might cause=
 some
> > > > > > >>>>>> misunderstanding?
> > > > > > >>>>>
> > > > > > >>>>> I think it's the patch description and subject that is ca=
using the
> > > > > > >>>>> misunderstanding.
> > > > > > >>>>>
> > > > > > >>>>
> > > > > > >>>> Yes, the subject should be made better.
> > > > > > >>>>
> > > > > > >>>>> Please help me with a couple of points and I'll help you =
draft
> > > > > > >>>>> something up.
> > > > > > >>>>>
> > > > > > >>>>> Firstly, what alerted you to the problem you're attemptin=
g to solve?
> > > > > > >>>>>
> > > > > > >>>>
> > > > > > >>>> I recently noticed the code was changed, I guess that I wa=
s missing
> > > > > > >>>> something there. After tracking the log, I found that ther=
e is a build
> > > > > > >>>> warning in the original implementation, and it was already=
 fixed, but
> > > > > > >>>> it seems to me that there are still some situations there,=
 please help
> > > > > > >>>> me to see the following illustration.
> > > > > > >>>>
> > > > > > >>>>>>>> --- a/drivers/clk/sifive/fu540-prci.c
> > > > > > >>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.c
> > > > > > >>>>>>>> @@ -20,7 +20,6 @@
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> #include <dt-bindings/clock/sifive-fu540-prci.h>
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -#include "fu540-prci.h"
> > > > > > >>>>>
> > > > > > >>>>> How is this related to the issue/patch?
> > > > > > >>>>>
> > > > > > >>>>
> > > > > > >>>> Let's go back to the version without '487dc7bb6a0c' fix. T=
he
> > > > > > >>>> prci_clk_fu540 variable is defined in sifive-fu540-prci.h =
header,
> > > > > > >>>> however, fu540-prci.c includes this header but doesn't use=
 this
> > > > > > >>>> variable, so the warnings happen.
> > > > > > >>>>
> > > > > > >>>> The easiest way to do it is just removing this line, then =
the warning
> > > > > > >>>> could be fixed. But as the '487dc7bb6a0c' or this patch do=
es, the code
> > > > > > >>>> should be improved, the prci_clk_fu540 variable shouldn't =
be defined
> > > > > > >>>> in the header, it should be moved somewhere.
> > > > > > >>>>
> > > > > > >>>>>>>> +struct prci_clk_desc prci_clk_fu540 =3D {
> > > > > > >>>>>>>> +     .clks =3D __prci_init_clocks_fu540,
> > > > > > >>>>>>>> +     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu54=
0),
> > > > > > >>>>>>>> +};
> > > > > > >>>>>
> > > > > > >>>>>>>> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers=
/clk/sifive/fu540-prci.h
> > > > > > >>>>>>>> index c220677dc010..931d6cad8c1c 100644
> > > > > > >>>>>>>> --- a/drivers/clk/sifive/fu540-prci.h
> > > > > > >>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.h
> > > > > > >>>>>>>> @@ -7,10 +7,6 @@
> > > > > > >>>>>>>> +extern struct prci_clk_desc prci_clk_fu540;
> > > > > > >>>>>
> > > > > > >>>>>>>> diff --git a/drivers/clk/sifive/sifive-prci.c b/driver=
s/clk/sifive/sifive-prci.c
> > > > > > >>>>>>>> index 80a288c59e56..916d2fc28b9c 100644
> > > > > > >>>>>>>> --- a/drivers/clk/sifive/sifive-prci.c
> > > > > > >>>>>>>> +++ b/drivers/clk/sifive/sifive-prci.c
> > > > > > >>>>>>>> @@ -12,11 +12,6 @@
> > > > > > >>>>>>>> #include "fu540-prci.h"
> > > > > > >>>>>>>> #include "fu740-prci.h"
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> -static const struct prci_clk_desc prci_clk_fu540 =3D =
{
> > > > > > >>>>>>>> -     .clks =3D __prci_init_clocks_fu540,
> > > > > > >>>>>>>> -     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu54=
0),
> > > > > > >>>>>>>> -};
> > > > > > >>>>>>>> -
> > > > > > >>>>>
> > > > > > >>>>> I'm not sure if it's you or I that is missing the point h=
ere, but
> > > > > > >>>>> prci_clk_fu540 is used within *this* file itself:
> > > > > > >>>>>
> > > > > > >>>>
> > > > > > >>>> Here is another situation I mentioned at the beginning, if=
 we'd like
> > > > > > >>>> to put prci_clk_fu540 here, prci_clk_fu740 should be put h=
ere as well.
> > > > > > >>>> I guess you didn't do that because there is a bug in the o=
riginal
> > > > > > >>>> code, fu740-prci.c misused the fu540-prci.h, so there is n=
o build
> > > > > > >>>> warning on fu740. FU740 still works correctly by misusing =
the
> > > > > > >>>> fu540-prci.h header because fu740-prci.c doesn't actually =
use the
> > > > > > >>>> prci_clk_fu740 variable, like fu540 we talked about earlie=
r.
> > > > > > >>>>
> > > > > > >>>>> static const struct of_device_id sifive_prci_of_match[] =
=3D {
> > > > > > >>>>>         {.compatible =3D "sifive,fu540-c000-prci", .data =
=3D &prci_clk_fu540},
> > > > > > >>>>>         {.compatible =3D "sifive,fu740-c000-prci", .data =
=3D &prci_clk_fu740},
> > > > > > >>>>>         {}
> > > > > > >>>>> };
> > > > > > >>>>>
> > > > > > >>>>> So why are you moving it out to somewhere it is *not* use=
d and making
> > > > > > >>>>> it an extern?  This sounds like the opposite to what you'=
d want?
> > > > > > >>>>
> > > > > > >>>> The idea is that sifive-prci.c is the core and common part=
 of PRCI,
> > > > > > >>>> and I'd like to separate the SoCs-dependent part into SoCs=
-dependent
> > > > > > >>>> files, such as fu540-prci.c and fu740-prci.c. The goal is =
if we add
> > > > > > >>>> new SoCs in the future, we can just put the SoCs-dependent=
 data
> > > > > > >>>> structure in the new C file, and do as minimum modificatio=
n as
> > > > > > >>>> possible in the core file (i.e. sifive-prci.c). It might a=
lso help us
> > > > > > >>>> to see all SoCs-dependent data in one file, then we don't =
need to
> > > > > > >>>> cross many files. Putting these two variables in sifive-pr=
ic.c is the
> > > > > > >>>> right thing to do, but that is why I separate them and mak=
e them
> > > > > > >>>> extern in this patch.
> > > > > > >>>
> > > > > > >>> I can see what you are doing, but I don't think this is the=
 right
> > > > > > >>> thing to do.  Please put the struct in the same location as=
 it's
> > > > > > >>> referenced.
> > > > > > >>
> > > > > > >> If we decide to move them into sifive-prci.c (i.e. put it in=
 where
> > > > > > >> it's referenced.), I worried that we might need to move all =
stuff
> > > > > > >> which are in fu540-prci.c and fu740-prci.c. Because 'prci_cl=
k_fu540'
> > > > > > >> is referenced in sifive-prci.c, whereas '__prci_init_clocks_=
fu540' is
> > > > > > >> used by 'prci_clk_fu540', and the almost things in fu540-prc=
i.c are
> > > > > > >> used by '__prci_init_clocks_fu540'. It seems to be a little =
bit
> > > > > > >> difficult to clearly decouple it for modularization which I =
want to
> > > > > > >> do. What this patch does might be a accepted way, I hope tha=
t you can
> > > > > > >> consider it again.
> > > > > > >>
> > > > > > >>>
> > > > > > >>> And yes that should also be the case for prci_clk_fu740 and=
 yes, it
> > > > > > >>> was over-looked because it wasn't causing warnings at build=
 time for
> > > > > > >>> whatever reason.
> > > > > > >>>
> > > > > > >>> IMHO, placing 'struct of_device_id' match tables in headers=
 is also
> > > > > > >>> odd and is likely the real cause of this strange situation.
> > > > > > >>
> > > > > > >> I couldn't see what are you pointing, do you mind give more =
details
> > > > > > >> about it? It seems to me that the match table is put in C fi=
le (i.e.
> > > > > > >> sifive-prci.c).
> > > > > > >
> > > > > > > Oh, sorry, it's a common source file, rather than a header.
> > > > > > >
> > > > > > > Okay, so I went and actually looked at the code this time.
> > > > > > >
> > > > > > > If I were you I would move all of the device specific structs=
 and
> > > > > > > tables into the device specific header files, then delete the=
 device
> > > > > > > specific source (C) files entirely.
> > > > > > >
> > > > > > > There seems to be no good reason for carrying a common source=
 file as
> > > > > > > well as a source file AND header file for each supported devi=
ce.
> > > > > > > IMHO, that's over-complicating things for no apparent gain.
> > > > > >
> > > > > > The reason it exists the way it does is that the driver uses th=
e header
> > > > > > files shipped and used for the device tree bindings, and they g=
ive the
> > > > > > same names to different constants (the first three constants ar=
e in
> > > > > > fact the same so don=E2=80=99t clash, but PRCI_CLK_TLCLK is dif=
ferent between
> > > > > > the two), so can=E2=80=99t both be in the same translation unit=
 (at least not
> > > > > > without some gross #undef=E2=80=99ing). In FreeBSD I took the a=
lternate
> > > > > > approach of just defining our own FU540_ and FU740_ namespaced =
copies
> > > > > > of the constants, as drivers do for most things anyway.
> > > > >
> > > > > That's a sensible approach.
> > > > >
> > > > > One which we use in Linux extensively.
> > > >
> > > > Thanks all for the review and suggestions, it is great to me to mov=
e
> > > > all stuff into the specific headers, I only have one question there=
,
> > > > is it ok to put the definition of those data structures in header
> > > > files? That is one of the changes we had done in v2 patch. If it's
> > > > good to you, I will do it in the next version. Thanks.
> > >
> > > Can you give me an example please?
> > >
> >
> > Yes, for the simplest example, we don't usually define 'int a =3D 1' in
> > header, we might just declare 'extern int a' in header files. If I
> > understand correctly, we are going to move all stuff in fu540-prci.c
> > into fu540-prci.h, so there will be many definitions of variable in
> > fu540-prci.h. These headers will be used only in one file (i.e.
> > sifive-prci.c), it might not cause strange behavior, but I'd like to
> > make sure if it could be accepted and ok to all you guys before I
> > sending the next version.
>
> Everything in fu540-prci.c is suitable for inclusion into a header
> file.  The data there is just made up of populated tables.
>

Thanks for your reply. I will change them in the next version.

> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
