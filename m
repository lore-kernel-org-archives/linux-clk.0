Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F7DC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 13 May 2022 12:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiEMMyc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 May 2022 08:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380461AbiEMMyb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 May 2022 08:54:31 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99EF5E168
        for <linux-clk@vger.kernel.org>; Fri, 13 May 2022 05:54:29 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id n10so16118611ejk.5
        for <linux-clk@vger.kernel.org>; Fri, 13 May 2022 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ASi203XoSXI2WoxDZNe0Qai/SexALG49//LisxCGVdM=;
        b=J/sb7EGCARrbZtDsH0GegRE4qukaA8jUlF26cOKChhU+9hYeea9nNLbY+2rzeVLcTR
         wWCM/ctVxh69s12hn/8eAevRtA6Hx86Tyw8PObMtglV7HelwHrnD6+dY5gqL0i7ZiqFa
         MYPr8DrrMTPMuXQtoOwdbIKHTityXO3p1wEcLc7qsraOG0oLvwzjHOlnareS/pFQlfby
         5asVwOV+dEdnY3ln4TRawGjtOLHynEKwIZZkpxg0tLO++jDyJFis0WOzJs4+WWzyoJkp
         +R+3LiyioL5RHODv6Qa8adaSEWGdqagP/5kGsZopxQmUU8GXBqo7rq9HA5HuawNLKJ2H
         1Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ASi203XoSXI2WoxDZNe0Qai/SexALG49//LisxCGVdM=;
        b=jQMgDvXm5Y0cuXSyACOtV0M43wrwqmRPcBFfJV0qRY7sthzyJgLQj1aXqIs1ubRqyR
         pUXrEfaDiSIR2fwEpCjMGt49K8nkz7mGTktJKDhRKHFTFGeMKogg4+gKOFiLsYNo+jiw
         or+ugmyPdTNmqmeeEFRdhhyv5h8KxfQCY+Gw4QAEffm+wvl6Js87jvG6UIjrOthaqiw+
         BHwmR8bXNwoEumm5ZanxHky42puZSO5Yw6eHRFbFhgyOi4EcrRHWbjqKl1NGOxES7Rwy
         cz65+4L5/K3haOTBXa4T+fDWwBm6VfAo8ruL66Godzt/S/ADp1+zzQ/aY4ytckhq1cV9
         lDqQ==
X-Gm-Message-State: AOAM5302c6BF8vfKH8rIuEVZAplCZAW0gONMLy8ObVdvVRQpJ73mfRCC
        T4wNvKSiU6+Wzi5tSLWCPHYgCw==
X-Google-Smtp-Source: ABdhPJxyJyjY5Mrgzb2B3oErKV0isHjNlbF/FWsm92BXl1E5W4ZiPVhgoPApq6bPdBu/1Eo6aCwvDg==
X-Received: by 2002:a17:907:1c8e:b0:6f4:e24f:20e0 with SMTP id nb14-20020a1709071c8e00b006f4e24f20e0mr4054580ejc.227.1652446468349;
        Fri, 13 May 2022 05:54:28 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qx16-20020a170907b59000b006f3ef214e36sm734838ejc.156.2022.05.13.05.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 05:54:27 -0700 (PDT)
Message-ID: <2945e445-3453-a45f-7d3d-3b07bf350b47@linaro.org>
Date:   Fri, 13 May 2022 14:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] ARM: dts: lan966x: Add UDPHS support
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220513105850.310375-1-herve.codina@bootlin.com>
 <20220513105850.310375-4-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513105850.310375-4-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/05/2022 12:58, Herve Codina wrote:
> Add UDPHS (the USB High Speed Device Port controller) support.
> The UDPHS IP present in the lan966x SOC is the same as the one
> present in the SAMA5D3 SOC
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  arch/arm/boot/dts/lan966x.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
> index 7d2869648050..4c09f3166d27 100644
> --- a/arch/arm/boot/dts/lan966x.dtsi
> +++ b/arch/arm/boot/dts/lan966x.dtsi
> @@ -211,6 +211,17 @@ can0: can@e081c000 {
>  			status = "disabled";
>  		};
>  
> +		udc: udphs@e0808000 {

Generic node names, so it looks like usb. For example HCD schema
requires it. I am not sure which bindings are used here, but anyway once
they might require usb...


Best regards,
Krzysztof
