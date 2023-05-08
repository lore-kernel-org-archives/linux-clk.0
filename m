Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4809EC77B75
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 15:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbjEHPDJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 11:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjEHPDI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 11:03:08 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D935E71
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 08:03:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f122ff663eso5205375e87.2
        for <linux-clk@vger.kernel.org>; Mon, 08 May 2023 08:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683558185; x=1686150185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5P7zQmkkbgrBtJhFAGKUKghf7IUiE+88LhUoxRqw578=;
        b=thJYmk9qbm8Br5Wc+/EL1Z8udNXQBMb6EyHrGiGkV9fOqaE8MWu2bqPicL4IzVPM1H
         mqos6dF5AJCaULu1dL8dD9Ffezxx7fd3fRzPB66OEyJsJM/1FV/8TaE+ZUOAmkYm5MDW
         2UxV18D6Q6cJoLPchP/1z2O2Aetdp99ArRsv/70WBbf0vB12HVya8LlyhH0kkFY1tjoF
         6pDW/anOYpcA8vZBigu3vW0MWpiOoEiJO+omFhZOYVIYXRwjQ2gFP/b8CEJR8TNf5ELg
         f462AlmAveODb7FsIAxCFlctlmD5++YKPeyY3tKSAYNWRzFVILmu8OgBOxZlRK0FxgAZ
         hWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683558185; x=1686150185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5P7zQmkkbgrBtJhFAGKUKghf7IUiE+88LhUoxRqw578=;
        b=Zis7f9n6HAFHGtpQQ+e8OC6nBU4s9hpMpAYull2/ujVyTmbi0aorBiujKDp2i0BMvB
         yog4Co4SlHFosubsAh7A0yDXT+fl3ZRyCP/AjkmDERUQUWYYWRbGY7D7pabeS4tBIyrX
         Mo/2JEuS2h8TphqH5mOjLNjQG1zxU+SGGH22rEKWE3YM1i9NrdSrmSSXppdyFo4ZWBhO
         3rePN8zByiluLwbhhxxPOHqSGxGCwV8xBQ/W0N49XgL1w4WgYElP0DDRjE11GvBl+DWO
         h78+Mru55er/mwENsZpfxzAyCtGeQ1SufMEodsYVTDuqxlddX9lt2Sd3T0Di1cnXK0PK
         Q9nA==
X-Gm-Message-State: AC+VfDxSw23VHB0CPmv1qR1BByLqDO4PH4LIWNfFrkBbFk9Q3LjwoY6f
        E7yZ/eX02aTZe+k9eAX7YEdAzQ==
X-Google-Smtp-Source: ACHHUZ64dANyCw4EZKVb6T1sq0Z1GmmEFvSAoQmDXKDucB5v/YDzvFl6fKSC6cbHVt/X3wysM7Su3A==
X-Received: by 2002:ac2:53a6:0:b0:4eb:20e:6aec with SMTP id j6-20020ac253a6000000b004eb020e6aecmr2434490lfh.40.1683558185331;
        Mon, 08 May 2023 08:03:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h22-20020a197016000000b004e887fd71acsm14877lfc.236.2023.05.08.08.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 08:03:04 -0700 (PDT)
Message-ID: <d6b77072-e559-93bd-2f60-94f0a8f9b400@linaro.org>
Date:   Mon, 8 May 2023 18:03:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for
 mdp_clk_src clock
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <70b06c2a-de21-b14f-b3b2-82e40762f862@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <70b06c2a-de21-b14f-b3b2-82e40762f862@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/05/2023 10:55, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 19:53, Dmitry Baryshkov wrote:
>> The mdp_clk_src clock should not be turned off. Instead it should be
>> 'parked' to the XO, as most of other mdp_clk_src clocks. Fix that by
>> using the clk_rcg2_shared_ops.
>>
>> Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock controller (MMCC)")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> I am inclined to think it's true, however I can't see any evidence
> of this being done on the vendor kernel.. I am however not a licensed
> archaeologist so I might have missed it.. Hence I'll do:

I have been observing the 'clock stuck at off' without this change. The 
warning goes away with this patch. Thus I suppose it is correct.

> 
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>>   drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
>> index 4273fce9a4a4..aa29c79fcd55 100644
>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>> @@ -485,7 +485,7 @@ static struct clk_rcg2 mdp_clk_src = {
>>   		.name = "mdp_clk_src",
>>   		.parent_data = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
>>   		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
>> -		.ops = &clk_rcg2_ops,
>> +		.ops = &clk_rcg2_shared_ops,
>>   	},
>>   };
>>   

-- 
With best wishes
Dmitry

