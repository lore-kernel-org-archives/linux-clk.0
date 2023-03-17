Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A20C7618B
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 12:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCQMMk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 08:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjCQMMi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 08:12:38 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3555C5ADD
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 05:12:31 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id r27so6191769lfe.10
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 05:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679055149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZ+vK+6WO1WDejh5ev7ilG9z4FY98vw2pL/2j3yWkWs=;
        b=fhfp6y8itcvatybT//bpiYJnAU1M+WXrvddBjQGZHSaDmb8QBRVUGYcvkO34NpmvQH
         qiwrbYjL951RqY6zaSLAOTEc80G0V1SXgLTjc6xYSCJiWlDmm3XLriX8t56w6Dro2LWf
         GYhU2zmVopE/jMczRVK++pP/BR9BIsQqvY6KQXbViOQ13dnPhiz6vJrlcJBetuhtNJUw
         rSAx0emdoK9BMlWLuL+psSg+qDeWY8WM9NjMonpMRT0RzT5os1umjdHJvIxZjsAU7RJu
         ckJFF1kVdLh0QEKsBTe5a+gUFjsu23B/L0Jw13e7wXIhqskImB6jpXvbqA+4ZvBljvbx
         56JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679055149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ+vK+6WO1WDejh5ev7ilG9z4FY98vw2pL/2j3yWkWs=;
        b=Go+oshnHGZ6EPhc7Q4k54ru90t3R377F5y248UyhD+byxGvBfHCAHHcCBXVyRIGIxv
         h66oxeOczw7rMZ8kLg0sGFvDQ9M/W/WOSWqdsprr1KNFDYtiBYjfvXtRCv/J8599IIk5
         GUbHDe9BpXEinm7cSaK88D2T02L09eu+vinomCugooDmTRUwoNK7vuJbMKbGwmoidIOL
         W+L10QzWJGu/XC6iSUhsLgB8bRnZzAW7o5pAB9Pu+3BjR4TAko9cctmh82EpKR/23yn1
         39MZYA2LOESMtCeTTRhlC2YiHpBpu4R5lAajtTO1KiVq02XN4phkJSfltbhCHMbsIuOc
         jRCg==
X-Gm-Message-State: AO0yUKVUBZSHrolZ7udlTd4bUofenDp+XxLnvY4akYvO4JHODVaadIpk
        0iLLOlFGFX56bIJUSc7v1PocSg==
X-Google-Smtp-Source: AK7set++/DawecZHkwBeKS86YHeRSjzF2Dwq3PiSStzZRtya7+0OEEjIF4DsMBPGukH/+x4Sp8yp4g==
X-Received: by 2002:a05:6512:70:b0:4b5:a207:8d70 with SMTP id i16-20020a056512007000b004b5a2078d70mr4187251lfo.5.1679055149357;
        Fri, 17 Mar 2023 05:12:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id d8-20020ac25448000000b004d093d60f50sm343325lfn.215.2023.03.17.05.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:12:28 -0700 (PDT)
Message-ID: <985c5e15-17a0-d54a-bac2-c33a265ca3c9@linaro.org>
Date:   Fri, 17 Mar 2023 13:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm6350: Add QFPROM node
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
 <20230315-topic-lagoon_gpu-v1-3-a74cbec4ecfc@linaro.org>
 <CR8J37NBHHRY.2S8LQ5O7IQ9PU@otso>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CR8J37NBHHRY.2S8LQ5O7IQ9PU@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.03.2023 09:50, Luca Weiss wrote:
> On Thu Mar 16, 2023 at 12:16 PM CET, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@somainline.org>
>>
>> Add a node for the QFPROM NVMEM hw and define the GPU fuse.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> index 523c7edfa4b3..60b68d305e53 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> @@ -637,6 +637,18 @@ ipcc: mailbox@408000 {
>>  			#mbox-cells = <2>;
>>  		};
>>  
>> +		qfprom: qfprom@784000 {
>> +			compatible = "qcom,sm6350-qfprom", "qcom,qfprom";
>> +			reg = <0 0x00784000 0 0x3000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			gpu_speed_bin: gpu_speed_bin@2015 {
> 
> gpu-speed-bin@2015 ?
Ack
Konrad
> 
> With that fixed:
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> 
>> +				reg = <0x2015 0x1>;
>> +				bits = <0 8>;
>> +			};
>> +		};
>> +
>>  		rng: rng@793000 {
>>  			compatible = "qcom,prng-ee";
>>  			reg = <0 0x00793000 0 0x1000>;
>>
>> -- 
>> 2.39.2
> 
