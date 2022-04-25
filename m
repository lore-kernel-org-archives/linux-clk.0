Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A829C4167B
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 20:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245401AbiDYUeO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 16:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245435AbiDYUeM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 16:34:12 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0676F2715F
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 13:31:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id be20so11519204edb.12
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QEWI49DIkFq3xz5aqme4xH1CUQfbVOVg+14bCxnOpwY=;
        b=GWeeMNxiOvZ2MEjV5lJ0JkaarUmpOQmX7WiUt8zCGDFWdzIgsw7tMh4A6keXYfm25C
         9m+pH1W5rBWouBR0SeFnMfXYe0HqJUHklk0SWx3U5m6ChNDAcPDzIzgV2K5Zl6UCGynr
         fZryzeneEkMp9pFKQc+cxftRmyMB7nCuuZzjHDTPWJWIYNOLVZKqOBRLMa0WtaY7R9Wu
         nDXnNtl4NQohg7f4cLe0yOUnKpi4JtTufOEVdg4dlRguHneDx/AqexcU2Xh69pIE9z4/
         XAbPiJW4iA1FjQo9xOEekc8mf+MocAQMZJxpKDQ5G2k/OwpKzUSaO3ix4eNQAQ1Mobu5
         2xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QEWI49DIkFq3xz5aqme4xH1CUQfbVOVg+14bCxnOpwY=;
        b=lmcCnYm2LWSXVJIoOZFmthTBE1oA6o+FJBfT7tlWlhyTl7Qsy0AujnL73EQbmEaTu4
         AqM6P3BMt8oWncvM/KauJH5WLmGicmCfH/VCnypGxDnQ/ASdfZbKenAGAj0be+tl3GmY
         pFNfGYlSCPR/CfV7DFamkxHgPM4S6qr16aEL29XKBLxWjaYo24Ktk4lc9Zzs0cDKCgnr
         vGJMAkX/m88yGFEMv5LuT1OA+AEY46eJc+11i3Z1xLt3YcjwE+mXqn9vteVYDKvsx/CI
         FS8+cdvabeqBuvxIeeHJmyZ0dzozaZ1rNrlwtEn18eSsmgnp/6tYAEgeARVpjLW72q3w
         6JwQ==
X-Gm-Message-State: AOAM531FeYZrPX8FKvNW5oEYKCMBnI0Oooo4zftEG90W57rDisVOrKyX
        kvyWA8k5PNaEBYCJnoZrtIKkKA==
X-Google-Smtp-Source: ABdhPJwBV+KTPEi3we1/z4LAXYT4VxbYRDl2XXgZb+ETedGwoRHTIb6nRCqB3zbKW3Gn13wuQJajjw==
X-Received: by 2002:aa7:c789:0:b0:413:605d:8d17 with SMTP id n9-20020aa7c789000000b00413605d8d17mr20736598eds.100.1650918665623;
        Mon, 25 Apr 2022 13:31:05 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n25-20020aa7db59000000b00415965e9727sm5047739edt.18.2022.04.25.13.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 13:31:05 -0700 (PDT)
Message-ID: <6cbf4b30-0283-1723-212e-5a772c6a7b10@linaro.org>
Date:   Mon, 25 Apr 2022 22:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: qcom,gcc-apq8064: Fix typo in
 compatible string
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220425133527.3723233-1-robh@kernel.org>
 <20220425193253.06828C385A4@smtp.kernel.org>
 <YmcDJw6T7p4dtFYc@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YmcDJw6T7p4dtFYc@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/04/2022 22:23, Rob Herring wrote:
>>>  
>>>  properties:
>>>    compatible:
>>> -    const: qcom,gcc-apq8084
>>> +    const: qcom,gcc-apq8064
>>
>> This file has dt-bindings/clock/qcom,gcc-apq8084.h referenced. Should
>> that be removed? It looks like commit a469bf89a009 ("dt-bindings: clock:
>> simplify qcom,gcc-apq8064 Documentation") took the more than just the
>> compatible for apq8084 from qcom,gcc-other.yaml and put it in here while
>> removing gcc-apq8064. Probably the apq8084 part needs to be a copy of
>> the apq8064 file with the single compatible changed.
> 
> IDK, can someone (Ansuel?) fix this properly?

I'll look at this and fix it.


Best regards,
Krzysztof
