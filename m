Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4843BC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 17:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiAMRve (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 12:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiAMRve (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 12:51:34 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF7EC061574
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 09:51:34 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id q9-20020a7bce89000000b00349e697f2fbso5290595wmj.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 09:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=KH7006drSV6Dd62aF3llZFCm9RhWWdYpRkYKufcPRwU=;
        b=iOktNwJQAN3q3/m52vYesB8g8VY1PapndpnD3iG0ih7jXmLjG4P9yVeFm8c+cDRLpc
         0e+wwtM18DX2rbqlOxKhxqyIAbTFY02/6kS+XsEscGnD+EL91uQwHptw8ybxnGsfyEmy
         RAiDqcuZyW0zXwvDrNOIN6qSM3RVik3OBXK1wyX7oG57M7+w1wRIit5785gB1Un64/tF
         N4g2Fec3TmPnlGuHQwEhWys+GsCMZzw1cH5lAunhkG50nGdvKBMh/jIqC6g+v6l2nIEi
         7PIuTf8KHgrpzrSB6eA50v57WrIQKkxSXfELgdHz2HrEK1zFuJHO20ALHgoRUZ4IIJNr
         Zx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=KH7006drSV6Dd62aF3llZFCm9RhWWdYpRkYKufcPRwU=;
        b=OAVw4+sqlEbMze6eUQccxdB4MxOST/Vl4vLXhOwY92JFLiYjxFpLaRORVcmTRDfOTe
         ZgzUfBTEpPPtpUAieIhIDSAWj6XGdMy3oPl5jDpjiGZ6dTNJFfpeqo6Slikhw/Lspp5j
         qpgMR9vc4zilc3DSgimnz5EWyLIimItJcWg6LNb8M0g/pfnFSZHODggqA7KHQkYZduhX
         XbVL1pbarjjr71cFKNQm3w3SWOk2O65uWC0K2xywyvs/czyoOn2hE+jKkNN0QS9nVR2G
         WiIYFL33MjhaN1uXc7TCMc67Le856rGI3IzIkrdKpUWsYIpC8Evco9tzt549J5eQsOgs
         gkfw==
X-Gm-Message-State: AOAM530vmDVl1IPtAOXqFNMfOkXZ+9Nu2Eu57zzVm9exgdIMV+2CfPmI
        CiErMUFEl9DRwAeZeJgDOhvu7Q==
X-Google-Smtp-Source: ABdhPJymT5wKe8VfSuU4sf4OV17l5qYkq6dOAL1Sl1egp4/Ms7NPg0N0g6uOrs4FnneCY43o64+k6g==
X-Received: by 2002:a1c:a78c:: with SMTP id q134mr4748735wme.103.1642096292564;
        Thu, 13 Jan 2022 09:51:32 -0800 (PST)
Received: from smtpclient.apple (global-5-142.nat-2.net.cam.ac.uk. [131.111.5.142])
        by smtp.gmail.com with ESMTPSA id o11sm8707330wmq.15.2022.01.13.09.51.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jan 2022 09:51:31 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <YeBftQu9YgfFelmw@google.com>
Date:   Thu, 13 Jan 2022 17:51:31 +0000
Cc:     Zong Li <zong.li@sifive.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0F4C6FB-2340-4ED1-921A-800795B298E7@jrtc27.com>
References: <20220107090715.2601-1-zong.li@sifive.com>
 <YdwBWmF8OJYab7qS@google.com>
 <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com>
 <Yd1OvFZ4pKw+aTgv@google.com>
 <CANXhq0oK-NewS9mn-b4a60D7t+fMSbT6=Mnw7st_njxGY1DJCg@mail.gmail.com>
 <Yd6a3Gnmv2ox+Sec@google.com>
 <CANXhq0oTyHGOUTgLk2HWpSYurUKuz5SvuaF6C5xKjn5Frswayw@mail.gmail.com>
 <YeBftQu9YgfFelmw@google.com>
To:     Lee Jones <lee.jones@linaro.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13 Jan 2022, at 17:21, Lee Jones <lee.jones@linaro.org> wrote:
>=20
> On Thu, 13 Jan 2022, Zong Li wrote:
>=20
>> On Wed, Jan 12, 2022 at 5:09 PM Lee Jones <lee.jones@linaro.org> =
wrote:
>>>=20
>>> On Wed, 12 Jan 2022, Zong Li wrote:
>>>=20
>>>> On Tue, Jan 11, 2022 at 5:32 PM Lee Jones <lee.jones@linaro.org> =
wrote:
>>>>>=20
>>>>> On Tue, 11 Jan 2022, Zong Li wrote:
>>>>>=20
>>>>>> On Mon, Jan 10, 2022 at 5:50 PM Lee Jones <lee.jones@linaro.org> =
wrote:
>>>>>>>=20
>>>>>>> Please improve the subject line.
>>>>>>>=20
>>>>>>> If this is a straight revert, the subject line should reflect =
that.
>>>>>>>=20
>>>>>>> If not, you need to give us specific information regarding the =
purpose
>>>>>>> of this patch.  Please read the Git log for better, more =
forthcoming
>>>>>>> examples.
>>>>>>>=20
>>>>>>=20
>>>>>> It seems to me that this patch is not a straight revert, it =
provides
>>>>>> another way to fix the original build warnings, just like
>>>>>> '487dc7bb6a0c' tried to do. I guess the commit message has =
described
>>>>>> what the original warnings is and what the root cause is, it also
>>>>>> mentioned what is changed in this patch. I'm a bit confused =
whether we
>>>>>> need to add fixes tag, it looks like that it might cause some
>>>>>> misunderstanding?
>>>>>=20
>>>>> I think it's the patch description and subject that is causing the
>>>>> misunderstanding.
>>>>>=20
>>>>=20
>>>> Yes, the subject should be made better.
>>>>=20
>>>>> Please help me with a couple of points and I'll help you draft
>>>>> something up.
>>>>>=20
>>>>> Firstly, what alerted you to the problem you're attempting to =
solve?
>>>>>=20
>>>>=20
>>>> I recently noticed the code was changed, I guess that I was missing
>>>> something there. After tracking the log, I found that there is a =
build
>>>> warning in the original implementation, and it was already fixed, =
but
>>>> it seems to me that there are still some situations there, please =
help
>>>> me to see the following illustration.
>>>>=20
>>>>>>>> --- a/drivers/clk/sifive/fu540-prci.c
>>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.c
>>>>>>>> @@ -20,7 +20,6 @@
>>>>>>>>=20
>>>>>>>> #include <dt-bindings/clock/sifive-fu540-prci.h>
>>>>>>>>=20
>>>>>>>> -#include "fu540-prci.h"
>>>>>=20
>>>>> How is this related to the issue/patch?
>>>>>=20
>>>>=20
>>>> Let's go back to the version without '487dc7bb6a0c' fix. The
>>>> prci_clk_fu540 variable is defined in sifive-fu540-prci.h header,
>>>> however, fu540-prci.c includes this header but doesn't use this
>>>> variable, so the warnings happen.
>>>>=20
>>>> The easiest way to do it is just removing this line, then the =
warning
>>>> could be fixed. But as the '487dc7bb6a0c' or this patch does, the =
code
>>>> should be improved, the prci_clk_fu540 variable shouldn't be =
defined
>>>> in the header, it should be moved somewhere.
>>>>=20
>>>>>>>> +struct prci_clk_desc prci_clk_fu540 =3D {
>>>>>>>> +     .clks =3D __prci_init_clocks_fu540,
>>>>>>>> +     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
>>>>>>>> +};
>>>>>=20
>>>>>>>> diff --git a/drivers/clk/sifive/fu540-prci.h =
b/drivers/clk/sifive/fu540-prci.h
>>>>>>>> index c220677dc010..931d6cad8c1c 100644
>>>>>>>> --- a/drivers/clk/sifive/fu540-prci.h
>>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.h
>>>>>>>> @@ -7,10 +7,6 @@
>>>>>>>> +extern struct prci_clk_desc prci_clk_fu540;
>>>>>=20
>>>>>>>> diff --git a/drivers/clk/sifive/sifive-prci.c =
b/drivers/clk/sifive/sifive-prci.c
>>>>>>>> index 80a288c59e56..916d2fc28b9c 100644
>>>>>>>> --- a/drivers/clk/sifive/sifive-prci.c
>>>>>>>> +++ b/drivers/clk/sifive/sifive-prci.c
>>>>>>>> @@ -12,11 +12,6 @@
>>>>>>>> #include "fu540-prci.h"
>>>>>>>> #include "fu740-prci.h"
>>>>>>>>=20
>>>>>>>> -static const struct prci_clk_desc prci_clk_fu540 =3D {
>>>>>>>> -     .clks =3D __prci_init_clocks_fu540,
>>>>>>>> -     .num_clks =3D ARRAY_SIZE(__prci_init_clocks_fu540),
>>>>>>>> -};
>>>>>>>> -
>>>>>=20
>>>>> I'm not sure if it's you or I that is missing the point here, but
>>>>> prci_clk_fu540 is used within *this* file itself:
>>>>>=20
>>>>=20
>>>> Here is another situation I mentioned at the beginning, if we'd =
like
>>>> to put prci_clk_fu540 here, prci_clk_fu740 should be put here as =
well.
>>>> I guess you didn't do that because there is a bug in the original
>>>> code, fu740-prci.c misused the fu540-prci.h, so there is no build
>>>> warning on fu740. FU740 still works correctly by misusing the
>>>> fu540-prci.h header because fu740-prci.c doesn't actually use the
>>>> prci_clk_fu740 variable, like fu540 we talked about earlier.
>>>>=20
>>>>> static const struct of_device_id sifive_prci_of_match[] =3D {
>>>>>         {.compatible =3D "sifive,fu540-c000-prci", .data =3D =
&prci_clk_fu540},
>>>>>         {.compatible =3D "sifive,fu740-c000-prci", .data =3D =
&prci_clk_fu740},
>>>>>         {}
>>>>> };
>>>>>=20
>>>>> So why are you moving it out to somewhere it is *not* used and =
making
>>>>> it an extern?  This sounds like the opposite to what you'd want?
>>>>=20
>>>> The idea is that sifive-prci.c is the core and common part of PRCI,
>>>> and I'd like to separate the SoCs-dependent part into =
SoCs-dependent
>>>> files, such as fu540-prci.c and fu740-prci.c. The goal is if we add
>>>> new SoCs in the future, we can just put the SoCs-dependent data
>>>> structure in the new C file, and do as minimum modification as
>>>> possible in the core file (i.e. sifive-prci.c). It might also help =
us
>>>> to see all SoCs-dependent data in one file, then we don't need to
>>>> cross many files. Putting these two variables in sifive-pric.c is =
the
>>>> right thing to do, but that is why I separate them and make them
>>>> extern in this patch.
>>>=20
>>> I can see what you are doing, but I don't think this is the right
>>> thing to do.  Please put the struct in the same location as it's
>>> referenced.
>>=20
>> If we decide to move them into sifive-prci.c (i.e. put it in where
>> it's referenced.), I worried that we might need to move all stuff
>> which are in fu540-prci.c and fu740-prci.c. Because 'prci_clk_fu540'
>> is referenced in sifive-prci.c, whereas '__prci_init_clocks_fu540' is
>> used by 'prci_clk_fu540', and the almost things in fu540-prci.c are
>> used by '__prci_init_clocks_fu540'. It seems to be a little bit
>> difficult to clearly decouple it for modularization which I want to
>> do. What this patch does might be a accepted way, I hope that you can
>> consider it again.
>>=20
>>>=20
>>> And yes that should also be the case for prci_clk_fu740 and yes, it
>>> was over-looked because it wasn't causing warnings at build time for
>>> whatever reason.
>>>=20
>>> IMHO, placing 'struct of_device_id' match tables in headers is also
>>> odd and is likely the real cause of this strange situation.
>>=20
>> I couldn't see what are you pointing, do you mind give more details
>> about it? It seems to me that the match table is put in C file (i.e.
>> sifive-prci.c).
>=20
> Oh, sorry, it's a common source file, rather than a header.
>=20
> Okay, so I went and actually looked at the code this time.
>=20
> If I were you I would move all of the device specific structs and
> tables into the device specific header files, then delete the device
> specific source (C) files entirely.
>=20
> There seems to be no good reason for carrying a common source file as
> well as a source file AND header file for each supported device.
> IMHO, that's over-complicating things for no apparent gain.

The reason it exists the way it does is that the driver uses the header
files shipped and used for the device tree bindings, and they give the
same names to different constants (the first three constants are in
fact the same so don=E2=80=99t clash, but PRCI_CLK_TLCLK is different =
between
the two), so can=E2=80=99t both be in the same translation unit (at =
least not
without some gross #undef=E2=80=99ing). In FreeBSD I took the alternate
approach of just defining our own FU540_ and FU740_ namespaced copies
of the constants, as drivers do for most things anyway.

Jess

