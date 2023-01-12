Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4E7C61DB3
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 12:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236797AbjALMRt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 07:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236834AbjALMRE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 07:17:04 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D0F4C70D
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 04:17:01 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bt23so28102249lfb.5
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 04:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/Crti06zdfvOeajjPfc6JQjPbNYY5J/eTBerZMm4d0=;
        b=usrpwr3EluaKa4Uwns8VicqiX7w9TrJImYoxAf1x48fP3BessI1ay8ByaxYmQR5Hn0
         CNwXfETezzlhtqCmLEq0TGFjjKN0ih1wGONa0slebwl7qzHDbseodmppilzXBBTbFMoW
         NKtGlfhBpWZI2JyCxfDbzEKmSQrvFRU4k/jDJXHm+K5NweIA0gd6+H8UkwFTXbp1plpp
         nUAB2iQaTaP2Kt2FJWtJKO6QWKY+6ZWbxTH+vSewAS4NQkc3qqZQW218C4+z9jnAIZeH
         +T9BQqoR7BQE/MO4OIpiTSLI+qEKq3/Qcy8Ddyl3vJxwtLWFxx8LQrdvmjas592sIO6G
         bvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/Crti06zdfvOeajjPfc6JQjPbNYY5J/eTBerZMm4d0=;
        b=qConj7SSwy7TD3m6Wl/W9D6sgCh8h1mwZamMDoYGrZFzlmYoLVvqWcFMrf/+lM0ds1
         Lfx42WsbBMWGG63botXUumfHSyJmSvGN5dvXMSku3hK11R/7W9qDljk6mJ5OGLwk4xZ5
         /gzBLNiWUhWlZpKDcu8dNAOdN/giU3Bpp25yR6BNHq7xBMgRgl09J867NMNMA7qVkF/Q
         ugjI8kNTf6bVe6AKtX+RDx49o18REei6nSrDxDKTm410TjqdjWfaWGM6JKHNuP8lUlKx
         IcDY10zAdTyN6yCgcVEIUOBW2lLleIzl8OQCwrGyOCIeyOktTbq8h1LloXqNf7szh+NR
         juEQ==
X-Gm-Message-State: AFqh2kqSOYeI0f46ILJoGtNiUGbN7R3plK12zNwimpEJ4NMaPnduwpvb
        LFP+c0p54uoqDoTWiTQlkdg3Uw==
X-Google-Smtp-Source: AMrXdXt3+Rwm9DxZ9ObnUuIybM/SXHl3nlvUEi3NYYVy9pIKtVXTNCxmQ/3A3vVdQE6CaxaC+OJ+dw==
X-Received: by 2002:a05:6512:b22:b0:4cb:154d:2175 with SMTP id w34-20020a0565120b2200b004cb154d2175mr17433236lfu.30.1673525819675;
        Thu, 12 Jan 2023 04:16:59 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id n27-20020a05651203fb00b004cb21eaf6e6sm3277894lfq.0.2023.01.12.04.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 04:16:58 -0800 (PST)
Message-ID: <c05e1f57-3d09-7b2a-9e1d-4885e52bc263@linaro.org>
Date:   Thu, 12 Jan 2023 13:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 04/13] clk: qcom: cpu-8996: support using GPLL0 as SMUX
 input
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <20230111192004.2509750-5-dmitry.baryshkov@linaro.org>
 <33a6bf2c-bb93-c183-3915-5b90b72e4503@linaro.org>
 <39c01d7b-eee4-ceb7-f7c4-7862c5527f33@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <39c01d7b-eee4-ceb7-f7c4-7862c5527f33@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.01.2023 22:52, Dmitry Baryshkov wrote:
> On 11/01/2023 22:59, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>>> In some cases the driver might need using GPLL0 to drive CPU clocks.
>>> Bring it in through the sys_apcs_aux clock.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Oh that's new.. downstream doesn't talk about this..
> 
> It does, but under the hood of the init procedure. See:
> 
>         /* Select GPLL0 for 300MHz for the perf cluster */
>         writel_relaxed(0xC, vbases[APC1_BASE] + MUX_OFFSET);
> 
Okay I see it now!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
>>
>> Konrad
>>>   drivers/clk/qcom/clk-cpu-8996.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>> index d51965fda56d..0e0c00d44c6f 100644
>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>> @@ -12,6 +12,8 @@
>>>    *                              +-------+
>>>    *               XO             |       |
>>>    *           +------------------>0      |
>>> + *               SYS_APCS_AUX   |       |
>>> + *           +------------------>3      |
>>>    *                              |       |
>>>    *                    PLL/2     | SMUX  +----+
>>>    *                      +------->1      |    |
>>> @@ -310,20 +312,29 @@ static const struct clk_ops clk_cpu_8996_pmux_ops = {
>>>       .determine_rate = clk_cpu_8996_pmux_determine_rate,
>>>   };
>>>   +static const struct parent_map smux_parent_map[] = {
>>> +    { .cfg = 0, }, /* xo */
>>> +    { .cfg = 1, }, /* pll */
>>> +    { .cfg = 3, }, /* sys_apcs_aux */
>>> +};
>>> +
>>>   static const struct clk_parent_data pwrcl_smux_parents[] = {
>>>       { .fw_name = "xo" },
>>>       { .hw = &pwrcl_pll_postdiv.hw },
>>> +    { .fw_name = "sys_apcs_aux" },
>>>   };
>>>     static const struct clk_parent_data perfcl_smux_parents[] = {
>>>       { .fw_name = "xo" },
>>>       { .hw = &perfcl_pll_postdiv.hw },
>>> +    { .fw_name = "sys_apcs_aux" },
>>>   };
>>>     static struct clk_regmap_mux pwrcl_smux = {
>>>       .reg = PWRCL_REG_OFFSET + MUX_OFFSET,
>>>       .shift = 2,
>>>       .width = 2,
>>> +    .parent_map = smux_parent_map,
>>>       .clkr.hw.init = &(struct clk_init_data) {
>>>           .name = "pwrcl_smux",
>>>           .parent_data = pwrcl_smux_parents,
>>> @@ -337,6 +348,7 @@ static struct clk_regmap_mux perfcl_smux = {
>>>       .reg = PERFCL_REG_OFFSET + MUX_OFFSET,
>>>       .shift = 2,
>>>       .width = 2,
>>> +    .parent_map = smux_parent_map,
>>>       .clkr.hw.init = &(struct clk_init_data) {
>>>           .name = "perfcl_smux",
>>>           .parent_data = perfcl_smux_parents,
> 
