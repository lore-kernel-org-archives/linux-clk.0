Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B07C77B72
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 11:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjDQLur (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 07:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjDQLuq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 07:50:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EE791
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 04:49:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ec8133c698so6259426e87.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 04:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681732169; x=1684324169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/OjZyhE0ENwMdI5KuPOl9FD06Q0NXkVYxfRjcYOPrE=;
        b=KCLNbnzyHTT8esQG29pR8LPrFJTnKlZAOfEg3RK+HOPSU2yxVxgAlRF8i0+JCGuwp6
         J1nHX03YXSz2YOM9JYWcrlU7XvehWfW/2OjA6ndP8EHl6GC4lTXDQH14IMnXV37y9iqK
         /Szv3Q28HSyN/6UrCIHTCakLzKcyF15cd/2Mz1skZweAGdAJPaLyGt4QtTvLNPczG1fe
         DvcMgugL+6INRO6iBievWC2oYghp4nH2QK3A4vR7nXrTvkGKTrgHh7IiCzqNIvrKzz2S
         DJnyq325yzVsRr4zHEsPlZQI2YVWbpcjBsjatJ5vlran414DVJbTTUk+XqhLQV+6TTmH
         SAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681732169; x=1684324169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/OjZyhE0ENwMdI5KuPOl9FD06Q0NXkVYxfRjcYOPrE=;
        b=biBnEWCOY0uBQJcxfCqAHMXo5HX06N4EkPDkjmiPtvRD4GibK4XdgFhijS+QXJh2A2
         hFOQ+eod7Z5jR0n+LNkSu0lJirzjxzBpG0sABk7vH/gJlE4r7Acr56B4zGKryz3t2ldA
         nTBrJPCYP6usB2fPFqu28W4Heys2fniWhwRkahBddTcg6WyHiim5n06qIIMakQeQsL2X
         K4YZLsL73zSd9NZq+soeNUa6JbiY3CiGweKL9ROYEw2cVEWy+4aHVTbV8tW9ZPVp2rkV
         5X5rNCWzhqjr0vEAaU3d/VRbd3GATjG1n+WpMn4SsGUMpBj5kgT9SqWVlJGB+LTwpKLW
         0EvQ==
X-Gm-Message-State: AAQBX9f7prT3ZYsydTx3dm7TO16uwIMOjshfX1kYzlI0Z97v7byiR4/V
        dUqZzli9BLZV6574jZLtjhAmaA==
X-Google-Smtp-Source: AKy350ZJpouc9mBroBFCAgLb2jZvQ22H22pgo7QKQsZ0p87Se9m+QKD6rvyA8mhUwAVUxNENBdntrA==
X-Received: by 2002:ac2:532c:0:b0:4eb:e8e:4139 with SMTP id f12-20020ac2532c000000b004eb0e8e4139mr2275009lfh.2.1681732168874;
        Mon, 17 Apr 2023 04:49:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u9-20020a056512094900b004e887fd71acsm1994012lft.236.2023.04.17.04.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 04:49:28 -0700 (PDT)
Message-ID: <d850071e-162d-9303-6e28-1fe675f69ce4@linaro.org>
Date:   Mon, 17 Apr 2023 14:49:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] clk: qcom: common: Handle invalid index error
Content-Language: en-GB
To:     Taniya Das <quic_tdas@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230303092859.22094-1-quic_tdas@quicinc.com>
 <20230303092859.22094-2-quic_tdas@quicinc.com>
 <CAA8EJpq5xBF=Wt-1_hGR-7qZHREcALurmR4ucmMmZaC-R_7Ttg@mail.gmail.com>
 <ce6c952b-2e2b-67d9-5023-e740ed798758@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ce6c952b-2e2b-67d9-5023-e740ed798758@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/04/2023 07:40, Taniya Das wrote:
> Hi Dmitry,
> 
> Thanks for the comments.
> 
> 
> On 3/3/2023 4:14 PM, Dmitry Baryshkov wrote:
>> On Fri, 3 Mar 2023 at 11:30, Taniya Das <quic_tdas@quicinc.com> wrote:
>>>
>>> Introduce start_index to handle invalid index error
>>> seen when there are two clock descriptors assigned
>>> to the same clock controller.
>>
>> Please provide details of the exact case that you are trying to solve
>> (this might go to the cover letter). I think the commit message is
>> slightly misleading here. Are you trying to add error messages or to
>> prevent them from showing up?
>>
> 
> We are trying to avoid error messages from showing up.
> 
>> I'm asking because error messages do not seem to correspond to patch
>> 2. You add start_index to make the kernel warn for the clock indices
>> less than LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC = 4, while quoted
>> messages show indices 5,6,7.
>>
> 
> Right, we want the kernel to warn if the clock index is less than 
> start_index,

