Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2666C7EE2A
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbjFAKDb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbjFAKCl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:02:41 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1311715
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:01:28 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4b80bf93aso712923e87.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685613680; x=1688205680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ioEn//NQFT+oZEC++gXomowkVto8H1YOn/EZNzbn6s=;
        b=ReOwnsrpA4kmhUrZv8TuJtTLcy3Yuql4TSfPEYMJxkQisD6BKRqh7WzsJpaqxTCNO/
         JdXJNQ2aarCzwxh7akL1CkHY7dZP+HkCss2bmsemBjaCY53OOXo6sMlEwd2L17qeguAc
         Mwtbgj13VjQIVVHGxWK6muY/RRwfXNdjxdlG4ECEQf9gto1Qu2vvsYIRJrll9CTHAQu8
         Xr4uxneoYv2VmEy3Tc6J2f3745BlkBPf2IC5XF5w8tGNbXFBTAlNybeJoAm24UkFFAS6
         NYGRAH4v3TMRN9w0ZV/wE+aaClznitFw5prgLwWy0c4Q8bN2UEJZlvAVNOh5g9TOdkzD
         MVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613680; x=1688205680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ioEn//NQFT+oZEC++gXomowkVto8H1YOn/EZNzbn6s=;
        b=EDID1z1MqqJA8iI+7fd7CD8Zv/Ug1maL9BrHO6QQj/2aFynwizccwaFAXdCZZXLg7y
         YCKs8hXIsY620bheyO3N0oR9ikuLVQ47zh3jL5sZhnjpildk/rri9WTz0qTg+1Kvn2fG
         8JqbwUOkxeUQgvwRwGaWlfKgu0LP+om4TbytYrNhHQiVX8+bA+csGKQRqx8dsSV1TqDC
         Vra1dmeudSRPM6qC+5euaTlDgIzEWk9mR8Bh8Q/imuvit50Ja+ZH9LwMKVEYAhJNHAcb
         jGQ/ofnMBC2u4SK0ZiXgxSEfjWCYS2hw75ehduUNGVIoxG0tCWVot2DTFId2UtzMoGwy
         gTVw==
X-Gm-Message-State: AC+VfDzKFsAAyIDP2NiNVVBm6DdDugIXEts2PIXtTtvGQ6l8aNtcAFp8
        QJdgNCVOWrZZUerc5kbmWxrHtw==
X-Google-Smtp-Source: ACHHUZ45A2zkOvmoul2/6LZWTZ/lgfoERO9Kxkw51MKhHfF4Vqw08RldTLbMkVp2uuThiEwd7qfS7g==
X-Received: by 2002:ac2:4c13:0:b0:4f3:8258:5894 with SMTP id t19-20020ac24c13000000b004f382585894mr1128367lfq.27.1685613680554;
        Thu, 01 Jun 2023 03:01:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id m7-20020a056512014700b004edce1d338csm1027007lfo.89.2023.06.01.03.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:01:20 -0700 (PDT)
Message-ID: <1f43abe6-faf3-3d87-a49f-12f2a62eafd9@linaro.org>
Date:   Thu, 1 Jun 2023 12:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 01/20] soc: qcom: smd-rpm: Add QCOM_SMD_RPM_STATE_NUM
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <20230526-topic-smd_icc-v1-1-1bf8e6663c4e@linaro.org>
 <2679410b-b40d-97b5-b7c2-46f32395b796@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2679410b-b40d-97b5-b7c2-46f32395b796@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 1.06.2023 11:20, Dmitry Baryshkov wrote:
> On 30/05/2023 13:20, Konrad Dybcio wrote:
>> Add a preprocessor define to indicate the number of RPM contexts/states.
>> While at it, use tabs instead of spaces for the existing entries.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   include/linux/soc/qcom/smd-rpm.h | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
>> index 2990f425fdef..99499e4b080e 100644
>> --- a/include/linux/soc/qcom/smd-rpm.h
>> +++ b/include/linux/soc/qcom/smd-rpm.h
>> @@ -4,8 +4,9 @@
>>     struct qcom_smd_rpm;
>>   -#define QCOM_SMD_RPM_ACTIVE_STATE        0
>> -#define QCOM_SMD_RPM_SLEEP_STATE         1
>> +#define QCOM_SMD_RPM_ACTIVE_STATE    0
>> +#define QCOM_SMD_RPM_SLEEP_STATE    1
> 
> This is what we usually try to abstain from: ident changes + functional changes. I'd say, leave spaces as is and just add the new entry.
I think I might wanna turn this into an enum..

Also, I'd like to rename it but that's a story for another day, as
it'd require even more messy merging..

Konrad
> 
>> +#define QCOM_SMD_RPM_STATE_NUM        2
>>     /*
>>    * Constants used for addressing resources in the RPM.
>>
> 
