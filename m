Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92168C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 13:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbiAMNge (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:36:34 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53092
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232568AbiAMNgd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 08:36:33 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9A94C3F1DE
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642080992;
        bh=LK8TIW5kBMgN60TTr9MsN0Nx6njpiR3Rbad9G3zx4zY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Nl/fJpmdl1iwO8i2Nk4M4UUAN5A8HFJvKfhMYIvgUEfiGebw3BzTvzr3rgAwnIMDF
         RJtxMh6CHHG+OJN5d5CTb/+/CRD/vXIGojquDg816x8kZHGIyc2012i6jMyiZ4ZHpB
         bk9mOFxlo8scwZVgyvDh3z6BeRXj79uPcFC7BApn3yKyf30lUlptfMWsFfv6D66Der
         xoYsgQYr2G8Ug4X2rEydT9zh1+47jJVg8CXm9ol45dQyKo6OwNvAZwoMZCZCXjU+K1
         +w0Q5lV3nj+4zemH2RMqHRN9KC3BIfp1kntn8alyoSlp5ONUowXJxZdQDgDvoKdJfr
         G1ZcYUiwxWYEQ==
Received: by mail-ed1-f71.google.com with SMTP id t1-20020a056402524100b003f8500f6e35so5381364edd.8
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 05:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LK8TIW5kBMgN60TTr9MsN0Nx6njpiR3Rbad9G3zx4zY=;
        b=G/oCEZZSAkc8JNBh3aBTBF/Oydc39ZdUfrFpQMwaPvM5eUnvXCUdunlOE91u7o5R6H
         iYg7hLYhmTigtA7SliZ56b+67DYhZrJe/RJwd8PTGH0SbowVQvSwbe/WxvY0v6bi465m
         na+rZNIG8lR9UJwAD7U0Ep0adFXE73ieQAsCiVrW46ubrQDNGAQjrKOhO+dYonDjtPDp
         +v1BM7Ty5Mrh17gQMQJcSAe0pOBOnje3VN5UAsH4nezytgftPfqChOGjYpm46Fp7M4rb
         cot3BeA7Jct0h+DvRqLHrr/nCQfcI/YZ+Fg9HvBmPQ30XiBBdueR8m6t62jT5VQ+EjEN
         FFiQ==
X-Gm-Message-State: AOAM533WhLYp5ubsG1R5o0kSikuP5FjhV3NTyPRSxPHTx4qFx0BUd8Bm
        r4ZhLhwyRMSvmpbCsvNpF2HFRqCrWXtG5HDQ1Ltc87S0jWcu0hFFHJ6jsZhno9rSlyGcZ0Ezz10
        tAISxa5iNeZLz6tIcx2Bw4+nfpBBn1CWFBQLqvA==
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr4125834edd.6.1642080992287;
        Thu, 13 Jan 2022 05:36:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz+FRblvd+YpkczXpBN7hT+oLurYDM4lo3dJdgM0Xz6YialsePTUBoBhaDXrvPv1Q1WUuYrw==
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr4125807edd.6.1642080992132;
        Thu, 13 Jan 2022 05:36:32 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id k22sm1182368edv.22.2022.01.13.05.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:36:31 -0800 (PST)
Message-ID: <6719ffa5-f765-6ed1-6347-6558471e6bbb@canonical.com>
Date:   Thu, 13 Jan 2022 14:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 23/23] clocksource: exynos_mct: Add support for handling
 three clusters
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        Aswani Reddy <aswani.reddy@samsung.com>, linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122502epcas5p37747b0c5c242c0571d294b9245963a1c@epcas5p3.samsung.com>
 <20220113121143.22280-24-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-24-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> From: Aswani Reddy <aswani.reddy@samsung.com>
> 
> This patch adds support for handling thress clusters
> (upto 12 CPUs)
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 5e3e96d3d1b9..ba3af940a687 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -78,6 +78,10 @@ enum {
>  	MCT_L5_IRQ,
>  	MCT_L6_IRQ,
>  	MCT_L7_IRQ,
> +	MCT_L8_IRQ,
> +	MCT_L9_IRQ,
> +	MCT_L10_IRQ,
> +	MCT_L11_IRQ,

I think this should be variable, based on SoC compatible. The mistake
was done already when adding Exynos5420 support by Linaro/Samsung, but
at least let's correct it now.

Older MCTs/SoCs do not support 12 local interrupts, so they do not need
and should not register so many interrupts.


Best regards,
Krzysztof
