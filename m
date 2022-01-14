Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1962C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jan 2022 10:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbiANKHa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jan 2022 05:07:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbiANKHa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jan 2022 05:07:30 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3119C061574
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 02:07:28 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r28so14758019wrc.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 02:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qa1ZFJxXVaWSMdK9qta4KUmxKIA22s0o1tyr1E9K88I=;
        b=mM4V3t9ISW0R3snunwTtWIT9JiDQR65VewEW5K8JyCjUkHvwfMj4wDeuJQ6OLHPKFd
         G54ImNt11skgd3VkT67yZmJhke8pLaZGTq0vEog5fKY6T4AI5ahtnIAJv8UaTiAynUZ/
         KZAL9lr0RJ6J16AJ/KdJC2nTLXWhQCLOJpUrGW6CoIHaifvVBMA92IMtYuV5IPa59XY2
         iihf2kCu5RvxiM5Fb0Ne7QflNUU9Eb+wR7oHeHPqeMiRoMGOVJmt4lzqQMsw1XIq7Z1V
         C8fqGbQRY2ZpBE0kJU3nd7xXDl4LwcymLIGNSWHfmzSMwUc6HwmxlMAmnSwqtwS/HoFL
         6nEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qa1ZFJxXVaWSMdK9qta4KUmxKIA22s0o1tyr1E9K88I=;
        b=U1BeNVe3tJh60pe9Jv5bBMIJld+x4tPVlcgICULF254xUpAVwCrwoa9qFPUJSmLEgG
         BhsxlPbhYu1Nbvn0JflO+mO/NzkaIiVpJ1c+YOBWR0rZpAK1VuMr//esnV62Dox4r92E
         5dr/tCwF/jg3UITZJg9bR1q5vhi083K3yiCjiO93rQeOuh+ubv0uD/vDNvTjfbE1kYWj
         ji1QbAFK8aWXtgx0XgCaXCj1avzBaXTzF52COEFfjEYG1mY5Nr7zY/NARRBC8pNbfEQn
         z4ODwVTUNVy+Po0IpZjVS7SsTc33pmESh2sKN+PZRvNh2ITvVHxpwsmwu3nShNI7+JGD
         HKQA==
X-Gm-Message-State: AOAM530tKHoDiV1OCBStaaEda4oHuY2+zqu3h/V5Ef1LpO5LX6IIg/t0
        XJoE52MwZIluztZuGipSJGiqCw==
X-Google-Smtp-Source: ABdhPJyy+WM+eMpHl3/0RVc3mCN2wkv6zJ333W4w1y7Fe4RBc/8LCZAxCSj1owJ2KqMih39cghq5tQ==
X-Received: by 2002:a5d:64e8:: with SMTP id g8mr4507982wri.286.1642154846918;
        Fri, 14 Jan 2022 02:07:26 -0800 (PST)
Received: from google.com ([31.124.24.179])
        by smtp.gmail.com with ESMTPSA id k10sm4962281wrz.113.2022.01.14.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 02:07:26 -0800 (PST)
Date:   Fri, 14 Jan 2022 10:07:24 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Zong Li <zong.li@sifive.com>
Cc:     Jessica Clarke <jrtc27@jrtc27.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
Message-ID: <YeFLXFGV8/qMrq8F@google.com>
References: <YdwBWmF8OJYab7qS@google.com>
 <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com>
 <Yd1OvFZ4pKw+aTgv@google.com>
 <CANXhq0oK-NewS9mn-b4a60D7t+fMSbT6=Mnw7st_njxGY1DJCg@mail.gmail.com>
 <Yd6a3Gnmv2ox+Sec@google.com>
 <CANXhq0oTyHGOUTgLk2HWpSYurUKuz5SvuaF6C5xKjn5Frswayw@mail.gmail.com>
 <YeBftQu9YgfFelmw@google.com>
 <F0F4C6FB-2340-4ED1-921A-800795B298E7@jrtc27.com>
 <YeBr45vcM6woAKlc@google.com>
 <CANXhq0r1LO1--C7DOzTT5q-1PoALq0G_-itOjcMfM0VjC_T9eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANXhq0r1LO1--C7DOzTT5q-1PoALq0G_-itOjcMfM0VjC_T9eg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 14 Jan 2022, Zong Li wrote:

