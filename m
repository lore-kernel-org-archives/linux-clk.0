Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16AAC001DD
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 07:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbjFXH74 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 03:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjFXH7w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 03:59:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B162944
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 00:59:44 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98934f000a5so160864366b.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593583; x=1690185583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTjB3MUThuy0fH56tPu8r2SapKpsQyQgWZ4G2iu3Iz8=;
        b=HEwevcjVQu+8yO3NUrkkTGxP0CcIpGsLiEQXCTRo3UkbkAEAAtNC0UlY9ftejwavbS
         WPfQTRQVl1GcrgXT/jwnimlNGGTxk1BasUFrZ0+zaXN90t4zsCJHF8eP/rzPh9y7q75O
         DrmxzN2V5bro/a7Yjn2JaR+shcHxeMnMBPEOsxKHS90sJWabsHm/pELi2kj5UnO7u9RD
         LnX93Xk9EYFZE7c3mDCbNFjt6xfev1h30nRmSxtXhBhzhBmUqIahBD/KcUlZwriKT34w
         oFkzPzPGaxAQxWKiI+DomOOYGd+hKHvLudnuiUccthDx082FzhV3uj+CPG6toFmF8/Bz
         rhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593583; x=1690185583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTjB3MUThuy0fH56tPu8r2SapKpsQyQgWZ4G2iu3Iz8=;
        b=Smnm1THzKnHkt+8doOe14eBj2BO3gKZdp4W00rEf14BeOIL3wzsIKo5oMwu96GepUu
         XwR1vWYOnhN8XrqEzlAVRfnwfgEwUPL6PrTF8lobn/PPNYD1NJzp0pWo4socQr3o1JPZ
         j8qHqKPM32Xa+pLbkOoJjhglZONiAdd8Ng5kKf6qRRBlJpkyBqk2HXk2JHg5IGUWcTE+
         bgHZi9cAzKtEw6kOGZDhOzBvdFf063hXTbwifFtqmTJTkrku5nzyZBWvQ68Mf5t55n2e
         /VxIRrlz6+eQImnqqXncqkm3JXK7zzS44UaY7tUBJPA7FKqpqWsvb6Wxrzdpct8OY0T1
         4HlQ==
X-Gm-Message-State: AC+VfDzMs+W5P7HOika49kBTmSaMShaQPlXh4v4Kt47gSs2ST3o8ha4u
        FWuQMv9dEkl+emlbPZXq7zb4wg==
X-Google-Smtp-Source: ACHHUZ5pRd8UNSYc52Q0vkUp3nRCIrlMv+cEYLJxjAGxSYuFwmJusDkYkiVv0idqnJteffrCHMZ8Sg==
X-Received: by 2002:a17:907:783:b0:988:dced:f339 with SMTP id xd3-20020a170907078300b00988dcedf339mr12750156ejb.31.1687593583035;
        Sat, 24 Jun 2023 00:59:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t23-20020a170906179700b00987f64b84afsm597458eje.39.2023.06.24.00.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:59:42 -0700 (PDT)
Message-ID: <7c0025cc-ed36-f4e1-d48d-d09326756d89@linaro.org>
Date:   Sat, 24 Jun 2023 09:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 16/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel TDES
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        olivia@selenic.com, a.zummo@towertech.it,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
        horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
        andrew@lunn.ch, alain.volmat@foss.st.com,
        neil.armstrong@linaro.org, mihai.sain@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        balamanikandan.gunasundar@microchip.com,
        manikandan.m@microchip.com, dharma.b@microchip.com,
        nayabbasha.sayed@microchip.com, balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-17-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-17-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add DT bindings for atmel TDES.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml   | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> index 3d6ed24b1b00..0e71bfd32a1c 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-tdes
> +    oneOf:
> +      - items:
> +          - const: atmel,at91sam9g46-tdes
> +          - const: microchip,sam9x7-tdes

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.


Best regards,
Krzysztof

