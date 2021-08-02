Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC39DC4338F
	for <linux-clk@archiver.kernel.org>; Mon,  2 Aug 2021 23:27:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8614A60E78
	for <linux-clk@archiver.kernel.org>; Mon,  2 Aug 2021 23:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbhHBX2H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Aug 2021 19:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhHBX2H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Aug 2021 19:28:07 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24C8C06175F
        for <linux-clk@vger.kernel.org>; Mon,  2 Aug 2021 16:27:56 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id j10so10454891vsl.10
        for <linux-clk@vger.kernel.org>; Mon, 02 Aug 2021 16:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QlzAmryyyeDSDQ1srUNZEgdUE1Lb18Ti4rrmaegWVkw=;
        b=Ajmr1ho9O5wL+Ew02Av/bUFYn8XmF5TlaNe9PnsD4qjKZxYPBh8Ge6NcYutRfxIzUc
         JzKbAgn+JG95Zms5Z5w0a2ZuyOjUQWCuyc9IxcYp61b9ECvW9FXLrqERM7GgSVg8cNHW
         zOJHKvgJHXFIZAc7W7wvYHcGLp3zh5CaIo49Ttue+NXQGnSzoEWNn5lQSeOtryypEVU7
         B/RKTe48HxHJspuGTebmsxIS1Wg/+LaA22N5jp/iqCGfOvsWgWY2BRLf/F33Bivk3UBt
         2+f/FYN/8cvKYlCMFXDkVTvCA/ocfTaDlhP7x+uxHc+w6C7WVl0L13Zk6bdrEHKgsX4C
         gC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QlzAmryyyeDSDQ1srUNZEgdUE1Lb18Ti4rrmaegWVkw=;
        b=Wnr+0m0eK/zMQW9qw3WTdZOF09y/xGZoYltBBumH9Gps+HxOW1oKiGuF5uSj9a2F6H
         zkPG39ZE3oZK7QWiECsAQ6dQj6m4bvLN2FRwwmMmW9R3UdOOtu/u4RVOCchqyZln11ah
         fP/BewYMaPItEYXZdCgbs3Gv2GTyl08HA1lpTrFcwjm3Vxtb0I84OuwwFZWuzkRfWayO
         lm72rgJ3kTTg/ecDB8uZEdu9WL/Hk39SxGZWm+XUxKVjufXikZrwlk7ADOl4gSAVtD3x
         HwTrgbOegiDC8zW+ULUKO3BmfX55fLu6cfSeo4YGTX7Vj0gtRI7MK5og8eHXPpYr3rsf
         seTA==
X-Gm-Message-State: AOAM530cGeIK8q+leHqBe6scCd+OqKw0RoCuMAX30VwRHWk9YWCtFEC8
        82gIbp565aPqdTliGBzNk6jjCUWhSNgBP3Gf6IZqkw==
X-Google-Smtp-Source: ABdhPJzJ3U5wtXY2YCtx/k4DqUJTlrgpZ48cDKUw9DVG41O8Yu+2eqmJVsghdHYCgAijN2Q95YtCA/yFaRSlHV3vfbA=
X-Received: by 2002:a67:f60e:: with SMTP id k14mr12216795vso.30.1627946875840;
 Mon, 02 Aug 2021 16:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com> <c3486111-0ec9-9679-d2a2-68b2f33a2450@canonical.com>
 <CAPLW+4kbnJEBkc0D=RWt59JxBan8X1uDy6sSXBiYAq8N9FDV6A@mail.gmail.com>
 <13f166bb-7103-25d5-35a6-8ec53a1f1817@canonical.com> <2dacc205-04ce-c206-a393-50ba0d5aa1a7@canonical.com>
In-Reply-To: <2dacc205-04ce-c206-a393-50ba0d5aa1a7@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 3 Aug 2021 02:27:44 +0300
Message-ID: <CAPLW+4=1Anr6rCWEBL04D81aEAEVKD5cGE+ObXH3q-HNHce07w@mail.gmail.com>
Subject: Re: [PATCH 00/12] Add minimal support for Exynos850 SoC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 31 Jul 2021 at 11:12, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 31/07/2021 09:29, Krzysztof Kozlowski wrote:
> > On 30/07/2021 21:02, Sam Protsenko wrote:
> >> Hi Krzysztof,
> >>
> >> On Fri, 30 Jul 2021 at 20:21, Krzysztof Kozlowski
> >> <krzysztof.kozlowski@canonical.com> wrote:
> >>>
> >>> On 30/07/2021 17:18, Krzysztof Kozlowski wrote:
> >>>> On 30/07/2021 16:49, Sam Protsenko wrote:
> >>>>> This patch series adds initial platform support for Samsung Exynos850
> >>>>> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
> >>>>> rootfs as a RAM disk. More advanced platform support (like MMC driver
> >>>>> additions) will be added later. The idea is to keep the first submission
> >>>>> minimal to ease the review, and then build up on top of that.
> >>>>>
> >>>>> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
> >>>>>
> >>>>
> >>>> Great work!
> >>>>
> >>
> >> Thanks, Krzysztof! And thank you for reviewing the whole series.
> >>
> >>>> What's the SoC revision number (should be accessible via
> >>>> /sys/bus/soc/devices/soc0/)? Recent wrap in numbering of Exynos chips
> >>>> might bring confusion...
> >>
> >> # cat /sys/devices/soc0/revision
> >> 0
> >
> > soc_id but you're right it won't be set for unknown SoCs. You need to
> > extend drivers/soc/samsung/exynos-chipid.c to parse new values (E3830000
> > for product ID) and maybe new register offsets (previous offset is 0x0,
> > for 3830 is 0x10 I think). Also revision mask might change.
> >
> >>> Judging by vendor's sources it is quite confusing. It looks mostly like
> >>> Exynos3830 but in few other cases it uses Exynos9 compatibles (Exynos9,
> >>> Exynos9820). Only in few places there is Exynos850. Marketing department
> >>> made it so confusing...  The revision embedded in SoC would be very
> >>> interesting.
> >>>
> >>
> >> As I understand, this SoC is called Exynos850 everywhere now.
> >> Exynos3830 is its old name, not used anymore. As you noticed from
> >> patch #2, it shares some definitions with Exynos9 SoC, so I guess some
> >> software is similar for both architectures. Not sure about hardware
> >> though, never worked with Exynos9 CPUs. Anyway, I asked Samsung
> >> representatives about naming, and it seems like we should stick to
> >> "Exynos850" name, even in code.
> >
> >
> > Since the chip identifies itself as E3830000, I would prefer naming
> > matching real product ID instead of what is pushed by marketing or sales
> > representatives. The marketing names don't have to follow any
> > engineering rules, they can be changed and renamed. Sales follows rather
> > money and corporate rules, not consistency for upstream project.
>
> On the other hand we have already two exceptions for naming
> inconsistency - Exynos3250 identifies itself as 3472 (which is confusing
> because 3250 is two core and there is a separate quad-core
> Exyons3472...) and Exynos5800 is actually marketing name for a revision
> of Exynos5422. Maybe indeed will be easier to go with the branded name
> 850...
>

Well, chip engraving says "3830", but I was specifically told to stick
to "850" in upstream kernel. I can presume there was some mix ups with
this naming, and it might be the case it's better to stick to "850"
exactly to avoid further confusion. Yes, I can see that
EXYNOS3830_SOC_ID = 0xE3830000 in chipid driver, but we can return
"EXYNOS850" string for that const, right? If you google "Exynos850"
and "Exynos3830", it's obvious everybody uses the former, so I'd
appreciate if we can stick to "850" in the end.

>
> Best regards,
> Krzysztof
