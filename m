Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FADCC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 11:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244906AbiETLke (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 07:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348672AbiETLkS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 07:40:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C79B15BAFC
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 04:40:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t25so13841244lfg.7
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QjR0cp2E5WyeJeKKWqWkDDhLDsPyWHtfSubP9NbP2ok=;
        b=z7lXIzJipVL1DFjw5V22zxLyciQIqvoAMmbg7hOziOU/QJtn/Nn4BjAJy9G7UPMOIf
         D7AWXzPpElU4KE2dkNShGr9iIvKaCppr/JYmr0r/qikXKmYBakV0eJnI1GKEF7g2kzX+
         b0LItq6ahMXGbM0j2IVXIz3+apmqY58odUSjsuL5re7vuegzZtE+EQx6i54tzzbW5QFa
         z3j4kGhZc3PBLXDk8ksG8NfkqkMdoNGtZkSE7CQOegiIaPLpqVT7R8kSwooxKFS3mfMO
         etHmBxh7C7+TisQCkjLaUb9MvkdyI/LDulCohSLfDIdjvBUNSNCiAqhg76F+vVrNGgO8
         5wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QjR0cp2E5WyeJeKKWqWkDDhLDsPyWHtfSubP9NbP2ok=;
        b=McmZlCHM8ZbE2WyquSrdY4LzRJIY0hmI7EjeVHI4Y9kOAbq+enHD5VNkmW4ypWlE2z
         Xyyw2eIwDWKBAAbLvR//kKah1aOeydUFPrC2z0NubAzwA6bhLmPbbz8ZRxrJ8q54wnec
         nJXU/v0EPbto/vk5A62Tda+GwgbCrShcjxQfyHDTbMQrLhuTy3ObkY8vsFRmqyzS8M6M
         amNZKFWprcmqMGrrvrpztM+pG7QO92AMQNJAPSxxvipTyPd0XgcRpXPuWFv/+OWW2Rk6
         +DofBKy2KwsjhS1novCWlxz/Utr4ZOqz6+XLO3X+CqK/mXOOQfH7s/8de3WsBsm5PNXK
         y2IA==
X-Gm-Message-State: AOAM5306DRc3B/p0S9/bqH5g3MOyHwMvmmfb+FtEKFWk5BZbdtsm4W87
        vUF/NZsPMh4o0d1R6u/iPvQnPhHYGaHXGbrW
X-Google-Smtp-Source: ABdhPJxd6iblFhYvucmLequOAvrsZJv7bQpp9hEpKuhaf8ii9yoAX9DyoEh/rGP+ykc/8mrj7AJ9DA==
X-Received: by 2002:a05:6512:1287:b0:473:b904:b27c with SMTP id u7-20020a056512128700b00473b904b27cmr6729249lfs.361.1653046815359;
        Fri, 20 May 2022 04:40:15 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q1-20020ac25fc1000000b0047255d210eesm630756lfg.29.2022.05.20.04.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 04:40:14 -0700 (PDT)
Message-ID: <b087c34f-0e2f-edd0-a738-3ffc2853a41b@linaro.org>
Date:   Fri, 20 May 2022 13:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] dt-bindings: usb: atmel: Add Microchip LAN966x
 compatible string
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220513105850.310375-1-herve.codina@bootlin.com>
 <20220513105850.310375-3-herve.codina@bootlin.com>
 <8f0d4127-7e66-cf50-21c9-99680f737e30@linaro.org>
 <20220520133426.3b4728ae@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520133426.3b4728ae@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/05/2022 13:34, Herve Codina wrote:
> On Fri, 13 May 2022 14:57:55 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 13/05/2022 12:58, Herve Codina wrote:
>>> The USB device controller available in the Microchip LAN966x SOC
>>> is the same IP as the one present in the SAMA5D3 SOC.
>>>
>>> Add the LAN966x compatible string and set the SAMA5D3 compatible
>>> string as a fallback for the LAN966x.
>>>
>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>> ---
>>>  Documentation/devicetree/bindings/usb/atmel-usb.txt | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
>>> index f512f0290728..a6fab7d63f37 100644
>>> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
>>> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
>>> @@ -87,6 +87,9 @@ Required properties:
>>>  	       "atmel,at91sam9g45-udc"
>>>  	       "atmel,sama5d3-udc"
>>>  	       "microchip,sam9x60-udc"
>>> +	       "microchip,lan996x-udc"  
>>
>> No wildcards please, especially that it closely fits previous wildcard
>> (lan996x includes lan9960 which looks a lot like sam9x60...)
>>
> 
> Well, first, I made a mistake. It should be lan966x instead of lan996x.
> 
> This family is composed of the LAN9662 and the LAN9668 SOCs.
> 
> Related to the wilcard, lan966x is used in several bindings for common
> parts used by both SOCs:
> - microchip,lan966x-gck
> - microchip,lan966x-cpu-syscon
> - microchip,lan966x-switch
> - microchip,lan966x-miim
> - microchip,lan966x-serdes
> - microchip,lan966x-pinctrl

And for new bindings I pointed that it is not preferred, so already few
other started using specific compatible.

> 
> I think it makes sense to keep 'microchip,lan966x-udc' for the USB
> device controller (same controller on LAN9662 and LAN9668) and so
> keeping the same rules as for other common parts.

Having wildcard was rather a mistake and we already started correcting
it, so keeping the "mistake" neither gives you consistency, nor
correctness...


Best regards,
Krzysztof
