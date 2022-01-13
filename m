Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7389DC4321E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 13:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233486AbiAMNcT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:32:19 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52942
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232034AbiAMNcS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 08:32:18 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 499703F1E3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642080736;
        bh=t1fGsqpmZOTRML60TK0WG2DkdgMd68nNzRyjYpnjGrc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=q4U947S+xXjiVgn9EudUGrn1j1lymfHBpYvE2I+4pMMHnN8xEnQof/YDWAym4QN7Y
         ILYs9GV1KVK3jL35L9UzE9WXzcJzUMpFGwc1Qlw34wivqTK3ufPu5Voj9qTmjGp7xo
         AVVHAvDm8QqRNM2hnzJ/dKkceIF95gi0D+BNzWAS4eODfUkqQoFcRAYL1iBUlNVMw3
         GIeJ5HaBygClwrC41ZtjU+VkvYf6h5qhmnPSPxBJtfnQjkK0mZxNw3N4kFVJQvX7rA
         FVg2BX7bxtJSYK0XqTYyz7nkiOxS5irGAwqm2wt66giN0AmOQJMTtWos8PUIPrHfix
         bF/+UWKrRJjxw==
Received: by mail-wm1-f71.google.com with SMTP id s190-20020a1ca9c7000000b00347c6c39d9aso3617314wme.5
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 05:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t1fGsqpmZOTRML60TK0WG2DkdgMd68nNzRyjYpnjGrc=;
        b=toJgJ2v/xsP5iOnQGopU18eBbqTSqAQZA7n4z1h7W5/aDjt9fu2AztXAyo/uteUjD+
         8ICseXXgXJkPoqn3MlZ2Z2Hgb44KcC8/85ud6cfopwLDsWLKP43marpDD85vDA5bUk50
         6Qz4QCewI7+UYNo7fUTbYnbtA3MKByXOO15imfg12XtXFQGALPqBQ7hmpWM9HjWBnU2M
         c41Pbbob4eK5sd0ND6g39xNLJ9xVolLbMNB9x1nMO3EH+86YzcMwMSGs+UVoZnPiCOwp
         sy141yfJOsoiT5DgYqkxQnrcsH4fA9z1BYWh/gSd3VCGvR/mXRUmnHhJadExIpNTa5vv
         l2Pg==
X-Gm-Message-State: AOAM5313R3ZbtXRdbphVLsMA5MxVCGyw4ZpN2WUy+mru80lDAedCarf2
        yjVN0Y4tUSsTC20HOBmpNixB+9tDT9xJL8aVNybkKXCLyze5IuEtdU76Of2dzq/1bHymgKGUPP4
        8m0sq0vWNaY60LYFk7lrYK+EzFTn2X75Crs+fBQ==
X-Received: by 2002:a05:6000:18af:: with SMTP id b15mr4109167wri.616.1642080733759;
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGbdSMulTQPsY60UuoLAuZAuY6P+aX+jB+ZR3YiMMLRRXKaWDybBcgGidUepwKg+fmquMeJg==
X-Received: by 2002:a05:6000:18af:: with SMTP id b15mr4109138wri.616.1642080733499;
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h10sm3615799wmh.0.2022.01.13.05.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
Message-ID: <75ae8b8c-e416-5007-b995-f1317ef207d4@canonical.com>
Date:   Thu, 13 Jan 2022 14:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 20/23] dt-bindings: iio: adc: exynos-adc: Add ADC-V3
 variant
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Tamseel Shams <m.shams@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122447epcas5p266d44c8df143229d22dfa700c285a786@epcas5p2.samsung.com>
 <20220113121143.22280-21-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-21-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch adds a new compatible string for exynos's ADC-V3 variant.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 81c87295912c..9303053759ca 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - samsung,exynos-adc-v1                 # Exynos5250
>        - samsung,exynos-adc-v2
> +      - samsung,exynos-adc-v3

Please use SoC-specific compatible. IP block versions are tricky because:
1. Documentation/datasheet mentioning which SoC has which block version
are not public.
2. Neither are public the datasheets for ADC blocks.
3. The versioning of IP blocks can be inaccurate.


Best regards,
Krzysztof
