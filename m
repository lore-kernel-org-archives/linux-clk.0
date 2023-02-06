Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D146FC05027
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 11:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjBFLXk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 06:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjBFLXi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 06:23:38 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505F210410
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 03:23:30 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id mc11so33151021ejb.10
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 03:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ox3sLMvy5JK6Q/gX+6AJCTV0Sr/EoCPVWT7KFDWPgWg=;
        b=yOMLpd8czAC6J1ZcVEbpS3ijmB5oKfB5VtKT+RLKhLBuhLjXssdx1J0oTKzgkEhqSr
         B8v0EJ5xHwIAkXkTbjedmC1iAsTvP40nEIAkktLfXnOS8EKlr1CRsLwLXYLyTNG7J5+6
         2lAQKLOde2lYL/hJiMoQJ92qjx/qLqr/yBZnuxQXMD6lQ6r3V5qwa5hniuZdw3gBtrJM
         SX6rWUbruFO/cfjyu6IkqqMLRkOMVkafwN2e92b0pJlVkMflVERNHJRSB09V+Th2QSnb
         likk8M4ZYQJhRnDSxr/mfCKOnKYwAm3KkTKE8BJ8zHc4IRdTn5niSY1b4Z3zI7uNeMPu
         ncKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ox3sLMvy5JK6Q/gX+6AJCTV0Sr/EoCPVWT7KFDWPgWg=;
        b=uXfwruGMxktvZmL+joKHBC/vVPrY7ekzRvO+nWAVszApaIsWgYvoNjyRBCyRIbF7wo
         8+8yyIbeLRMGDj7fIrZmfw25J55jniJe+NglSEZJ3Z4jBcH1IAzqQdgUbYiT2Z2jotl5
         AEFzTIYS3ZLobeUj1KUf2F6q7ZyX8SOMhYJgV1yk1mzITnzU/XXD99ENUquHYu+pwcFV
         fwhQCd5yRVPEko7BFGF0ikBILH4fvUyqR9yy0beOmfm8Eri9fEtDpT7SnkM8uwNPkNZW
         V/khm38Vpza/SZic6uk09XSNJCg958k5oafHWdCRmV4Kmby54nlqjWB2ce/S3TX9Du2C
         s8Bw==
X-Gm-Message-State: AO0yUKXYPsECthNxkpX1clXID1gDTwN1U6AB50bUUeSYPSJUpn8r7JIy
        xOvymkF2uGzC97MxUxq5LZJqwA==
X-Google-Smtp-Source: AK7set+Ipi12ujUkGwXBVG19EHyv6UWyXlhzd4uEvFMQxrrgXjQAxrfRMv6ClUrW9ZI8GvM5FU6mLw==
X-Received: by 2002:a17:906:140a:b0:88e:e498:109b with SMTP id p10-20020a170906140a00b0088ee498109bmr15880643ejc.5.1675682608885;
        Mon, 06 Feb 2023 03:23:28 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id u21-20020a170906125500b0089b6fd89429sm2244298eja.10.2023.02.06.03.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 03:23:28 -0800 (PST)
Message-ID: <20b91f29-b47d-3051-a84a-744b8b44f4e0@linaro.org>
Date:   Mon, 6 Feb 2023 12:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
 <f563f3e9-2c50-4509-a44d-9406bc725a95@linaro.org>
 <a5635503-2d03-3996-a60f-f6255e407ca1@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a5635503-2d03-3996-a60f-f6255e407ca1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6.02.2023 12:22, Dmitry Baryshkov wrote:
> On 06/02/2023 12:44, Konrad Dybcio wrote:
>>
>>
>> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>>> Add another power saving state used on SM8350.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   include/dt-bindings/power/qcom-rpmpd.h | 1 +
>> Wrong patch?
> 
> And this patch is correct. sm8350 GPU OPP table uses this value (but as doesn't reference the rpmh's opp states, we don't have to add one there).
Okay, but it's *just* a header entry, so the subject is
misleading and you're not adding the dt part here.

Konrad
> 
>>
>> Konrad
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>>> @@ -211,6 +211,7 @@
>>>   #define RPMH_REGULATOR_LEVEL_MIN_SVS    48
>>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1    56
>>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS    64
>>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1    80
>>>   #define RPMH_REGULATOR_LEVEL_SVS    128
>>>   #define RPMH_REGULATOR_LEVEL_SVS_L0    144
>>>   #define RPMH_REGULATOR_LEVEL_SVS_L1    192
> 
