Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBADC433F5
	for <linux-clk@archiver.kernel.org>; Sat,  2 Apr 2022 16:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357606AbiDBQDi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Apr 2022 12:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357670AbiDBQDH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Apr 2022 12:03:07 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD41767D2B
        for <linux-clk@vger.kernel.org>; Sat,  2 Apr 2022 09:01:14 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id d10so1453594edj.0
        for <linux-clk@vger.kernel.org>; Sat, 02 Apr 2022 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lmJCCJ8fgUPzUm6LeyDlcBmDbRHg8TIVpjOQGBqlZHk=;
        b=wq63czqcdGAdUoH/+15ETJz8usSPQogFdLMvAZIavzBPSG6GW2VRfJSqcB9bJ9jFPA
         mqvVEHeUKFa2veONrP0uYF10XNOpH/F0u1m6zj+oHx+bqrHtvbZxPhjjfgh1CaN165R7
         N4ss4HBdWNiU8J5P4+pEiSOMv2p1I5bRnYUVAlJVqwkpiTQp21fVk45bt+Gc6PBd1ltR
         4eDKLyhqZqg1WXvtPgaPy3q2/lubIXC62uiuQs6ugIMgWOmFzEp4+xEG1CXUFcGSNCmF
         ohbLKwpl20Sbik5b/IApeOTXMrKm3sveQfXKZ8HSj0f5zEdx4op099MmOnrgdyAZXF8K
         MbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lmJCCJ8fgUPzUm6LeyDlcBmDbRHg8TIVpjOQGBqlZHk=;
        b=FbX6632a5IS7yHz8xE5BrFNzGrmIGVbwB6Rn8AZ0FqTuhGfYSRnD/IbZQ9MjFCNUpe
         OgChsSLqxkP1yj01+UwjMREBmV2JN/lJ3XDADpYrRcMo1BibsimiwPB6x2mXKpVkEHji
         QvSVSaciifgNZFFzZKy9NZBVBmjx5MZbluEVQZAOA6kQm5kRfWMRIpy8F/0WzNcIXe4Y
         8QOn+YgAwnKaYSFgRcQsjo0o1VfGXstpCYvBV/sRzGtMOUDLaocE27UCTvrezy1znQ2C
         fLt0oM00p7kfV9CH8dj80Bx8mnw9h6qJIkIe0M7Zd+DQUJIvjGI/rkOVtXrAL3mZLziR
         jWlw==
X-Gm-Message-State: AOAM532/U1hX+7+P3zCsz+Wn0i1zulDhbyVixiDQMIDNr/uqEDaV/iHk
        sHEri2PETq+uHxHnjvvNZxQKSw==
X-Google-Smtp-Source: ABdhPJxk2uVM8AfzL67ivCUJqnJfKP/vco7byneQz2mX7LZKuaoW7Llqvp4oorxKC7j40wUOq43fyg==
X-Received: by 2002:a05:6402:4247:b0:419:3990:3db6 with SMTP id g7-20020a056402424700b0041939903db6mr25461773edb.193.1648915273352;
        Sat, 02 Apr 2022 09:01:13 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id uz12-20020a170907118c00b006e7475db2d6sm244830ejb.217.2022.04.02.09.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 09:01:12 -0700 (PDT)
Message-ID: <4b7af0ed-c5e1-7523-0abc-4204596edeb9@linaro.org>
Date:   Sat, 2 Apr 2022 18:01:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: convert
 rockchip,rk3188-cru.txt to YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        zhangqing@rock-chips.com, Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220329111323.3569-1-jbx6244@gmail.com>
 <20220331225134.7A0A9C340ED@smtp.kernel.org> <3107512.vfdyTQepKt@diego>
 <c212c994-fc5d-6ad0-3cd6-88dc2c719e38@linaro.org>
 <7c786619-6fcf-21dd-8e5a-0ec67da2a63d@gmail.com>
 <5e1b6c09-0a8f-f1d9-728b-90ffbaedae83@linaro.org>
 <0eed395b-ca02-2308-a5c6-7c4a72720175@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0eed395b-ca02-2308-a5c6-7c4a72720175@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/04/2022 14:20, Johan Jonker wrote:
> 
> 
> On 4/2/22 14:16, Krzysztof Kozlowski wrote:
>> On 02/04/2022 13:45, Johan Jonker wrote:
>>>
>>>
>>> On 4/2/22 13:41, Krzysztof Kozlowski wrote:
>>>> On 01/04/2022 09:55, Heiko Stübner wrote:
>>>>> Hi Stephen,
>>>>>
>>>>> Am Freitag, 1. April 2022, 00:51:32 CEST schrieb Stephen Boyd:
>>>>>> Quoting Johan Jonker (2022-03-29 04:13:22)
>>>>>>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000..ddd7e46af
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.yaml
>>>>>>> @@ -0,0 +1,78 @@
>>>>>>> +# SPDX-License-Identifier: GPL-2.0
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/clock/rockchip,rk3188-cru.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Rockchip RK3188/RK3066 Clock and Reset Unit (CRU)
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Elaine Zhang <zhangqing@rock-chips.com>
>>>>>>> +  - Heiko Stuebner <heiko@sntech.de>
>>>>>>> +
>>>>>>> +description: |
>>>>>>> +  The RK3188/RK3066 clock controller generates and supplies clocks to various
>>>>>>> +  controllers within the SoC and also implements a reset controller for SoC
>>>>>>> +  peripherals.
>>>>>>> +  Each clock is assigned an identifier and client nodes can use this identifier
>>>>>>> +  to specify the clock which they consume. All available clocks are defined as
>>>>>>> +  preprocessor macros in the dt-bindings/clock/rk3188-cru.h and
>>>>>>> +  dt-bindings/clock/rk3066-cru.h headers and can be used in device tree sources.
>>>>>>> +  Similar macros exist for the reset sources in these files.
>>>>>>> +  There are several clocks that are generated outside the SoC. It is expected
>>>>>>> +  that they are defined using standard clock bindings with following
>>>>>>> +  clock-output-names:
>>>>>>> +    - "xin24m"    - crystal input                 - required
>>>>>>> +    - "xin32k"    - RTC clock                     - optional
>>>>>>> +    - "xin27m"    - 27mhz crystal input on RK3066 - optional
>>>>>>> +    - "ext_hsadc" - external HSADC clock          - optional
>>>>>>> +    - "ext_cif0"  - external camera clock         - optional
>>>>>>> +    - "ext_rmii"  - external RMII clock           - optional
>>>>>>> +    - "ext_jtag"  - external JTAG clock           - optional
>>>>>>
>>>>>> I'd expect all these clks here to be inputs to this node.
>>>>>
>>>>> The optional clocks are all part of a circular dependency.
>>>>>
>>>>> So for example xin32k normally is generated by the pmic and fed
>>>>> back into the system, so to get xin32k, we need the pmic to probe,
>>>>> which needs i2c, which in turn already needs the clock controller.
>>>>
>>>> Are you sure that xin32k (RTC) clock should be input to the clock
>>>> controller? I would expect it is the input to the SoC RTC block, so
>>>> there is no circular dependency.
>>>
>>> clk-rk3188.c:
>>>
>>> PNAME(mux_pll_p)		= { "xin24m", "xin32k" };
>>
>> Thanks, but that's not the answer whether it is an input to the clock
>> controller. It's the answer how the driver implements this. :)
> 
> PX2 == rk3066
> 
> Rockchip PX2 TRM V1.0.pdf
> 
> page 30
> 
> Chip Clock Architecture Diagram 1

I found it, thanks. That's the answer, so indeed this is an input.

Answering partially to Heiko/Stephen, this could be still modeled in DTS
as a fixed-frequency clock going as input to the clock-controller. The
trouble with that approach is that it would actually duplicate the
definition (another one coming from PMIC).

Best regards,
Krzysztof
