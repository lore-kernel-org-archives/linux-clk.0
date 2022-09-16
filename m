Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744F5C6FA82
	for <linux-clk@archiver.kernel.org>; Fri, 16 Sep 2022 06:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiIPGNn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Sep 2022 02:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiIPGNm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Sep 2022 02:13:42 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC87EA1D6E
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 23:13:40 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x27so715173lfu.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 23:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Awmr0QCErYv1BU5SjkxuA6ZGqWBjWVg8QQSWtKwPoYg=;
        b=aRT9MQIDp2Ol+EMuIzDcxKJdi3gYg8OGHmur/HnRKAL16NpEU/R6AkWSk+a1i55xHZ
         RxOWdUrOf8VZjoOr7F6VQiRDlenVkfOxxltvGE42EY2Dwdi9AwNvdi5Jvm+K+Sf6lp9+
         ikImSeoBmXchacYwK3K10Bp95zhbZvyH5pPDI6IJaCOxCeqKLLPUpu6UPW00Yn2IfctW
         6wPAK9hsiShNNf8odm8vK5bdM66FMdVLBM+gYu0Xrd8eyu9HrnnC2BGzaHRNuMPGLIze
         KSphHEM3dh/lUC76+UVY34/88Jtw3tgvJ/loRu9Dp8SICenPRf4yi/CfZ27eGt/1psT2
         nuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Awmr0QCErYv1BU5SjkxuA6ZGqWBjWVg8QQSWtKwPoYg=;
        b=CqWcpDHc1ANXYuB4pN07C01e33qEM/t+SvYgIqRuwhItlSLZ4HeCrkXliAYuKvK2N9
         Tt+DYWVmVzAW+0krB3ZO+38CxahkaheT52t9bFmxN7j1+w8kKLCqoewYzZQCc3VWNkhl
         drXZK077GNJwSyvNJiR5vR5BBCQFlkpl4xxG/SYul6hvebOSmumj3x2AedxmhGcr+JxU
         9J6SFoVmdbDiAlKySmemeQaPlU9EGHtA7lI+QvPrKVe93ujeGZ3+bUFXVJVsqFKTHWP/
         8x5Ut3QeJT4LakjHAw5XCN6WBLJnmfOtY5ruxAeJG/Lx3WyOaCZc+Ty7Y7VycQoAWXKO
         kXmA==
X-Gm-Message-State: ACrzQf082H+lKyLzgQCak4cXvqMrTWl6oI+aWWGLLi1dNlUabFnBNk1m
        LRdaxvwPzNJoIqWSbAsg18L89JI9GbxteQ==
X-Google-Smtp-Source: AMsMyM7hP7AoOeZCHJ5EbCv84R28TazXx46IvZ8z8s92sy6LdzJ1xuES43qio7lXg4M63/CRhYwutA==
X-Received: by 2002:a05:6512:c1c:b0:499:acb9:5788 with SMTP id z28-20020a0565120c1c00b00499acb95788mr1073565lfu.347.1663308819093;
        Thu, 15 Sep 2022 23:13:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s9-20020a05651c048900b0026aca137046sm3474693ljc.120.2022.09.15.23.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 23:13:38 -0700 (PDT)
Message-ID: <f2d374cb-49dc-27c7-081e-0f514cb4cdd8@linaro.org>
Date:   Fri, 16 Sep 2022 09:13:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 1/3] clk: asm9260: use new helper for fixed rate clock
 creation
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Johan Hovold <johan@kernel.org>
References: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
 <20220708135450.2845810-2-dmitry.baryshkov@linaro.org>
 <Yw2fRVsnkHYhcmSy@matsya>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Yw2fRVsnkHYhcmSy@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/08/2022 08:25, Vinod Koul wrote:
> On 08-07-22, 16:54, Dmitry Baryshkov wrote:
>> The __clk_hw_register_fixed_rate() is an internal API, which is better
>> not to be called directly. Add new helper to create fixed rate clocks
>> using parent clock accuracy.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/clk-asm9260.c    |  6 ++----
>>   include/linux/clk-provider.h | 14 ++++++++++++++
>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
>> index bacebd457e6f..0609b661ff5a 100644
>> --- a/drivers/clk/clk-asm9260.c
>> +++ b/drivers/clk/clk-asm9260.c
>> @@ -276,10 +276,8 @@ static void __init asm9260_acc_init(struct device_node *np)
>>   
>>   	/* TODO: Convert to DT parent scheme */
>>   	ref_clk = of_clk_get_parent_name(np, 0);
>> -	hw = __clk_hw_register_fixed_rate(NULL, NULL, pll_clk,
>> -			ref_clk, NULL, NULL, 0, rate, 0,
>> -			CLK_FIXED_RATE_PARENT_ACCURACY);
>> -
>> +	hw = clk_hw_register_fixed_rate_parent_accuracy(NULL, pll_clk, ref_clk,
>> +							0, rate);
> 
> Should this not be described in DT instead, resolve the todo :-)
> 

I wanted to abstain from changing the asm9260 too much, but probably 
we'd have to do that.

>>   	if (IS_ERR(hw))
>>   		panic("%pOFn: can't register REFCLK. Check DT!", np);
>>   
>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
>> index 72d937c03a3e..659ef5a77246 100644
>> --- a/include/linux/clk-provider.h
>> +++ b/include/linux/clk-provider.h
>> @@ -439,6 +439,20 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
>>   	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
>>   				     (parent_data), NULL, (flags),	      \
>>   				     (fixed_rate), (fixed_accuracy), 0)
>> +/**
>> + * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
>> + * the clock framework
>> + * @dev: device that is registering this clock
>> + * @name: name of this clock
>> + * @parent_name: name of clock's parent
>> + * @flags: framework-specific flags
>> + * @fixed_rate: non-adjustable clock rate
>> + */
>> +#define clk_hw_register_fixed_rate_parent_accuracy(dev, name, parent_name,    \
>> +						   flags, fixed_rate)	      \
>> +	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name),      \
>> +				     NULL, NULL, (flags), (fixed_rate), 0,    \
>> +				     CLK_FIXED_RATE_PARENT_ACCURACY)
>>   
>>   void clk_unregister_fixed_rate(struct clk *clk);
>>   void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
>> -- 
>> 2.35.1
> 

-- 
With best wishes
Dmitry

