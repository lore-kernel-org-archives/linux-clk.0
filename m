Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3246BC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 19:46:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 167DD60E96
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 19:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhJNTsu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Oct 2021 15:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhJNTsu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Oct 2021 15:48:50 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E451DC061753
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 12:46:44 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g10so28728471edj.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LIsEKXGFSNqQILX0QaJSH8NtoAJ3+z1bPLQqixvplHo=;
        b=hNxW5hC2idI1Jg8+e26evIeA5PeqpxeKwsKwB+H30h8vvhunj1NqfCIkEBTEPWiIW6
         t24A1obCettCyty86kX4WHyoEnfLRxjsSfL2F/OKRbHMF511op01Xx1H62emuzBVoBn9
         9wCjlWfo0NQPwekkaNaUqxT/dzQt9N00eV/U3OIUTbnWXUuDKZoMBxoauySOY1qOD/V5
         CKgrqfEh10PJdZm6Yc9vcPAN61vfPJb6vk1OBq4g2snHqF6ys3BGN8Owy2PaZxTHacN2
         H0Uzs8OD6vn1CoCPtyBuQFYohU+eLMjqW3SIgrqS6khDvWmHV2UzXC/1nNQKRV3e4qOH
         CVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIsEKXGFSNqQILX0QaJSH8NtoAJ3+z1bPLQqixvplHo=;
        b=oO1J9AZImENGUi17/SwdBe1ZToq3VDdjqIKiHmP/7cbqi1ocWyMEzGyKHpLXK/8mw2
         5amBD086bXY5PJwdhli//0dXlOCClYnPZfFi7anMqmf0DiFjF5HsqdcIS5EwvS8YNHek
         7AO3CJ5A9kFSUsTLKeQsJ/gn800uFPNNxnaq1DzVc73Xa7HN90hBk4/t8QOGtYVk92Ka
         xYs3IkcnJEJW3Mh2UwlV4uYZxSMyB/eYJidXwKHXaXM/Wn3eD4GFnf1QtDfqxJ7J0dZU
         8mMmERoZLm+/b6bzIdI7rUejFJQMoWzeiFQhzVoXaphL7fqEL699OGHG7KP1KSiSr+yp
         P5Hw==
X-Gm-Message-State: AOAM532qruyZ4s4fEYVbEZ9XjDlKcBCRamnRFhl4ihhwlKR5PrN0mnz4
        03G7LPg3dwxEaWuSkj1bv/t8LySdfNv5HvW+FFjlCw==
X-Google-Smtp-Source: ABdhPJwt4SGLP1Ol1ETFJg5qPFl0XVP2v4pyiP5CQ1uByeWMBYVAMQNWbYhCWtLDwTvOQ3exBnQhRcPeb/5S6cFcZIU=
X-Received: by 2002:a17:907:9908:: with SMTP id ka8mr1283587ejc.164.1634240803070;
 Thu, 14 Oct 2021 12:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20211013221032eucas1p1d8e2fcc36d3f021aa86cb846df0ed6da@eucas1p1.samsung.com>
 <20211013221021.3433704-1-willmcvicker@google.com> <b968773d-9ee4-4e7a-7e33-f3ded7362a9c@samsung.com>
In-Reply-To: <b968773d-9ee4-4e7a-7e33-f3ded7362a9c@samsung.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 14 Oct 2021 12:46:27 -0700
Message-ID: <CABYd82bcyweWba52wM6hXEgL_z6Ud+yE=Wtkb=5N8RyiQnxxiA@mail.gmail.com>
Subject: Re: [RFT PATCH v3 0/2] clk: samsung: add common support for CPU clocks
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 14, 2021 at 1:33 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 14.10.2021 00:10, Will McVicker wrote:
> > These two patches were originally a part of the series [1]. They add
> > support to the common samsung clock driver to parse and register the
> > CPU clocks when provided. This allows for the samsung clock drivers to
> > simply provide a `struct samsung_cpu_clock` to `struct samsung_cmu_info`
> > and then call samsung_cmu_register_one(). With this new support, we can
> > now get rid of the custom apollo and atlas CLK_OF_DECLARE init functions.
> >
> > Since I don't have the hardware to test these, I'm including the RFT tag
> > to try and get help testing and verifying these.
> >
> > [1] https://protect2.fireeye.com/v1/url?k=91329df7-cea9a478-913316b8-0cc47a31307c-8e0b8e6442100c5a&q=1&e=50af1e33-8bdf-429f-9e54-434d425998d6&u=https%3A%2F%2Flore.kernel.org%2Fall%2F20210928235635.1348330-4-willmcvicker%40google.com%2F
>
> Works fine on my Exynos5433 TM2e test board.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for testing!

>
> > Will McVicker (2):
> >    [RFT] clk: samsung: add support for CPU clocks
> >    [RFT] clk: samsung: exynos5433: update apollo and atlas clock probing
> >
> >   drivers/clk/samsung/clk-cpu.c        |  26 ++++++
> >   drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
> >   drivers/clk/samsung/clk.c            |   2 +
> >   drivers/clk/samsung/clk.h            |  26 ++++++
> >   4 files changed, 102 insertions(+), 72 deletions(-)
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
