Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007F1C61DB3
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 11:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241324AbjAMLoo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 06:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241669AbjAMLoP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 06:44:15 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D48564F6
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 03:35:14 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bf43so32727249lfb.6
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 03:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iapGRaVZJCJhixJmVEyuyZPoh1zMlniKZSdec3xz9/s=;
        b=gzuRt+XXCGY+pseGlNd8jzfI0vyS1DiOWhXp42uUmVYV9hVHCcVWWCKiJPPT5yineG
         kWtBfnIkHQ6Ud3vmRf5rmNCqviBMODil+TlyOSjQjXKr+j5EBcKrEDbmceG+MMww7UOb
         PMnN4IxZYd+04iY/L+T1fU8iLgThf6wa+cdwrrzv63Leowz+PLptytw2ZKUHbbmWBLoQ
         t9oX6qWTXDE2CHQ18LIBEX9W1GCGm1n/EhMnw1HYhg9YJHFgptLNbhIVjHIuMhB/08TA
         gWdEdhSO6eDNPzgoSEaJrEpFWI63cP0LVJgkHE4SNEGS9C2Q9uUPITcRC1tLngoD8qiu
         veXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iapGRaVZJCJhixJmVEyuyZPoh1zMlniKZSdec3xz9/s=;
        b=l/YJM9+n6lGdKcAyovgI2TjvtZj/R0+Hto9tlKPxqyvmmbwV2ukLWYj4cNPsVh/BWD
         Zz4NsDDAHOT4gCcoF2nMBd4YFsa+3u3KUq0PaNu+7Vp2jjbUWlwKRxJP2mVWzAiGWeGs
         GYDPf/ZRhT1a9Ciax08HQXWl6y7uxc0xyuL6EF4FeCNnhd6Vy1wdpzA2+m5XBxfQ7no1
         NqFbC2V4J27au77g4Tr+Y+/+gZ8JVyqAD1+7jqcbCaNb4ud4R5SvhbTAf9qqvsuA0myM
         I50XdOsX3GZgsG8vMsehCygbycP068d0zcXiAEKcWBzREJwm0iNXT35ckGeXq2wjc4bd
         VXIQ==
X-Gm-Message-State: AFqh2krx+LneqCeO/oky4rXJ5HmBf0d2aX/nGBa7Ttkxv8635Q3toopO
        esTq0MiZ23k+hEuv69WyBfNosg==
X-Google-Smtp-Source: AMrXdXtQ9D+5uTSbrFcqZzXxSXL0fie2kl2XAydJ3YJvlFna/70bK4USgVvrvOfMPDcWOU9myMUMHA==
X-Received: by 2002:a05:6512:a83:b0:4cc:a108:842b with SMTP id m3-20020a0565120a8300b004cca108842bmr2215979lfu.41.1673609710462;
        Fri, 13 Jan 2023 03:35:10 -0800 (PST)
Received: from [192.168.2.31] ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id v15-20020a056512348f00b004abc977ad7fsm3800668lfr.294.2023.01.13.03.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:35:10 -0800 (PST)
Message-ID: <66296817-669f-b3f9-146e-48d5808e124e@linaro.org>
Date:   Fri, 13 Jan 2023 13:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 11/13] clk: qcom: cpu-8996: fix PLL clock ops
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-12-dmitry.baryshkov@linaro.org>
 <b2798d5a-d637-cc94-501e-0739345f0fed@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b2798d5a-d637-cc94-501e-0739345f0fed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/01/2023 18:10, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>> Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
>> better.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> I *think* SUPPORTS_DYNAMIC_UPDATE should also be kicked from
> non-alt PLLs.. Otherwise we might have been kicking ourselves
> in the face all along, changing the frequency of a running
> PLL that doesn't support it if we were using the main PLL
> and not the altPLL/ACD..
> 
> Downstream sets it only for clk_ops_alpha_pll_hwfsm which is
> used on alt PLLs only
> 
> This change seems sound, as Huayra supports dynamic update
> even without setting any flags.

I don't know where Huayra came from. Downstream uses plain hwfsm pll. 
Huayra uses different alpha register settings.

> 
> Konrad
>>   drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index 1c00eb629b61..b53cddc4bca3 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -128,7 +128,7 @@ static struct clk_alpha_pll pwrcl_pll = {
>>   		.name = "pwrcl_pll",
>>   		.parent_data = pll_parent,
>>   		.num_parents = ARRAY_SIZE(pll_parent),
>> -		.ops = &clk_alpha_pll_huayra_ops,
>> +		.ops = &clk_alpha_pll_hwfsm_ops,
>>   	},
>>   };
>>   
>> @@ -140,7 +140,7 @@ static struct clk_alpha_pll perfcl_pll = {
>>   		.name = "perfcl_pll",
>>   		.parent_data = pll_parent,
>>   		.num_parents = ARRAY_SIZE(pll_parent),
>> -		.ops = &clk_alpha_pll_huayra_ops,
>> +		.ops = &clk_alpha_pll_hwfsm_ops,
>>   	},
>>   };
>>   

-- 
With best wishes
Dmitry

