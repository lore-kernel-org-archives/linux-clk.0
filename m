Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97DEC77B78
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 12:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjEDMwH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 08:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjEDMwG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 08:52:06 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B730E6E90
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 05:51:33 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-953343581a4so66805566b.3
        for <linux-clk@vger.kernel.org>; Thu, 04 May 2023 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683204653; x=1685796653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2obC0cCkbuuZfXfRaApQUsjUhYRjOVjT9ma5uBlilE=;
        b=CGgnPsWj7gT8G7a/TeYTnrfIH3GbZXAzKzl23MMuVFADFRvnPFzYGHCDV6EW588TTc
         NBC8WfsuRahYRm8RI4X2gf+uyXrI+j+qHTschHy4PaeotgnwkGI/DRmgTFVJsjW+XOCD
         7r4Fv8Vxljud0g0AWCsEfBDo/9XKvuUrqtch6A2OnMLyqre0Qqog8IpVJ7AiHL4GayIV
         VLviGVXEcTleBbbfN+5/LH7PGrTPv5PjyBmT1CNkJ27grPWohmOC7XV5VSxpJiNvqQQL
         iiBCGOs9wx8mITE9kkBgNr4TzeoEiem+9d40DWtCdkcgyImU2kOwmRIQU7L7PH09WK8k
         ShHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683204653; x=1685796653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2obC0cCkbuuZfXfRaApQUsjUhYRjOVjT9ma5uBlilE=;
        b=DbxXpSTuxU2jN4qQ41RmP3Cd/7u1qZq1Vm8Jr5lQ2tniHCBn56pOln/C57NRP+DtLh
         G6P5gC6tjcx9pPJPdYB25T+HqAZxkWw7VI+0yt9kFWbBM/PxYeX40Dr7g5aMYSvlZXEt
         hGl66tz9DZYsBK7QcJWTAkt5p92yETSnJcG8RKNpIoHM5XQ5UIZMf62h3wQb/JaE+by4
         g+nIVEl2p2ceVaw+dyFcndaTuz04mVyk/PY6Zi9bwcGOxM8f3pClO7lpiodOxvR0Qa0y
         2L0tqySs9fcKLrx6AqaVZTLxYFq7epfpZTus8Qs5oFjKxl7KSkE0pcg0oaX5atvWGTl7
         KVzg==
X-Gm-Message-State: AC+VfDyoPutGLPhmbGhbvL0uiLGbH5XMGt5xSbkxXnwgfaYt/xjQk5QV
        v9ZMqWmdW32aNQjcF3F+fIuCMA==
X-Google-Smtp-Source: ACHHUZ4p5/ZI/MQhoR/P1zQKgfq+Cw+kXOWRIR8givCmU3e+NL2+9TtXsspQiz2YNPuMLAIm9b1HRw==
X-Received: by 2002:a17:907:1c21:b0:94b:cd7c:59f4 with SMTP id nc33-20020a1709071c2100b0094bcd7c59f4mr6549002ejc.16.1683204653018;
        Thu, 04 May 2023 05:50:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906504500b0094f124a37c4sm18826340ejk.18.2023.05.04.05.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 05:50:52 -0700 (PDT)
Message-ID: <7f9f991a-fa56-2f65-293b-bd0ec5d07c40@linaro.org>
Date:   Thu, 4 May 2023 14:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/5] dt-bindings: clocks: at91sam9x5-sckc: convert to yaml
Content-Language: en-US
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230504060729.689579-1-claudiu.beznea@microchip.com>
 <20230504060729.689579-6-claudiu.beznea@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230504060729.689579-6-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/05/2023 08:07, Claudiu Beznea wrote:
> Convert Atmel slow clock controller documentation to yaml.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  .../devicetree/bindings/clock/at91-clock.txt  | 30 -------
>  .../bindings/clock/atmel,at91sam9x5-sckc.yaml | 84 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/at91-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/at91-clock.txt b/Documentation/devicetree/bindings/clock/at91-clock.txt
> deleted file mode 100644
> index 57394785d3b0..000000000000
> --- a/Documentation/devicetree/bindings/clock/at91-clock.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Device Tree Clock bindings for arch-at91
> -
> -This binding uses the common clock binding[1].
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -Slow Clock controller:
> -
> -Required properties:
> -- compatible : shall be one of the following:
> -	"atmel,at91sam9x5-sckc",
> -	"atmel,sama5d3-sckc",
> -	"atmel,sama5d4-sckc" or
> -	"microchip,sam9x60-sckc":
> -		at91 SCKC (Slow Clock Controller)
> -- #clock-cells : shall be 1 for "microchip,sam9x60-sckc" otherwise shall be 0.
> -- clocks : shall be the input parent clock phandle for the clock.
> -
> -Optional properties:
> -- atmel,osc-bypass : boolean property. Set this when a clock signal is directly
> -  provided on XIN.
> -
> -For example:
> -	sckc@fffffe50 {
> -		compatible = "atmel,at91sam9x5-sckc";
> -		reg = <0xfffffe50 0x4>;
> -		clocks = <&slow_xtal>;
> -		#clock-cells = <0>;
> -	};
> -
> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
> new file mode 100644
> index 000000000000..62660c823ea1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/atmel,at91sam9x5-sckc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes.

> +
> +title: Atmel Slow Clock Controller (SCKC)
> +
> +maintainers:
> +  - Claudiu Beznea <claudiu.beznea@microchip.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Drop items here.

> +          - enum:
> +              - atmel,at91sam9x5-sckc
> +              - atmel,sama5d4-sckc
> +              - atmel,sama5d3-sckc

Keep order by name, so 5d3 and then 5d4.

> +              - microchip,sam9x60-sckc
> +      - items:
> +          - const: microchip,sama7g5-sckc
> +          - const: microchip,sam9x60-sckc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    enum: [0, 1]
> +
> +  atmel,osc-bypass:
> +    type: boolean
> +    description: set when a clock signal is directly provided on XIN
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

put it after allOf, just like previous patch.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,sam9x60-sckc
> +              - microchip,sama7g5-sckc

Drop this one. It's not needed.

> +    then:
> +      properties:
> +        "#clock-cells":
> +          const: 1
> +      required:
> +        - "#clock-cells"
> +        - clocks

Move these to top-level.

> +    else:
> +      properties:
> +        "#clock-cells":
> +          const: 0
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - atmel,sama5d4-sckc
> +                - atmel,sama5d3-sckc
> +      then:
> +        required:
> +          - "#clock-cells"
> +          - clocks

and drop these required... but this is if-within-else. Very confusing.
Which case you want to handle that way? So other compatibles do not need
clock cells or clocks?


Best regards,
Krzysztof

