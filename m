Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793DBC7618A
	for <linux-clk@archiver.kernel.org>; Tue, 14 Mar 2023 14:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbjCNOGH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Mar 2023 10:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjCNOF7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Mar 2023 10:05:59 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BEEA54FC
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 07:05:51 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y4so33076182edo.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678802750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IP0KSz4lT+u+HebFhfe8Z+E9HmxxFebdK40uPcNluho=;
        b=VMc3dHzCbH8kAJ0met49jqj4q9sBl/CTcqfdk/2nAnFSUiJzxX/Zb/9/l0ZWxk252f
         37AK1+OPk5JYUlso2MptIakR4qrC0Ss/fr9vkG0FAAfCKf0uUb79OBLLNZt/LLdT2xdA
         jjIfKv7ccyresFXV4cfJekvDRuZohYfJm4RJx+EAMl4ctNtFdnvOipU5vY/5bpokXBWV
         NcAjbMeReFutRGDUNC9lQsjRE/7b9SJBV0PonTKxvkmxC7K3FbdnkARKR12hLUl/G/Zr
         aPnx1vB4nJXckOea2G5aO/v51VApWofZjWiEunv668LELL/MfYnsPejtB1pP0S4CUyir
         o+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678802750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IP0KSz4lT+u+HebFhfe8Z+E9HmxxFebdK40uPcNluho=;
        b=TnpCAsZxvaKsSFEiFMgzsKkeccFW+fj4rruzikZl4Px239SpugHdilVpq9nP8yOOK1
         UKhb85ADm14khKfyuX8ta8DzPxSZWdqKHv7xmYwLAsYob+4OLa2YxTPmbfrKYV/dWb1E
         zlybxiTgtHkcRPTuXcdfTuwCGuMquxf3oMVqDDL2mUzO+LQjs7ODs4gjOeBml48q2pj8
         5Dw2/Scace6v9Uude1CsDCpqEBerqJcWpv6CuNSPjyZLqQcQjRzbvfcRRHRjEAFi0it2
         MBm3fX6z5CH6qKsstvn+3RUR/AZTed5qzxq2L3Fujd2EaClkwEdH698Yco/YSaWo9Gme
         mikw==
X-Gm-Message-State: AO0yUKWfk0m/3OHytmESMQQqWygUi9IjXiO4F6XRFp3kehzDyWohex60
        WtlveKV5HZk5oyxyG8hEEUs8GH3xNG1N7YnRCuM=
X-Google-Smtp-Source: AK7set+/9ywuRumyeAN238PsARcUKnYZ2ALTYHhTX6lxmf3l+Q2lmS+pqtOVRHP6a3kcf9WpQQ8jUg==
X-Received: by 2002:a17:906:13d4:b0:861:4671:a834 with SMTP id g20-20020a17090613d400b008614671a834mr3084596ejc.71.1678802750006;
        Tue, 14 Mar 2023 07:05:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id ga17-20020a170906b85100b00922e3221c88sm1182419ejb.117.2023.03.14.07.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 07:05:49 -0700 (PDT)
Message-ID: <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
Date:   Tue, 14 Mar 2023 15:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     neil.armstrong@linaro.org, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
        kernel@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/03/2023 12:48, Dmitry Rokosov wrote:
> On Tue, Mar 14, 2023 at 12:28:40PM +0100, Krzysztof Kozlowski wrote:
>> On 13/03/2023 21:12, Dmitry Rokosov wrote:
> 
> [...]
> 
>>> +#define CLKID_SPIFC		84
>>> +#define CLKID_USB_BUS		85
>>> +#define CLKID_SD_EMMC		86
>>> +#define CLKID_PSRAM		87
>>> +#define CLKID_DMC		88
>>
>> And what is here? Between 88 and 121?
>>
> 
> Explained below.
> 
>>> +#define CLKID_GEN_SEL		121
>>> +
>>> +#endif /* __A1_CLKC_H */
>>> diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>>> new file mode 100644
>>> index 000000000000..8e97d3fb9d30
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>
>> I found in changelog:
>> "fix license issue, it's GPL-2.0+ only in the current version"
>> and I do not understand.
>>
>> The license is wrong, so what did you fix?
>>
> 
> Sorry don't get you. Why is it wrong?

Run checkpatch - it will tell you why wrong. The license is not correct.
This is part of binding and should be the same as binding.

> I've changed all new source files to GPL-2.0+ except yaml, because yaml
> dt bindings schemas require the following license:
> 
>     # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> 
> I've pointed it in the changelog.

The only thing I found was:
"fix license issue, it's GPL-2.0+ only in the current version"

so what exactly you pointed out in changelog? What was to fix? What was
fixed? Correct license into incorrect? But why?

> 
>>> +/*
>>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>>> + * Author: Jian Hu <jian.hu@amlogic.com>
>>> + *
>>> + * Copyright (c) 2023, SberDevices. All Rights Reserved.
>>> + * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>> + */
>>> +
>>> +#ifndef __A1_PLL_CLKC_H
>>> +#define __A1_PLL_CLKC_H
>>> +
>>> +#define CLKID_FIXED_PLL		1
>>> +#define CLKID_FCLK_DIV2		6
>>> +#define CLKID_FCLK_DIV3		7
>>> +#define CLKID_FCLK_DIV5		8
>>> +#define CLKID_FCLK_DIV7		9
>>> +#define CLKID_HIFI_PLL		10
>>
>>
>> Probably I asked about this... why indices are not continuous? You know
>> that consumers are allowed to use number 2 and it will be your ABI, even
>> though you did not write it in the binding? That's a tricky and
>> confusing pattern for no real gains.
> 
> Actually, indices are continuou but splitted into two parts: public and
> private. The public part is located in the dt bindings and can be included
> from device tree sources. The private part is in the drivers/clk/meson
> folder, and only clk drivers can use it.
> I know, there is some trick when the user just inserts a digit value and
> doesn't use constants.

This is not a trick. This is how DTS works. You have only indices/numbers.

> But I'm starting from the assumption that such
> dts changes will not be approved by maintainers. In other words, the user
> *must* apply defined ABI constants from dt bindings; it's a strong
> restriction.

But it is not correct assumption. Defines are very important, but they
are just helpers. Otherwise without defines you could not use any clock?
We pretty often use IDs - for DTS to allow merging via different trees,
for DT binding examples to not rely on headers.

Your driver implements the ABI and the driver exposes for example clock
ID=2, even if it is not in the header.

These IDs are unfortunately undocumented ABI and you if you change them,
users are allowed to complain.

Solution: don't do this. Have all exposed clock IDs and clocks in sync
(and continuous).

Best regards,
Krzysztof

