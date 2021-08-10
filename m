Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1866C04FE3
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 18:17:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82BBF60527
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 18:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238706AbhHJSRa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 14:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbhHJSPq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Aug 2021 14:15:46 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911E9C04D508
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 10:52:42 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id s196so7804813vsc.10
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I6RKMjNTFF3c4/mfptDSFtrMGh5XLa0CrYIkYccb5cQ=;
        b=tTc1eTNXUWe0XoOjLyXa5hWVJ1+NahkZ8Ta6wc++jrvJjlQjgzV/HOv1/SxZrydqJC
         yw9VgluFgx/H31tdOZ1xuxaElxtOhQq4jI1V0d0iNKxqqqVXJDyHG3VnpUKiEVutHzp3
         JL58yp0v10wBoIXtm1dA4s6x4W38EgpiDifaMUX2OWrmv7VzzoHOSoLjc9u23V9A7oDk
         TjvAbR8jNoMsO+Nq7mq74bWyNo1Labxv0Zz1+cwnhaMalG8FofcZJsQgTOzfWMN6QRtG
         3ZBQ6Rav5kf/+QLy3Q59hUDscZXdYkVvCN0rvr8PxmCMaFKia5uXZIwE9iR8Xd03UV1D
         DAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I6RKMjNTFF3c4/mfptDSFtrMGh5XLa0CrYIkYccb5cQ=;
        b=MunVmTwJHjKay3jyeVHEtzSlAMoU2clTIt0O2l2rztBmPBqdvng2hjT3Q5GaKHtJ+g
         rBwrclJ4QqK/k5VE3cnTdr4qmwlHV23427znDBeS43eAUGSVMBo6Ka79OZuR7IepLcoU
         fxoNcia2YKz1DfOaCuPSLm13jxYKF/ylkWu7e4nlEGLDqQ4vB0IZnx0vabkU/PMjIARM
         6NQbH+NxQqKR49NaoUqagwyfVjt2jJa+dGdIsAte4y40oc21NG2Ne55Z5460Riz8hEVX
         mlct2SKMrLAvgVTm3M0Dg/PNy0g/FEDm/B3wFZua7OMNP36UNj15IJeeCs9LsK5NpOZ5
         8Lvg==
X-Gm-Message-State: AOAM531X+g7ZC8elqwRkbL4TDxsL5ZnttO4C6TfTaxo5ggDi6Jg/atBx
        FiCay7C4ygLL1s6GIi3PUO3VUbK6cvj/fxevs5mXCQ==
X-Google-Smtp-Source: ABdhPJyUfonwtn+iwAgVxzf+i5aYU3d34oG5yYxD2OZ6IEkOUkj1WII0Yze+Sx5JdaGL+V/KciNsvmOmCmNAW1OVboM=
X-Received: by 2002:a05:6102:942:: with SMTP id a2mr10771088vsi.30.1628617961798;
 Tue, 10 Aug 2021 10:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 10 Aug 2021 20:52:30 +0300
Message-ID: <CAPLW+4nx68hsz_+W5MtB3CfE0GsFwMLMRYh-ksq2CHZ84eCLcg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] dt-bindings: clock: samsung: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Krzysztof,

On Tue, 10 Aug 2021 at 12:32, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi,
>
> Combined patchset of separate v1 sets:
>
> https://lore.kernel.org/linux-samsung-soc/20210809120544.56596-1-krzysztof.kozlowski@canonical.com/T/#t
> https://lore.kernel.org/linux-samsung-soc/20210809130935.80565-1-krzysztof.kozlowski@canonical.com/T/#t
> https://lore.kernel.org/linux-samsung-soc/20210809135942.100744-1-krzysztof.kozlowski@canonical.com/T/#t
>
> Changes since v1:
> 1. Patch 7/8: include header to fix clock IDs error in example.
>
> Best regards,
> Krzysztof
>
>
> Krzysztof Kozlowski (8):
>   dt-bindings: clock: samsung: convert Exynos5250 to dtschema
>   dt-bindings: clock: samsung: add bindings for Exynos external clock
>   dt-bindings: clock: samsung: convert Exynos542x to dtschema
>   dt-bindings: clock: samsung: convert Exynos3250 to dtschema
>   dt-bindings: clock: samsung: convert Exynos4 to dtschema
>   dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
>   dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
>   MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry
>
>  .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
>  .../bindings/clock/clk-s5pv210-audss.txt      |  53 ---------
>  .../bindings/clock/exynos3250-clock.txt       |  57 ----------
>  .../bindings/clock/exynos4-clock.txt          |  86 ---------------
>  .../bindings/clock/exynos5250-clock.txt       |  41 -------
>  .../bindings/clock/exynos5420-clock.txt       |  42 -------
>  .../clock/samsung,exynos-audss-clock.yaml     |  79 ++++++++++++++
>  .../bindings/clock/samsung,exynos-clock.yaml  |  87 +++++++++++++++
>  .../clock/samsung,exynos-ext-clock.yaml       |  46 ++++++++
>  .../clock/samsung,s5pv210-audss-clock.yaml    |  77 +++++++++++++
>  MAINTAINERS                                   |   4 +
>  11 files changed, 293 insertions(+), 382 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos3250-clock.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos5250-clock.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos5420-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml
>
> --

For the whole series:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks!

> 2.30.2
>
