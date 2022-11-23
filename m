Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5199EC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 10:28:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236480AbiKWK2b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 05:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236091AbiKWK1Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 05:27:25 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2639B13C716
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 02:10:28 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id q7so397673ljp.9
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 02:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqJl1+6YGIooPA5RyCLFMiFhceaRWa4Nlh5Xn0glHTk=;
        b=JH7kpmAlHqFLEvsthwrLXnmFxxjht9kdZM8X5XfWaeEbvoyTx+CqYnZSYxYvuiemN1
         ZPby/Pq4iVzH3CTDRma1EBFYd5IRVOKYJhQPUwpI4Vh1THFJHP0EngW+4pe2aRIpVpj/
         4BZ2hugDECFImf/7nKc7qMOTL0DDP+OpoDkjtY5XEYUf9Zyd6BvDZNp/DsPnnBVeYE56
         vlE0ih1XjONPjhpyGMIRex/dPSNHCeywzGgMaoksmOzNrWudhPGUhyONPfvL3uBUor5Z
         LNEWzGt64TKRf1q7WDtUgMPihWdEpa0ADL/QI3SOZPd2+1L7p4UCwSvvaAG7UYhZ7NwZ
         nGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqJl1+6YGIooPA5RyCLFMiFhceaRWa4Nlh5Xn0glHTk=;
        b=FZrmwUDE/Zrn1TPQTNRGb+zhK8JZMHcYvNUQ2q1e4TBU0C+TOVRx4FmV5/3/5JbQzB
         QZNqQ1eLY5I+uz6Xk9Mq5I9pnCEASdnK8uRtekMp7LNvn10zUMmDss1Vy5KVgP/2f37D
         CjbxfSk3CIjtJAS6+1IixYSoLBwJZq9qe5A4bWt2FudICzwVLOWfAOYYWytoMet9R1nM
         7WvcNiiJ1ZIIZxyLkGHUJRlMGdzZofGeaLTr2bA1jr7ees79NqKrMtP1uIV2lGen3Opr
         z0IWHtG9erhIpZymAtkwO4GZiBQVkSrWb7r9hOoaoviCdG8ureERZ+fr5+KY44FjfjOl
         mvbQ==
X-Gm-Message-State: ANoB5pkv6kx7YKQX88r/kF4gjYxx+S0UtYTLY+8uAhqDJCDI3D9npS8c
        wCZ9ivvtl60ExBVhk+HTikWNWA==
X-Google-Smtp-Source: AA0mqf6XnTP7DKHANKMnVZVz2ILRp+dyk+l4bhA9ENXc6MSPSOQqM8P2qEVwUWegdewfNZkbnQ238w==
X-Received: by 2002:a2e:b5d4:0:b0:279:5fa:8e7c with SMTP id g20-20020a2eb5d4000000b0027905fa8e7cmr8382761ljn.62.1669198226494;
        Wed, 23 Nov 2022 02:10:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s14-20020a2eb62e000000b002772414817esm1429030ljn.1.2022.11.23.02.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:10:25 -0800 (PST)
Message-ID: <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
Date:   Wed, 23 Nov 2022 11:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123021346.18136-5-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/11/2022 03:13, Yu Tu wrote:
> Added information about the S4 SOC Peripheral Clock controller in DT.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index bd9c2ef83314..e7fab6e400be 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -6,6 +6,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>  
>  / {
>  	cpus {
> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>  				#clock-cells = <1>;
>  			};
>  
> +			clkc_periphs: clock-controller {
> +				compatible = "amlogic,s4-peripherals-clkc";
> +				reg = <0x0 0x0 0x0 0x49c>;

This is broken... did you check for warnings?


Best regards,
Krzysztof

