Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2DDC5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 21:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbjAKVzq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjAKVzn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 16:55:43 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE4D6549
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:55:42 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bu8so25592565lfb.4
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vz9fH9Cm2rsPnHnwubyzz/DzCG761azlSWcLfjwE5SI=;
        b=AB1R0wYXVlrakO1cS/aAAFNrQVH60TlbVcn2TYFGdqQ37efmImnPkGm35zPpWBn5zt
         UByKhfbGn+IPAlQxfbSfXtMNkxo1IQJrX0nfWiH8KFr11OIsrx2WVYTBvNHYlx1E8pi1
         9P05VKU/foc+Po19Op2YNL9TePBz9acwu6A+IAd/7d6EHTndgoXrTObFk6mKlCM0R2SB
         8JJgUaeMxPebkWcrSefVkOxBRlTgwlxKef5EsHtXN65b3U5HbNEARH70JZijtJF9AKe8
         xGaXCzW1V/scMAcbZ2bANCDPvMesg8tduGwL9QWDGe6A3rYz66T8LMwGHM1bbniOa5tX
         5sOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz9fH9Cm2rsPnHnwubyzz/DzCG761azlSWcLfjwE5SI=;
        b=M1cGM0+PMOS3KvlPc6YXJ58ZzjNbuwwBow8+vtwLbTRYjuIivNNlnFvCCrVYzGSige
         CglOQxSXJOXFZQY3gOZG48OfTqecwQQWmGXWAM/0P5f0i3WVp/+3EO6yxTGFrrVwhCKr
         NoyT/ycYDysZhK9/N9PNEmDUElfGqt8+BeCJznEEnsKkDJfI5grsfTWzzL3cCadGAM4E
         e/BIVzkVBiGcy5DPLw/kUElhLgIaUA2kM2bPnElISJZnwxTj60wTHoYYAv8ijAXgntCQ
         6t2cbhm3qiAM6xgVXT0KPuCgvZrhpND7rY4ub6EXAOmB6N4EOlpuu3pT+7NespjvPpyL
         AVVg==
X-Gm-Message-State: AFqh2krQ0TKnKY5n9d8CEk6YjujV4jq81pSLeOBHQjDdasPZS37Bx8Wn
        7C00r96H6ptIz1M75CfzX9s6eQ==
X-Google-Smtp-Source: AMrXdXvyV27ADWXM0w/pygDar6cso2ZMM7vIGkO9rCVVdiub7JYaKkPjYZU5NnbTyeiplXt0B7KGjg==
X-Received: by 2002:a05:6512:3c8d:b0:4ca:b51b:2bb3 with SMTP id h13-20020a0565123c8d00b004cab51b2bb3mr23522453lfv.39.1673474140440;
        Wed, 11 Jan 2023 13:55:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a05651232b200b004cb358444e9sm2936394lfe.204.2023.01.11.13.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 13:55:40 -0800 (PST)
Message-ID: <38745a30-0502-3a1d-4376-9d10471cf780@linaro.org>
Date:   Wed, 11 Jan 2023 23:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 05/13] clk: qcom: cpu-8996: skip ACD init if the setup is
 valid
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
 <20230111192004.2509750-6-dmitry.baryshkov@linaro.org>
 <e3c3449c-dd20-05fd-fd7d-b863d9f66426@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e3c3449c-dd20-05fd-fd7d-b863d9f66426@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/01/2023 23:00, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>> Check whether L2 registers contain correct values and skip programming
>> if they are valid. This follows the code present downstream.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Once again, my random local msm-3.18 doesn't do this, can you show
> me the downstream source for this?

https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L856

> 
> Konrad
>>   drivers/clk/qcom/clk-cpu-8996.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index 0e0c00d44c6f..7e5246ca7e7f 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -472,10 +472,15 @@ static void __iomem *base;
>>   static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
>>   {
>>   	u64 hwid;
>> +	u32 val;
>>   	unsigned long flags;
>>   
>>   	spin_lock_irqsave(&qcom_clk_acd_lock, flags);
>>   
>> +	val = kryo_l2_get_indirect_reg(L2ACDTD_REG);
>> +	if (val == 0x00006a11)
>> +		goto out;
>> +
>>   	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
>>   
>>   	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
>> @@ -492,6 +497,7 @@ static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
>>   		writel(0xf, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
>>   	}
>>   
>> +out:
>>   	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
>>   }
>>   

-- 
With best wishes
Dmitry

