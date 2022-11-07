Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B68C43217
	for <linux-clk@archiver.kernel.org>; Mon,  7 Nov 2022 18:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbiKGSY5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Nov 2022 13:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbiKGSY3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Nov 2022 13:24:29 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1A128E2A
        for <linux-clk@vger.kernel.org>; Mon,  7 Nov 2022 10:24:05 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id l12so6797959lfp.6
        for <linux-clk@vger.kernel.org>; Mon, 07 Nov 2022 10:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/+DmlpUJNQ6H+y2+hAk27Zykcqu9Cxop/8nW/tfq8o=;
        b=YM6wEP8D2ic+78mnkgabgCawUWu5PRsEDd33Uz5A4ygUYI7EaV1pBVoNegOluHeRBP
         cpj54KXembu+3W9hDl8Qyro7au79xuQTxdiq6zb58BMrvmw4tzlESZVBcOZ5m3S7FOmU
         SB8wdGGh7d+J47isBugbdpZrCno3LYjdZ5IUiwRQgUEr3rY11SkXAo7RikONu9QnX1vI
         HU5YAF3KGAV0c51lqPbYeSrW/SOu7vO7uc9C9PnS8HamJQxPT3KOAS47YGutU11oBIeR
         fPpPsCH6oP+s8yO3U2EmoHtmH4C3H52m8SAhIKzEd3ZCgijel+Yrtlc/STylA8BJbvK5
         3/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/+DmlpUJNQ6H+y2+hAk27Zykcqu9Cxop/8nW/tfq8o=;
        b=ZvXGlIiPmm+sDM7ppsOPpYZ2Ak8N0YsKMqO73bkl5A2Xmh8b4i4OcQNL29IkQI6GGx
         pQO9ROSpUTBYkbdfrjXXvXbJjw2+bYZtkjpFXCt+D6aib234JhoGabd6wbCR79Fc46Vt
         lEjv9D6QG4p49RVdGbmiBqSLvdk0dxwVgLG1dbDu7p1Oppo2Y/cMYnh9InA4L1CzDR7l
         RVa5hQMC+42fD82suKHKPUxY55TAEyyaVHoSAi4RUoOdgK1gKFkpLcU0R5ol2gM0JPYR
         7oOMIwhTcoM8d8JwsO4dR54OSAZpGsTxpc1L0bg6kGDESjGnKChG8xVcbneZnBNa8QqB
         OLNg==
X-Gm-Message-State: ANoB5pmDVS8nHpZJdieB3rOo7Z7kLziiS4pzU/TaPzjhRtxx0zh0XA8g
        evIHsvR/bpctupgp8c9lEv3xEA==
X-Google-Smtp-Source: AA0mqf5uwcpb6dUhKs4Vhu0uRUXiku2hqbfLgAsSVoGqbFd7CA76YcTVc/3qG22gp+wuXsTzA+O6sA==
X-Received: by 2002:a05:6512:374e:b0:4b2:c8b:7a66 with SMTP id a14-20020a056512374e00b004b20c8b7a66mr4976348lfs.498.1667845443689;
        Mon, 07 Nov 2022 10:24:03 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id q23-20020a19a417000000b004ab98cd5644sm1358051lfc.182.2022.11.07.10.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:24:02 -0800 (PST)
Message-ID: <c10df12c-ccb9-03b7-96be-1aac5feee1aa@linaro.org>
Date:   Mon, 7 Nov 2022 19:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/7] dt-bindings: usb: add the Renesas USBF controller
 binding
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221107135825.583877-1-herve.codina@bootlin.com>
 <20221107135825.583877-5-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107135825.583877-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/11/2022 14:58, Herve Codina wrote:
> The Renesas USBF controller is an USB2.0 device controller
> (UDC) available in Renesas r9a06g032 SoC (RZ/N1 family).
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../devicetree/bindings/usb/renesas,usbf.yaml | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,usbf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbf.yaml b/Documentation/devicetree/bindings/usb/renesas,usbf.yaml
> new file mode 100644
> index 000000000000..f2b146d9d37b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbf.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,usbf.yaml#

Filename based on compatible, so renesas,rzn1-usbf.yaml.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas USBF (USB Function) controller binding
> +
> +description: |
> +   The Renesas USBF controller is an USB2.0 device
> +   controller (UDC).
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:

You have only one possibility, so oneOf is not needed. Unless you
already predict it will grow with new incompatible lists?

> +      - items:
> +          - enum:
> +              - renesas,r9a06g032-usbf
> +          - const: renesas,rzn1-usbf
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Internal bus clock (AHB) for Function
> +      - description: Internal bus clock (AHB) for Power Management

Blank line

> +  clock-names:
> +    items:
> +      - const: hclkf
> +      - const: hclkpm
> +
> +  interrupts:
> +    items:
> +      - description: The USBF EPC interrupt
> +      - description: The USBF AHB-EPC interrupt
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +
> +    usb@4001e000 {
> +        compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
> +        reg = <0x4001e000 0x2000>;
> +        interrupts =

No need for line break. It's not helping in readability.


> +            <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +            <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&sysctrl R9A06G032_HCLK_USBF>,
> +                 <&sysctrl R9A06G032_HCLK_USBPM>;
> +        clock-names = "hclkf", "hclkpm";
> +    };

Best regards,
Krzysztof

