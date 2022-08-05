Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756E5C25B08
	for <linux-clk@archiver.kernel.org>; Fri,  5 Aug 2022 09:17:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240445AbiHEJR0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Aug 2022 05:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbiHEJRZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Aug 2022 05:17:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133D512089
        for <linux-clk@vger.kernel.org>; Fri,  5 Aug 2022 02:17:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id m22so2565684lfl.9
        for <linux-clk@vger.kernel.org>; Fri, 05 Aug 2022 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=+CMoiOvoALqtlN1eR5gWn8reZtPiBx8t9tCsPV6Dp58=;
        b=OKPNxIev9fG8WJRrJTmLx6z+KVrASNdQbVsclsUZHhIMbt0Mn3Yz6p0XqWv/1gfN4h
         ShtELN23qN9RTsWiGXfiT+LPfD+6jhO7t3AJvkbaZOrwt6pIO5Wt0bDcYs1QHMzDnZ6a
         3LaaBh3Gm6DAclxUyKW6hKCAWgrHfC0aE9XBYc6aFnd+h1S6njPln/RPG92ZPcx3rW+A
         ZVcm7xXu2y0yaHUznvBOtIQTtaF/ck8I4epvOxXDrwOfISXtCKWoMDuAuV1Z8pxMOZZB
         0EBKItKsFEvVvmNaug52ALhoS4R2vfycAtS1o2QOaEuIWEs0qQqd/zPI1gGTyNepOcjl
         1yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+CMoiOvoALqtlN1eR5gWn8reZtPiBx8t9tCsPV6Dp58=;
        b=W+mrYiKrE+SBUea/+rjS9QZNjffY9cnE1VkGZfy4rHwzhCqRQCchz96taV7Z3/V4lQ
         FPyWzy7kGZEmntpEPeThNc9M1ScLZ/iNNilHrGlXLMKxnmc1ckBpqLyYDoAyf/3/5rjU
         bKXKFUGvcffPg0Rx+spjmxFmQ65+6wP55fsPCbWmBx4DHdmZ0sUh2snPGZPyLBglz0Go
         Y7QqL/afvM87ChE0ISI0gJXURUoiRYLinFgCRu6EBDtmGUU/r+NZVYaee9T2JewhAizg
         YCAtz+VBDsQdhoyAWdDPxia556XwdWWfNKnvcbCd0AYXnSfaT7zKzwynhlj+/ru2XZrG
         accw==
X-Gm-Message-State: ACgBeo0NaUfeA9AqrGnp2N1u2/lSkHifBg98T/OZoBjzr5tb4iBS5BB6
        X2GDam6bITvBR19+rgQVbaOAyg==
X-Google-Smtp-Source: AA6agR5B0PGL1bwVhuuIxkORg7wFZpXdetwZm595Mjcarj1SUuhQgmBMgOGGJ4/tduXpC+CTDAbqVw==
X-Received: by 2002:ac2:4c50:0:b0:48a:f0f4:9dff with SMTP id o16-20020ac24c50000000b0048af0f49dffmr2229390lfk.318.1659691042476;
        Fri, 05 Aug 2022 02:17:22 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id i3-20020ac25b43000000b0048af3c090f8sm409012lfp.13.2022.08.05.02.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:17:07 -0700 (PDT)
Message-ID: <19654574-bdc0-9fa5-6465-fc88b20e20c5@linaro.org>
Date:   Fri, 5 Aug 2022 11:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock controller
 in DT
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-3-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805085716.5635-3-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/08/2022 10:57, Yu Tu wrote:
> Added information about the S4 SOC PLL Clock controller in DT.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ff213618a598..a816b1f7694b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -92,6 +92,14 @@ apb4: apb4@fe000000 {
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>  
> +			clkc_pll: pll-clock-controller@8000 {

Node names should be generic - clock-controller.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof
