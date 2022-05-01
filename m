Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A694BC433EF
	for <linux-clk@archiver.kernel.org>; Sun,  1 May 2022 08:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244899AbiEAIaQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 May 2022 04:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244814AbiEAIaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 May 2022 04:30:15 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFF748300
        for <linux-clk@vger.kernel.org>; Sun,  1 May 2022 01:26:50 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id g6so22823946ejw.1
        for <linux-clk@vger.kernel.org>; Sun, 01 May 2022 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aieFNs83tAeOzx9VGqKeTzmBqVk0Z3Ih2xN4eLJiTMs=;
        b=XZe5cAo0+519IeF7RzlnCkdXH8Bdr+d8wgR1DoCVu1WDZRh10/xtCs6oFtIY77M4Xw
         uFHpaRCe3UDEQxeHejYyzExiPikFiP7O1CIQ0IGZwe/mB0RPB5613MN0MpfOjl2HaHpA
         l9ehyfFxbq66xoPrkyQIXtogUbTegDZ3Fz4IjIFCZiR2T/yP3hYaNdJNX4MR2qSz1jrP
         sJIQ8bL/7H55zOSXewmhAQZuCxraNHH8Tq42Fw+8eBYfmgx1tRwfjGNEL6d0ILlp0xC5
         Qfqh+nZxO/hxfnBWpRXU4o6ssmGix+ijMkfTfeIYwJ6b0XEPe6n+fHcumPQlftvEYQhX
         MUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aieFNs83tAeOzx9VGqKeTzmBqVk0Z3Ih2xN4eLJiTMs=;
        b=NYuyB8vcP22w6c7lqVoDtYhcz4xrvbaI4BI0SwRpGDVjxtQ9xWLjUUuHBfUKAfBxZ7
         1pLO7M2UXvXOptI8VvGAMdPAHW1KJSPEFdkySJFzqcSNrFyetvFvduOrTvrokrqHT77J
         cGXFBFmDEYFseNeCS00ro7IG9GQ+ObBbawO7h14f8QA+FHhbx5Pe9cyd9IV2PptSdnf7
         zUSAV0OMVV616t0Ye6mPeGp8egipLIBN/19FYZbbBeURRaG8ZwhDYximQTyt080setpC
         ZAoHN2LclTn2xfnFwdWzRKTMeu/yiSABb3TevDXVPzLTaZ0wUe3Krd54JQgfmXH0+Qi3
         97EQ==
X-Gm-Message-State: AOAM530iSceNPcwpO9fp/GHQAIp0hJ8BhSTzYG4eE6dujeO18pKMKrNT
        j8nddZ4b2BqAJhp4Sc+vtZDM+w==
X-Google-Smtp-Source: ABdhPJyieE+oJQm5ErVscXXH2m9CCb+hzLggcttxL8uRbaqvW7uJ6EIyjro9OjxduIYLT72JMga0qw==
X-Received: by 2002:a17:907:2da4:b0:6f4:24e7:e7fd with SMTP id gt36-20020a1709072da400b006f424e7e7fdmr4614276ejc.139.1651393608715;
        Sun, 01 May 2022 01:26:48 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d11-20020a056402078b00b0042617ba63c0sm5064807edy.74.2022.05.01.01.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 May 2022 01:26:48 -0700 (PDT)
Message-ID: <0711b822-506b-7b90-6b63-50c5c0ce4f6e@linaro.org>
Date:   Sun, 1 May 2022 10:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: msm: Convert kpss-gcc driver
 Documentation to yaml
Content-Language: en-US
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20220430060125.9124-1-ansuelsmth@gmail.com>
 <20220430060125.9124-4-ansuelsmth@gmail.com>
 <fec305d1-d4b3-3f9d-bc31-bc33490d1ad7@linaro.org>
 <626d4cbf.1c69fb81.e6965.76b4@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <626d4cbf.1c69fb81.e6965.76b4@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/04/2022 09:42, Ansuel Smith wrote:
> On Sat, Apr 30, 2022 at 04:40:54PM +0200, Krzysztof Kozlowski wrote:
>> On 30/04/2022 08:01, Ansuel Smith wrote:
>>> Convert kpss-gcc driver Documentation to yaml.
>>> Add #clock-cells additional binding to required bindings and example
>>> as it's a required binding for clock-output-names.
>>>
>>> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
>>
>>
>> (...)
>>
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - qcom,kpss-gcc-ipq8064
>>> +          - qcom,kpss-gcc-apq8064
>>> +          - qcom,kpss-gcc-msm8974
>>> +          - qcom,kpss-gcc-msm8960
>>> +      - const: qcom,kpss-gcc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: phandle to pll8_vote
>>> +      - description: phandle to pxo_board
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: pll8_vote
>>> +      - const: pxo
>>> +
>>> +  clock-output-names:
>>> +    const: acpu_l2_aux
>>
>> It does not make sense having a constant output name. What is the
>> meaning this property in such case? The original binding did not enforce it.
>>
>>
>>
>> Best regards,
>> Krzysztof
> 
> Mh. Should I just drop the const and put a description referring to an
> advised name? The driver with the kpss-gcc hardcode the name to
> acpu_l2_aux that's why I thought it was a correct conversion using a
> const but I assume this is another problem of not making a correct 1:1
> conversion and adding fixes on pure conversion.

Hard-coding a name by implementation is not a reason to put that name in
DTS. DTS is not a place for values stored in the driver.

> Think I should drop it and put a description to it. (and then later fix
> it when I will push the other series with all the tweaks)

The driver kpss-gcc does not use this property at all, so I am not sure
if there is a point to even keep it. Any other user of bindings makes
use of the property?


Best regards,
Krzysztof
