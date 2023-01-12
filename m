Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DEFC677F1
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 12:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjALMN7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 07:13:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjALMNY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 07:13:24 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD972618
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 04:12:39 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b3so28143384lfv.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 04:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bvFICsPZ6ZqlbbNB7ZOZobuZU7WKFW2B2wh+0pMugw=;
        b=ooZfirUUteTmrb9BecyUfttrhJafF6IfHdKlMpodjofmrqLB3Mh18Exctm+dwGheeJ
         vqMJr811y1YCxA4zMcVrurh+4kVy+N2zQtmgDH48Ry7efL8kKAVT/n32+0A/Thz+cqTR
         RTdtw0huUF7Em/pHqrKoHWUwyzQGrc+K7RktzTAIq2+aRjNKrlRXrigFZ7TkENWTV6of
         A8l0S0OpwrigyyGAxm4vHhGLnnyTLUHikCKLDUhPAlvBj+ywvuTgV5rn3u5QMkqU0PDk
         DNX4e/V6Iqdg/KnSCfsQvdcRHW5qu7m0A/9HRoD9QErGoWqujC90dSiAWOMAEoc7xmvD
         i7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bvFICsPZ6ZqlbbNB7ZOZobuZU7WKFW2B2wh+0pMugw=;
        b=8EyeEZxksMYTQha9kefzpevaRF8SsDtrtykSZZc1kZcaWrfLfbiG6G0q0M9MBrymaz
         PkYMuTUjxmjOyOqEKKalbJwK0sH04zKjPBviz6NDR+eysLYAPV0MAlRt1BNqYmxixymx
         bwMtEnaptsiJ28Kh6fY3f8wJ9PbCaorY/2VI7NOwmbdJXHOaI7+/sIPiRMALQxvotFia
         fBekwDToxlAFL9lRSenZP6+PvMg0jj5g9kX9i6KLSsqGiEuFudkrmTgcitzai2ysyw0u
         lB2/lprFmagG9fXpj/YRbN+gUQFvCcr8nrZt/KdzY+OKp528aEg05wtiWpBQSaMOf49V
         byYw==
X-Gm-Message-State: AFqh2kpehhgWOLQIHg2Z3M1aiJuK9ctg8Jio85tIwRHPy5ucRltuq9Tm
        ZWlRFKdqDZlVPFbwzi0zD8LFcQ==
X-Google-Smtp-Source: AMrXdXuWsh7usnXvYnZzN6ilIyMpWOXu+0Qa38+yFuOrFbbwCj+pyki9fqLPhsNztoW21lBDKx52Hw==
X-Received: by 2002:ac2:4a6b:0:b0:4b5:5f2b:ddfa with SMTP id q11-20020ac24a6b000000b004b55f2bddfamr21060877lfp.30.1673525557448;
        Thu, 12 Jan 2023 04:12:37 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id c11-20020ac25f6b000000b0048af9576d30sm3240384lfc.83.2023.01.12.04.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 04:12:36 -0800 (PST)
Message-ID: <19a7a3ca-6a7e-125f-38c6-9caed183ddbc@linaro.org>
Date:   Thu, 12 Jan 2023 13:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 03/13] clk: qcom: cpu-8996: fix the init clock rate
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
 <20230111192004.2509750-4-dmitry.baryshkov@linaro.org>
 <9a3071e1-0e3f-ae87-0574-7659c52bc884@linaro.org>
 <0a2e9def-c963-d4cd-eb2e-2b9adfa2fd1a@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <0a2e9def-c963-d4cd-eb2e-2b9adfa2fd1a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.01.2023 22:51, Dmitry Baryshkov wrote:
> On 11/01/2023 22:58, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>>> Change PLL programming to let both power and performance cluster clocks
>>> to start from the maximum common frequency.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Can you point me to the source of this? My local random msm-3.18 has this at 60.
> 
> Yes, but with 60 cluster start at the unlisted frequency (60 * 19.2 = 1152 MHz), which leads to cpufreq whining and immediately performing a switch.
> 
> I modified this to 54 * 19.2 =  1036.8 MHz which is supported by both power and performance clusters. Maybe we could have gone to 58 * 19.2 = 1113. Mhz or to 62 * 19.2 = 1190.4 MHz, but as all the safety and power measures and not probed at this point, I preferred to rather be safe than sorry.
Okay, please include this reasoning in the commit message, as nobody
would guess it fixes this issue..

Konrad
> 
>>
>> Konrad
>>>   drivers/clk/qcom/clk-cpu-8996.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>> index ed8cb558e1aa..d51965fda56d 100644
>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>> @@ -102,7 +102,7 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
>>>   /* PLLs */
>>>     static const struct alpha_pll_config hfpll_config = {
>>> -    .l = 60,
>>> +    .l = 54,
>>>       .config_ctl_val = 0x200d4828,
>>>       .config_ctl_hi_val = 0x006,
>>>       .test_ctl_val = 0x1c000000,
> 