This is arguable but logical. Usually we do not warn for absent clocks.

> along with that we also want to handle the case where 
> num_rclks is uninitialized because of same clock descriptor being 
> assigned to two clock controllers.

Hmm, but num_rclks is always initialized, isn't it? In the worst case it 
will default to 0 meaning that

> Earlier Invalid index error was showing up for valid indices 5,6,7 
> because of the simple if check(idx >= num_rclks), hence we enhanced the 
> checks to handle the above case and compare the index to the start_index 
> + num_rclks, instead of simply comparing it with num_clks.

This is not a part of the patch and it will be incorrect anyway, since 
num_rclks = desc->num_clks = ARRAY_SIZE(some_cc_clocks).

Checking idx against `start_index + num_rclks` will allow one to get 
clocks after the end of rclks array.

For lpass_audio_cc_sc7280_desc num_rclks should get the value of 16, as 
the last entry in llpass_audio_cc_sc7280_clocks has index 
LPASS_AUDIO_CC_RX_MCLK_CLK_SRC = 15.

My analysis might be completely wrong, but I can only assume that 
somehow wrong clock controller got used. Could you please give it a try 
with the 
https://lore.kernel.org/linux-clk/20230417114659.137535-1-dmitry.baryshkov@linaro.org/ 
being applied?

> 
>> Nit: please don't overwrap the commit message, the recommended line
>> width is about 72-77 chars.
>>
> 
> Done.
> 
>>>
>>> [ 3.600604] qcom_cc_clk_hw_get: invalid index 5
>>> [ 3.625251] qcom_cc_clk_hw_get: invalid index 6
>>> [ 3.648190] qcom_cc_clk_hw_get: invalid index 7
>>
>>>
>>> Fixes: 120c15528390 ("clk: qcom: Migrate to clk_hw based registration 
>>> and OF APIs")
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/common.c | 12 ++++++++----
>>>   drivers/clk/qcom/common.h |  1 +
>>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>> index 75f09e6e057e..0e80535b61f2 100644
>>> --- a/drivers/clk/qcom/common.c
>>> +++ b/drivers/clk/qcom/common.c
>>> @@ -21,6 +21,7 @@ struct qcom_cc {
>>>          struct qcom_reset_controller reset;
>>>          struct clk_regmap **rclks;
>>>          size_t num_rclks;
>>> +       u32 rclks_start_index;
>>>   };
>>>
>>>   const
>>> @@ -226,12 +227,13 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct 
>>> of_phandle_args *clkspec,
>>>          struct qcom_cc *cc = data;
>>>          unsigned int idx = clkspec->args[0];
>>>
>>> -       if (idx >= cc->num_rclks) {
>>> +       if (idx >= cc->rclks_start_index && idx < cc->num_rclks)
>>> +               return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
>>> +       else if (idx < cc->rclks_start_index && idx >= cc->num_rclks)
>>>                  pr_err("%s: invalid index %u\n", __func__, idx);
>>> -               return ERR_PTR(-EINVAL);
>>> -       }
>>>
>>> -       return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
>>> +       return ERR_PTR(-EINVAL);
>>> +
>>>   }
>>>
>>>   int qcom_cc_really_probe(struct platform_device *pdev,
>>> @@ -281,6 +283,8 @@ int qcom_cc_really_probe(struct platform_device 
>>> *pdev,
>>>
>>>          cc->rclks = rclks;
>>>          cc->num_rclks = num_clks;
>>> +       if (desc->start_index)
>>> +               cc->rclks_start_index = desc->start_index;
>>>
>>>          qcom_cc_drop_protected(dev, cc);
>>>
>>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>>> index 9c8f7b798d9f..924f36af55b3 100644
>>> --- a/drivers/clk/qcom/common.h
>>> +++ b/drivers/clk/qcom/common.h
>>> @@ -23,6 +23,7 @@ struct qcom_cc_desc {
>>>          const struct regmap_config *config;
>>>          struct clk_regmap **clks;
>>>          size_t num_clks;
>>> +       u32 start_index;
>>>          const struct qcom_reset_map *resets;
>>>          size_t num_resets;
>>>          struct gdsc **gdscs;
>>> -- 
>>> 2.17.1
>>>
>>
>>
>> -- 
>> With best wishes
>>
>>
>>
>> Dmitry
> 

-- 
With best wishes
Dmitry

