Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEFBC433FE
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 20:02:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 961E8610A5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 20:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbhJFUEb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 16:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhJFUEb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 16:04:31 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76216C061753
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 13:02:38 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id f2so4284170vsj.4
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 13:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FnczB4qtoym6/uCjIoCpBahkSSySqs0UV+3zlX8l/eU=;
        b=luzAbdgOSHLbUnVI7+LDtEwAOcBzWaPm/YemTUoropMXQELkkRtug3wUOd8ISioW5y
         R6PLuwR0g8vqXMFB1jTT3B4O1TvkZtsv2RhsLK8zus2wSLCdTUUJn1Sk9d5FL7TmISbI
         noq+Alw3COJg0SlDatN1KJbFAKN6h96r+mVbhbs1ZhnAKkaL1xXVEiB/z2CXjJgXT3Or
         W3LUrGd809izM0ubfAoHLp27pLiyVg6lM3BCR2slvu51OlufNNMwd7ocGwJjaKO0dLdA
         7KtXQ8L8zGsrF7FoLRDW1HJLLZO6rIRNK0UUObibxfRXvuXFH2VCwLfPyMdEwcQOT7qn
         eGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FnczB4qtoym6/uCjIoCpBahkSSySqs0UV+3zlX8l/eU=;
        b=7EyU/5vw4Vb3cvNKcd2bKhKavtnfKLHa0yhHYJlhFhepptQ0H2hXKgv/ekiz1bKW3c
         0Ss2qaJGBmiz9b/U8y8ZZVX2PNcSfrb82CCMKTEeaEsrX6Yz4Dk8wNsjs6UF7gRfIlgm
         Rv6zdPWtBCcH2mPkqOdENHuUPDwAfTLbPTxczrRp974ikDwpPVewktsfwJjO/B9JoQ3f
         oaB3CkFhXQ+DEmrD+enR6ljrU2NQtcTvJWfr1qPpBzz3Eq8PBjwQsIP3DVmSwHfQZNRC
         As4K1lAxs+PM8HMOFZyaJO5g//57VQlNBDfCjPAjkoT7oQJQZ5u0Y+R4qZg/8aCEBYrA
         +zRw==
X-Gm-Message-State: AOAM530/L5WkYvdR70OxyensA+SCvZnVSfy+mhhtG5RG0TCYn/o5NgXy
        BTXGGuERHohTx14++WglhWC0K/p0LjCesyZrc/bq4Q==
X-Google-Smtp-Source: ABdhPJyELTZu4mT/PVMaTLHDN0ZAPUEE6TvSoJzj8LOR79nAd4NsF/4drXozDiH8Ionz68cLVZi8M2xd1UvxfYkU0ms=
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr26731553vsp.35.1633550557421;
 Wed, 06 Oct 2021 13:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com> <20211006132324.76008-11-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211006132324.76008-11-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 6 Oct 2021 23:02:25 +0300
Message-ID: <CAPLW+4migQ+3NBsHgMd04N-Fc71CTzxoUMS3HN2S8377qFDa6g@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] dt-bindings: mfd: samsung,s5m8767: document buck
 and LDO supplies
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 6 Oct 2021 at 16:24, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Document the properties with regulator supplies for bucks and LDOs.  At
> least one board uses it (Exynos5250 Arndale).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> index b2529a48c890..12dea5aac8b6 100644
> --- a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> @@ -96,6 +96,44 @@ properties:
>      description: |
>        GPIO specifiers for three host gpio's used for dvs.
>
> +  vinb1-supply:
> +    description: Power supply for buck1
> +  vinb2-supply:
> +    description: Power supply for buck1

Nitpick: all those vinb* are for buck1, or that's a typo (here and below)?

> +  vinb3-supply:
> +    description: Power supply for buck1
> +  vinb4-supply:
> +    description: Power supply for buck1
> +  vinb5-supply:
> +    description: Power supply for buck1
> +  vinb6-supply:
> +    description: Power supply for buck1
> +  vinb7-supply:
> +    description: Power supply for buck1
> +  vinb8-supply:
> +    description: Power supply for buck1
> +  vinb9-supply:
> +    description: Power supply for buck1
> +
> +  vinl1-supply:
> +    description: Power supply for LDO3, LDO10, LDO26, LDO27
> +  vinl2-supply:
> +    description: Power supply for LDO13, LDO16, LDO25, LDO28
> +  vinl3-supply:
> +    description: Power supply for LDO11, LDO14
> +  vinl4-supply:
> +    description: Power supply for LDO4, LDO9
> +  vinl5-supply:
> +    description: Power supply for LDO12, LDO17, LDO19, LDO23
> +  vinl6-supply:
> +    description: Power supply for LDO18, LDO20, LDO21, LDO24
> +  vinl7-supply:
> +    description: Power supply for LDO5, LDO22
> +  vinl8-supply:
> +    description: Power supply for LDO1, LDO6, LDO7, LDO8, LDO15
> +  vinl9-supply:
> +    description: Power supply for LDO2
> +
>    wakeup-source: true
>
>  required:
> --
> 2.30.2
>