> On Fri, Jan 14, 2022 at 2:13 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Thu, 13 Jan 2022, Jessica Clarke wrote:
> >
> > > On 13 Jan 2022, at 17:21, Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > > On Thu, 13 Jan 2022, Zong Li wrote:
> > > >
> > > >> On Wed, Jan 12, 2022 at 5:09 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > >>>
> > > >>> On Wed, 12 Jan 2022, Zong Li wrote:
> > > >>>
> > > >>>> On Tue, Jan 11, 2022 at 5:32 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > >>>>>
> > > >>>>> On Tue, 11 Jan 2022, Zong Li wrote:
> > > >>>>>
> > > >>>>>> On Mon, Jan 10, 2022 at 5:50 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > >>>>>>>
> > > >>>>>>> Please improve the subject line.
> > > >>>>>>>
> > > >>>>>>> If this is a straight revert, the subject line should reflect that.
> > > >>>>>>>
> > > >>>>>>> If not, you need to give us specific information regarding the purpose
> > > >>>>>>> of this patch.  Please read the Git log for better, more forthcoming
> > > >>>>>>> examples.
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> It seems to me that this patch is not a straight revert, it provides
> > > >>>>>> another way to fix the original build warnings, just like
> > > >>>>>> '487dc7bb6a0c' tried to do. I guess the commit message has described
> > > >>>>>> what the original warnings is and what the root cause is, it also
> > > >>>>>> mentioned what is changed in this patch. I'm a bit confused whether we
> > > >>>>>> need to add fixes tag, it looks like that it might cause some
> > > >>>>>> misunderstanding?
> > > >>>>>
> > > >>>>> I think it's the patch description and subject that is causing the
> > > >>>>> misunderstanding.
> > > >>>>>
> > > >>>>
> > > >>>> Yes, the subject should be made better.
> > > >>>>
> > > >>>>> Please help me with a couple of points and I'll help you draft
> > > >>>>> something up.
> > > >>>>>
> > > >>>>> Firstly, what alerted you to the problem you're attempting to solve?
> > > >>>>>
> > > >>>>
> > > >>>> I recently noticed the code was changed, I guess that I was missing
> > > >>>> something there. After tracking the log, I found that there is a build
> > > >>>> warning in the original implementation, and it was already fixed, but
> > > >>>> it seems to me that there are still some situations there, please help
> > > >>>> me to see the following illustration.
> > > >>>>
> > > >>>>>>>> --- a/drivers/clk/sifive/fu540-prci.c
> > > >>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.c
> > > >>>>>>>> @@ -20,7 +20,6 @@
> > > >>>>>>>>
> > > >>>>>>>> #include <dt-bindings/clock/sifive-fu540-prci.h>
> > > >>>>>>>>
> > > >>>>>>>> -#include "fu540-prci.h"
> > > >>>>>
> > > >>>>> How is this related to the issue/patch?
> > > >>>>>
> > > >>>>
> > > >>>> Let's go back to the version without '487dc7bb6a0c' fix. The
> > > >>>> prci_clk_fu540 variable is defined in sifive-fu540-prci.h header,
> > > >>>> however, fu540-prci.c includes this header but doesn't use this
> > > >>>> variable, so the warnings happen.
> > > >>>>
> > > >>>> The easiest way to do it is just removing this line, then the warning
> > > >>>> could be fixed. But as the '487dc7bb6a0c' or this patch does, the code
> > > >>>> should be improved, the prci_clk_fu540 variable shouldn't be defined
> > > >>>> in the header, it should be moved somewhere.
> > > >>>>
> > > >>>>>>>> +struct prci_clk_desc prci_clk_fu540 = {
> > > >>>>>>>> +     .clks = __prci_init_clocks_fu540,
> > > >>>>>>>> +     .num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> > > >>>>>>>> +};
> > > >>>>>
> > > >>>>>>>> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> > > >>>>>>>> index c220677dc010..931d6cad8c1c 100644
> > > >>>>>>>> --- a/drivers/clk/sifive/fu540-prci.h
> > > >>>>>>>> +++ b/drivers/clk/sifive/fu540-prci.h
> > > >>>>>>>> @@ -7,10 +7,6 @@
> > > >>>>>>>> +extern struct prci_clk_desc prci_clk_fu540;
> > > >>>>>
> > > >>>>>>>> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> > > >>>>>>>> index 80a288c59e56..916d2fc28b9c 100644
> > > >>>>>>>> --- a/drivers/clk/sifive/sifive-prci.c
> > > >>>>>>>> +++ b/drivers/clk/sifive/sifive-prci.c
> > > >>>>>>>> @@ -12,11 +12,6 @@
> > > >>>>>>>> #include "fu540-prci.h"
> > > >>>>>>>> #include "fu740-prci.h"
> > > >>>>>>>>
> > > >>>>>>>> -static const struct prci_clk_desc prci_clk_fu540 = {
> > > >>>>>>>> -     .clks = __prci_init_clocks_fu540,
> > > >>>>>>>> -     .num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> > > >>>>>>>> -};
> > > >>>>>>>> -
> > > >>>>>
> > > >>>>> I'm not sure if it's you or I that is missing the point here, but
> > > >>>>> prci_clk_fu540 is used within *this* file itself:
> > > >>>>>
> > > >>>>
> > > >>>> Here is another situation I mentioned at the beginning, if we'd like
> > > >>>> to put prci_clk_fu540 here, prci_clk_fu740 should be put here as well.
> > > >>>> I guess you didn't do that because there is a bug in the original
> > > >>>> code, fu740-prci.c misused the fu540-prci.h, so there is no build
> > > >>>> warning on fu740. FU740 still works correctly by misusing the
> > > >>>> fu540-prci.h header because fu740-prci.c doesn't actually use the
> > > >>>> prci_clk_fu740 variable, like fu540 we talked about earlier.
> > > >>>>
> > > >>>>> static const struct of_device_id sifive_prci_of_match[] = {
> > > >>>>>         {.compatible = "sifive,fu540-c000-prci", .data = &prci_clk_fu540},
> > > >>>>>         {.compatible = "sifive,fu740-c000-prci", .data = &prci_clk_fu740},
> > > >>>>>         {}
> > > >>>>> };
> > > >>>>>
> > > >>>>> So why are you moving it out to somewhere it is *not* used and making
> > > >>>>> it an extern?  This sounds like the opposite to what you'd want?
> > > >>>>
> > > >>>> The idea is that sifive-prci.c is the core and common part of PRCI,
> > > >>>> and I'd like to separate the SoCs-dependent part into SoCs-dependent
> > > >>>> files, such as fu540-prci.c and fu740-prci.c. The goal is if we add
> > > >>>> new SoCs in the future, we can just put the SoCs-dependent data
> > > >>>> structure in the new C file, and do as minimum modification as
> > > >>>> possible in the core file (i.e. sifive-prci.c). It might also help us
> > > >>>> to see all SoCs-dependent data in one file, then we don't need to
> > > >>>> cross many files. Putting these two variables in sifive-pric.c is the
> > > >>>> right thing to do, but that is why I separate them and make them
> > > >>>> extern in this patch.
> > > >>>
> > > >>> I can see what you are doing, but I don't think this is the right
> > > >>> thing to do.  Please put the struct in the same location as it's
> > > >>> referenced.
> > > >>
> > > >> If we decide to move them into sifive-prci.c (i.e. put it in where
> > > >> it's referenced.), I worried that we might need to move all stuff
> > > >> which are in fu540-prci.c and fu740-prci.c. Because 'prci_clk_fu540'
> > > >> is referenced in sifive-prci.c, whereas '__prci_init_clocks_fu540' is
> > > >> used by 'prci_clk_fu540', and the almost things in fu540-prci.c are
> > > >> used by '__prci_init_clocks_fu540'. It seems to be a little bit
> > > >> difficult to clearly decouple it for modularization which I want to
> > > >> do. What this patch does might be a accepted way, I hope that you can
> > > >> consider it again.
> > > >>
> > > >>>
> > > >>> And yes that should also be the case for prci_clk_fu740 and yes, it
> > > >>> was over-looked because it wasn't causing warnings at build time for
> > > >>> whatever reason.
> > > >>>
> > > >>> IMHO, placing 'struct of_device_id' match tables in headers is also
> > > >>> odd and is likely the real cause of this strange situation.
> > > >>
> > > >> I couldn't see what are you pointing, do you mind give more details
> > > >> about it? It seems to me that the match table is put in C file (i.e.
> > > >> sifive-prci.c).
> > > >
> > > > Oh, sorry, it's a common source file, rather than a header.
> > > >
> > > > Okay, so I went and actually looked at the code this time.
> > > >
> > > > If I were you I would move all of the device specific structs and
> > > > tables into the device specific header files, then delete the device
> > > > specific source (C) files entirely.
> > > >
> > > > There seems to be no good reason for carrying a common source file as
> > > > well as a source file AND header file for each supported device.
> > > > IMHO, that's over-complicating things for no apparent gain.
> > >
> > > The reason it exists the way it does is that the driver uses the header
> > > files shipped and used for the device tree bindings, and they give the
> > > same names to different constants (the first three constants are in
> > > fact the same so don’t clash, but PRCI_CLK_TLCLK is different between
> > > the two), so can’t both be in the same translation unit (at least not
> > > without some gross #undef’ing). In FreeBSD I took the alternate
> > > approach of just defining our own FU540_ and FU740_ namespaced copies
> > > of the constants, as drivers do for most things anyway.
> >
> > That's a sensible approach.
> >
> > One which we use in Linux extensively.
> 
> Thanks all for the review and suggestions, it is great to me to move
> all stuff into the specific headers, I only have one question there,
> is it ok to put the definition of those data structures in header
> files? That is one of the changes we had done in v2 patch. If it's
> good to you, I will do it in the next version. Thanks.

Can you give me an example please?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
