Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D26C7618A
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 17:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjCTRGN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 13:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbjCTRFx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 13:05:53 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABC5DBF0
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 10:00:21 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id x3so49353158edb.10
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679331533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFJSUgHgBA6fVjFOsVCUCNBjQjOx28L2GR1TCgVlFOc=;
        b=S8AF6sztGHKKvy75/sIaXt1iU/9+rwHSBa9rmsnP8SuIcvh+qPtIwXIhtZevmS7/Bm
         IUSTfPhSAI3XS9sZo8IiGhlwcgwkaQm1f0egHxwHhlO5EfnBuisQDU82+FQKpsV5bWfp
         HIVEiEcyXBzVXU/klLoXtpmbVuzsHn0P3PcsZIgOngiQzGx71hzWD6zNNiJJ5EA6WAG0
         lPUhLcjs0cLoDN2ZxHERKWyM4Wi5NN7zoNmitK6Z7xgWCpRSlEJKf5ZP9nQdcZ80Of+g
         5elxKyp5buGHaaL2x8j3sXnqxmUa+Rx6XLaCW5NZIc/rtWb5ZRZwP9Ydx+D+7yeZ3WTW
         x/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679331533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFJSUgHgBA6fVjFOsVCUCNBjQjOx28L2GR1TCgVlFOc=;
        b=GUCzWGcgDoMgWuH1+55v6dgEKV5pxSFUo8a0ZrsEUl7GMjwKCP1oOguEgZ7IF4QHK2
         r8MZP7ufGVQR3OnJt0IPrOlufmg1zdJmbdJNZfhpD0eOiHKSemGwelznWyssPDKJAfcG
         jlaZ0YCZ7v6KYKoAD47kPPbXZ+j5srFCXYxsJM9lzR5K2/VFN20tyL55YekfToHsizuj
         E6H+8e7DIEexYWJnpunytqElAty9XrWt1aCI8+Y4B+N9ltBatyTcHFhLWtan7ME1xND9
         xdW3Jbn+PW9WO9KxMjCv0uV3iSoWTK/uJnfLa8QqUqQKh0AI68rPafQqrZFGyn+ndRq1
         EnWA==
X-Gm-Message-State: AO0yUKU8t5YUlqYdYaonF9o6mhdRlzF7ysaaxpbeVXzI2Nufua1f5vs4
        il3pyjM3xBuR/XHwmeiRhR8kNHsLOoKslsSLyHU=
X-Google-Smtp-Source: AK7set8b9t2ZFlGF1WY07Zu3lWziOZGj1aKUfLhWe2QE7mDcO8rGB3IIiBBozLUDLT39ruGI1pOJeQ==
X-Received: by 2002:a05:6402:150e:b0:4fe:96a9:ab0a with SMTP id f14-20020a056402150e00b004fe96a9ab0amr207881edw.1.1679331022727;
        Mon, 20 Mar 2023 09:50:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id i20-20020a508714000000b004fc649481basm5185947edb.58.2023.03.20.09.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 09:50:22 -0700 (PDT)
Message-ID: <182d39e4-fa11-c914-7015-80bd68c91596@linaro.org>
Date:   Mon, 20 Mar 2023 17:50:21 +0100
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
 <1e2f67b4-3bfb-d394-4f60-e6f63ce6a2fd@linaro.org>
 <b98429b7-2932-6bd5-39bc-f82c747b4333@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b98429b7-2932-6bd5-39bc-f82c747b4333@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/03/2023 17:43, Arınç ÜNAL wrote:
> On 20.03.2023 19:36, Krzysztof Kozlowski wrote:
>> On 20/03/2023 17:18, Sergio Paracuellos wrote:
>>> Adds device tree binding documentation for clocks and resets in the
>>> Mediatek MIPS and Ralink SOCs. This covers RT2880, RT3050, RT3052, RT3350,
>>> RT3883, RT5350, MT7620, MT7628 and MT7688 SoCs.
>>
>> Use subject prefixes matching the subsystem (which you can get for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching).
>>
>> Subject: drop second/last, redundant "device tree binding
>> documentation". The "dt-bindings" prefix is already stating that these
>> are bindings.
>> (BTW, that's the longest redundant component I ever saw)
>>
>>>
>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>> ---
>>>   .../bindings/clock/mtmips-clock.yaml          | 68 +++++++++++++++++++
>>>   1 file changed, 68 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/mtmips-clock.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/mtmips-clock.yaml b/Documentation/devicetree/bindings/clock/mtmips-clock.yaml
>>> new file mode 100644
>>> index 000000000000..c92969ce231d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/mtmips-clock.yaml
>>
>> Filename matching compatible, so vendor prefix and device name (or
>> family of names).
> 
> I influenced Sergio to use MTMIPS here as I want to designate it the 
> family name for the MediaTek MIPS and Ralink SoCs.

I don't know how to respond to this. Is it argument for not using naming
style?

> We can't change the 
> compatible string as it's established from my pinctrl patch series we 
> don't do that.

The patch did not say it is documenting existing compatibles in the
kernel DTS. And if we are at this, ralink,rt2880-reset does not look
like single clock nor like clock controller.

Best regards,
Krzysztof

