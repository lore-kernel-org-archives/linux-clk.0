Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA873EB64D9
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 16:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236187AbjFNQs0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 12:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236080AbjFNQsX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 12:48:23 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89994213B
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 09:48:19 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f122ff663eso8988793e87.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686761298; x=1689353298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjxCr0Eyh5XbtZr9j4fPMosNiG88CLowvSkvH9o00qg=;
        b=dUQrEGguhCOeiIreuYJckzj9xEbYgKzR9O7bg7RaQiFUr1CtuR3rCQGKo6uIAEdSza
         fmA68LBIw3hiGK2Zbv3M2hAIqtnhquH9BMBSEAvIhpxG/Sb5boKP+IgIlhRv7yI8jc2q
         tDH2NULoUW/ZrXHZqIOwNiTX3NivoyMoSHFQ8juQuQuhGqoabWt3FGP2JTMGpqj9Uw14
         h+xHLCZ72QUhJnmzHxfxXVA+tXYijosWSwZf5dZe2W9hmqmZBb7oApWBs3VYsftpLyMy
         tTervyWNSTQ/s8E2R2+DHqNSV9ILxU8EY/toBbxeBMOMK2FDSLNmvCBfBskvipbofMbz
         RRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686761298; x=1689353298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjxCr0Eyh5XbtZr9j4fPMosNiG88CLowvSkvH9o00qg=;
        b=Cgywy5RwMKVaQfYQejgtgOzekJi1i2IB5FEVCFGL0mfS969k+YRFU8moPx4KosWgTk
         6Cdjp1VKRN3zYQ6ImEmdKkyNWRLZQqmgCoa60YDsr0+Z5Ntq1Xw0wjNrVFedEuDMrgHt
         gBKdyN3HbV1WsKyPKFPMneFkF30GA3MV9o7GjqQvwa5cnJXOFzWMgQQ0UVNH+sZMqwje
         jmwnmf++rkaFSRvFwc2heJoWpdSAlIhdryTXn+oOLX8YRfRGHCai4eyeJAl05qkDlGTj
         Pve/Lxbu3Gb1DL3F4qicg0zHGAvbv6DffNkoaIgBcBZJK3hHDOcw8DRu0Ur1sP5DyZ4R
         k7aQ==
X-Gm-Message-State: AC+VfDzg7JIPoRoKvvQGqX4ZMFd9gzs0WShfK/IbNd/4/0C6qmWvZz0r
        zwKc5jnmYaDQ/VcemzM2rUa/Fg==
X-Google-Smtp-Source: ACHHUZ6vRWUxacyXAGtcmWUgz5ZEqNlOF23a3xrKApRe3wLOIxFWW0iDZdKnR17e48t+x/c+7FJClg==
X-Received: by 2002:a05:6512:1c6:b0:4f7:672a:453 with SMTP id f6-20020a05651201c600b004f7672a0453mr1514602lfp.17.1686761297596;
        Wed, 14 Jun 2023 09:48:17 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id w8-20020a05651204c800b004f640b0fb04sm2196761lfq.212.2023.06.14.09.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:48:17 -0700 (PDT)
Message-ID: <c1c84eef-ee43-fcb9-de93-ba609b842d87@linaro.org>
Date:   Wed, 14 Jun 2023 18:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 01/22] dt-bindings: interconnect: Add Qcom RPM ICC
 bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230526-topic-smd_icc-v5-0-eeaa09d0082e@linaro.org>
 <20230526-topic-smd_icc-v5-1-eeaa09d0082e@linaro.org>
 <c8573d08-d4e2-41a8-f0b1-e1d7a0c9ce17@linaro.org>
 <e7a083f6-e885-113b-bb6c-d20108777c5e@linaro.org>
 <47cfe777-45b9-6303-1374-bc96803d26d4@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <47cfe777-45b9-6303-1374-bc96803d26d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14.06.2023 18:47, Krzysztof Kozlowski wrote:
> On 14/06/2023 18:43, Konrad Dybcio wrote:
>> On 14.06.2023 18:43, Krzysztof Kozlowski wrote:
>>> On 14/06/2023 12:22, Konrad Dybcio wrote:
>>>> The SMD RPM interconnect driver requires different icc tags to the
>>>> RPMh driver. Add bindings to reflect that.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>  include/dt-bindings/interconnect/qcom,rpm-icc.h | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/include/dt-bindings/interconnect/qcom,rpm-icc.h b/include/dt-bindings/interconnect/qcom,rpm-icc.h
>>>> new file mode 100644
>>>> index 000000000000..2cd56f91e5c5
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/interconnect/qcom,rpm-icc.h
>>>> @@ -0,0 +1,13 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>> +/*
>>>> + * Copyright (c) 2023, Linaro Limited
>>>> + */
>>>> +
>>>> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_RPM_ICC_H
>>>> +#define __DT_BINDINGS_INTERCONNECT_QCOM_RPM_ICC_H
>>>> +
>>>> +#define RPM_ACTIVE_TAG		(1 << 0)
>>>> +#define RPM_SLEEP_TAG		(1 << 1)
>>>> +#define RPM_ALWAYS_TAG		(RPM_ACTIVE_TAG | RPM_SLEEP_TAG)
>>>
>>> Where are these used? I don't see any DTS in your patchset. Did you send
>>> it separately?
>> In the driver for now, e.g. patch 19. DTS can only come after the
>> driver is fixed or things will explode!
> 
> You reference it in patch 19, but I still do not see the constants being
> used.

Fragment of P19:

 	if (!tag)
-		tag = QCOM_ICC_TAG_ALWAYS;
+		tag = RPM_ALWAYS_TAG;
 

Konrad
> 
> Best regards,
> Krzysztof
> 
