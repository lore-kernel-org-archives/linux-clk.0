Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4596C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 13:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiAMNde (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:33:34 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52988
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232075AbiAMNdd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 08:33:33 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B56143F1C5
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642080812;
        bh=2AZxHTRlLvm3ZGGogebXDNWe5vJdA0bdD7/jvlL6me8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=i1B/S4cEE2kEQPo8sUjndaVgWCZErCjOLOILk8oFmhGTfs5vM14aIBDfhBQ/QwLq7
         mdPVeWiwzU6UWZOCde04d0rIbTs4Kj3MqOrGL2gpE/YxzAPyS1e6wMjWLfrA4t1bpB
         /UKeKstMtL6TU/YNHZPN0oPaM5Vcaiuo89VS9kBm5BIKUM7pBptkulnm+MJORD5ypy
         O7oXXj0lWvim2lOb0Ar5fvhP3rCwaHYei9Bpl/s421TksvX7TKgBk/eiRkPaY7lmkv
         kk4WoE/ISFkNtOHC7WVWXegAIBLxpKW/UIjTQFrZdRGZAnkhG7kEp3c3ZR/ffbux0f
         qpe0c+G23VdCQ==
Received: by mail-wm1-f69.google.com with SMTP id n25-20020a05600c3b9900b00348b83fbd0dso3621944wms.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 05:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2AZxHTRlLvm3ZGGogebXDNWe5vJdA0bdD7/jvlL6me8=;
        b=NwxfXqrhzN1SCZb2nTjOpVlqJ2g0B6k6G80oolVYiEUTwyC3eoEC1UxRrUTB7FGupg
         bwXIK9XNu6A4UcWbgQV+0B/X8/x+jz+Od2FVD9vfR5bQBDj0KfUp5kecBUl6V5cl+/eh
         C5WxTtXDHuo1psYG+NYoNarqDMFYWfE6k4j/W4mGLRD03bB8MIcJSmwk4mxL/isTETqG
         hKzktFc5JDY+PhUDRe+aRoRCMdXDwdRLEah7S+46aIR6g9z64EbYfBNId79f3c/FcgLL
         Wisn73qKDmeWwK0JocTlfR81nBq9CemmN+F7P8EF+yxDWKzACQYpYaBtwblNdq6AG01/
         cDtg==
X-Gm-Message-State: AOAM530q/ZIK9uy3XX2lD9Pe8CyY9U3zIBu4NZpbi53CTMncXR+FLl9u
        pNFFjGqVUn4yjJ/RM1FJT2xfpnLsFZfbnLlePUaf0yLL6NuLjqgDioscMgnylZ6vL1GrV2TMNkj
        M0VLppSU9CJIlKoN58o3saOAbdDwfi+C0gbTgIg==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr3999426wrs.510.1642080812442;
        Thu, 13 Jan 2022 05:33:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4dIKRpTtfD07xSz5+2nbmXQZf2eX9cv3ujygsjXdEyYvntQPkXEKJq+e836RN3/ma2EAGLw==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr3999404wrs.510.1642080812290;
        Thu, 13 Jan 2022 05:33:32 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id a2sm3542426wri.17.2022.01.13.05.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:33:31 -0800 (PST)
Message-ID: <7431da93-d3df-9c32-f614-0b6c95ed016a@canonical.com>
Date:   Thu, 13 Jan 2022 14:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 22/23] arm64: dts: fsd: Add ADC device tree node
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
 <CGME20220113122456epcas5p35f6406ab03af58d2e56b0b7304d4d002@epcas5p3.samsung.com>
 <20220113121143.22280-23-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-23-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch adds ADC device tree node and enables the same
> on fsd platform.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd.dts  |  4 ++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi | 11 +++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dts b/arch/arm64/boot/dts/tesla/fsd.dts
> index 7f3bb6212e50..dd6c75fc3221 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd.dts
> @@ -150,3 +150,7 @@
>  &spi_2 {
>  	status = "okay";
>  };
> +
> +&adc {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
> index 7e687c6f74f6..058a9d381aed 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -788,6 +788,17 @@
>  			num-cs = <1>;
>  			status = "disabled";
>  		};
> +
> +		adc: adc@141A0000 {

lowercase hex numbers please.

> +			compatible = "samsung,exynos-adc-v3";
> +			reg = <0x0 0x141A0000 0x0 0x100>;
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clock_peric PERIC_PCLK_ADCIF>;
> +			clock-names = "adc";
> +			#io-channel-cells = <1>;
> +			io-channel-ranges;
> +			status = "disabled";

This does not pass dtschema. NAK.

> +		};
>  	};
>  };
>  
> 


Best regards,
Krzysztof
