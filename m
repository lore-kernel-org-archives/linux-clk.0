Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F7CC001DE
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 16:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjG1Qj3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 12:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjG1Qj2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 12:39:28 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD89D4202
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 09:39:26 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso23360935e9.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690562365; x=1691167165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vByKr6oo2J1M3LP2EswYpTAgknyd7AeR6xbbY9MOCNo=;
        b=mo8zWxTM63nVRrUOTO7QI4aIwgzo0/AmsgAVZVATFZSN5xjrfhTFuymKH9XEu2mHr1
         b6eK58AZfiqrvbGFKkcK6Q/uQwzperFyRp2nwx/eHZPxBYgCpVomLZDnLrU02HxkE9UY
         u9VwtEIShsRV9pFpbZP4pQBK1JqEJfxprjjOKRw3quSJi02U1ar8slU5BA+Fwhh+rGiv
         WYEzoW443X5c1OagYCbSI1mGxZ8JjPD5JTNaXqnSG6IDoI9viF9zNnFmJPy5Sv3Byqi0
         S1yAIGzHowPD7AICb2sFDD7bOteZ5gCqL7UJev97PCvXe+V73MaLB8zYBC4zVi7/RpSL
         nPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690562365; x=1691167165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vByKr6oo2J1M3LP2EswYpTAgknyd7AeR6xbbY9MOCNo=;
        b=fAdrKm4BOMoKhkYLM9Yk0nsZK6JoKdiV8WMMTsy8kiPnZOWVVDuKLMdQKeQrKwdIO4
         OuywlyWcfxH5mp5iyuQrURio7eZeZ4fOQaWH8rdwR378C+mOPNFmqnp9k9RTceZ1yAPX
         uuG7+DNXijd0xujj2PiAKjLJk0bpD89ER0amY+i1W4swjRR7XbJmXIZ7jUnJyJO2Htty
         GRNQQ21tWXTJ10kUqe64cCHeVrNIyph6XIghvcoZH836fjUtoRgDrYt/H5lNRFkBiGTK
         lcqzQd4mFwMVqGrUfLUMKrxG3Gh8U1a+7pVRBbD697lxk0HabXdKpYwL7kBfVVQx9wVC
         YgWA==
X-Gm-Message-State: ABy/qLafxp5Jf7oI2KcohedxPHXXOJ4NC5avA9/emeikGkNImruVDmmu
        z0rLlf2C9rVouyctf+PGYhut409lBLGepB+wrI3tbw==
X-Google-Smtp-Source: APBJJlG6cIh0+NK+0YeR7SfuoqonZAGEeuthpdDID4DzwxoaoD5X3hYugr3QF0BBgWxbMliuMZb+/A==
X-Received: by 2002:a1c:ed0d:0:b0:3fb:dd5d:76b with SMTP id l13-20020a1ced0d000000b003fbdd5d076bmr2073630wmh.7.1690562365223;
        Fri, 28 Jul 2023 09:39:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id z24-20020a7bc7d8000000b003fbc681c8d1sm7398747wmk.36.2023.07.28.09.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 09:39:24 -0700 (PDT)
Message-ID: <010713ed-1fe7-788c-868d-26149c21d7a7@linaro.org>
Date:   Fri, 28 Jul 2023 18:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>,
        "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Simek, Michal" <michal.simek@amd.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
 <20230724-direness-syrup-14c0b50c8018@spud>
 <BY5PR12MB4902A95CD14D934BCF3B7C658103A@BY5PR12MB4902.namprd12.prod.outlook.com>
 <20230725-untaxed-footman-0c764cc9792f@spud>
 <BY5PR12MB49023F377CB6A3A1D7C78B7D8106A@BY5PR12MB4902.namprd12.prod.outlook.com>
 <20230728-slit-constrain-641d33f9f99b@spud>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728-slit-constrain-641d33f9f99b@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/07/2023 18:19, Conor Dooley wrote:
> On Fri, Jul 28, 2023 at 06:41:50AM +0000, Datta, Shubhrajyoti wrote:
>> [AMD Official Use Only - General]
>>
>>> -----Original Message-----
>>> From: Conor Dooley <conor@kernel.org>
>>> Sent: Wednesday, July 26, 2023 12:57 AM
>>> To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
>>> Cc: devicetree@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; linux-
>>> clk@vger.kernel.org; Simek, Michal <michal.simek@amd.com>;
>>> conor+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>>> robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com
>>> Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the xlnx,zynqmp-
>>> clk.txt to yaml
>>>
>>> On Tue, Jul 25, 2023 at 05:28:07AM +0000, Datta, Shubhrajyoti wrote:
>>>> [AMD Official Use Only - General]
>>>>
>>
>> <snip>
>>>>>>    clocks:
>>>>>>      description: List of clock specifiers which are external input
>>>>>>        clocks to the given clock controller.
>>>>>> -    items:
>>>>>> -      - description: reference clock
>>>>>> -      - description: alternate reference clock
>>>>>> -      - description: alternate reference clock for programmable logic
>>>>>> +    minItems: 3
>>>>>> +    maxItems: 7
>>>>>
>>>>> This doesn't seem right to me. The original binding requires 5 clock
>>>>> inputs, but this will relax it such that only three are needed, no?
>>>>> You'll need to set constraints on a per compatible basis.
>>>>>
>>>> Does below look good.
>>>
>>> I don't think that you tested it with < 5 clocks (hint, if you remove one of the
>>> clocks from your example below, dt_binding_check should fail).
>>> All the constraints need to move into the `if` bits AFAIU.
>>
>>
>> https://lore.kernel.org/all/20230720113110.25047-1-shubhrajyoti.datta@amd.com/
>> Here I had it in the if .
>> Then what I understood from below is that
>>
>> https://lore.kernel.org/all/745fccb0-e49d-7da7-9556-eb28aee4a32b@linaro.org/
>> it should be dropped from the if and added to the above.
>>
>> Maybe I am missing something.
> 
> (Background I got this mail once off-list and tried to make the
> binding's validation work)
> 
> With the current conditions, validation is completely broken. You can
> put in just 1 clock and 1 clock-name and dt-binding-check will pass. The
> only way I could satisfy it, 

I don't understand why you think 1 clock would work. The binding has
clear min/max constraints in top level and strict constraints per each
variant (through listing items). In my opinion this is correct, except
what I wrote - mismatched number of clocks for zynqmp (8 against 7).


> while keeping 7 as the maximum number of
> clocks, was moving the constraints into the if/else. My guess was that 7
> being fewer than the number of clocks in the items: list is part of the
> problem.

Best regards,
Krzysztof

