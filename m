Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A5FC32793
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 12:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjARMKf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 07:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbjARMJs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 07:09:48 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3664523A
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:28:47 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so1029675wmq.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxUpFn+vHXo2x03dVOOns5Z5QVeKCPlOcCL5Odszc18=;
        b=d3EV88ulnfx6lUcl0/QzgicIPKxB5qwBgvjZVjaqWEUTnU+MajTyD7Z22LRE9ox1z2
         YgBAg5yhz2EctzUwY0FtohcQro2wiiVSfs8YnuLO2994Cx5GkGzTeorCs0wxuvGXUrCx
         vtyPJykT7oVTryo/s+bFwHRGpDBlB7xYPtUN5N64gezpD1Qx2x984XPiK0cTwyW/Xtb+
         /FqtjiCijX42x8+mi7JreftzeVF8wah9A5MM/DdlqEiY5u3e28uo1S70JD3FGluU+hOq
         C10xJCcpOCYfw0Vkfj2z7JifNKHj9lzIBykMkWqNR/1mpS0Z83xgQP9AZt4056QUes4i
         6ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxUpFn+vHXo2x03dVOOns5Z5QVeKCPlOcCL5Odszc18=;
        b=kHVhUxWSIwgTX2LshENUBI0UHPAdJsrFxmEiW3QmWmFxN7R5AAt1EKlDO3Fezf3IT9
         AZoJUqhZ7HFWm1L+PSFRU9NCWhak2iBEtx4J+yMB6DGbs6zd798dkaicnkuuX5EKgioT
         NV7JQwjkXWBH3IlasV1P0cRPFlA654UYGBOYVu53Y7uUD1ev2ngpPoNwtK9DT0OPmheY
         f0YUgqqy4gQX5hqq3usCOIGG5ftnD8+fXQZxb2r6OSUvzbTXuPCjEvGd0JU2ds6d9MzW
         11IYvecGecVUPzelcL1ZAXq2mX6bKmvk2TA0QTsASLXZigyz/Qwo9VOxIDr3sfso7JDl
         KrMw==
X-Gm-Message-State: AFqh2koj2nKUFgRrjNHACWJU2TgWqDUKcg7xV/7FRVWWW2SLv4Y7WHTt
        7S5TLVxpOpcCbSTt0WwsBJIycQ==
X-Google-Smtp-Source: AMrXdXuId3Foh0SWVAY6qz8qAyCxJvW+7NG5DagvGGRV2VtZXY8/2QFgCREY5aLHUMTPIz9TAgGKYg==
X-Received: by 2002:a05:600c:4f12:b0:3d0:7415:c5a9 with SMTP id l18-20020a05600c4f1200b003d07415c5a9mr2286903wmq.21.1674041326432;
        Wed, 18 Jan 2023 03:28:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i18-20020a05600c355200b003d9df9e59c4sm1922828wmq.37.2023.01.18.03.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:28:45 -0800 (PST)
Message-ID: <b31ed518-a39a-c4fa-e0c6-785c77c11edd@linaro.org>
Date:   Wed, 18 Jan 2023 12:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add binding for Loongson-1 clock
 driver
Content-Language: en-US
To:     Kelvin Cheung <keguang.zhang@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230113110738.1505973-1-keguang.zhang@gmail.com>
 <20230113110738.1505973-2-keguang.zhang@gmail.com>
 <63fdd223-c5e1-302d-ffef-9e582874e938@linaro.org>
 <CAJhJPsV5wC_fNgP9iSi1bUp+HFY=dgyh4-x0OueZ8fQO=p7r8w@mail.gmail.com>
 <4f56e6b3-c698-0909-17a0-ec8c39b6c25d@linaro.org>
 <CAJhJPsXOX16SA0bb8zWJ=wSxshjv38g038cR0b3u0CDDm1aUQw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJhJPsXOX16SA0bb8zWJ=wSxshjv38g038cR0b3u0CDDm1aUQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2023 12:16, Kelvin Cheung wrote:
> Hi Krzysztof,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 于2023年1月17日周二 18:47写道：
>>
>> On 17/01/2023 11:31, Kelvin Cheung wrote:
>>>>> +  "#clock-cells":
>>>>> +    const: 0
>>>>> +
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - loongson,ls1b-clk-pll
>>>>> +      - loongson,ls1b-clk-cpu
>>>>> +      - loongson,ls1b-clk-ahb
>>>>> +      - loongson,ls1c-clk-pll
>>>>> +      - loongson,ls1c-clk-cpu
>>>>> +      - loongson,ls1c-clk-ahb
>>>>
>>>> Are you registering single clocks? It looks like. No, make a proper
>>>> clock controller.
>>>
>>> This binding contains two types of clock, pll-clk and div-clk.
>>> Should I split the binding to two bindings files?
>>
>> No, you should register rather one clock controller. Why this have to be
>> 3 separate clock controllers?
>>
> This sounds like a big change for the driver.
> Could you please show me a good example of one clock controller?

All or almost all the drivers?

> Thanks very much!
>>>>
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +required:
>>>>> +  - "#clock-cells"
>>>>> +  - compatible
>>>>> +  - clocks
>>>>> +  - reg
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    clocks {
>>>>
>>>> No, not really related to the binding.
>>>
>>> Should I remove the "clocks" section?
>>
>> Yes.
>>
>>>>
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <1>;
>>>>> +        ranges;
>>>>> +
>>>>> +        xtal: xtal {
>>>>
>>>> Incorrect in this context. Missing unit address.
>>>
>>> XTAL doesn't have reg property.
>>
>> Yeah, but DTS is not correct now, is it? If you doubt, build your DTB
>> with W=1.
>>
> No doubt.
> I just want to know the right way to declare XTAL.
> Could you please show me an example?

Almost all DTSes?


Best regards,
Krzysztof

