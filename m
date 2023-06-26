Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2492DEB64D7
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 16:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbjFZQUd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 12:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbjFZQUI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 12:20:08 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5931BEE
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 09:17:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fb10fd9ad3so7457585e9.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687796222; x=1690388222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXeypSA36Qg27xwQK6BwDtx9kWu+FNhZhOD5YziOszI=;
        b=sPsZ86m5T5T04cUPJ6T5/9291QbjPMFyaSlceLp+6Z3VkTseFFaRaaj41GdRaDMyKW
         AvmGwchSI6OBo/R40KeXNU5aHaqvZvg0lsACalGibHKNU+CNWuFw1mvHO/nh0DKSi9a0
         4bS3YQTuGx565//jrqHhGQlMAG8aZv1g8XI2BA12PuebSxfmh6hdCsToQiU7W6v0XrZZ
         8FPHh/SQoESnw4D6xAaMCB6CFHo+5T5YfwNWcymt+52ohKUxeXvttYBts30DvDz1SqJ1
         BuzYc+04nuOYWdh7C96S21OoNlqBBJiFS3mSwLElfEbgAGB8EKt0oDV1Lviql/E0lEQa
         8pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796222; x=1690388222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXeypSA36Qg27xwQK6BwDtx9kWu+FNhZhOD5YziOszI=;
        b=a+UdxSxkkyjxhgkD48mPlTUuTTzHUA1zSyiMQWO3N1AepdANQYkb8/B2W2qn3RArQ5
         L/LDqfpe9njcVBJUMom4UWcW2sIxVXBK+g59sP0JDTiduCufk98iqPO9jcnHL7EC3b3p
         gps+3dPniRGwEMxDezdp6KFmpF84W5fzcTJjUog+3etOAhU6gqZNSf9PfocwaPfa5yDV
         1wytansSa77gcoMA71pEBJ7aB5icHbAZPcWMHLwsSEFHvnZmBYPhArfr9io70XdSSUd7
         Cj6iuZV8s1MS19m/n0egWv6XJkH4CKX8czwmEryKYT+SRhK9AiNiqCBRDK0VOJaCBxTD
         5+cw==
X-Gm-Message-State: AC+VfDw1uOK0u2KKMtxdi74DT5HkYShCvYwwrQHeRLoUF2l5zhpG6FCJ
        v37tyIUlxG8cZVbj3RTT30XKkw==
X-Google-Smtp-Source: ACHHUZ5D7uHptdZqFo2PIkF6RpQXHdVAueCcOlxaXh158opWn01xLXfxyk7SpixUISeHvjWi2z+a3Q==
X-Received: by 2002:a7b:cd1a:0:b0:3fb:7184:53eb with SMTP id f26-20020a7bcd1a000000b003fb718453ebmr127490wmj.18.1687796221657;
        Mon, 26 Jun 2023 09:17:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c230700b003fa968e9c27sm3404076wmo.9.2023.06.26.09.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 09:17:01 -0700 (PDT)
Message-ID: <a6f3906a-98a7-de7a-3e26-4b8c45fe93f7@linaro.org>
Date:   Mon, 26 Jun 2023 18:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
 <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
 <75d64lixeawfoqbrctm4thzh73cxkvnlmnh5xgbpf277pmh3gz@zthnqvvuxmeq>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <75d64lixeawfoqbrctm4thzh73cxkvnlmnh5xgbpf277pmh3gz@zthnqvvuxmeq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/06/2023 21:52, Marijn Suijten wrote:
> On 2023-06-24 11:12:52, Krzysztof Kozlowski wrote:
>> On 24/06/2023 02:41, Marijn Suijten wrote:
>>> SM6125 is identical to SM6375 except that while downstream also defines
>>> a throttle clock, its presence results in timeouts whereas SM6375
>>> requires it to not observe any timeouts.
>>
>> Then it should not be allowed, so you need either "else:" block or
>> another "if: properties: compatible:" to disallow it. Because in current
>> patch it would be allowed.
> 
> That means this binding is wrong/incomplete for all other SoCs then.
> clock(-name)s has 6 items, and sets `minItems: 6`.  Only for sm6375-dpu
> does it set `minItems: 7`, but an else case is missing.

Ask the author why it is done like this.

> 
> Shall I send a Fixes: ed41005f5b7c ("dt-bindings: display/msm:
> sc7180-dpu: Describe SM6350 and SM6375") for that, and should maxItems:
> 6 be the default under clock(-name)s or in an else:?

There is no bug to fix. Or at least it is not yet known. Whether other
devices should be constrained as well - sure, sounds reasonable, but I
did not check the code exactly.

We talk here about this patch.

Best regards,
Krzysztof

