Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16E6C433EF
	for <linux-clk@archiver.kernel.org>; Sun, 21 Nov 2021 22:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhKUW6r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Nov 2021 17:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhKUW6r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 21 Nov 2021 17:58:47 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A679DC06173E
        for <linux-clk@vger.kernel.org>; Sun, 21 Nov 2021 14:55:41 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id n6so32916807uak.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Nov 2021 14:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S438G+utz8pjDkvXqx18EM21msuvfiLmqt/53NycU20=;
        b=zF4VuhMkOvolYehi5B/JWkTO1dRxbjNScex3BHFGl5I82XST22YzhAWj5ykjWWb1Eo
         X1SmjNqdH/CeStdilN4MB9awVlBKEudQ0oaI4rkKrZEcjDyGoDT+6tlJlzLHrispfEsK
         qSfaSsn6TIlcsAw6AqEetnZZXf2YxO6GvYphbP4/fLNYRd+HDRPL6IoCdiO50rvHCgCD
         ErDkX1+6ann6fiQH/lsRxQvPIz99xsbQBb1PRPkfOwsI43WL5vCRcUfpy8lzxm+XbxSH
         sWaEPZX2Sd8g4EaPYeB42Flkmlm/IQ3A6GFBwQ1T0xJERsfale5p6LuhlPFFPU455Rxo
         QqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S438G+utz8pjDkvXqx18EM21msuvfiLmqt/53NycU20=;
        b=bPxMkOlbMxd3mkQ+iebgsL1Tsr69mha6bV0JuGLoRjSuYRUvDO49Xai44h8vZuutan
         lVjytXHMSif7uNKFpiOEdxVbaoBVJYE3WZIn/WudNB4/SJ2u7YJwjVFqZaMeKZ2zSUjF
         Er9EowO4FUkjZ6upQ/hFI93Mn8Ja9TNxjgX3ygOGDFwY0tapwYwKaEwuT8t/NyD1OQAt
         TSsmCQQd5uCnmpgOpxE0N9hcrFcrLGtffTJR5ocUEU6tfC0cXzYzc4zo8KTuHP9vTUod
         HpU6HZ+rOi08cYQtcJ89Vt4QJ2qI554N10cu+6Sp8r7d2Kyq2xAtY5xNONs4O1LodZFQ
         pw6g==
X-Gm-Message-State: AOAM530XQ0PU/Uxg29208xXkXo0TG4BiWKklxLYbfDHncIIVSzAiVNsV
        gV4qjFIPgz7l6sLogxDVe2g/+HjkXq7veOtHLTwdzg==
X-Google-Smtp-Source: ABdhPJwgf46PvVFqRlUS2culzCgQuSh0I0XL196ZF7cYR8TmgHwR+Gs2ynsMw9ktq+ZcHsUQSvUH0wfBjwF/ur2ckbw=
X-Received: by 2002:a05:6102:4192:: with SMTP id cd18mr123860031vsb.35.1637535340797;
 Sun, 21 Nov 2021 14:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20211022224556.18742-1-semen.protsenko@linaro.org> <YXtVS1YrZqE5kW32@robh.at.kernel.org>
In-Reply-To: <YXtVS1YrZqE5kW32@robh.at.kernel.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 22 Nov 2021 00:55:29 +0200
Message-ID: <CAPLW+4kgQ8CVS6eNXxwePiATHT41E2EhhAP3AbxgFTCnjyO-VQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: samsung: Document Exynos850 CMU_APM
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 29 Oct 2021 at 04:58, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, 23 Oct 2021 01:45:55 +0300, Sam Protsenko wrote:
> > CMU_APM generates clocks for APM IP-core (Active Power Management). In
> > particular it generates RTC clocks, which are needed to enable rtc-s3c
> > driver on Exynos850 SoC.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > ---
> > Changes in v2:
> >   - Added R-b tag by Krzysztof Kozlowski
> >   - Added Ack by Chanwoo Choi
> >
> >  .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

This patch series is superseded by:

    [PATCH 0/6] clk: samsung: exynos850: Clock driver improvements

(going to submit that soon).
