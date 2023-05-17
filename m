Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06214C77B75
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 14:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjEQOWD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 10:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjEQOWC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 10:22:02 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A6C40EB
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 07:22:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso1463231a12.2
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684333320; x=1686925320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONuJY2KtI2KHJtsYCPsFhw7heZvdRq+s7WoctleT5QQ=;
        b=mxoDAeCr+NxZwAyQdXIKhSX/7OYByY9p0AlLZp6EEQ/WLcZBbQjkLeIx1CW0kMhhd2
         i5OeoqfV9vTiuN0Y6w4Ie1eGulLIO3uu8Cl/66c9O7Yi8VOfRty/V50nVSZSBjFG8I2b
         nCSOgHMax5X6f7Gx8tQgmhFEvIDVzOUtfh2CdMXJk3oNZFrNPVGNWrIYO2dDeuv2TG79
         XZjW76uj/jCOBLyeLqSqi+XLg8TNGa0Sm1mBoRR/kLMJdJqqBJRt5hhCg+8Wt9zqzppV
         ai/0ait6TEoBeVPYcldyeTntoxu4a6oC9HEVbu2AWHmZojpQkf1I1DxY8ZjyQ0jcV1p7
         aqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684333320; x=1686925320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONuJY2KtI2KHJtsYCPsFhw7heZvdRq+s7WoctleT5QQ=;
        b=hGyMOI4c3iPPDvoCT8i/U3xtBihVlwsETssaziRC/GrNTUraC08y/8IbJ48Tur755b
         00Jbm/DyVWfSdlZC5F5UtvMsJmjYLgFwzKK2IwS0jve+sbVN8GLgBBcfjr2XKvE+UrKm
         XZvPDCXe5AWPHL4Q2qXYUrmZwGH1YkHkXTv3qt5QgK0k3T/Errcmj51LoNa4qJ/lq9N3
         UEgktt94pb8g/CLslWC4K3KU+wUCgFQBMEl9kie9X55ZaxFKrWb+p8bLkKxlTzy2pYDJ
         wWSJX8k+4o36N/ZsgAOeXcES6jtXgaA6Lh+862iliE0BwJjIYIM/Bv96jyQl6O2Ajf9T
         /2uQ==
X-Gm-Message-State: AC+VfDyOb06vhRMo16w0zzW6YZCJQw9JGCB43ElHjAk5xgITrKuk7Ijf
        EEWRthYC7gl2zS0pqR86+CFpsA==
X-Google-Smtp-Source: ACHHUZ5OJ/YLytKU3bCRqMPBudelHZ3QHoMBNuG0N9S8Ng5wRUmLHpOMp0yEFnGPVTQTRkijdezw5Q==
X-Received: by 2002:a17:907:c1e:b0:94f:250b:2536 with SMTP id ga30-20020a1709070c1e00b0094f250b2536mr39106884ejc.28.1684333319732;
        Wed, 17 May 2023 07:21:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id ks16-20020a170906f85000b00947740a4373sm12136992ejb.81.2023.05.17.07.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 07:21:59 -0700 (PDT)
Message-ID: <83f484ff-f170-6f32-f4b4-9743eb6d0b4c@linaro.org>
Date:   Wed, 17 May 2023 16:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 2/5] dt-bindings: clocks: atmel,at91rm9200-pmc: convert
 to yaml
Content-Language: en-US
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor.dooley@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230517094119.2894220-1-claudiu.beznea@microchip.com>
 <20230517094119.2894220-3-claudiu.beznea@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517094119.2894220-3-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/05/2023 11:41, Claudiu Beznea wrote:
> Convert Atmel PMC documentation to yaml. Along with it clock names
> were adapted according to the current available device trees as
> different controller versions accept different clock (some of them
> have 3 clocks as input, some has 2 clocks as inputs and some with 2
> input clocks uses different clock names).

Thank you for your patch. There is something to discuss/improve.


> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - atmel,at91rm9200-pmc
> +              - atmel,at91sam9260-pmc
> +              - atmel,at91sam9g20-pmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: slow_xtal
> +            - const: main_xtal
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - atmel,sama5d2-pmc
> +              - atmel,sama5d3-pmc
> +              - atmel,sama5d4-pmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: slow_clk
> +            - const: main_xtal

This and previous if, should be squashed. You have exactly the same then:.



Best regards,
Krzysztof

