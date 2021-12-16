Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D94C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 19:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241069AbhLPTrm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 14:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbhLPTrj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 14:47:39 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3FDC06173E
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 11:47:39 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id s20so125732vkm.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfeGz675bo0ZAQkD1KeicPK8T+9nudR2MVitSK3mkmI=;
        b=BhowvOlsjQ0sC/mAtZEVQ7CqisgZvneuyURY5COLjoEiosEeHD1ityN8relL+yTQLk
         ZEjTSThRMFuNWHSeB3mfAshATpgv28Kc2K8pVmszVrU8i5acbjAoHb0kqm0zZt025PWP
         C4fZiW+LNLnmJ6Vami2sLJobvwEoNlminL2hYEYqgFhkpL0v501a4kp3Ph4sZaFn86mW
         XZg3Dz9hiu4wUdavj+dRPc2q1F3SKPFsnC9jiziTveg2jW3OJxfx6UTPPPA6T321wZfg
         3jVg0OXIszHSHEd3CfeeiWs4GkTd4NkrYTqzfBNTiCh0GAWcQDxXL+wTh3xA8VUFBJ2w
         hf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfeGz675bo0ZAQkD1KeicPK8T+9nudR2MVitSK3mkmI=;
        b=fale5MrOlnj4STt0uJ6BxlWZEbLlb1pPZZs8GtKC3pbMruL1FHsS6G1SiO/GUPmSLE
         qAgau1Vb2jki0cveF8FaH5kNMWBZ9TC539ZyYNB/sGc6dr8XcsEuzyBQQOgIGinbiZbW
         uAR5PEUBiJv5PVJYgzWQJXO7lmd9mwhYj7qByoBPGUgB3cUU+9auH9eY27nzHplKYANy
         9+Baz+xD7BG+zVwcny1dk07mtDF/iOt8jT7KEiCFXT8aVFQqG+epXjI2hIEQiXvH9qbv
         Y2c32sdvM76upjkDDou9z3xZt27gY+NYbNy2xUhNahmi1VQwO4pldTlzArojqIcud+sG
         ZJ+g==
X-Gm-Message-State: AOAM531H0fbZ69bFdzizZP8aPlsnAEVKPfGMR+Iai0mt8fWgDIJSpVGA
        GsE8Aw7gQ0tEs/6Tl3ULBLd1vn/Q6i6Yz1O9z9jD2Q==
X-Google-Smtp-Source: ABdhPJwBOX7xYFt8nvx7Ihazb7tPaF6woxVxl6yfCpvjDeCk/qlAfPInPy5Imr/zr+u/k9vC932UVin83BVZ2WFqwnY=
X-Received: by 2002:a05:6122:1306:: with SMTP id e6mr7233502vkp.13.1639684058230;
 Thu, 16 Dec 2021 11:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-2-semen.protsenko@linaro.org> <Ybt78LP4KDYoQrDy@robh.at.kernel.org>
In-Reply-To: <Ybt78LP4KDYoQrDy@robh.at.kernel.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 16 Dec 2021 21:47:26 +0200
Message-ID: <CAPLW+4=z12N-WFDVfmyTZ2oj_X-+3gHTGaJ0CSTJ5JrM8fK2oA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
To:     Rob Herring <robh@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Virag <virag.david003@gmail.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hao Fang <fanghao11@huawei.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 16 Dec 2021 at 19:48, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 15 Dec 2021 18:09:00 +0200, Sam Protsenko wrote:
> > System Register is used to configure system behavior, like USI protocol,
> > etc. SYSREG clocks should be provided to corresponding syscon nodes, to
> > make it possible to modify SYSREG registers.
> >
> > While at it, add also missing PMU and GPIO clocks, which looks necessary
> > and might be needed for corresponding Exynos850 features soon.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  include/dt-bindings/clock/exynos850.h | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>

No malice intended, just forgot to do so, sorry. Already added all
missing tags, will be present in v2 (gonna send it soon).
