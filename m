Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CD1ECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 21:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237164AbiJ0V7i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 17:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237160AbiJ0V7f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 17:59:35 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C7F26E7
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 14:59:31 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id o8so2727754qvw.5
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7ugP0tq/kTqwapqa/g5RjNpPzZRDaE9uddOPhLuISc=;
        b=o7sW47GHzXAoiD2j6H6QFu/7GUf/pA0/oDdbcm6+sZ9bOmjpAo/qB24B0IowZvt9P+
         uEs+wbUUSlkmnLlVdNkn65fxdk5zBa5isbU+FAL+wpT+pO1YhGTdX2/pgOan1gvHNCPl
         9qVN6T8ALdciWQ3Oo6k2+p55TKJ4AkaLgvxO0mveT+TCFzB/fAyxkViEbfJuupiToNIT
         NQQWZo2QRbvY79zCmS+btF6flLLVtGFS+nGdVlM9nxoJw0C4oyKnyiBlDa+GMxDYAbRT
         Yl7yiRraviHFOwYRsvBF8ogkgaSuOEtsuk8P1O7ywuqYPLFqDn6QWUmaDLBhaxsQL30e
         +N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7ugP0tq/kTqwapqa/g5RjNpPzZRDaE9uddOPhLuISc=;
        b=73nFVinRKUQqPgiYxNnR/h6Z3nuwhsCKraVF3sQcLLz6g3J157s/ZXQ1LlORYtHrAt
         PsmuOrtSwvw0WEd3xfgkKiLljJiIz3yxL08aKC44JMcZwtk9rUNv/Y8I7p3JqGxLIh2S
         iWSdwxQEPQ7ZBsFYRqlbh5NdDpFzdJOe9KbYz8a0BgqQpUMBAh+qZQxs3b+3LXY5xUBR
         yEdfQiEkuoYv6n2fz2KPgtH/Jxyo0Vgp8YnIOksrwaX8Z/ELyhWNCm3sEAa1FQ7xQ3FT
         GYMILuu34bf0rVnsoFhGuT7GG+7OFgMi1GNvKFZ6lI2EGv79OUC2ohuz3u08fCeGy8nG
         r2DA==
X-Gm-Message-State: ACrzQf3gwvmgKMTIZW96ihuAMJf+rBmUIJoWypaTiQXfKcM8YoR7xa6m
        PGXG+l7iu4EAajGX4bynR6ttvQ==
X-Google-Smtp-Source: AMsMyM4FZ19Rf+aeDh57uIFiQqlt84X/FMAN2OviCklU/tLpK688yp4VPjiM2ZG3IyKbfArb+7ea7Q==
X-Received: by 2002:a05:6214:20a7:b0:4bb:9359:8368 with SMTP id 7-20020a05621420a700b004bb93598368mr10237414qvd.122.1666907971077;
        Thu, 27 Oct 2022 14:59:31 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id k10-20020a05620a414a00b006be8713f742sm1794489qko.38.2022.10.27.14.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 14:59:30 -0700 (PDT)
Message-ID: <2c8c4642-8aee-3da3-7698-5e08b4c5894d@linaro.org>
Date:   Thu, 27 Oct 2022 17:59:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Add QDU1000 and QRU1000 GCC
 clock bindings
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-2-quic_molvera@quicinc.com>
 <e5009a33-1f71-1fe3-3a06-98bba031fdf0@linaro.org>
 <20221027182449.366AEC433D6@smtp.kernel.org>
 <cb9a2732-0904-4a2b-61a5-a6d65cad58ae@linaro.org>
 <a5e8c70a-3358-513b-c8a5-7a7903f6ea42@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a5e8c70a-3358-513b-c8a5-7a7903f6ea42@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 17:28, Melody Olvera wrote:

>>>>> +      - description: Board XO source
>>>>> +      - description: Sleep clock source
>>>>> +      - description: PCIE 0 Pipe clock source
>>>>> +      - description: PCIE 0 Phy Auxiliary clock source
>>>>> +      - description: USB3 Phy wrapper pipe clock source
>>>>> +    minItems: 2
>>>> Why the clocks are optional?
>>> They should not be optional. They're always there.
>> Just to be sure - I refer to last three clocks here as indicated by
>> minItems:2.
>>
>> DTS does not define them, so something here is not complete or correct.
>>
> DT is incomplete; I don't have that in my current patchset. Will add later when PCIE and
> USB nodes are complete.

Bindings should be complete as much as possible, therefore please define
in the DTS stub clocks (fixed clocks) to fill these with a TODO notes.

Best regards,
Krzysztof

