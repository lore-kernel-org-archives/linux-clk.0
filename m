Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6404EC00A5A
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 13:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjASNhW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 08:37:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbjASNhA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 08:37:00 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CDA7ED53
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 05:36:57 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id y11so2788506edd.6
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 05:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ul2QoxkNx6V65kWnLOrufKLqPcbvPbRP5IqxNTkmCWs=;
        b=ly7/ErrfnFARsBkd7LDXnsdKYGHdGD8IIXbMEun0t/RogWbaaXvq8T4fWJFYzAoLg5
         GmCNM5Msz6HSwSSHThUk5DrOKrHna/0OduFjnDpVpH15iA7hg6bBpt//2joyJrJFA7gi
         P67eVh/gloF6OG1Shqp1UN6sL8UZTZNo/dec0I0J5bMBrU06VEqdHhFxLo0SQMoSTKj0
         DyFT2IwFiy5PQwPRddeTO+d0ITetx8VitkzlyCh+JJ6M54gw4SiQlnu4hUy4qaf6D2WE
         /p/iPBXT/M/R8xF1UwqwKHN+pg+ttvgltCvgzHWHywhap2YsAHCr+0KpaOpko2n61u+E
         5mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ul2QoxkNx6V65kWnLOrufKLqPcbvPbRP5IqxNTkmCWs=;
        b=5zOkmPJqqdmJfdP13EcJdDqfY6StD9Mw/8JcBJ3O7HtxzXkhNMy32hRSqUSesofJER
         U2SlARstF0dVb6eaN19GtCo8TI35rgEjJGu5whdPUOc49uZ2xH0t6XMss4w1wTo4Hr6X
         64I+TJ2WoBx+I64Lr/BnQiOXiBkAyvOZyqcsC5NkTbtd8+D0rUV2O+0Haj6Fgr03oySX
         xcmFGXbaH4sA3k8J0qipLcT8La5DyAsWEHRBapUdmq3M+aKSpUNh/enVTcKiEOFEj/9y
         UDLIlebJ3VYinsBoXgpBn2OZvs5nYad0UR7XgwVRK9F1ox5aDnaeoCzA1OiOjYEhlGWC
         YliQ==
X-Gm-Message-State: AFqh2krZNvD8JB0o61iSQAzewbC07fd1h1knCvFBxfHlFQyAnu28dVIH
        rAOWVu8+8pin+xLAqHu4MtKkbQ==
X-Google-Smtp-Source: AMrXdXuIfyla87CmWJcxhOl5p2kzwJveDFvUR21VRAsZvgC5Elf6y8XbV71T51FQpl53s5GVCd1y1A==
X-Received: by 2002:a05:6402:e8c:b0:463:e2cd:a8b5 with SMTP id h12-20020a0564020e8c00b00463e2cda8b5mr10405163eda.11.1674135416361;
        Thu, 19 Jan 2023 05:36:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r8-20020a05640251c800b0049df0f91b78sm6928239edd.78.2023.01.19.05.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:36:56 -0800 (PST)
Message-ID: <4a4d8da9-4068-b74d-5811-759cd7d1b34e@linaro.org>
Date:   Thu, 19 Jan 2023 15:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: msm8996: add CBF device entry
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-7-dmitry.baryshkov@linaro.org>
 <2382c5f5-f57d-1fc6-497c-b355aed08036@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2382c5f5-f57d-1fc6-497c-b355aed08036@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2023 15:44, Konrad Dybcio wrote:
> 
> 
> On 17.01.2023 23:58, Dmitry Baryshkov wrote:
>> Add device tree node for the CBF clock.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 150d13c0f4b8..7d8e31b84959 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -3562,6 +3562,13 @@ saw3: syscon@9a10000 {
>>   			reg = <0x09a10000 0x1000>;
>>   		};
>>   
>> +		cbf: clock-controller@9a11000 {
>> +			compatible = "qcom,msm8996-cbf";
>> +			reg = <0x09a11000 0x10000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
> This should be RPM_SMD_XO_A_CLK_SRC, downstream consumes cxo_ao.

Ack

> 
> Konrad
>> +			#clock-cells = <0>;
>> +		};
>> +
>>   		intc: interrupt-controller@9bc0000 {
>>   			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>>   			#interrupt-cells = <3>;

-- 
With best wishes
Dmitry

