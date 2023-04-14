Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C04DC77B72
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 20:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjDNU6c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 16:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDNU6c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 16:58:32 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6246C76A6
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 13:58:22 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id rp27so11722212ejb.12
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681505901; x=1684097901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUyDRWdW4/T9LZmqkwqHBULPvN8LvBPM7VEGve+sN8g=;
        b=OdJSsd/FdJ7uw4V93teLUlao9crPOo+y95Ky2Gvxq3OzuUS3+tcSSCmTujQAokps5+
         zEnfIEMkDrLcIogRreJ/zFE0mjgnHJ3c51IZwj1v6Qm9KFp+z4yg4FTXZkrlh3ruRDv1
         59c4SLQze2J/cjBLpRsDm0wv7f2oUJHg9HG+TO+IyPOWyjlUCKOl6PF/fnbUp01iRDg8
         oogkunsK3phR1tOwxJofMGpnfzmWHfzG8t35tMkrep1Fmv+HB492LHrY71q4AHIFpN1K
         m8VYPlkmlsSI+OkS+wAXzkpEnyb8C456rd+VuD5cMcmAEt47XAw9ertsCnzrX8WhVTiu
         vqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681505901; x=1684097901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUyDRWdW4/T9LZmqkwqHBULPvN8LvBPM7VEGve+sN8g=;
        b=BbRbwMI6yaJeO514GuM3Iyo61k8N+axNbHBQbLaPDDoMFqTmv23ZaMCIzPaLa3FztN
         /LBSN6sumv6xKdFwhaDqmFhgXKCdBDoJpr18+p+1sv87vzn+95zfKDhyNIUnG/lx3uvs
         VOrkk0CPHExEOgQl3s3IdhPa3x0QPlyj8Md0MZAipbmPxf9kPrpAgBauS3Rq+itGOcTE
         65Vty0H4DdsbfOdQxAK/mNRWApzOZTMCN/XWA0ebFsj7Y38B0CcaY4fuJk3p7SAEtIJ0
         m52OBNhIRIO+JtRExM/26llSjQcGZD6SjkDY1dgCJQffnDENK5aEYyygdg3EBk+r6XtR
         EKJw==
X-Gm-Message-State: AAQBX9fg5YykvY91BlwVAAW7fv7M6SCoXVHmU9cAmoRelQePyy6KPQ2q
        TMAwadY167tNMPkDNMe5PI3RQ0Kd6BoVGZTPgpE=
X-Google-Smtp-Source: AKy350bHG+Tjne2i7DGoav1XsNtf8dsquEfcTHErwlmyWJd6LW+OSBvc9vPc2bv0IkfaaPPCx+HkSg==
X-Received: by 2002:a17:906:179a:b0:94a:74b8:7b85 with SMTP id t26-20020a170906179a00b0094a74b87b85mr378586eje.6.1681505900834;
        Fri, 14 Apr 2023 13:58:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ffae:8aab:ae5a:4688? ([2a02:810d:15c0:828:ffae:8aab:ae5a:4688])
        by smtp.gmail.com with ESMTPSA id ia20-20020a170907a07400b0094a671c2298sm2910089ejc.62.2023.04.14.13.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 13:58:20 -0700 (PDT)
Message-ID: <ff8c9220-369d-332c-1cf0-dca8be8f8241@linaro.org>
Date:   Fri, 14 Apr 2023 22:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add SM8350
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230413-topic-lahaina_vidcc-v2-0-f721d507e555@linaro.org>
 <20230413-topic-lahaina_vidcc-v2-1-f721d507e555@linaro.org>
 <20faef75-9182-6e67-8ac5-c8234318ab64@linaro.org>
 <CAA8EJprnD0jSH7JvhoEnqhNxC55TeqCvvR64R7U8Ni7M93N2eQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprnD0jSH7JvhoEnqhNxC55TeqCvvR64R7U8Ni7M93N2eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/04/2023 18:45, Dmitry Baryshkov wrote:
> On Fri, 14 Apr 2023 at 18:18, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 14/04/2023 13:26, Konrad Dybcio wrote:
>>> SM8350, like most recent higher-end chips has a separate clock
>>> controller block just for the Venus IP. Document it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 29 +++++++++++++
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Krzysztof, Konrad, would it make sense to split it into separate
> bindings? After all, previous videocc bindings used clock-names, while
> this one doesn't.

Yes, makes sense. Otherwise I am afraid allOf:if:then will keep growing...

Best regards,
Krzysztof

