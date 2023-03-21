Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BF5C74A5B
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 06:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjCUGe4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 02:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjCUGey (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 02:34:54 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01272CFF6
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 23:34:17 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id ek18so55631991edb.6
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679380455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I7y6CEKyo9f4ym50W2J1VElNR4r7uzh+824EqBJttEg=;
        b=Mm5SHrWvt/C11CxBWPSs8OB5e0OmziG7kCV6tRt0IbilF4n0xQZSLrcCAvBOZAUCdD
         uyUEaL1w+TtX4rK16Epy3/9mHFp5wKyHv71UKR89yxpggDPaRjvzfgkYMPWJS7hvIRar
         /N0cgAMvBKGQgqAui1Pcl1ht41Qv5LHZmMWeJOLfIbkGpGVEeAexbHKlJDXLVpXqCXFr
         fnB82qAJ3FEwx3TkSnMNIcfajhVapOosI8LzCw3ajeLvfGckc389k0MG5p7QnwN9J0Da
         UAfNgQajaEmLOEQiYk4WVirZyD5BmXVpEWX/YOc6jelX8k+npy6gAmom9VSAWxn6tCPY
         P40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7y6CEKyo9f4ym50W2J1VElNR4r7uzh+824EqBJttEg=;
        b=0FSSxJ0Ajkx+NMJ+RcKPxzAx2DHvXKMFZ8CWjooIDy9PgD0zPpqX321fgu5UGPDYmr
         8if6UPl1ArGi+7ddpfwY7nVZu4pU3dGNpilTGiwztItMkhPOuxLdNcm4iR5q/JGXDK9y
         gfdP+eL8fs77TPvUaWr4B/1QrDCvSyygRvflASph5NeFLVKN4lY9lIxQR+ofMkiYQe7o
         SpFGpNHhK6CkbGLkQdKN8GAALIEne7+AUcs4hDWkO14UBh6TaarOZIx8KBwc66I3C4IV
         qk8UEJQmpdJ97lCWXxTn0oHE5efDlLe2S2h/Me+Y68/s4WNuw5jnrEqWLgh1FoHkwNpk
         fTsw==
X-Gm-Message-State: AO0yUKUS0KyfwY5QSI+wpktcccl1woKlRuRW9evAP+N1i2/CfYYZKRhh
        BR70dpXrvLm0t5iynPbdyaZEZg==
X-Google-Smtp-Source: AK7set+rivmM7028r39gA06BxStCr476bAgL3eYIZfoGXmza0rkmeJjO0OTLxMLISJVbixQsjd443Q==
X-Received: by 2002:a17:906:2a90:b0:8aa:1f89:122e with SMTP id l16-20020a1709062a9000b008aa1f89122emr1426902eje.39.1679380455530;
        Mon, 20 Mar 2023 23:34:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id z24-20020a1709060ad800b0092ffc83cc27sm5353883ejf.5.2023.03.20.23.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:34:15 -0700 (PDT)
Message-ID: <b3365947-5567-2fd7-1bb7-34052c40e5f6@linaro.org>
Date:   Tue, 21 Mar 2023 07:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] dt: bindings: clock: add mtmips SoCs clock device
 tree binding documentation
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-clk@vger.kernel.org
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, devicetree@vger.kernel.org
References: <20230320161823.1424278-1-sergio.paracuellos@gmail.com>
 <20230320161823.1424278-2-sergio.paracuellos@gmail.com>
 <5109c01b-48bd-2854-3f42-bf8ef8b4a821@linaro.org>
 <9cfd5bc1-64e9-5250-5a8d-18ac4c205584@arinc9.com>
 <f323f1bc-1d91-f8bb-2c1f-2f1b93fe1b3e@linaro.org>
 <6a8989c5-f12d-a4cb-9b20-29049dee016e@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6a8989c5-f12d-a4cb-9b20-29049dee016e@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/03/2023 19:23, Arınç ÜNAL wrote:
> On 20.03.2023 21:11, Krzysztof Kozlowski wrote:
>> On 20/03/2023 19:07, Arınç ÜNAL wrote:
>>> On 20.03.2023 21:01, Krzysztof Kozlowski wrote:
>>>> On 20/03/2023 17:18, Sergio Paracuellos wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - ralink,rt2880-sysc
>>>>> +          - ralink,rt3050-sysc
>>>>> +          - ralink,rt3052-sysc
>>>>> +          - ralink,rt3352-sysc
>>>>> +          - ralink,rt3883-sysc
>>>>> +          - ralink,rt5350-sysc
>>>>> +          - ralink,mt7620-sysc
>>>>> +          - ralink,mt7620a-sysc
>>>>> +          - ralink,mt7628-sysc
>>>>> +          - ralink,mt7688-sysc
>>>>
>>>> One more comment - this and maybe other compatibles - have wrong vendor
>>>> prefix. This is mediatek, not ralink.
>>>
>>> This platform was acquired from Ralink by MediaTek. I couldn't change
>>> some existing ralink compatible strings to mediatek as Rob explained on
>>> my pinctrl patch series that we don't do that. The compatible strings on
>>> this patch series here are new but I'd rather keep the compatible
>>> strings ralink to keep things consistent.
>>
>> The comment that you cannot change existing compatibles does not apply
>> to these, because these are new. However indeed some SoCs have already
>> compatibles with ralink, so it's fine for these. mt7620 and mt7628 are
>> already used with mediatek, so these should be rather corrected to new
>> prefix.
> 
> If you're talking about the pinctrl schemas for MT7620 and MT7628, it's 
> just the name of the yaml files that have mediatek. The compatible 
> string is still ralink so it should be kept ralink here as well.

No, I am talking about compatibles.

Best regards,
Krzysztof

