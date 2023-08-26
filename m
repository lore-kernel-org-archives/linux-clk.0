Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD6FC83F15
	for <linux-clk@archiver.kernel.org>; Sat, 26 Aug 2023 09:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjHZJq3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 26 Aug 2023 05:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbjHZJqT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Aug 2023 05:46:19 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52307E7A
        for <linux-clk@vger.kernel.org>; Sat, 26 Aug 2023 02:46:17 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c0290f0a8so214808666b.1
        for <linux-clk@vger.kernel.org>; Sat, 26 Aug 2023 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693043176; x=1693647976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/9cF7mUGcs5lnURjy7czI/q0cwno2d09/e2CkYrp74=;
        b=iXXSLwwIRGNrtx2YExsxI7JPrANjYjRiv4pogNxDEWAvhN929yxMbz+1yFpp+uCmaK
         Nm5sJ5x2vtXm9NLcNEbRWQC8Qb4hKl69abp+XapaXEJRmVBYxdoroSnDPV9Qlq9KoSjy
         oj+0jC1HRvFeCem4I1sZ1Uinw726gdUCbOhEcaTPv2JM2NsgEgLyIyRcWUXHGp441NON
         gIxG9UK+BpwCgnjHS3itX4YhV5leVdq7ML0L8zuGudv5d+ArDGblmdI05J0WfEdtAuuF
         JQ71d7zi69AMMZGIK9pv4zOJRgVPAJT5V04K+STOHKU9TkwFf6wKadiO9Bpm6yhPQiGi
         U8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693043176; x=1693647976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/9cF7mUGcs5lnURjy7czI/q0cwno2d09/e2CkYrp74=;
        b=aQ1QaJ4IT3yzaOz+6Gc0WrJPigMvf0h+eiM/SV6Je5s85Hp2xm0cw0banZvurWqF2D
         cLySjfHIGWAS/lZul/7TEcR+ojGg840u5/07qitEb/MPrDKxLOozwUAk7/iy1SU1GKBH
         d+4zrHcbIc/WV41ZbFqUTfzkoe8Lj9OAN08HnY6jw/PmTaP6vV7WTvVfm4wyaZtL3ai3
         gW+yqxKIy5/jgtwia60QOucSaJ6t8t+SXWeMXK7Hannb656XIiNvNeEBSmWdiTm6LbvS
         zfGBK+8x205rf2L5mO9bUlw7ZrvicGEiuWH3pdpKZW/XnSCDCYEh4lUf7Ym2l2SnsloM
         YZ2w==
X-Gm-Message-State: AOJu0YyUiTrhcorJxnbJNM1dMR9ZkHmp3PbdJpNII5qrh0GhzTj3ADf6
        QG3g9UoglpEgiyRe0SzjYi7hiA==
X-Google-Smtp-Source: AGHT+IF6ONPf1t5PcgHA07gMjKsXc4Q4wOIhd3qXTJXgn/fivxGj+UiCAcfYejmfcbHb598D7X6wvw==
X-Received: by 2002:a17:907:7845:b0:9a1:8f6f:6873 with SMTP id lb5-20020a170907784500b009a18f6f6873mr13551115ejc.33.1693043175769;
        Sat, 26 Aug 2023 02:46:15 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090699d000b0099315454e76sm1928144ejn.211.2023.08.26.02.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 02:46:15 -0700 (PDT)
Message-ID: <997bab8c-aae0-1f04-0a31-8d02ff6abe67@linaro.org>
Date:   Sat, 26 Aug 2023 11:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SM6115 LPASS clock
 controller
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org>
 <20230825-topic-6115_lpasscc-v1-1-d4857be298e3@linaro.org>
 <40fd108a-86e3-e68e-04bc-caab45a3381e@linaro.org>
 <3985f56a-7152-4b73-b456-24d3a329a2b4@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3985f56a-7152-4b73-b456-24d3a329a2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/08/2023 11:39, Konrad Dybcio wrote:
> On 26.08.2023 11:28, Krzysztof Kozlowski wrote:
>> On 25/08/2023 20:13, Konrad Dybcio wrote:
>>> SM6115 (and its derivatives or similar SoCs) have a LPASS clock
>>> controller block which provides audio-related resets.
>>>
>>> Add bindings for it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../bindings/clock/qcom,sm6115-lpasscc.yaml        | 53 ++++++++++++++++++++++
>>>  include/dt-bindings/clock/qcom,sm6115-lpasscc.h    | 15 ++++++
>>>  2 files changed, 68 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
>>> new file mode 100644
>>> index 000000000000..58ee84aed073
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
>>> @@ -0,0 +1,53 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,sm6115-lpasscc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm LPASS Core & Audio Clock Controller on SM6115
>>
>> Everything here looks the same as sc8280xp, so this could be just added
>> there as enum. The overall LPASS block version is different, but the
>> resets/clock controller look similar, doesn't it?
> I think the 6115 cc block is a bit different, 8280 has more swr
> hosts. Maybe Srini would know more.

Indeed, looking at downstream DTS this is closer to SM8250 and SM8350
than SC8280xp, with some interesting differences. But if you bring it
up, you also might fix SM8350, to which I looked a bit but then gave up.

Anyway, with the example staying or removed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

