Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2A2C61DB3
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 15:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjALPtY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 10:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240666AbjALPtD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 10:49:03 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9A567BF7
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 07:38:08 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d30so24081014lfv.8
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 07:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UokpHPU0/CDmS6F/enVQfF6HXAy0LQLEXmkgeAwI3bg=;
        b=WxWNIC31SmiuNKufHtV6TyXqziRsMxBeG0xQXWKPMvwRg6FDjWqF/QeTxjgo5dkgB6
         v7UglTiyMI9Uy4Ai1Td5rrmiv3xtcUsy2qtsZ+nmq0Y9vA2bt3R8lrIHxGvdYVWqfMn+
         0ifFUW9eVe3HXrkPMjnbuaAY5BIzpHUUgUmQId90JGAPg3BJ93zBFSB2AUH8RRFqoQJs
         AcEHD3HZj0bIHNGVijsc2BRtkKl6PZukwS+6inErWZnde/ZJN34+keWfdQoProrSopGb
         USjZENwpREYJC+nIMW4Mwn5ZwmJS9fQeWk4OfK8fJ9/H/9GhXyAMxVlxVlbEdAWb4tBM
         SWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UokpHPU0/CDmS6F/enVQfF6HXAy0LQLEXmkgeAwI3bg=;
        b=Kf9kL3+TfXw6XHgB6HJ9k+jRho3lU29f3wXAj0H5t6kL7f7SDV7SgHgDU8CDhlSqQo
         kOtcFvdzbb4/nq2nkfwq09h8l5/t6JD0A5Q6cGReRXrrXXrgo9RwbMi83vI5JcP35RkC
         XiCL1QmjRfJMBmfalAc0TWUASWZVMgOwVSoOrxyw6cCSgBOuG6kpEL+nTzR/LELLk4hk
         1qQIe1xt1TwHsoi7DpoTWvTXh2qSUtfr8TzTkhuj3lQ164gG/xlWnJDQMdjCbN9cRQkh
         M9ASFd3H4TT8CGwcDVl4F60J726aPN1fWA1Wa+L6DoaQ8hC+R080gzQcVywIvu2G9s+r
         BvZA==
X-Gm-Message-State: AFqh2kpKjiMmRG/FphPEPNCrcz/b2GXAUSBK6mSPGxlsLJhWs1Tej2ZB
        xNOzMLbGwCfIPYYs01n6cjKvTw==
X-Google-Smtp-Source: AMrXdXu/la29HyOnu94jfg8ykt0Qza8Mg/nw9w7LUQBl6gtbKhWWHiwg23T4Cz5bQucfSIjk5D+nLQ==
X-Received: by 2002:a05:6512:1390:b0:4cb:4307:eda5 with SMTP id p16-20020a056512139000b004cb4307eda5mr4428904lfa.25.1673537886932;
        Thu, 12 Jan 2023 07:38:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b004a47e7b91c4sm3300642lfo.195.2023.01.12.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:38:06 -0800 (PST)
Message-ID: <fdd82d5f-d66b-b297-ed28-f44e9806e020@linaro.org>
Date:   Thu, 12 Jan 2023 17:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: msm8996: add CBF device entry
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
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-5-dmitry.baryshkov@linaro.org>
 <3cd04f83-94df-931c-728a-f015ad05d876@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3cd04f83-94df-931c-728a-f015ad05d876@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/01/2023 17:05, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:57, Dmitry Baryshkov wrote:
>> Add device tree node for the CBF clock.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 37ebd8a3b2c8..e5a638b85ffc 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -3558,6 +3558,13 @@ saw3: syscon@9a10000 {
>>   			reg = <0x09a10000 0x1000>;
>>   		};
>>   
>> +		cbf: clock-controller@9a11000 {
>> +			compatible = "qcom,msm8996-cbf";
>> +			reg = <0x09a11000 0x10000>;
>> +			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
> Shouldn't this be RPM_SMD_XO_A_CLK_SRC? I don't see BB_CLK
> referenced *anywhere* downstream, other than being defined
> in the 8996 GCC driver..

Good question. On the schematics I have the CXO input is connected to 
the BBCLK1 PMIC pin.

> 
> Konrad
> 
>> +			#clock-cells = <0>;
>> +		};
>> +
>>   		intc: interrupt-controller@9bc0000 {
>>   			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>>   			#interrupt-cells = <3>;

-- 
With best wishes
Dmitry

