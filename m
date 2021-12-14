Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B44C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 16:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhLNQPq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 11:15:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235593AbhLNQPq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 11:15:46 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB9EC061574
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 08:15:45 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id n9so16733705uaq.10
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 08:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6FJi1chVbjhnnxyU13+cLRUgb7epxkD3A/uWK2BL6E=;
        b=FCrnA9ABISsTiY1lnbiP9+rfCMgW2g08O6yQF8CfKnrrGmEpexA+SIvqrll1A3dPCq
         BKPTXc/7IW1Ef4gZrAasmwlRo59LM5YWGm89jTjRndAUgOSlxjDlEuXLpzbmkGdRopsx
         X2A431io7LiTaagHHLjONVFn7X004XUhAqFBhDUUt8s8ck/oDDC/rhdBs+v5bZvqTfYX
         Cm2mM3+XNemXd4cDvRBBWMxTHQfZeY8Tm4kNjkPAEfrMRuCb+n8AEUtHq9otxZmqrnkj
         3ppIu5zf4M9KYj9gb9sVqG+NRN5SougOKXnUuERI5Hgsuv7nvRKIRgudGZ3xeZ0pOz+T
         9gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6FJi1chVbjhnnxyU13+cLRUgb7epxkD3A/uWK2BL6E=;
        b=YX5B9fGwMb8pZUHmh6zvdvdUDDiPOVHVGIQMNJiVhmTgdX3mUmz84tmvskl8SpcYN5
         5RniNAD6lZc8jETqoU5fxfTMuViE8O7eAhGDgRS93qFtoY4UNDnk5tgESHuj1YaTjmJz
         pGeU296cL1DfOFOX+jqBl4N6w+Y2GKFAi1PydrihzGTJ28+d+DRjSp8QN+x0ZFfnW5Am
         gPQDlnPNKnBWnlbHkSLcMGTTs2DJCwvMIQXTas+X5QAgcjV624C/phL2OF+WUXI1pHzl
         LwBf7UZO/MasVePm1AP6EyKZ5ZPGsqBgcGF6k/H+oslHuKhYSHB+X4Fgt2f4FG4kccss
         Va+A==
X-Gm-Message-State: AOAM532g5M+Yr0GMAF4vm7IAH/2zKfzvgsrKIvhAYTKDXqedY4gfkRA4
        yGdMUQAIh+sw53/RkpLaDbuXVj2ThNpIEuz7oBU+fA==
X-Google-Smtp-Source: ABdhPJzEL887m0Kxg3sI2RmnzaW9Lu/RySFA8VRYAU3p3WJAo5Y3zuyk8/44Zjpq1FkqALrxnuD3wDw/WQyN5lfSdQo=
X-Received: by 2002:ab0:7859:: with SMTP id y25mr2325675uaq.9.1639498543523;
 Tue, 14 Dec 2021 08:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20211126203641.24005-1-semen.protsenko@linaro.org>
 <YagPWOj0CLxE/+ER@robh.at.kernel.org> <CAPLW+4=LTd8i2Tqr7Wa0NDRTJ5mRJXP=EvRCx84WxnwCDQ1eVg@mail.gmail.com>
In-Reply-To: <CAPLW+4=LTd8i2Tqr7Wa0NDRTJ5mRJXP=EvRCx84WxnwCDQ1eVg@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 14 Dec 2021 18:15:31 +0200
Message-ID: <CAPLW+4nk7Y8Psg9ZVacvzJeAV3VAGWfi+9hTPWgTeAWqh67AKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        David Virag <virag.david003@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 7 Dec 2021 at 22:54, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> On Thu, 2 Dec 2021 at 02:12, Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, 26 Nov 2021 22:36:40 +0200, Sam Protsenko wrote:
> > > System Register is used to configure system behavior, like USI protocol,
> > > etc. SYSREG clocks should be provided to corresponding syscon nodes, to
> > > make it possible to modify SYSREG registers.
> > >
> > > While at it, add also missing PMU and GPIO clocks, which looks necessary
> > > and might be needed for corresponding Exynos850 features soon.
> > >
> > > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > ---
> > >  include/dt-bindings/clock/exynos850.h | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> >
> > Acked-by: Rob Herring <robh@kernel.org>
>
> Hi Sylwester,
>
> Can you please review and apply this series, if it's ok?
>

Hi Krzysztof,

Do you think it's possible to take this series in your tree? Once it's
applied, I can send the board support (dts) series -- this is the only
remaining blocker for that right now.

Thanks!

> Thanks!
