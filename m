Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9822C54EBE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 13:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241627AbjAMNtU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 08:49:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241897AbjAMNsw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 08:48:52 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A89B24
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 05:43:59 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id y19so1193729ljq.7
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 05:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0dvIgWqDWY/1LgfOS7GGbiamPI1bZCecZCmejiag2nM=;
        b=H9SX8B/JRlvpSfhw6j/Fdm2vUS6GUe9mWXyE1mFqOBCa+u3ykx9Ar2nN4qhhFrg0Nh
         FqDUFeSmXpLnHm8KyhmJPkTctimDeEMM145ZfYmdcnkKCEx5o7tn43zO0JjoFQjZxEWa
         FBfnTQSQnO+ZOUm2xqmeMpUNRmvXT93EHLaZpUp5xqun0vs7vWqQ3Tf5zJ3PLp6V5dez
         V8HBZWsbA/7SLX9EHMJ55WhsuYN1Q8pXiCMe3Kv1n6OczMQkpwqI5Znnk1qwFeCwRtz1
         Kz90X+SUW0iA1aMFbuUKbGCqceq4be4Tam19VsTm7vayd+YHfueiPkzMmvAQqgX1S61f
         TWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dvIgWqDWY/1LgfOS7GGbiamPI1bZCecZCmejiag2nM=;
        b=MqMsajZvzKNRBG0o4iiJ1Xl+1glLS4mgUGBIPcztio8s9BF7rEuh/JhG/xi/MrIWzQ
         XHtNK8X/NOds1rDOy5p+bFm7SMeOUXNnVyRQJz1armzWRNadIwF8gzR4HJZuHhNjBdMp
         Q6v6yn2oX5zmPwugW1OHQ+MHagV/5yNTGsOo+R1LT/njm9zzbdsDJBv8hrlpeG6sKvdn
         5hgsG2Jlcjhp1gMqVvdJY9EbZFTvldgNgkNGnmMSzTCxqi8e3c9ORmRXPEivCng1PwEo
         EZ3AA2juSC5WB9u3IvenKnrnjbh688LZ9ZXscVAO0LNOvsgMkZJhSxQwL9jxwxPz6Ooz
         FGIA==
X-Gm-Message-State: AFqh2kph1endFQc93jFaOVYVz0nnTWCMxcnKDfG0d/eFGRON4jtyLk0x
        UkCOqJ3Wapp9VpITzNUChZPxiQ==
X-Google-Smtp-Source: AMrXdXsjw/R9fTAkGVJOeAERoJ3QoqbCXdUYTxmMFXKDVL0gMFGgPEKCbLCCaq6fIYJiYvtRZ5bQfg==
X-Received: by 2002:a2e:954b:0:b0:27f:ca62:5fb4 with SMTP id t11-20020a2e954b000000b0027fca625fb4mr19568500ljh.14.1673617437794;
        Fri, 13 Jan 2023 05:43:57 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651c10b000b0027fb9e64bd0sm2571401ljn.86.2023.01.13.05.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 05:43:56 -0800 (PST)
Message-ID: <1ebbd129-5b84-b649-a36d-f9030b26cb5c@linaro.org>
Date:   Fri, 13 Jan 2023 14:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 09/13] clk: qcom: cpu-8996: fix PLL configuration sequence
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <20230111192004.2509750-10-dmitry.baryshkov@linaro.org>
 <e556e250-7ae4-a5a7-7d0f-eb80a0231e8b@linaro.org>
 <449be451-f12c-ee14-a5f8-7a1e0d417597@linaro.org>
 <942a6282-5519-8871-5043-229bead87bd8@linaro.org>
 <ee457852-adb7-3ecf-e02b-264e804a280c@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ee457852-adb7-3ecf-e02b-264e804a280c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.01.2023 12:19, Dmitry Baryshkov wrote:
> On 12/01/2023 16:32, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 23:05, Dmitry Baryshkov wrote:
>>> On 11/01/2023 23:08, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>>>>> Switch both power and performance clocks to the GPLL0/2 (sys_apcs_aux)
>>>>> before PLL configuration. Switch them to the ACD afterwards.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>    drivers/clk/qcom/clk-cpu-8996.c | 14 ++++++++++++++
>>>>>    1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>>>> index 571ed52b3026..47c58bb5f21a 100644
>>>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>>>> @@ -432,13 +432,27 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>>>>>    {
>>>>>        int i, ret;
>>>>>    +    /* Select GPLL0 for 300MHz for the both clusters */
>>>> superfluous 'the'
>>>>
>>>>> +    regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0xc);
>>>>> +    regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0xc);
>>>>> +
>>>>> +    /* Ensure write goes through before PLLs are reconfigured */
>>>>> +    udelay(5);
>>>> Is this value based on n clock cycles, or 'good enough'?
>>>
>>> Don't know, this is based on downstream direclty.
>> Right, I see it now.
>>
>>>
>>>>
>>>>> +
>>>>>        clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
>>>>>        clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
>>>>>        clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>>>>>        clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>>>>>    +    /* Wait for PLL(s) to lock */
>>>>> +        udelay(50);
>>>> Weird indentation
> 
> Fixing for v2.
> 
>>>>
>>>> Maybe wait_for_pll_enable_lock() to be super sure?
>>>
>>> Does it work for HWFSM PLLs?
>> Not sure, but wait_for_pll_update_ack_clear() should, since it's
>> called by
> 
> I'd prefer to keep it as is. First, this seems to be the difference between normal and hwfsm PLLs, see clk_alpha_pll_is_enabled() vs clk_alpha_pll_hwfsm_is_enabled(). And second, the wait_for_pll() function is not exported from the clk-alpha-pll.c. Note, that downstream also does sleep instead of waiting.
Okay let's settle on that.

Konrad
> 
>>
>> clk_alpha_pll_hwfsm_set_rate() ->
>>    __clk_alpha_pll_set_rate() ->
>>      clk_alpha_pll_update_latch() ->
>>        __clk_alpha_pll_update_latch()
>>
>> Konrad
>>>
>>>>
>>>>> +
>>>>>        qcom_cpu_clk_msm8996_acd_init(regmap);
>>>>>    +    /* Switch clusters to use the ACD leg */
>>>>> +    regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
>>>>> +    regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
>>>>> +
>>>> No delays here?
>>>
>>> No. Probably it isn't required since there is no additional PLL locking, etc.
>>>
>>>>
>>>> Konrad
>>>>>        for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>>>>>            ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
>>>>>            if (ret)
>>>
> 
