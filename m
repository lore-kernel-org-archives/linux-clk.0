Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2C5C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 30 Mar 2022 17:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245162AbiC3RaL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Mar 2022 13:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349280AbiC3RaJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Mar 2022 13:30:09 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF7054682
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 10:28:23 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bi12so43016785ejb.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZsXgBTrCuEUxC1QZQ0H2Ukv1GeSn41ah9SOqQNdPE7M=;
        b=oJLD1USfQGNXmh8umJRilraVZc9jthngKtOn/GdB9lcFP3jbqhtVZWPFPC0D62l3hw
         vLWXTeE6XRN6+SovH0Z9z2ecTReOxQ4+G8nEGQQDVSoaVNW//uuDDPw+neLNdqvj9pwe
         6beKe54sSMzYbbv5rc71eNK7uysO8puaSwRrK9QEL9I3lX+Eisv56ALY3v/+Iyqn3lJg
         ot4ahZJCAB4UBAj3+qjybA0iEGDuNmb58m2Fblw/umLLrf55Doi0thEfBiCOQH4VEcKO
         c0X+dTBxUWqw3dr2RC0ezjxvmiWGzUmIO+VB+D+om6vZ6KqzNECf95GYg56DgCpihm0S
         n2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZsXgBTrCuEUxC1QZQ0H2Ukv1GeSn41ah9SOqQNdPE7M=;
        b=0e59kCrB4aN8jjY/93dzMbKRFKyvsnvnbV5pk08VOBC1smhSziiF27sGaVYk4XJkZ2
         oE0u2TUF3mQuC1fjrN0UAOn/p/kp2KKQjM7rRG0uLcT9y4/bSltJAdemnGgXCtbAXApH
         nzwEoUWkvOOlUrp1U8owp/BEsT9JGPWeMiksEwcXobwzp87N6sLNkvHIQ9Fm5Rcs3+dn
         C5w6BmNOvZkt4OEW7ZvFcvYZjPFsm86/7u9WRqQwrQ3Zq65AvUYYrTodMSHs7DfVaSIP
         XG0kyLNutPuKJ+U8vS9ZkVDJ9Lqzh9y0bCfgyGe3zbreCX80d8yTY1/UYCHI8FUfjma6
         uDnA==
X-Gm-Message-State: AOAM530aK3pDDEGj/mKWn5td3NohlTLXz/vjkbvRVXefkmTGrZdtwlY7
        rwCgb0WhJMpvQgaksumDf8h3Lg==
X-Google-Smtp-Source: ABdhPJwAF/kWlcbyw+AnOhkeZyWbHk5sSJiKV2D52eeGBittR1aJjyH4YGKCBAWEytDCQ4+LdVuN6Q==
X-Received: by 2002:a17:906:9c8e:b0:6df:f6bf:7902 with SMTP id fj14-20020a1709069c8e00b006dff6bf7902mr631908ejc.191.1648661301916;
        Wed, 30 Mar 2022 10:28:21 -0700 (PDT)
Received: from [192.168.0.164] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ky5-20020a170907778500b006d1b2dd8d4csm8521852ejc.99.2022.03.30.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 10:28:21 -0700 (PDT)
Message-ID: <faee52b3-6d43-dfe0-500d-2fae70fe2fd9@linaro.org>
Date:   Wed, 30 Mar 2022 19:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: convert
 rockchip,rk3036-cru.txt to YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220330114847.18633-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330114847.18633-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/03/2022 13:48, Johan Jonker wrote:
> Convert rockchip,rk3036-cru.txt to YAML.
> 
> Changes against original bindings:
>   Add clocks and clock-names because the device has to have
>   at least one input clock.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/clock/rockchip,rk3036-cru.txt    | 56 ---------------
>  .../bindings/clock/rockchip,rk3036-cru.yaml   | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036-cru.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036-cru.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
