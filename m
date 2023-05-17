Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71804C77B7A
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 19:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjEQTLs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 15:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjEQTLr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 15:11:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B771713
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 12:11:45 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f2510b2b98so1373819e87.3
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 12:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684350703; x=1686942703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54iwv/pGzux9yUooHmL70lgD44/ZcJlgzOCmfdHgBto=;
        b=uXKqksZ2ucaYLlDpISTIWF6CU6gZIsSWQMMCvItyiZPfUXEnKMqv/zEdE1mKgC9o9A
         uixAWtffzvQv+EwuxqvWr1aUCuYCC+lLVO51NVwdAIw/iC0GF7UeaevYSFG6lOhg1QUN
         NI2ka+hKR8P88dK4M/uWuO093Hvn0+9IzfsXrdPu13JYVLhXWWQw7VvAHctUUKxxeGA7
         YaxZlFD2VNm3ZhTCW1T8DnEXe1ggMBwa9OWTmn+A3iad+dnNbSrKq9uLoxmWbfRt8t7N
         UhYpbq6QP+V1nlv5NQuatD9WMsTTasTm/qBzTqyvaESVvMYNNNzj21L0BPKHpGELKD9u
         op2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350703; x=1686942703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54iwv/pGzux9yUooHmL70lgD44/ZcJlgzOCmfdHgBto=;
        b=PD+vIn/siQVUi37yU5dqa35QRFopx+Y9W/dA7Scgj3MZDfNgocwDHphNimU0OVGx/a
         rAmmSjw8sy2dYorKJB2CPTRfTScZtuJ3iqxRMzOK6vJCiYD+Ld2RWyx4u50XtSUuj0ez
         cmh7hcCtRhNj8eS6T2q/ufUyqCAZ4YOLrhhiqUKJPY6wBQ4y5RlFisq43Xu7pb+F8BWH
         ux2yE84Q/uAXMrqJdRmuFBw9c6mXpKbZ2UVDwh+WNtFLcdBblD4Whc9VYTJHN5UJ/9Op
         IhVSZ2bZTjcN/xfW1QkQ6s4PDSqcd6FsLG1VWNC9lfyKVdiTda5pC8aRgWJ5T2uzN4iN
         Y+QA==
X-Gm-Message-State: AC+VfDxLiX0V2Rm80lI618r1T4cRAyUJbXaMWIi3cGLKctp50BdALWTa
        Hq7BjzBKNZCKS/awJgZHlgHesQ==
X-Google-Smtp-Source: ACHHUZ7Ok6LehYkCwfiScUDyFS6l76YaTjpbf2vGVyHHiMNUo1oqXp2JOmH5PCmZZEe8/TewtLBSBQ==
X-Received: by 2002:ac2:4143:0:b0:4f3:895f:f3f8 with SMTP id c3-20020ac24143000000b004f3895ff3f8mr410341lfi.16.1684350703501;
        Wed, 17 May 2023 12:11:43 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id t24-20020ac243b8000000b004eff4f67f1csm3478306lfl.304.2023.05.17.12.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:11:43 -0700 (PDT)
Message-ID: <2a04cde4-ae8e-82b0-d467-0fc32d0c67b7@linaro.org>
Date:   Wed, 17 May 2023 21:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] clk: qcom: smd-rpm: conditionally enable scaling before
 doing handover
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230506-rpmcc-scaling-handover-v1-1-374338a8dfd9@z3ntu.xyz>
 <20bd79c1-6c38-f1ed-1661-6fa4c308c5c5@linaro.org>
 <2679120.mvXUDI8C0e@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2679120.mvXUDI8C0e@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.05.2023 16:59, Luca Weiss wrote:
> On Dienstag, 16. Mai 2023 03:27:46 CEST Konrad Dybcio wrote:
>> On 6.05.2023 22:10, Luca Weiss wrote:
>>> On older platforms like msm8226, msm8974 and msm8916 the driver in the
>>> downstream kernel enables scaling first before doing the handover of the
>>> clocks.
>>>
>>> While this normally doesn't seem to cause noticeable problems, on
>>> apq8026-asus-sparrow this causes the device to immediately reboot,
>>> perhaps due to older rpm firmware that becomes unhappy.
>>>
>>> On newer platforms the order has swapped and enabling scaling is done
>>> after the handover, so let's introduce this behavior only conditionally
>>> for msm8226 and msm8974 for now.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>> ---
>>
>> Did you give this a spin on some 8974? I think hammerhead had
>> issues around rpmcc in the past..
> 
> Yes, appears to be fine on msm8974 also.
> 
> I tried to reproduce the hammerhead ocmem hang we had in the past but even 
> with v6.3 rpmcc it seems to be fine. But iirc it was happening more or less at 
> random in the past so wouldn't be surprised if my tests just didn't show 
> anything on accident.
> 
> Regards
> Luca
OK sg

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
>>
>> Konrad
>>
>>>  drivers/clk/qcom/clk-smd-rpm.c | 16 +++++++++++++---
>>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c
>>> b/drivers/clk/qcom/clk-smd-rpm.c index 887b945a6fb7..6d5476afc4d1 100644
>>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>> @@ -178,6 +178,7 @@ struct clk_smd_rpm_req {
>>>
>>>  struct rpm_smd_clk_desc {
>>>  
>>>  	struct clk_smd_rpm **clks;
>>>  	size_t num_clks;
>>>
>>> +	bool scaling_before_handover;
>>>
>>>  };
>>>  
>>>  static DEFINE_MUTEX(rpm_smd_clk_lock);
>>>
>>> @@ -693,6 +694,7 @@ static struct clk_smd_rpm *msm8974_clks[] = {
>>>
>>>  static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
>>>  
>>>  	.clks = msm8974_clks,
>>>  	.num_clks = ARRAY_SIZE(msm8974_clks),
>>>
>>> +	.scaling_before_handover = true,
>>>
>>>  };
>>>  
>>>  static struct clk_smd_rpm *msm8976_clks[] = {
>>>
>>> @@ -1318,6 +1320,12 @@ static int rpm_smd_clk_probe(struct platform_device
>>> *pdev)> 
>>>  	rpm_smd_clks = desc->clks;
>>>  	num_clks = desc->num_clks;
>>>
>>> +	if (desc->scaling_before_handover) {
>>> +		ret = clk_smd_rpm_enable_scaling(rpm);
>>> +		if (ret)
>>> +			goto err;
>>> +	}
>>> +
>>>
>>>  	for (i = 0; i < num_clks; i++) {
>>>  	
>>>  		if (!rpm_smd_clks[i])
>>>  		
>>>  			continue;
>>>
>>> @@ -1329,9 +1337,11 @@ static int rpm_smd_clk_probe(struct platform_device
>>> *pdev)> 
>>>  			goto err;
>>>  	
>>>  	}
>>>
>>> -	ret = clk_smd_rpm_enable_scaling(rpm);
>>> -	if (ret)
>>> -		goto err;
>>> +	if (!desc->scaling_before_handover) {
>>> +		ret = clk_smd_rpm_enable_scaling(rpm);
>>> +		if (ret)
>>> +			goto err;
>>> +	}
>>>
>>>  	for (i = 0; i < num_clks; i++) {
>>>  	
>>>  		if (!rpm_smd_clks[i])
>>>
>>> ---
>>> base-commit: dd9e11d6477a52ede9ebe575c83285e79e823889
>>> change-id: 20230506-rpmcc-scaling-handover-a63029ed9d13
>>>
>>> Best regards,
> 
> 
> 
> 
