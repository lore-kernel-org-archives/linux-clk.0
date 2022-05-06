Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D91FC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  6 May 2022 07:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389467AbiEFHTd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 May 2022 03:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355142AbiEFHT1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 May 2022 03:19:27 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DEA66FA3
        for <linux-clk@vger.kernel.org>; Fri,  6 May 2022 00:15:43 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id n10so12762631ejk.5
        for <linux-clk@vger.kernel.org>; Fri, 06 May 2022 00:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7g9JO/Ybw9irKMb1RLnb7HIkga3Dv3dwhtzTDOGzIqI=;
        b=eunXz/jJ22emEnm9j1ZKkdizjud+RpDosbQw03+WYs/zT4ezzVjJmgyCbF8K9QaChP
         q8/4A2wtC96OPJuvFDq0ersh77V8L5R7gM8k9azwtSHn9JPcjCrjzAk2LCGO31OT0Z4y
         PDXCBm/w/BVDih3HHieKmt5so84yoEw1kx2v8SPLu5VEcOlN24qhcFTBh8yKXbVyLbEU
         PHxv4bAg77gVeDU1RA7bToXYfmRdd5RulyxGNCBTn6FmIVG5hiGX33DHA+Zs3JWDzR/L
         T6u9XL4pozWRZXW264WrXSVsdHqjp2f7kku5ow7B1eQTp3JJB7TbIIAVpJMtfbnKFXcJ
         LIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7g9JO/Ybw9irKMb1RLnb7HIkga3Dv3dwhtzTDOGzIqI=;
        b=GSSMqmsMSyir5C1uLxHw6JjmK/Ax7vq7mgqbB2NET0EZZXYsWK861ieCjTtZaJw8Qz
         0uxINfvhUyOzDF5Yi8zcCDTxWRdAvLIBKqnOIYmg7ETHLM1+J1L4IezxU/TcHIn6AESy
         b9afOs2lhSEbFUyXL4U1Rsc81ScFLAveXpVdB+aWtWx1Q+w2JQVTLpWwhwTXM6JDiNdY
         FP2+2eDzRgdwb4FEeAulU44Mcn6E9VaIzVh+sWUjIfJrlCXo4z0c6wmO75NrWAQUjgl7
         X8eKLBVrGy7GMJhpqtisqTKE63y6XmgnMyrZChWjXM8bbmE5xk1XSxdPVsWCdPaIZqKI
         Ekpg==
X-Gm-Message-State: AOAM531EJUG0Q2OslBpLCtApeMiIYlKYclMMTW1c0FQO6bPkBBbRnH/D
        JQFYiECkOKSGWQk45F0z3Pn8pg==
X-Google-Smtp-Source: ABdhPJxgd3hK/qt9qIuLszkmZtLv2HjclvaSrS1ez9rOxs8wZ1arV9Hioosh6sfq5Fg2Oc7d0T6qxA==
X-Received: by 2002:a17:907:6e8b:b0:6f4:7147:a6ac with SMTP id sh11-20020a1709076e8b00b006f47147a6acmr1782778ejc.187.1651821342232;
        Fri, 06 May 2022 00:15:42 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qz24-20020a170907681800b006f3ef214de6sm1605225ejc.76.2022.05.06.00.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 00:15:41 -0700 (PDT)
Message-ID: <7c4b51a9-6340-ef27-708d-2ad96830edcb@linaro.org>
Date:   Fri, 6 May 2022 09:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v14 6/9] dt-bindings: interrupt-controller: Add bindings
 for SP7021 interrupt controller
Content-Language: en-US
To:     =?UTF-8?B?cWluamlhblvopoPlgaVd?= <qinjian@cqplus1.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "maz@kernel.org" <maz@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <cover.1651805790.git.qinjian@cqplus1.com>
 <56fb5e9a35a901f15d8e9721385c7e916c181377.1651805790.git.qinjian@cqplus1.com>
 <550cd907-be2a-4e90-350c-fbc3bdc03728@linaro.org>
 <d4ec03ed722349dda9fa3357449ac612@cqplus1.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d4ec03ed722349dda9fa3357449ac612@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/05/2022 09:01, qinjian[覃健] wrote:
>>> +title: Sunplus SP7021 SoC Interrupt Controller Device Tree Bindings
>>
>> Remove "Device Tree Bindings". This applies to all bindings patches, not
>> only to one.
>>
> 
> Did you means change
> "title: Sunplus SP7021 SoC Interrupt Controller Device Tree Bindings"
> to 
> "title: Sunplus SP7021 SoC Interrupt Controller"?

Yes, thank you.


Best regards,
Krzysztof
