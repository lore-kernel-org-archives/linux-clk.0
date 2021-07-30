Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2545FC4320E
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jul 2021 12:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0284760F0F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jul 2021 12:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhG3Mi2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jul 2021 08:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238753AbhG3Mi1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jul 2021 08:38:27 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19602C061765
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 05:38:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l17so12187923ljn.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0TPrFNXDo3fiyz0l/s2CJAtmfo7kIvxhcbaJib7tKDk=;
        b=vpScR3U25Ovsfdyt7Y7crUtNpsGq4dweZaIpvd8TbQumwlSW4i5tBuVwczmFcoNcag
         E5iJtmPSdE/flOnlqdoR7VnY2Urk4sEyFZoAqDFiQJO4l9KdnfJleH0V44thWadtf/Pp
         O5XP0NtMiDiHDoIV9gE95mHJYDORJ7LY9PJIAXJP+sX16UMVzKbr+c8A3E3WyFcfvKef
         6xpUyXD21hyy0FeF/GtvAkJOw8bvd2wZLqzKPjMCgab5KGN4rAkcNQ+qAj07dMlSCrnd
         XwWPyN8bK8PK5WXgLWMPU7HuJ5GnwHucT8meJhzA7QvtdiyCQideDgaHRNQFqE3wsUG1
         8sXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0TPrFNXDo3fiyz0l/s2CJAtmfo7kIvxhcbaJib7tKDk=;
        b=qXYJR3e8woqHhvB70S8p0SpitGsCJBkHXPrDo91hDkaxrE7AKkEprNv52hR0YYGanY
         r1FvUX4eJg8W2TQgrCPABBeOgpOpAzT04csVlPrpXohZv3q/iNcWTxMoMLcYH5WiWIAa
         hAqPG6jhilt9SpgCHvSZMeQAfvHBc0GLSNL/ec8p9N2XQxmaYl3mI7tyOYGWo29eBnZy
         hmzSwKfLEu9bi2dGd9jCEUzptlg2AHIwP0zyRfwt3UdjQJIQb32baoXDS6kF6+Y1+rS3
         4G/M/JZT8FqvC9Uc2O0aVfBtg7NW7EmpQjALbqSpj9dF4N582wrBRUmZtThwM5gPkOj9
         75Cw==
X-Gm-Message-State: AOAM530xDXl6oIVkYAajGm8uvzZnUIU4jrUcfWRhXUI9V5d+y4X2kcw2
        weM9KgTx/X9Al6bhpQj1BjGjuqEL02dr2edAGXIqsA==
X-Google-Smtp-Source: ABdhPJwQP9rYUjp+G/nfNIv5a0w33o23MO0STAgKSfw8PMCWe/ucqXTK5QcMMJ+7QOP5dAlI1PRu3SaENWjQzVQNYHU=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr1528246lji.326.1627648700492;
 Fri, 30 Jul 2021 05:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com> <20210721030134.10562-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20210721030134.10562-7-jiaxun.yang@flygoat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 14:38:09 +0200
Message-ID: <CACRpkdbFw0SE8iHs+Y+D-oUBrjxkB_1gqdL2TCYHtd8EsT_edw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] pinctrl: pistachio: Make it as an option
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 21, 2021 at 5:02 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> So it will be avilable for generic MIPS kernel.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I just applied this one patch to the pinctrl tree, let's see if
it works!

Yours,
Linus Walleij
