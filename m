Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18BCC61DB3
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 14:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239935AbjALOoY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 09:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240000AbjALOno (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 09:43:44 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4515E631B2
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 06:32:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id y25so28675290lfa.9
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 06:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Y2UrGUHISQLitvMADQqDIxu/bBzkECC1FpO2DGrndQ=;
        b=UFvMnOK9uUObb5ZoKImH81sC7v3WDOLatUiArI9JgXeL3Yhnp5gaLU6OnO4FiAvcuK
         CaRnoF9vMbuMYYW0D27c+IRJR0jegvvj6kZWuCuiQEF4y3mEC/gbbpp/47awSs3sX3TH
         mlguJXN06BhZerjPy2NxBkOrcMgriuLyR52BzGZ9dXvFuZ6MvDFMWDZBjg4qt6oSaheU
         kdgqxDaVO/Ql6+yWPqoqHxjtpEETRe0vrCYeDUxOwW22HSA6Q3qDylbJGQwZq8kvGb1Z
         /4JRuHynZivp7brh7xNYyKmXFcrsy3OcISFYMzBR5Ck1gQsu1DxUiXx6SOAaydJc8GoA
         6W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y2UrGUHISQLitvMADQqDIxu/bBzkECC1FpO2DGrndQ=;
        b=3QFHlPV3wz3DKi9f/dQZaZB+H8PBUkPBMl1sY350MeQrKU0L5Gdj9p6WNJQ5dGKRaV
         N2lUUU2LYCKvMkwBdvqr6y9GkheINsqMoVXKBtZXOU/KRTCXCLZTZe9nijpbtugNvexb
         Oc9sZAIZK8pOtmEwrbueFqsJ5YtsNuAhvwy5NwtLsY6GIcvLeovJE4kE8bY8ja9yA/2Z
         zNLeKtlKa0BxSyFiIVY3gnDsNjZkZ1sLUuoqlGl7bDbv+lgQ0Zr0u2p1yqRUUXopGQMs
         rmlaMjPLQmv/xF+4YMyVv60oGVrDI/f3GaB7fwriAmd0pq/uj60YORdbCh0FXf6MNT5A
         /xUg==
X-Gm-Message-State: AFqh2kqwWRWJJQqRpKIME/QAgPSmW/UOBhn33P4as1/Fca3qRLPIpeOQ
        91QWzXMkJlfgLsSiGSOVyNYsfQ==
X-Google-Smtp-Source: AMrXdXsOsDxwb4o3dI50PMcqFHzhyUZFE93Wbq6/VKnY+W1DiBCTRoiYhLvPHiA1GYo4GoN0Iz06Rw==
X-Received: by 2002:ac2:5102:0:b0:4b5:6649:eb6c with SMTP id q2-20020ac25102000000b004b56649eb6cmr30805090lfb.25.1673533957616;
        Thu, 12 Jan 2023 06:32:37 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id v9-20020a2ea449000000b0027fee4c3c29sm2191413ljn.21.2023.01.12.06.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:32:36 -0800 (PST)
Message-ID: <942a6282-5519-8871-5043-229bead87bd8@linaro.org>
Date:   Thu, 12 Jan 2023 15:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 09/13] clk: qcom: cpu-8996: fix PLL configuration sequence
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
 <20230111192004.2509750-10-dmitry.baryshkov@linaro.org>
 <e556e250-7ae4-a5a7-7d0f-eb80a0231e8b@linaro.org>
 <449be451-f12c-ee14-a5f8-7a1e0d417597@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <449be451-f12c-ee14-a5f8-7a1e0d417597@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.01.2023 23:05, Dmitry Baryshkov wrote:
> On 11/01/2023 23:08, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>>> Switch both power and performance clocks to the GPLL0/2 (sys_apcs_aux)
>>> before PLL configuration. Switch them to the ACD afterwards.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/clk/qcom/clk-cpu-8996.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>> index 571ed52b3026..47c58bb5f21a 100644
>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>> @@ -432,13 +432,27 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>>>   {
>>>       int i, ret;
>>>   +    /* Select GPLL0 for 300MHz for the both clusters */
>> superfluous 'the'
>>
>>> +    regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0xc);
>>> +    regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0xc);
>>> +
>>> +    /* Ensure write goes through before PLLs are reconfigured */
>>> +    udelay(5);
>> Is this value based on n clock cycles, or 'good enough'?
> 
> Don't know, this is based on downstream direclty.
Right, I see it now.

> 
>>
>>> +
>>>       clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
>>>       clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
>>>       clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>>>       clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>>>   +    /* Wait for PLL(s) to lock */
>>> +        udelay(50);
>> Weird indentation
>>
>> Maybe wait_for_pll_enable_lock() to be super sure?
> 
> Does it work for HWFSM PLLs?
Not sure, but wait_for_pll_update_ack_clear() should, since it's
called by 

clk_alpha_pll_hwfsm_set_rate() ->
  __clk_alpha_pll_set_rate() ->
    clk_alpha_pll_update_latch() ->
      __clk_alpha_pll_update_latch()

Konrad
> 
>>
>>> +
>>>       qcom_cpu_clk_msm8996_acd_init(regmap);
>>>   +    /* Switch clusters to use the ACD leg */
>>> +    regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
>>> +    regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
>>> +
>> No delays here?
> 
> No. Probably it isn't required since there is no additional PLL locking, etc.
> 
>>
>> Konrad
>>>       for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>>>           ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
>>>           if (ret)
> 
