Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8901C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 12:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C80586101E
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 12:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351056AbhI3Mtm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 08:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351065AbhI3Mtl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Sep 2021 08:49:41 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270ADC06176C
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 05:47:59 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v17so9833541wrv.9
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jQcb/IRMulWTMVpLN7/tTW0JOEcywHbsCrqDEOi1tes=;
        b=YciORU29ZLiM3+rVUPyXHQ/8jB28s1o/9oUDvkyfz5GDf+e9xhFV7JeHUgmjYxXHSL
         fZL7VzoVijF/ZysR1BzWIU9+EsUSVjhDNhBbs8K75x2G+e/Ua+OzUhje3IJkab4RJF/b
         2Wj6+P/HBT7whH6TTLSEDgC+28U2SxY8yrUdAohzBjOol2v4ap4D5QRNhb4cXINdH6jb
         ZbGbPo/eatNtfPE1nbbZ9Hfw2GJuSEPeuC/Vis5sLjRvVocs5D2KBxG6Ek6rFDD9iAyk
         eF8BBC+g66Vt5hSQs0mGUGSfSbqoFTtqBXQ4bDutWP9w9td99kj+qE594JunsF0UuI3P
         njRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jQcb/IRMulWTMVpLN7/tTW0JOEcywHbsCrqDEOi1tes=;
        b=UOfldJCf7Tl15Un0or5DCc5t3G5/xKjDqhalksJ/nCFe3Kx35W+qv3I1Em+BRZidTC
         5CWy3+5Y5q21Lapvj5BICASKmxo9gIhn7iiJ71LNllOFXqR63WJQTDKiVLyQkgWEB8NG
         rapDUe5RXJHhVQtJpWEK5+rTLq5s0eBk5TjvaQiP9ilGFK9cavS5F6OPgKFeH3K0bUft
         fxbZVneXSIqlzIBXLE4CMXamQoJpda1Vr7Uxrxhn9gai/etvWue7lzCeC9X2ny0BQaej
         4iiib1Ha+Y9YlLvvL0knkLmAyUyh78YhWLQrT4g20SIQ2Ja5eVrvBtgkojDFAXbH3HLN
         +GlQ==
X-Gm-Message-State: AOAM532a/SViYh1A6jzVke9pcPKEhBNqEi4xEKbXiQ1sNQFujExGYHHs
        mGA5TvAGQa3FxkmLTIYBUBbeTw==
X-Google-Smtp-Source: ABdhPJwnejh6dcPEIzPH5qBtw9qE77SEtnm6HLAZlJZXDYk4sIFKXEk4qno2ugj5odIXtRGh9o+kAA==
X-Received: by 2002:a5d:6b46:: with SMTP id x6mr5972981wrw.192.1633006077728;
        Thu, 30 Sep 2021 05:47:57 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id t16sm5222171wmi.33.2021.09.30.05.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 05:47:57 -0700 (PDT)
Date:   Thu, 30 Sep 2021 13:47:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH 10/12] mfd: dt-bindings: samsung,s5m8767: document buck
 and LDO supplies
Message-ID: <YVWx+08egbGPiYYt@google.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
 <20210928084949.27939-11-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210928084949.27939-11-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 28 Sep 2021, Krzysztof Kozlowski wrote:

> Document the properties with regulator supplies for bucks and LDOs.  At
> least one board uses it (Exynos5250 Arndale).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)

These all need Rob's Ack.

But can you start with reworking the subject line please.

It should be:

  "dt-bindings: mfd: <component>: <Subject starting with an uppercase char>"

> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> index 35018346f68b..e97a94cab4e8 100644
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

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
