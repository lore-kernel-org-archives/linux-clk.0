Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC494C3A5A7
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 23:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiLFX0M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 18:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiLFX0L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 18:26:11 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539B32EF57
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 15:26:10 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id z4so19004152ljq.6
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 15:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l526E0M3m2oeB1LGIT6sGPLZlCdqeAgIKILU4qw9R8o=;
        b=axdpt8rtOC+4lWH3yeM7CqJipR688ChCb1DV9otuZRi6Es07a3T1t81R7VRGuhFrDO
         9sqnWjphfzPU/TkZG7v6fO1cR+7zMjychCWUZMtDhPqJa7r+nxrGxUTBzM8tBECJUge/
         h6pd6jEb8hRvEquzMC6v1toloTJPuN5eLA2evS7JgRx8ktg1zDqAvtBzw+PB/reyUb9d
         ohvBB+CgQCIGFrMN5wSM5iWTOHtgNWLE6z3iD3/DzMwhVSqrxNmN9vq1PjRVW/gaQlOl
         yTmdTeyyJ1d7hsoStraG67xMR713y+3+sCHCctalLfHe4/veWqmni7ThxJWUpaHT3Qs5
         A8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l526E0M3m2oeB1LGIT6sGPLZlCdqeAgIKILU4qw9R8o=;
        b=Fa9kN39GTZK4CenLkiOupZNf3Hl/8SSbF+DnN/CmwWwFFOOvqNVIqWwCcHsXv94Ubw
         UcuS3YV7380JBO1tHkQSvj9w2kOHpCQDBvqCq0LV+WG0ZVESxrtxjO8wJs8VoAPN3bBd
         h6JdJAVd3as3czo8evP9lB0xhIiV4oWWMaciquDoSyc1dNr7H6AvYG5K6Fqz/XsmHQfk
         ZpVqj55ghfqx4GRQHKKMppp2r71NbhZo6gyNwtumrAUQSVuG+cq6d0Eq5JPtp0rr0wIC
         Rn78yLO21uxsbv81ZkIEzBNdP2iR8dUCXEccnuzsGbzbv5FrqL4OgojASWKZaUaIkbJa
         uk0w==
X-Gm-Message-State: ANoB5pl/r4+iuT/X1fL1uoyLtNPiSDCvT7UAT3VxUbvFLVCSgqSPH2vD
        YMuN7D0/Vkr8AuRd/NZXHPd2Zw==
X-Google-Smtp-Source: AA0mqf5AMBhOUAlsSTuDp8La/PiMR5li1Szx4VI1AWPh2b5s120FGNjnxk3yF6z61cRnerkyBsj5bg==
X-Received: by 2002:a2e:a791:0:b0:27a:13ad:14b1 with SMTP id c17-20020a2ea791000000b0027a13ad14b1mr1174186ljf.351.1670369168644;
        Tue, 06 Dec 2022 15:26:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m8-20020a2e9108000000b0026dffa29989sm1492438ljg.23.2022.12.06.15.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 15:26:08 -0800 (PST)
Message-ID: <76c419d6-c017-713c-a7af-7f8876462335@linaro.org>
Date:   Wed, 7 Dec 2022 01:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 06/16] clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks
 to qcs404_ln_bb_*
Content-Language: en-GB
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-7-dmitry.baryshkov@linaro.org>
 <7d56df1b-eb80-9e56-705f-c2d639ac1792@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7d56df1b-eb80-9e56-705f-c2d639ac1792@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/12/2022 19:04, Alex Elder wrote:
> On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
>> Follow the usual practice and rename msm8992_ln_bb_* clocks to use
>> qcs404_ln_bb_* prefix, since there is already a family of pin-controlled
>> ln_bb_clk clocks defined for the latter platform. This is mostly a
>> preparation step for the next patch.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I notice something below.  I might be misunderstanding the code,
> but please explain anyway.
> 
>> ---
>>   drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++------------
>>   1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c 
>> b/drivers/clk/qcom/clk-smd-rpm.c
>> index 6af0753454ea..3a526a231684 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -635,7 +635,8 @@ static const struct rpm_smd_clk_desc 
>> rpm_clk_msm8976 = {
>>   };
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 
>> 19200000);
>> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8, 
>> 19200000);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 
>> 19200000);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, 
>> ln_bb_clk_a_pin, 8, 19200000);
> 
> You define the above clock(s), and comment out the qcs404 version below,
> but there are no changes to these clock reference in this patch.  Is
> that a mistake?  Should the pin control clock changes go in a different
> patch (like the next one)?

No. For all other pinctrl clocks there was a corresponding XO_BUFFER 
clock with the similar name (e.g. msm8998_ln_bb_clk3_pin vs 
msm8998_ln_bb_clk3). For qcs404_ln_bb_clk_pin there was no 
qcs404_ln_bb_clk, since the msm8992_ln_bb_clk was used instead (even for 
qcs404).

So for the sake of making the next patch simpler I just rename the 
msm8992 clock to qcs404. I'll add this to commit message.

> 
>                      -Alex
> 
>>   DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 
>> 0);
>>   DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 
>> 1);
>> @@ -673,8 +674,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
>>       [RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>>       [RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>>       [RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
>>       [RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
>>       [RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
>> @@ -733,8 +734,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
>>       [RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>>       [RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>>       [RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
>>       [RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
>>       [RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
>> @@ -798,8 +799,8 @@ static struct clk_smd_rpm *msm8996_clks[] = {
>>       [RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>>       [RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
>>       [RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
>>       [RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
>>       [RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
>> @@ -822,7 +823,6 @@ static const struct rpm_smd_clk_desc 
>> rpm_clk_msm8996 = {
>>   };
>>   DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, 
>> QCOM_SMD_RPM_MEM_CLK, 2);
>> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, 
>> ln_bb_clk_a_pin, 8, 19200000);
>>   static struct clk_smd_rpm *qcs404_clks[] = {
>>       [RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
>> @@ -841,8 +841,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
>>       [RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>>       [RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
>>       [RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>> -    [RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
>>       [RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
>>   };
>> @@ -1014,8 +1014,8 @@ static struct clk_smd_rpm *msm8953_clks[] = {
>>       [RPM_SMD_BB_CLK2_A]        = &msm8916_bb_clk2_a,
>>       [RPM_SMD_RF_CLK2]        = &msm8916_rf_clk2,
>>       [RPM_SMD_RF_CLK2_A]        = &msm8916_rf_clk2_a,
>> -    [RPM_SMD_RF_CLK3]        = &msm8992_ln_bb_clk,
>> -    [RPM_SMD_RF_CLK3_A]        = &msm8992_ln_bb_a_clk,
>> +    [RPM_SMD_RF_CLK3]        = &qcs404_ln_bb_clk,
>> +    [RPM_SMD_RF_CLK3_A]        = &qcs404_ln_bb_clk_a,
>>       [RPM_SMD_DIV_CLK2]        = &msm8974_div_clk2,
>>       [RPM_SMD_DIV_A_CLK2]        = &msm8974_div_a_clk2,
>>       [RPM_SMD_BB_CLK1_PIN]        = &msm8916_bb_clk1_pin,
> 

-- 
With best wishes
Dmitry

