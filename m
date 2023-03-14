Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6489C7618B
	for <linux-clk@archiver.kernel.org>; Tue, 14 Mar 2023 15:41:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCNPlR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Mar 2023 11:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjCNPku (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Mar 2023 11:40:50 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BD4B1A79
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 08:40:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id y14so2094826wrq.4
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 08:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808421;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=txkXz/I3r3Tjb5s8k1jSMemJtidVgLhZ7+02zqLYGf4=;
        b=sD6q8uCo8xBD0SMMmwkuzWrvH9QcadfmFi4Z+WiGG7JnU3M7+5m5oo1OLN4tkuNsrk
         rUJ6NQPlzNUtqwoCi31FrojSxjnNDfgnvzH3+a/4CzEKlXKIeA7PrzyMv6HymuGSSgvz
         wohHyqnxU6dYWpIgbNHHGD2C94TmbVvu5PBKRQbrwj4UqgumRQvG+AnArg2MXqlYtrjL
         Al/uLzsabUckDbPAX+VH06mju/nbsLsJf7CwOiCN6WRBKNpQEsZQDMzrKDHGxtDvYh34
         ff477xAWAkCRmkVGI7JUbZiLEI22/ho/M3v7jfYIlIs5U6CtMuELrINjyOaQWe2/UvQ4
         L0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808421;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txkXz/I3r3Tjb5s8k1jSMemJtidVgLhZ7+02zqLYGf4=;
        b=JDnDn8ool+4Xv/ZftBAkRZnnHY1u2G5rrJT4T5K5Yfo2px+PYY/bLpVlfsD8EEHh6m
         PJ/yn9VZw+9Cixt5oroVMB5nkRi7XW/34QQ9H800n4+xkNdzCA/wRzX5ie5J9j0Ib0q1
         jcCpkJs6JqyV9WOODmNOd44mvM9b4Vba/xnzk334eXohrKnHUrBW0vJQTiA3f5GxP2Ib
         5mPtUBOq6cNqKRFajaxwYWrpRCYJtBoUBOrGUqOptWmd7ZpLyvbES4Oa1qqBbgMoMXUQ
         VJpSuj3QyDQe60oVio5e7lneKRmQJvLOHNibf+xe11NQ0lSpFuBg1cwxoBYg6BLNDOBe
         x9Kw==
X-Gm-Message-State: AO0yUKXgE4TdgXsmfh8c3v2LLVE1rJiHod5VH+Z/ufbpp38OvN3PqPWS
        +QPxlvd+f9gzhwcq5JVKztJAnQ==
X-Google-Smtp-Source: AK7set/rB1r35ueF97ISYBhFnUPTdvBSKd9cI6GOQPNUprLBXMlhEuGTztdytq7ar4n0jR5So2Z6jQ==
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id c17-20020adffb51000000b002ce721942b8mr17688166wrs.32.1678808421181;
        Tue, 14 Mar 2023 08:40:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11c3:d4e5:ef75:8eb9? ([2a01:e0a:982:cbb0:11c3:d4e5:ef75:8eb9])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d698a000000b002c71a32394dsm2291933wru.64.2023.03.14.08.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 08:40:20 -0700 (PDT)
Message-ID: <6b7ae52c-d84d-8d08-139c-5c67ec363e85@linaro.org>
Date:   Tue, 14 Mar 2023 16:40:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
 <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
 <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
 <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
 <c8fecf94-2581-6cc9-955c-324efdc7c70a@linaro.org>
 <21add21d-4afe-7840-6c49-3786f82761d9@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <21add21d-4afe-7840-6c49-3786f82761d9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/03/2023 16:37, Krzysztof Kozlowski wrote:
> On 14/03/2023 16:33, neil.armstrong@linaro.org wrote:
>>> There are many ways - depend on your driver. For example like this:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-exynos5420.c#n975
>>>
>>> The first argument is the clock ID (or ignore).
>>>
>>> BTW, quite likely the problem is generic to all Meson clock drivers.
>>
>> This issue about "public" non-continuous defined was already discussed at https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
>>
>> I don't see what's different with this one.
> 
> So you are aware that all undocumented clock IDs are still allowed to
> use in DTS and they are ABI? Changing them will be an ABI break.

Yes of course.

Neil

> 
> Best regards,
> Krzysztof
> 

