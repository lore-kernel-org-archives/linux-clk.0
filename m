Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6E6C6FD1F
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 08:38:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjCHIi3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 03:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjCHIiJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 03:38:09 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AD37D98
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 00:37:43 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id j11so43013383edq.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 00:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678264662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/WzsZEhRWqesaA/VgihYCVlcuAuHDDmWjDn5s627q8=;
        b=hkLM635i6PbEzvxaklVMhvnoyMxzoamNwWrBl9HRjPD1ixywfwQssDR/Fq0d56W/J5
         ysP6gO+qTrOiwQltIacANsamOhN3sRFf3w8GIODKbgkNCQl/Aeok84B2diwhk00a+7bN
         4vMszuLBYpz/SHYSsU9Ej3PLkKVv/nBZ2eBO15DxYaqo85ExNyFLZ9gpq3si3LieIXNt
         7u2EeAKi52aDAte2DNGjPxVVSfWl4pj110+AbjWI9LDbgpi3mqKDeNDU2FK5778CaOIq
         eCSRiw+F+hUfqJ06K8iSV9YyZHnkuQoGpmpPe5+sqJWuKyf0Fe3uXb2Dv7yCKud7duQL
         bdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678264662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/WzsZEhRWqesaA/VgihYCVlcuAuHDDmWjDn5s627q8=;
        b=C+vnIhdSLlMCv0Rw8aewYNty3uUD+f68DTept7VWiugLc723qcz+po8bIgCIOHeH0r
         fO9bvg8br5pLw6USJ0p4c5LDYTQYnoof1wdWksm6EPv53FqhgTv3w7sxVlxZFvGMM7Lg
         jqs3A1uD3tAQIGusJo/0zTN+WeFGi3U08vsm2qk2A++Nuu/XJl/xfZDbmRpXhVd9LD9m
         Z9lXLFVlFf6SM3Fljm8puHVJ4zGuHzeT1zenK6FjS+aF1Bmwze/VwqStxORr6RnEcLCe
         I8h3113FdS4vwwTBkY6yNoqsgcZBvEVZ/PWm6PMZpI/cV+ulbDGhlKca3PYXOMNezp5r
         5srA==
X-Gm-Message-State: AO0yUKXrSudwlZQ+tb4C311B33008/a3lOgKu1iWGa+ovw63sYdfQe4U
        Q2NSujypr5mL4UuYygh7FQjKkg==
X-Google-Smtp-Source: AK7set8FU50SUCDPOEAD3jF8EdZXMqpxg583cG8nktaaEmYKPV8Cb4xBm2pZXn2RjynHCuDiBRcqiQ==
X-Received: by 2002:aa7:cfc2:0:b0:4bf:f9f4:9b1e with SMTP id r2-20020aa7cfc2000000b004bff9f49b1emr15578064edy.4.1678264662068;
        Wed, 08 Mar 2023 00:37:42 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id 20-20020a508e54000000b004d8d2735251sm5795219edx.43.2023.03.08.00.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:37:41 -0800 (PST)
Message-ID: <31e2a67a-c046-9501-80de-e754ed450195@linaro.org>
Date:   Wed, 8 Mar 2023 09:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 1/2] dt-bindings: clock: add loongson-2 boot clock
 index
Content-Language: en-US
To:     zhuyinbo <zhuyinbo@loongson.cn>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Jianmin Lv <lvjianmin@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn
References: <20230307115022.12846-1-zhuyinbo@loongson.cn>
 <692a62da-a9a1-fa23-6e24-723d73c3a423@linaro.org>
 <5e9b3bd5-d885-6237-5e14-2becb3c956cc@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5e9b3bd5-d885-6237-5e14-2becb3c956cc@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 02:35, zhuyinbo wrote:
> 
> 在 2023/3/7 下午8:47, Krzysztof Kozlowski 写道:
>> On 07/03/2023 12:50, Yinbo Zhu wrote:
>>> The Loongson-2 boot clock was used to spi and lio peripheral and
>>> this patch was to add boot clock index number.
>>>
>>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>>> ---
>> This is v13? Where is the changelog then?
> 
> in fact, this is a new patch(v1),   but another clock driver patch in 
> this series had send as v13 and need depend on
> 
> this patch so set current patch as v13.

This should be explained in changelog.

> 
>>
>>
>>>   include/dt-bindings/clock/loongson,ls2k-clk.h | 25 ++++++++++---------
>>>   1 file changed, 13 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-bindings/clock/loongson,ls2k-clk.h
>>> index db1e27e792ff1..e86804365e506 100644
>>> --- a/include/dt-bindings/clock/loongson,ls2k-clk.h
>>> +++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
>>> @@ -13,17 +13,18 @@
>>>   #define LOONGSON2_DC_PLL				3
>>>   #define LOONGSON2_PIX0_PLL				4
>>>   #define LOONGSON2_PIX1_PLL				5
>>> -#define LOONGSON2_NODE_CLK				6
>>> -#define LOONGSON2_HDA_CLK				7
>>> -#define LOONGSON2_GPU_CLK				8
>>> -#define LOONGSON2_DDR_CLK				9
>>> -#define LOONGSON2_GMAC_CLK				10
>>> -#define LOONGSON2_DC_CLK				11
>>> -#define LOONGSON2_APB_CLK				12
>>> -#define LOONGSON2_USB_CLK				13
>>> -#define LOONGSON2_SATA_CLK				14
>>> -#define LOONGSON2_PIX0_CLK				15
>>> -#define LOONGSON2_PIX1_CLK				16
>>> -#define LOONGSON2_CLK_END				17
>>> +#define LOONGSON2_BOOT_CLK				6
>> That's an ABI break and commit msg does not explain it.
> you meaning is that need add a explanation in commit msg that why

You need good explanation to break the ABI. I don't understand the
commit msg, but anyway I could not find there justification for ABI
break. If you do not have good justification, don't break the ABI,



Best regards,
Krzysztof

