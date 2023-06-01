Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04354C7EE29
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbjFAKG7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbjFAKGj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:06:39 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B483E66
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:04:19 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so685605e87.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685613857; x=1688205857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9i8qSyHoCZxIWQDl0hc1f8hnhb6ezH05dBHaorFPAPQ=;
        b=zqfaoBiYj4x94Neyq+lEArtnccLsXGPAukqwMmnyfRWitR/HMzEwXtOz1XiOk/pO8y
         MVpFT256g1joYK9LCIaTZwhEgy9zR871nyv3ZXxxuCugJ6AN14DnfiLqiAIfoayv9wz5
         qP3VACKKiX+8zBv9LT/CRbyh78YsCPfmTH60JYHtuPbtVoz6iN4wNgJyWGYJC2RqJQyw
         EsEXfAkCrii2fzsZwKxZ+gXKS03POCghGEc2+WRLtkRzxa7a/0bD0Arw4POhfLyeqzUk
         wg/54wjPQHnr27uKZsZveyqqJjQRbnv2beZbC/WQeaG7WGdkQ+9oL1Suw6fDGdkhbouy
         VxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613857; x=1688205857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9i8qSyHoCZxIWQDl0hc1f8hnhb6ezH05dBHaorFPAPQ=;
        b=R0hISMinT/IaUb2wdTFFM5JsAPXcEeir3ba3K/to7IJumRfHxzX+Sug8+tiMPgNvIJ
         aNwfl+hmzl4vtpVr/su3S5hCMImGdO95XZoGe7W1JufKE6DaUtU3dXDctNyRj3QvYqXF
         lDeoOe9/4tyCKaZOOd4JL6GhJtaVk9dBfL8U9wEzvueXdcy77+JcUTjr88Qxi0rgUkEN
         6a2HlMgWEECTl1LAcY8JMlQVJjc7zG1jh1uwTAju21+eGWZCbWuqKsFSvwJnFOd2PF5B
         ga8MhES6OM0pduZwgFJLutl/pX1HmxsB6K9D4xgINNynlGMXAWaSJceI4mB4WoHxO4Cn
         lEvQ==
X-Gm-Message-State: AC+VfDwwqLJEWOkC7GF0YOUUFlX7zE/hKuxd97iXrHB1z9ppaY8JR+k5
        8dz6xMlL5gu8QB7vhPytaTg/rg==
X-Google-Smtp-Source: ACHHUZ76Uaazo5aeUSK/AldT6iYOaQmqEXTOyJIyMRMRsIatr4Z7VhYaTCcf9ARdkINY5btju8KfHQ==
X-Received: by 2002:ac2:46ec:0:b0:4f4:cda3:8c99 with SMTP id q12-20020ac246ec000000b004f4cda38c99mr1045640lfo.42.1685613857378;
        Thu, 01 Jun 2023 03:04:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t28-20020ac2549c000000b004f3892d21a5sm1037737lfk.69.2023.06.01.03.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:04:16 -0700 (PDT)
Message-ID: <21f6b17b-366b-1233-e8f8-c9ac8503eeab@linaro.org>
Date:   Thu, 1 Jun 2023 13:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/20] interconnect: qcom: Fold smd-rpm.h into icc-rpm.h
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
 <20230526-topic-smd_icc-v1-7-1bf8e6663c4e@linaro.org>
 <ea21f29f-482e-1dd3-12d7-b9f685b1d5dd@linaro.org>
 <4de7d05a-91da-501c-2889-4eee8e3bd34f@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4de7d05a-91da-501c-2889-4eee8e3bd34f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/06/2023 13:00, Konrad Dybcio wrote:
> 
> 
> On 1.06.2023 11:57, Dmitry Baryshkov wrote:
>> On 30/05/2023 13:20, Konrad Dybcio wrote:
>>> smd-rpm.h is not very useful as-is and both files are always included
>>> anyway.. Combine them.
>>
>> If we ever add interconnect driver for non-SMD RPM platforms (like MSM8960/APQ8064), we can just ignore the smd part.
> icc-rpm sends requests via smd so that doesn't sound unifiable

Ack. Should we rename it to icc-smd-rpm.c while doing the merge?

> 
> Konrad
>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/interconnect/qcom/icc-rpm.c |  1 -
>>>    drivers/interconnect/qcom/icc-rpm.h |  5 +++++
>>>    drivers/interconnect/qcom/msm8916.c |  1 -
>>>    drivers/interconnect/qcom/msm8939.c |  1 -
>>>    drivers/interconnect/qcom/msm8974.c |  2 +-
>>>    drivers/interconnect/qcom/msm8996.c |  1 -
>>>    drivers/interconnect/qcom/qcm2290.c |  1 -
>>>    drivers/interconnect/qcom/qcs404.c  |  1 -
>>>    drivers/interconnect/qcom/sdm660.c  |  1 -
>>>    drivers/interconnect/qcom/smd-rpm.c |  2 +-
>>>    drivers/interconnect/qcom/smd-rpm.h | 15 ---------------
>>>    11 files changed, 7 insertions(+), 24 deletions(-)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>

-- 
With best wishes
Dmitry

