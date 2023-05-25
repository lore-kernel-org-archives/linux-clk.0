Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC359C7EE29
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 10:31:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240825AbjEYKb4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 06:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240987AbjEYKbz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 06:31:55 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C6C1A2
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 03:31:50 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso3170405e9.0
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685010708; x=1687602708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZdgPEgDAoSmA/7SXhnwPx/sNtYd4qe0zdzgh7q8GVQ=;
        b=RPaw11UGtfXADUXUfw2DDLPIgvC68J74KrQRPWKR+hyYRcmAT5tBWE5Z4I4zfOkzuF
         ISHguIAzubWqsAa82mfX01T351JOjnE8n4Hg/+vNBGfP3PjIzciO+zwDxFqiufu/ufdd
         j3mW8nlUk6RVK8t4PqmHvJJbJY6krCiVBMZ2KehWrYaIkoRsvxQ4Tggcpd4+6V9uKLD7
         8mMqbsRwnGjdJ5NcYgDFwcVwghsonEMP+fp4jg0Zrg/43MEyIkVRZuV0rxQX9HggMOYg
         LUgx5UqcdLVxPeYhKZ3+xfgGEYYdtExIBytQuk9jd/FFVoBOluohjxZ7QMp/D3j5OYk6
         ZTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685010708; x=1687602708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZdgPEgDAoSmA/7SXhnwPx/sNtYd4qe0zdzgh7q8GVQ=;
        b=BOwfueyQSkNcXJQ4+UL+3FtPUnaOv4i7Payf3T6fHXeRlmRZ43gx587AiRShT2Qtb5
         hJN3w+avc5flEvmav19WdnMdO0LbQoLVK+70DrmxvDqvg+vQA6DUG54/sJUKI/wYPhYz
         xRafxB54sGDchM/PgwcieA6/t17xgyQYlwZN3lV0/d7az61vHPmBKyZru9Y74251Ku0Y
         H25GxNcuJ5xUg3V6fHFLMnJm493+H4059OD8wRUX7M8lAuq6ZBkP3s1T8YPu4RPj8YPk
         S3NN709LzilsmqzddWuoSlaq3yAJkaFQQn0oNwG+Dr+3sGgv4tb7uYQ8N5q1U6SBO3Cz
         8dcQ==
X-Gm-Message-State: AC+VfDy4pTB2RJ0a46VTMftNpeFqGLuXMkrqjBUEkU2oLS6UZ+UdyD7u
        fEC5PNl5k9emklHZ933pjVjFDQ==
X-Google-Smtp-Source: ACHHUZ7UwxI8JOpqpaFtEvnkFO+1r7zo82NNT05WijoC2pcObFhz7kY3Z3YRG1f8HIHMRuJxFFemSA==
X-Received: by 2002:a7b:cd8e:0:b0:3f6:a66:a372 with SMTP id y14-20020a7bcd8e000000b003f60a66a372mr1968045wmj.1.1685010708356;
        Thu, 25 May 2023 03:31:48 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id l18-20020a5d5272000000b002fefe2edb72sm1335523wrc.17.2023.05.25.03.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 03:31:47 -0700 (PDT)
Message-ID: <497f6543-4d6d-256d-2fa0-be47a594a55c@linaro.org>
Date:   Thu, 25 May 2023 11:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] clk: qcom: Add lpass audio clock controller driver
 for SC8280XP
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
 <20230518113800.339158-5-srinivas.kandagatla@linaro.org>
 <ZGso3u6e0L5jXBLf@hovoldconsulting.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZGso3u6e0L5jXBLf@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 22/05/2023 09:33, Johan Hovold wrote:
> On Thu, May 18, 2023 at 12:37:59PM +0100, Srinivas Kandagatla wrote:
>> Add support for the lpass audio clock controller found on SC8280XP based
>> devices. This would allow lpass peripheral loader drivers to control the
>> clocks and bring the subsystems out of reset.
>>
>> Currently this patch only supports resets as the Q6DSP is in control of
>> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
>> channel.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/clk/qcom/lpasscc-sc8280xp.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
>> index 118320f8ee40..e221ae2d40ae 100644
>> --- a/drivers/clk/qcom/lpasscc-sc8280xp.c
>> +++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
>> @@ -13,6 +13,26 @@
>>   #include "common.h"
>>   #include "reset.h"
>>   
>> +static const struct qcom_reset_map lpass_audio_csr_sc8280xp_resets[] = {
>> +	[LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
>> +	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
>> +	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
>> +};
>> +
>> +static struct regmap_config lpass_audio_csr_sc8280xp_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.name = "lpass-audio-csr",
> 
> Should you update this name to match the new compatible
> ("lpassaudiocc")?

This name reflects the name from data sheet, keeping it that way would 
be useful.

--srini
> 
>> +	.max_register = 0x1000,
>> +};
>> +
>> +static const struct qcom_cc_desc lpass_audio_csr_reset_sc8280xp_desc = {
> 
> Same here (and for the reset struct as well as previous patch).
> 
>> +	.config = &lpass_audio_csr_sc8280xp_regmap_config,
>> +	.resets = lpass_audio_csr_sc8280xp_resets,
>> +	.num_resets = ARRAY_SIZE(lpass_audio_csr_sc8280xp_resets),
>> +};
>> +
>>   static const struct qcom_reset_map lpass_tcsr_sc8280xp_resets[] = {
>>   	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
>>   };
>> @@ -33,6 +53,9 @@ static const struct qcom_cc_desc lpass_tcsr_reset_sc8280xp_desc = {
>>   
>>   static const struct of_device_id lpasscc_sc8280xp_match_table[] = {
>>   	{
>> +		.compatible = "qcom,sc8280xp-lpassaudiocc",
>> +		.data = &lpass_audio_csr_reset_sc8280xp_desc,
>> +	}, {
>>   		.compatible = "qcom,sc8280xp-lpasscc",
>>   		.data = &lpass_tcsr_reset_sc8280xp_desc,
>>   	},
> 
> Johan
