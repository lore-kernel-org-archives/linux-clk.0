Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A6FC46467
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 21:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235748AbjAKVvR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235729AbjAKVvQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 16:51:16 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418376329
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:51:14 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id s25so17453432lji.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkpNlQJGygfo/fmA7rKKLb341X0fk1CDJsPweTK2OTU=;
        b=xKHhqZXwFCOJKJ6L+Slq/3zOuSxNWpT452x21xEnopSuJoV/9BxWE0IuE++Lyv/J3a
         SQ9JhW3bQ5gfDxsKpRwrtG0+wg3ih9Rw5E1L+ValNVgRTOHGLtm2/leozzUrVvgcsAoO
         8qr2JpqFObAlib8OWRWUUtlgO8Y5NjW1UBjAV2LO84qWv0XjwtepGozuZTHIVHJ622fQ
         ebsEYQLNtxo7adUiHM9aAJFXResacaCQ8cnXYI0Dj2mqc5/z5jKfM8+OlOwf3mkl0dAZ
         Ssy/pSUwKLCJiSC3nR5Jd1zEZMI+27t3q8JNhwt2PdL93gO6oIfGsU5aYXce7ZbsEGGi
         jAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkpNlQJGygfo/fmA7rKKLb341X0fk1CDJsPweTK2OTU=;
        b=bGleEMgLEdbmoiWEdMpnDM/l+Wzyin9mCb9/j0x644L7iUhyANPIhtizjI2XTmHWRT
         p+E5dseQeiklayfrmA7ueRUaNYg7bpMVCTm1rqMICzpHXaQdWaQQJ+RL0/Gyy+54qCXu
         0yVicjzFXkVoTeXv3e4zgkh26Sdfj6lgMMElujKgsvoeqAmyCzivI6RLBpQK6mpjdmok
         7gH2464MMi7OA7opYtPr8jclh+qDPcDQCjr5lygbvCFf4pyZcpOYVWTOe3Awo+ioUL4C
         0Y3jW+cSHqWXLI4UbZYoac15wB0Lw5z6fHiECHfzJXfhIWOKDuVJ87Pp4yCQgRKdsPue
         v9PA==
X-Gm-Message-State: AFqh2krwhdvVTniHGeEtAhXzPoMqcHDFAMz3oQuxxcOpBynBCsjWYlOl
        GSLyxUqyWiCRka4T823yFZdy1w==
X-Google-Smtp-Source: AMrXdXvBmuGNZ0bIj34YG2GkyiggiEWSO0bCNhkeqdVBRrSJS6xrJbsAsnvAWRvoBCwKMDg1KaXiHA==
X-Received: by 2002:a05:651c:ba1:b0:288:2dce:3bf9 with SMTP id bg33-20020a05651c0ba100b002882dce3bf9mr1303107ljb.1.1673473872599;
        Wed, 11 Jan 2023 13:51:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p21-20020a2eba15000000b0027fc4a35c30sm1934763lja.48.2023.01.11.13.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 13:51:12 -0800 (PST)
Message-ID: <0a2e9def-c963-d4cd-eb2e-2b9adfa2fd1a@linaro.org>
Date:   Wed, 11 Jan 2023 23:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 03/13] clk: qcom: cpu-8996: fix the init clock rate
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
 <20230111192004.2509750-4-dmitry.baryshkov@linaro.org>
 <9a3071e1-0e3f-ae87-0574-7659c52bc884@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9a3071e1-0e3f-ae87-0574-7659c52bc884@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/01/2023 22:58, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>> Change PLL programming to let both power and performance cluster clocks
>> to start from the maximum common frequency.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Can you point me to the source of this? My local random msm-3.18 has this at 60.

Yes, but with 60 cluster start at the unlisted frequency (60 * 19.2 = 
1152 MHz), which leads to cpufreq whining and immediately performing a 
switch.

I modified this to 54 * 19.2 =  1036.8 MHz which is supported by both 
power and performance clusters. Maybe we could have gone to 58 * 19.2 = 
1113. Mhz or to 62 * 19.2 = 1190.4 MHz, but as all the safety and power 
measures and not probed at this point, I preferred to rather be safe 
than sorry.

> 
> Konrad
>>   drivers/clk/qcom/clk-cpu-8996.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index ed8cb558e1aa..d51965fda56d 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -102,7 +102,7 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
>>   /* PLLs */
>>   
>>   static const struct alpha_pll_config hfpll_config = {
>> -	.l = 60,
>> +	.l = 54,
>>   	.config_ctl_val = 0x200d4828,
>>   	.config_ctl_hi_val = 0x006,
>>   	.test_ctl_val = 0x1c000000,

-- 
With best wishes
Dmitry

