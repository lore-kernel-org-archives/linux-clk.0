Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F8EC3DA78
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 10:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbjAQKrh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 05:47:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236231AbjAQKrg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 05:47:36 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672C52DE74
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 02:47:35 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso1088094wmb.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 02:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvIcZpPr71LAli4Ctw18NaK663H1wXEFiZ1hnSUC9M0=;
        b=Y+86NVomNfbZJj3bNQA99LzfKbWS1gl9P3M2xDVt54IbzeIw1atZ9k256jeY4iqz1k
         GrzlzHfeZdOytZpecBqdel9sXmGpRdXrrHWqBVg8e4PoCKfkpYkqnQhqfBbOlfzi0uIK
         35DWzJIHZb82vq36jduj5kDx8Cq70WWP10NAkap5YlurQQ/CNeXezt/FU2Du/fUszMsn
         EYhZE1ePjBR+HWxLlX6txelo8DfG9wI6f8D0UIkQlFwpdE9cTNHrkIn1MvDAGppQfJcz
         wblJjHentHrITYgSlMEyYnpCTqqybAfZljFRRc4VOMO+OvvbquMbwywO/VQH/yFFcewu
         zuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvIcZpPr71LAli4Ctw18NaK663H1wXEFiZ1hnSUC9M0=;
        b=CZ1WJZXbs+QytiEVsnqSnhpKOqkbFeGOQLDGigS3Awq16O9ychLZCyCklVMNLkgt4P
         P/eIiJfU2fyz5HdGmErXKtmCn3hizqna997hJ/SJBWsIxbbp5rjc3qmFEv1nD10Qy8ya
         Ybm75frIMgCRpw8t0IzVSdQ13mVr9DCe6+r6BhZPFmnVpdVW6EbeC14Nbj/tK2q8vq1m
         zCtXlMPE+RSVd5fz34cX12OGNhiwCo47A4q0a43OlSO+yi2agmQz105DtTgPCAsXiQIG
         TM56LqHIhFy9Vhg0N151r9UaJQ6e3wqB6PLtxzIMEas+ptw5dg3/SFzTCI9XPGFnfgiA
         Heeg==
X-Gm-Message-State: AFqh2kp1y7syUiewJEcX3algrT5bNDwNA+TMiYaxcyh5pQ3j3KbOflZJ
        KdJSdDbzAVeD4F2PZCldfyBvuw==
X-Google-Smtp-Source: AMrXdXsUfsCQI3brlhkYMF0HmGM1NDMYajoVu/4uY4pbIRkMs5bSGZzmtTCq2ZDO/aOjIEuDbOFsPg==
X-Received: by 2002:a05:600c:538c:b0:3cf:6f4d:c259 with SMTP id hg12-20020a05600c538c00b003cf6f4dc259mr2514487wmb.39.1673952453939;
        Tue, 17 Jan 2023 02:47:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r126-20020a1c2b84000000b003d35c845cbbsm40262609wmr.21.2023.01.17.02.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 02:47:33 -0800 (PST)
Message-ID: <4f56e6b3-c698-0909-17a0-ec8c39b6c25d@linaro.org>
Date:   Tue, 17 Jan 2023 11:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJhJPsV5wC_fNgP9iSi1bUp+HFY=dgyh4-x0OueZ8fQO=p7r8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/01/2023 11:31, Kelvin Cheung wrote:
>>> +  "#clock-cells":
>>> +    const: 0
>>> +
>>> +  compatible:
>>> +    enum:
>>> +      - loongson,ls1b-clk-pll
>>> +      - loongson,ls1b-clk-cpu
>>> +      - loongson,ls1b-clk-ahb
>>> +      - loongson,ls1c-clk-pll
>>> +      - loongson,ls1c-clk-cpu
>>> +      - loongson,ls1c-clk-ahb
>>
>> Are you registering single clocks? It looks like. No, make a proper
>> clock controller.
> 
> This binding contains two types of clock, pll-clk and div-clk.
> Should I split the binding to two bindings files?

No, you should register rather one clock controller. Why this have to be
3 separate clock controllers?

>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - "#clock-cells"
>>> +  - compatible
>>> +  - clocks
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    clocks {
>>
>> No, not really related to the binding.
> 
> Should I remove the "clocks" section?

Yes.

>>
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges;
>>> +
>>> +        xtal: xtal {
>>
>> Incorrect in this context. Missing unit address.
> 
> XTAL doesn't have reg property.

Yeah, but DTS is not correct now, is it? If you doubt, build your DTB
with W=1.

>>
>>> +            compatible = "fixed-clock";
>>> +            #clock-cells = <0>;
>>> +            clock-frequency = <33000000>;
>>> +        };
>>> +

Best regards,
Krzysztof

