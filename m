Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19707C636CC
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 12:38:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbjAaMiP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 07:38:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjAaMiM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 07:38:12 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385AC3EC6C
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 04:38:03 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id ml19so17620840ejb.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 04:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKxbXbEULBKOHnps7S4m6S4/h0JUMvMF27+rV1zb/eY=;
        b=KoQK4BP+iUuerkkYupPQ6Mfvtfw+GCDZgMZNWp3fj+UhiBjoITRpmFXWpZIkOqIu3o
         Lc2EsgPGLh6reRhpPZY0PcmnKo2V5l2pcLIkTEXKZRWFBbaKBJBUy9uO+44HiqM1dIgt
         uJ8gqAa5NcErmSLuyDIPhKk3VLZQ7M+eCBFNN/OwqhBIdkUU0rzR24l6fgcZp6VhWsU0
         cBsEc7T5tmSExLTiC3LmqVuqvGqFAwG+EWBw9KEbP1xBWsra6fGUuQIYtnfeFPuDdi9n
         m2TMoX/uXM80Nva6rNxYmJcnoZ1dBNOrEur5JIhiPMmvi0IrJ9+/0d/Rl0aPR9Jv/Sch
         DMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKxbXbEULBKOHnps7S4m6S4/h0JUMvMF27+rV1zb/eY=;
        b=yr+ZwrZq2LGs19y3tu1iUuP3B2/sFW6Yx7DCzaUkAbFd4N2cNNrYQliajSIbpDwt+z
         HaEoU8/1QrDk+VW3a4LjK5kEd/+XyvoJeYtDlNCro9awa9q6us12OpI3Kq5ubrrhHohY
         BI4PVP6TJAzVX7Bl+gZ2UT9kGKeXEXYBJLHREzGOamgxrzW+hQq4mGLkgU9N3W6or5oD
         j3fc7VAc7e5eRP1L1mho2oOIuac70EiMYBC/gnalAn+EYZ90qQjSMdMUqKx8EiAUBklv
         qWNfCoZbYtM7i+Wfb7vGWCCIdmHF6/Gi64IPj69n0XIeIIpRTK/kc3sI3aLscvJ8PaSN
         V0lw==
X-Gm-Message-State: AO0yUKWDTEa1DSleQM9Vp2W0hetG1/yYTHdbbZ4d9ZiErN/oJ9tm5NZ5
        m28Bkxxc4ZfnOh6Z2fZjRyFWiQ==
X-Google-Smtp-Source: AK7set+tpLdZpV3Lq1clFGcWzNITzxmhts98f/KIaiISBd86thLtpFk5vBVlowdEYD8yiRezgckW1Q==
X-Received: by 2002:a17:907:1c84:b0:889:b6ae:75fe with SMTP id nb4-20020a1709071c8400b00889b6ae75femr3706521ejc.61.1675168681710;
        Tue, 31 Jan 2023 04:38:01 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id s9-20020a170906a18900b0088519b92074sm4504437ejy.128.2023.01.31.04.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 04:38:01 -0800 (PST)
Message-ID: <8e11a80c-8056-e226-e051-c01b82f29d05@linaro.org>
Date:   Tue, 31 Jan 2023 13:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 4/8] clk: qcom: Add GPU clock controller driver for
 SM6125
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
 <20230130235926.2419776-5-konrad.dybcio@linaro.org>
 <ac2d458c-3cb9-9117-82ca-b025b92073df@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ac2d458c-3cb9-9117-82ca-b025b92073df@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 31.01.2023 10:00, Dmitry Baryshkov wrote:
> On 31/01/2023 01:59, Konrad Dybcio wrote:
>> Add support for the GPU clock controller found on SM6125.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
[...]

>> +    /* Set recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
>> +    regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, CBCR_WAKEUP, 0xf);
>> +    regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, CBCR_SLEEP, 0xf);
> 
> I think you have to use FIELD_PREP here. regmap_update_bits doesn't shift the value according to the mask, does it?
> 
You're right.

Konrad
>> +
>> +    qcom_branch_set_force_mem_core(regmap, gpu_cc_gx_gfx3d_clk.halt_reg, true);
>> +    qcom_branch_set_force_periph_on(regmap, gpu_cc_gx_gfx3d_clk.halt_reg, true);
>> +
>> +    return qcom_cc_really_probe(pdev, &gpu_cc_sm6125_desc, regmap);
>> +}
>> +
>> +static struct platform_driver gpu_cc_sm6125_driver = {
>> +    .probe = gpu_cc_sm6125_probe,
>> +    .driver = {
>> +        .name = "gpucc-sm6125",
>> +        .of_match_table = gpu_cc_sm6125_match_table,
>> +    },
>> +};
>> +module_platform_driver(gpu_cc_sm6125_driver);
>> +
>> +MODULE_DESCRIPTION("QTI GPUCC SM6125 Driver");
>> +MODULE_LICENSE("GPL");
> 
