Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B7AC05027
	for <linux-clk@archiver.kernel.org>; Wed,  8 Feb 2023 06:08:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjBHGIL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjBHGIK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 01:08:10 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12263A5A4
        for <linux-clk@vger.kernel.org>; Tue,  7 Feb 2023 22:08:09 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 16so2654378pfo.8
        for <linux-clk@vger.kernel.org>; Tue, 07 Feb 2023 22:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iec23gsP+sSms2hV+HR+Vp0eFbhDQHdA6maO2iZiIVw=;
        b=LKUOLxjmnNMz9gvLHLLDkZ417tWU/oPLRPjDnHjj+O56WlbzroFIcAgNxOAnou09Td
         fq6PJ2vMNs6bzz2LqZas4kJwN6TIQKwcHleK2D0VS0yp1g1Tj3ko9+aMvpMYT0LXJjY6
         LADxqQdVRhECEjv9q0Inr1hNMEdOPXAlN9mfhhNUu50/oZHECDvUdIBMpwc1zksr3d99
         /hRoAJB9YcOQ9qYJ09bPJm/pQ9JaQidxeio6QRZw/k5SLWbNZWF5gCnC9J0rH+vn1DjD
         DhjLYhCq2b8LxHR/KhLuYaZgMjT3ydhbrTT5sD2S4KnTPD27vOGWf8yaTQGcmhJmqh21
         soUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iec23gsP+sSms2hV+HR+Vp0eFbhDQHdA6maO2iZiIVw=;
        b=yhys3/xw81eXn+5kd2K02CCGkq2BY5kGDsOlKr20OE/NhVVbZ3s7JZnPxpNsXSZaya
         v2vd+C7REBnG8hiyo0Bh4Re0Y1FChTq+ja+/e4RcBG33h2uRbMLMd/CA/rBzvrUUs2tC
         qkYlnoJ0nKsJm5jm8k1Tf2RLo+WIWq8SJt9opU8RUx4ZOoQqfS7b1wh0vXMNKgqx+1Kc
         TVbABNl9oEii/3+WxLiiSUsevnMYcjl4U+nsxQz8+962P0cbxiMiW5SyEUdJZf9R7YN9
         lYsKcOl6KxBrw24iEWRDjXQFFF6RyGukM1lztUQpSdBZQt1/Isnj8f4JT/dzTSHTbQDm
         CUZQ==
X-Gm-Message-State: AO0yUKVXnMsLNVHK+bBOl0lC0QF0gu0f164Gx+7jXRQy96e1tisyRUFW
        xp8BFoqMz95734egsQrdnnIxEZGDKPuY+Q/MZXrIrw==
X-Google-Smtp-Source: AK7set9VK9sGir420UmhyaPvxF5uQawzrlEDIpDo9OvveQC0SfMGXXRUKk/qqxnI3hWKpv94NGRSPK5OJiOWw65QFas=
X-Received: by 2002:a62:cf06:0:b0:5a8:1929:f482 with SMTP id
 b6-20020a62cf06000000b005a81929f482mr388781pfg.49.1675836489152; Tue, 07 Feb
 2023 22:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20230203060924.8257-1-semen.protsenko@linaro.org>
 <20230203060924.8257-7-semen.protsenko@linaro.org> <59ff815b-baad-02c5-67df-e4d65f63afa3@linaro.org>
In-Reply-To: <59ff815b-baad-02c5-67df-e4d65f63afa3@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 8 Feb 2023 00:08:18 -0600
Message-ID: <CAPLW+4mXJ8Gmb-OWabdN6EyaUrCUQuFAGyGh09TDgikmL5gjAg@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: samsung: exynos5433: Extract PM support to
 common ARM64 layer
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 3 Feb 2023 at 03:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/02/2023 07:09, Sam Protsenko wrote:
> > Exynos5433 clock driver implements PM support internally, which might be
> > also useful for other Exynos clock drivers. Extract all PM related code
> > from clk-exynos5433 to common ARM64 functions.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
>
>
> >
> >       if (IS_ERR(parent_clk)) {
> >               pr_err("%s: could not find bus clock %s; err = %ld\n",
> > @@ -91,6 +112,46 @@ static int __init exynos_arm64_enable_bus_clk(struct device *dev,
> >       return 0;
> >  }
> >
> > +static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
> > +             const struct samsung_cmu_info *cmu)
>
> Align the arguments.
>

The same issue here as in my previous answer, unfortunately: when I
try to align the `cmu' argument to match the open parentheses, it
doesn't fit 80 characters limit, which doesn't look nice to me. Do you
mind if I leave it as is?

> Rest looks good to me.
>
> Best regards,
> Krzysztof
>
