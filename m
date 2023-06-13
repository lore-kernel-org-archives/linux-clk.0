Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889B5EB64D8
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 17:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238536AbjFMRyh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 13:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239086AbjFMRyg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 13:54:36 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C36C10F6
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 10:54:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1c30a1653so72620091fa.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686678872; x=1689270872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9zgdhSF1aOcpipOR26/WVzGDCl4KCQi2wBowzIbrew=;
        b=yNc6OtjcskGRjYj6vDxP3axpLWF4qYIATCemgeKrybVmQMRA81UOmV9zFDg3wxbLj8
         lNDx6eMkZHhROScqrZI8u0lbRNlIpJCfBtU/xjmLEScEgaJyK8FB6erXKJ4GrTvIr9+f
         9yKyHj7sJCb7dociQkQp+QtzH67taUH4JsWLnIUmD25dfs80EP3JAXLSV8BG3nnFJ60N
         /efnXLLtodKiVqTVra8Nbc7SScuuvS3YV8qR8EKwv6jsd+J3nS+ocIqfU4AbKOB4U9H8
         sarN/yvQD0yEfAtFhkWIU4/7yqZAP9u3gct7O5r91Wdh/953fMvBulxwSF92ToMY1lAG
         E4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686678872; x=1689270872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9zgdhSF1aOcpipOR26/WVzGDCl4KCQi2wBowzIbrew=;
        b=J9OkWubWgbm56fNiq5x8rsc7cOyitiGLOM9nlOV++A/A+/G/Jcc2CuP/ANuDUgLfIz
         aMKteNE5LY6gVUniJauKB1OlVZSHSIV6nHKf8pB10rtiq67Fps3B8MtebePe8rM2MGuB
         ClJcDeAxIV5KnRonVmqAtRSEKg7zmMkMqj//MrblcF230WS6Kwn5q/vSRpTeGPRU+AIx
         2Sw3HNyGTIf+rZhOyLCtNljgsCo1iS+H6QfsC8ICgJohXUCZuD41KX6ve0951nAVBxM1
         nJRLJRO4G8Xs3YfFwEVSxRvDdKyIA/awU6fve8HvbjznOzFkJQEvCMSaWBlpykEGrCtD
         0H8A==
X-Gm-Message-State: AC+VfDwdbFnc1ckcWsGHYko/vmW8DkNHEEpGb3J/vmOLEAmD7wOcSgPm
        uU6HcJRdy/7uloaSs3X1XmFLZQ==
X-Google-Smtp-Source: ACHHUZ6A2BkRkGGsGMEt93Z0iGWqJeq40pRRnIGc4uxnQlgpWPn0FIJMF0NkqE/hSOHNKJ7QLRCU9w==
X-Received: by 2002:a2e:a411:0:b0:2b1:a8e9:d487 with SMTP id p17-20020a2ea411000000b002b1a8e9d487mr5066777ljn.10.1686678872404;
        Tue, 13 Jun 2023 10:54:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id d8-20020a2e9288000000b002b247680950sm1820443ljh.131.2023.06.13.10.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 10:54:32 -0700 (PDT)
Message-ID: <e3f69e9d-7c23-d5cd-e203-f1e435ba063a@linaro.org>
Date:   Tue, 13 Jun 2023 19:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8996: Use read-only RCG ops for RPM
 bus clocks
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
 <20230612-topic-rcg2_ro-v1-2-e7d824aeb628@linaro.org>
 <20230613175626.aesimqz2alcqjtok@ripper>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230613175626.aesimqz2alcqjtok@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.06.2023 19:56, Bjorn Andersson wrote:
> On Mon, Jun 12, 2023 at 11:22:48AM +0200, Konrad Dybcio wrote:
>> The config/periph/system NoC clocks are wholly controlled by the
>> RPM firmware and Linux should never ever alter their configuration.
>>
> 
> Does Linux need to know about them?
Not really, but it allows us to get rates of their children.

We can get rid of them if one can argue debugcc is enough. Unless
we need clk_get_rate for some reason.

Konrad
> 
> Regards,
> Bjorn
> 
>> Switch them over to read-only ops to avoid that.
>>
>> Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/clk/qcom/gcc-msm8996.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
>> index 5e44d1bcca9e..588e3b67657a 100644
>> --- a/drivers/clk/qcom/gcc-msm8996.c
>> +++ b/drivers/clk/qcom/gcc-msm8996.c
>> @@ -264,7 +264,7 @@ static struct clk_rcg2 system_noc_clk_src = {
>>  		.name = "system_noc_clk_src",
>>  		.parent_data = gcc_xo_gpll0_gpll0_early_div,
>>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
>> -		.ops = &clk_rcg2_ops,
>> +		.ops = &clk_rcg2_ro_ops,
>>  	},
>>  };
>>  
>> @@ -284,7 +284,7 @@ static struct clk_rcg2 config_noc_clk_src = {
>>  		.name = "config_noc_clk_src",
>>  		.parent_data = gcc_xo_gpll0,
>>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>> -		.ops = &clk_rcg2_ops,
>> +		.ops = &clk_rcg2_ro_ops,
>>  	},
>>  };
>>  
>> @@ -306,7 +306,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
>>  		.name = "periph_noc_clk_src",
>>  		.parent_data = gcc_xo_gpll0,
>>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>> -		.ops = &clk_rcg2_ops,
>> +		.ops = &clk_rcg2_ro_ops,
>>  	},
>>  };
>>  
>>
>> -- 
>> 2.41.0
>>
