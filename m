Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEF7C77B73
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 11:37:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbjEHLhr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 07:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbjEHLhS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 07:37:18 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA4E31567
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 04:36:53 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ac785015d6so47942361fa.0
        for <linux-clk@vger.kernel.org>; Mon, 08 May 2023 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683545776; x=1686137776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwYbaMN3dCdCT8K/nKUJpbtKfxl8i/KYmyHshaMqV2w=;
        b=ZGpoUwM86kB2XE28iNttwtRQagoWcy7gceng/kGUVN/pZ1IfBCJWvktlPIyGCLU107
         eDsi8zBKrs7HRJ6+X7DlMimjc8OzYDuRbPBkZEVfLn1HjSV7ajOYAkx1YYGtRnwmd0RH
         n8wHUo6qIPfZT4udE+DFP2KlKnwCvqi0SwqaHhyOpJGcpJgZHiJ1RQl6WS1zOIEPEVec
         nFOQlX9ApBOPw2RjIP5QAvqzfxO/8IyxSYxuthmwMEAENZGv7bgGgiOdBiNu67TnyO4d
         pnQ2tDVeAcUzupQLzhLLkUyYWnb/9HeLqftEJ/QGuqBb3OUyz2pJRaHNY9pi0IgUcsgv
         gzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545776; x=1686137776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwYbaMN3dCdCT8K/nKUJpbtKfxl8i/KYmyHshaMqV2w=;
        b=KI/N3ikSQpVHm9HAvl2HaGeY80DS/G4+OTv/fPaA8hcQ3m61Ebe2jt3ombdOq78+2Y
         E4I3O/S08Oh/qJg/RNA6xIRrDIE0oINNtDeuNUkzrPdnB/dLn/s+Y5dlqyNw/85YbQuW
         755b+qUzj4Nn377Fy06Qb+FH4hn+ll2v+5AXD6ymJGyTwq+AGh13urdyJj0mKCdFT25H
         KWaCWnPYHwT3MQr41eMNAL/ZOFuGu/cjW3srWtG87OMebPlwXSrlFB49ny41AhKSgYmw
         0ad29le1EghfJKGXNBx6SBwU5lVNZHfaiDGuwy/shiajur7fJkorFDORMuGxduslRtHu
         RzMA==
X-Gm-Message-State: AC+VfDxYY7ZH5m1E+0EkgZfALRHuSTXG4NtBpC/2kqDUiSLn2EtJHYpG
        S11zfipdTVYsHkb7xM+GO+gEGg==
X-Google-Smtp-Source: ACHHUZ58fOkHPkkn/MpT7Bv4OCSJYfOgdpL4SsexdHmSaR7unLAkYkPId4VQB/G3VlXkMoswbeKieA==
X-Received: by 2002:a2e:b6c6:0:b0:2ab:4399:708b with SMTP id m6-20020a2eb6c6000000b002ab4399708bmr2666246ljo.40.1683545776425;
        Mon, 08 May 2023 04:36:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j2-20020a2e8002000000b002a798d12cdbsm1142660ljg.116.2023.05.08.04.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 04:36:15 -0700 (PDT)
Message-ID: <2921aee8-520d-080d-4ecb-7438fff4e0f2@linaro.org>
Date:   Mon, 8 May 2023 14:36:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
 <e1ee4334-ee99-2495-89b6-6a67f4130747@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e1ee4334-ee99-2495-89b6-6a67f4130747@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/05/2023 11:27, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 19:53, Dmitry Baryshkov wrote:
>> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
>> The gdsc doesn't fully come out of retention mode. Change it's pwrsts
>> flags to PWRSTS_OFF_ON.
>>
>> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> This is a stopgap solution, not exactly a fix, all signs on Heaven and
> Earth say that 8974 should support retention on this GDSC!
> 
> *although*
> 
> pre-v2.2 chips don't

Mine is apq8074 v2.2, if I'm not mistaken.

> 
> Konrad
>>   drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
>> index aa29c79fcd55..277ef0065aae 100644
>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>> @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
>>   	.pd = {
>>   		.name = "mdss",
>>   	},
>> -	.pwrsts = PWRSTS_RET_ON,
>> +	.pwrsts = PWRSTS_OFF_ON,
>>   };
>>   
>>   static struct gdsc camss_jpeg_gdsc = {

-- 
With best wishes
Dmitry

