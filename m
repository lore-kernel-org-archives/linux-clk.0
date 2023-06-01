Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55ECBC77B7E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbjFAKOU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbjFAKNs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:13:48 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FE010E0
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:11:36 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f50470d77cso763832e87.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685614294; x=1688206294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhoCA2QH36QfcbROSHzKcbe/jXpRfD6WBXnyxhagi1E=;
        b=CCMbzbS5b+dydseaXKkcp50fuol2wgEDqsgwXJOGl0Co4REzxZhTqtl5/zV7vRQR7E
         FRRUF/pO904u3TTfEDuaW3eI4e3pVMd3/Zh/HJ2qOjG0PnGeSoLexByFjpJVimLwzxg3
         0KtrtZ2c9CrNJgfBI86IEmUT3JkEaMPufPRibexbdxKywRErb+9smvA4w1qC1mJbVN3n
         7nJ3bA7uh27TJT+DSr/ymZ9U8aB5PEHFO8AKt/oOyBg2BaQduV0S1M6/nBGgL/ORten2
         Y7W6V6ZA6z2J1MRvGhMXjIDBMaV/Xbr8Nt3HaS2HGx/Q1yyOqnClmVY3vzv+oyu1BFq1
         RG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685614294; x=1688206294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhoCA2QH36QfcbROSHzKcbe/jXpRfD6WBXnyxhagi1E=;
        b=Uo/LLnV2hCJXok6uTtDdv9RyEpmVOogBLimlTe/NpRlx3P1K5G1a8J4lZiBcWIj0ru
         +k2i7o2tppBGunalLlsvL2hbk4iEtv9h2xZkglg6qn6GE/Nd4Dlwu1LwIklxe0v+PgUr
         VF8DmY0Yn+GcYNsiLh9h0bE/5s1HzPyBD/5DbbMX0Awj2/7qzITGmGyHeQvOauaXd7D7
         zWaC4N9RvkWcqJG8vI2YB7pJenYMmWH24Q+LeTt2rWF18c/RT2u4illhdrXL9vg+oCpb
         B1g8fsSMnVOoS0y+xRBfdy4/LJTKJDVVmJcxCow4FMmAfZ7hlTPbPJcaYbbVng+t5ayS
         XlcA==
X-Gm-Message-State: AC+VfDyb0/aH0xAnAkDyuZCObbMNW/SyPtz5chkdxrFqA5XvhZZG4zQU
        BCLsD7vYr1q83PmwMOXs/YGERQ==
X-Google-Smtp-Source: ACHHUZ6DstT5A89g1x2UBpqfrgPbEFOThpcTPNihppqvdqilfsIK5o2ku3Ae+zriTliT5YIHSJz05w==
X-Received: by 2002:a19:5208:0:b0:4f3:a3e0:8502 with SMTP id m8-20020a195208000000b004f3a3e08502mr972806lfb.33.1685614294192;
        Thu, 01 Jun 2023 03:11:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25a09000000b004db51387ad6sm1039964lfn.129.2023.06.01.03.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:11:33 -0700 (PDT)
Message-ID: <1e846ba0-c8dc-5a93-538e-42457c557580@linaro.org>
Date:   Thu, 1 Jun 2023 13:11:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 12/20] interconnect: qcom: msm8996: Hook up RPM bus clk
 definitions
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
 <20230526-topic-smd_icc-v1-12-1bf8e6663c4e@linaro.org>
 <62eaf77a-94c4-0a48-e335-83664fe343db@linaro.org>
 <8cb8b647-8efb-e140-5575-52785b4e93d3@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8cb8b647-8efb-e140-5575-52785b4e93d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/06/2023 13:10, Konrad Dybcio wrote:
