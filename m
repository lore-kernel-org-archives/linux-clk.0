Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B828C05027
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 08:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbjAZIVD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 03:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236376AbjAZIU5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 03:20:57 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F506A335
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 00:20:55 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id lc27so579435ejc.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 00:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXOcNfOjRw1Y0qlOF/3R7EgUaI8IBLrnuJ66uPISGZo=;
        b=wm9R/Twc5JV6iAvLIM0EAyevxG49lRJsTVoOxJGHA78ymVchZhsvOYR+RvqCaNDfYs
         ahIXL/48IfjuvLCTtKkVPjPbPkieLeoPXT+BERurZJpQdWuBl/0tBQ8J/Z0LEA1k+slx
         SQ5ZgI+TD6I42P3r2LAeH/vtJnRk69ktHaxaFvg02aQqv6SoEsyJWSbM0AjKEQauPIzI
         1l9CJSXIu4bBbKXnPop08oDpvqdQMoqzNkyE1pQKa/MIzI+Nd0fvcLgK7MYlMMU44ged
         rslspynHGx7euvThb+8EdpEzo1VZOOgn2zgJDpSylK3QTfHqkuyHewc1n+kU7br7ENir
         dsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXOcNfOjRw1Y0qlOF/3R7EgUaI8IBLrnuJ66uPISGZo=;
        b=LwY98UPYmDwMptsST7QiJSPzjvJOLejw0vDJG+qUm4tKUiUI7hPtWhp+hKkF+0kZUy
         nHo51Muqj4UUntNQCrwYF8EiRGQQaHms8Z8FaIqtcFE0ZQOy7HvAL9iCBkG5eTb3kDtT
         rE8yvT+s9KH/QMRowmmN0pSuY7M4WRfPWtg0813OjSxTkPfomeI62Kn7siLgrrVshThw
         bv8JRLlGlnzgF2JWeqobPg/v0TcsjEWbLe9XwJxQQlSojU0rnVAkTvRSDLac5MuHqHsN
         NliyF50Gpb7PK7+/5FR8qIREjPiZR3zQYaAr/ttUHtQPxA2zGLvgwlelCvJNOthNUMPZ
         j83Q==
X-Gm-Message-State: AO0yUKXxPi/Z47unryW5DVelfIJasGeKtUOzAlRGQPy2EeAHQ0ILMQTb
        wttVqKKpG1w4NZ72xIFPXhtKAA==
X-Google-Smtp-Source: AK7set8O4Q8kdw4WO9csN17e7RgF3UVlRgep1//+HpuRvVC+YWMHL+XKfyFLJFOMQC4EH+jSbW66ng==
X-Received: by 2002:a17:907:9b88:b0:878:5937:7637 with SMTP id kq8-20020a1709079b8800b0087859377637mr2331915ejc.38.1674721253534;
        Thu, 26 Jan 2023 00:20:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gv11-20020a1709072bcb00b007c0d6b34d54sm231427ejc.129.2023.01.26.00.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:20:52 -0800 (PST)
Message-ID: <9e2b822a-b8ff-c4e0-aaa3-004682393bd9@linaro.org>
Date:   Thu, 26 Jan 2023 10:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 4/8] clk: qcom: cbf-msm8996: scale CBF clock according
 to the CPUfreq
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <20230120061417.2623751-5-dmitry.baryshkov@linaro.org>
 <078c5a8254ac006b65fc5fa81dfbc515.sboyd@kernel.org>
 <3a355075-cc29-957a-678b-2a05aed25587@linaro.org>
 <b4dd052421f926b60728f1578e4922e0.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b4dd052421f926b60728f1578e4922e0.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/01/2023 23:40, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-01-20 14:53:21)
>> On 21/01/2023 00:11, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2023-01-19 22:14:13)
>>>> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
>>>> index 9cde0e660228..b049b4f7b270 100644
>>>> --- a/drivers/clk/qcom/clk-cbf-8996.c
>>>> +++ b/drivers/clk/qcom/clk-cbf-8996.c
>>>> @@ -225,6 +228,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
>>>>           .val_format_endian      = REGMAP_ENDIAN_LITTLE,
>>>>    };
>>>>    
>>>> +#ifdef CONFIG_INTERCONNECT
>>>
>>> Can you move this driver to drivers/interconnect/ ?
>>
>> Only the interconnect part? At some point I considered dropping the
> 
> Yes only the interconnect part. Use auxiliary bus.

Ack

> 
>> whole CBF mux support and moving the whole driver to
>> drivers/interconnect, but I could not find a good way to use alpha-pll
>> from the interconnect driver. Would you recommend one?
> 
> I don't think you need to use alpha-pll code from the interconnect
> driver, do you?

If we have separate drivers? No, I don't.

-- 
With best wishes
Dmitry

