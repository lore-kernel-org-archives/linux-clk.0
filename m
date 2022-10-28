Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465C4FA3741
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 23:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiJ1X4V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Oct 2022 19:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiJ1X4T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Oct 2022 19:56:19 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF46E52DB
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 16:56:02 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id l28so4490949qtv.4
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8w2NYwcU/LxoZeA70fFUf8Snmsz0a/FEvB2F4yg5rzI=;
        b=RS9HoOWqVyRPdi4iPukjXDBFWBHpBP+0R3pRGgU1YY0THtRKCGBm5+TvZe/Y7tqf4W
         WmAnDLLOfK1tAVDJS6tTqjW5D4YCnPxAuDGxBXvqcVcm35aXhBSscbEQrS+bUo7MVXeY
         HFn3q6CnpBg5EwMKeQ8hosbhPRbpnZ/dRNFUOSzWkb7z4ED525yYK3sC4Lig2GblI23S
         PG7D3d8rlIrKNWvNrtcq/M6FOflJ/xRA7D5dm2eFUwz9kASav0ny4OklPZo8vPoIIlT2
         7GTsH1bv4guGVz/o53yS6/pe4dw1k3AZPbYjUmQkPuoQNSuYDex5qn7X6WbZGUcHWLRf
         u1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8w2NYwcU/LxoZeA70fFUf8Snmsz0a/FEvB2F4yg5rzI=;
        b=XiSEDIG9GnLXviQEVDOoKyMVkJ9AxPMU4VM/4dD7B8ic7gNrs3aeRPTPRH3BIA5cXy
         MJom+sTNzSK9Bdywy2VjHHAH9fIBTTPCDP+itMlZej3SSvAU27zCqki//elpO1tSc1tb
         wSyRkgoFkFbxrY8U1cMjE87rwV7YyL9gu6ETVyldc9mGOvXAd1x1RkY2DcttEof8SWWg
         pXEZP1QZzMoqWFLjc1QEtOEOuP0ueMKjrYz/CiHMo1Q+6dP483jPdPectQ46ZdL1qHVi
         rs/l0Q9PmEXsHHEpB3LjAdnaRlrD3Bk2AF7UZ9DlIFQWxiWW3jIWzjNeRU2nlR8ntecu
         xBnw==
X-Gm-Message-State: ACrzQf007/hqBQfa2+3bO0FEEnVKtq2g1t0pzaUafNHSd2Oy8Iwpwofx
        CATFp7uTzfTgNzQ40SkxZj3lbw==
X-Google-Smtp-Source: AMsMyM7fMyqhfK46Jxy9MvJOiMmlZBT+lsFy9twv/ntI4E00t092YTyfoMwUSvVgDhAOeV9pu7xWtQ==
X-Received: by 2002:ac8:5e54:0:b0:399:e614:3b0b with SMTP id i20-20020ac85e54000000b00399e6143b0bmr1803085qtx.89.1667001361886;
        Fri, 28 Oct 2022 16:56:01 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id i21-20020a05620a249500b006a6ebde4799sm33564qkn.90.2022.10.28.16.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 16:56:01 -0700 (PDT)
Message-ID: <fdbde791-b0d9-7cb8-c028-5e4466ae3d81@linaro.org>
Date:   Fri, 28 Oct 2022 19:55:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add bindings for Renesas ProXO
Content-Language: en-US
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, geert+renesas@glider.be
References: <20220914211809.22500-1-alexander.helms.jy@renesas.com>
 <20220914211809.22500-2-alexander.helms.jy@renesas.com>
 <20220915120844.GA996386-robh@kernel.org>
 <8d71b849-7226-09ec-d099-ae5c172e1a17@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8d71b849-7226-09ec-d099-ae5c172e1a17@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/09/2022 14:06, Alex Helms wrote:
> On 9/15/2022 5:08 AM, Rob Herring wrote:
>> On Wed, Sep 14, 2022 at 02:18:08PM -0700, Alex Helms wrote:
>>> Add dt bindings for the Renesas ProXO oscillator.
>>>
>>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

>>> ---
>>>  .../bindings/clock/renesas,proxo.yaml         | 50 +++++++++++++++++++
>>>  MAINTAINERS                                   |  5 ++
>>>  2 files changed, 55 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,proxo.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/renesas,proxo.yaml b/Documentation/devicetree/bindings/clock/renesas,proxo.yaml
>>> new file mode 100644
>>> index 000000000..2ae131431
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/renesas,proxo.yaml
>>> @@ -0,0 +1,50 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Frenesas%2Cversaclock7.yaml%23&amp;data=05%7C01%7Calexander.helms.jy%40renesas.com%7C34ce960b2542459b61d408da97130b50%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637988405289843575%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=izvR%2FXbUNVXknaODSnMmcetPnn%2Ff3Jk%2F6RuBdZ7uSa0%3D&amp;reserved=0
>>> +$schema: https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=05%7C01%7Calexander.helms.jy%40renesas.com%7C34ce960b2542459b61d408da97130b50%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637988405289843575%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=dQ7nZtgfTE5DrXB1iavJuOhSWmGl4tYI1m6iZpkPAhA%3D&amp;reserved=0
>>> +
>>> +title: Renesas ProXO Oscillator Device Tree Bindings
>>> +
>>> +maintainers:
>>> +  - Alex Helms <alexander.helms.jy@renesas.com>
>>> +
>>> +description: |
>>
>> Don't need '|' if no formatting to preserve.
>>
>>> +  Renesas ProXO is a family of programmable ultra-low phase noise 
>>> +  quartz-based oscillators.
>>
>> Are they all the same from a s/w standpoint. If not you need specific 
>> compatibles for the differences. 
> 
> At this time only the XP variant is supported and this is reflected in
> the "compatible" string.

You should document everything, if possible, not what is supported by
some version of some system/driver/firmware.

> 
>>
>>> +
>>> +properties:
>>> +  '#clock-cells':
>>> +    const: 0
>>> +
>>> +  compatible:
>>> +    enum:
>>> +      - renesas,proxo-xp
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  renesas,xtal:
>>> +    description: Internal crystal frequency, default is 50000000 (50MHz)
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>
>> Use 'clock-frequency'.
> 
> I think "crystal-frequency" would make more sense. The parts come
> programmed to a factory clock frequency which is different than the
> internal crystal frequency.

We have a standard property and it should be used, when applicable.
Don't encode here frequency for something else than the driving clock.

Best regards,
Krzysztof