> 
> 
> On 1.06.2023 12:08, Dmitry Baryshkov wrote:
>> On 30/05/2023 13:20, Konrad Dybcio wrote:
>>> Assign the necessary definitions to migrate to the new bus clock
>>> handling mechanism.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/interconnect/qcom/msm8996.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
>>> index 1f7e88a37acd..a596f4035d2e 100644
>>> --- a/drivers/interconnect/qcom/msm8996.c
>>> +++ b/drivers/interconnect/qcom/msm8996.c
>>> @@ -1840,6 +1840,7 @@ static const struct qcom_icc_desc msm8996_a1noc = {
>>>        .type = QCOM_ICC_NOC,
>>>        .nodes = a1noc_nodes,
>>>        .num_nodes = ARRAY_SIZE(a1noc_nodes),
>>> +    .bus_clk_desc = &aggre1_branch_clk,
>>>        .regmap_cfg = &msm8996_a1noc_regmap_config
>>>    };
>>>    @@ -1861,6 +1862,7 @@ static const struct qcom_icc_desc msm8996_a2noc = {
>>>        .type = QCOM_ICC_NOC,
>>>        .nodes = a2noc_nodes,
>>>        .num_nodes = ARRAY_SIZE(a2noc_nodes),
>>> +    .bus_clk_desc = &aggre2_branch_clk,
>>>        .intf_clocks = a2noc_intf_clocks,
>>>        .num_intf_clocks = ARRAY_SIZE(a2noc_intf_clocks),
>>>        .regmap_cfg = &msm8996_a2noc_regmap_config
>>> @@ -1889,6 +1891,7 @@ static const struct qcom_icc_desc msm8996_bimc = {
>>>        .type = QCOM_ICC_BIMC,
>>>        .nodes = bimc_nodes,
>>>        .num_nodes = ARRAY_SIZE(bimc_nodes),
>>> +    .bus_clk_desc = &bimc_clk,
>>>        .regmap_cfg = &msm8996_bimc_regmap_config
>>>    };
>>>    @@ -1947,6 +1950,7 @@ static const struct qcom_icc_desc msm8996_cnoc = {
>>>        .type = QCOM_ICC_NOC,
>>>        .nodes = cnoc_nodes,
>>>        .num_nodes = ARRAY_SIZE(cnoc_nodes),
>>> +    .bus_clk_desc = &bus_2_clk,
>>>        .regmap_cfg = &msm8996_cnoc_regmap_config
>>>    };
>>>    @@ -2000,6 +2004,7 @@ static const struct qcom_icc_desc msm8996_mnoc = {
>>>        .type = QCOM_ICC_NOC,
>>>        .nodes = mnoc_nodes,
>>>        .num_nodes = ARRAY_SIZE(mnoc_nodes),
>>> +    .bus_clk_desc = &mmaxi_0_clk,
>>
>> What about an ahb_clk_src here?
> This should be remodeled to MNoC (MMAXI clk) + MNoC_AHB (ahb_clk_src).
> 
> I can fix this after this series.

As long as it doesn't result in a regression.

> Konrad
>>
>>>        .intf_clocks = mm_intf_clocks,
>>>        .num_intf_clocks = ARRAY_SIZE(mm_intf_clocks),
>>>        .regmap_cfg = &msm8996_mnoc_regmap_config
>>> @@ -2038,6 +2043,7 @@ static const struct qcom_icc_desc msm8996_pnoc = {
>>>        .type = QCOM_ICC_NOC,
>>>        .nodes = pnoc_nodes,
>>>        .num_nodes = ARRAY_SIZE(pnoc_nodes),
>>> +    .bus_clk_desc = &bus_0_clk,
>>>        .regmap_cfg = &msm8996_pnoc_regmap_config
>>>    };
>>>    @@ -2082,6 +2088,7 @@ static const struct qcom_icc_desc msm8996_snoc = {
>>>        .type = QCOM_ICC_NOC,
>>>        .nodes = snoc_nodes,
>>>        .num_nodes = ARRAY_SIZE(snoc_nodes),
>>> +    .bus_clk_desc = &bus_1_clk,
>>>        .regmap_cfg = &msm8996_snoc_regmap_config
>>>    };
>>>   
>>

-- 
With best wishes
Dmitry

