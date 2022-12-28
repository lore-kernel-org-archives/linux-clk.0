Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B5CC4167B
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbiL1NmH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiL1Nlz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:41:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B03B16
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:41:54 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j17so14159516lfr.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I99sMjDsAea5G8B1JlCQSCo9peQ47lkvT7dfS54M45M=;
        b=eV9isvizueOy1vXXFpMk7UnDoGDerHmnCOZXWfLhABxUKkg2szl1Z1xkKDkfUN04La
         Lj+FGfAadQSmWh9ZErCcHRxw6epcIsRUZF+2ZxD/JwEG9ZxVvPfudeBMfbhCGwN3Q2Md
         DA7KCApdzo/H+RvT6YgRFp7i9eSEH3vpval+2/hee1PGJtxE0odlUUloRr/IsFgyduKB
         ekAmIV7B7mxjknjvkYfRk+AlU1vy6JgCyGpeyavTYHPKRw9TjcncQ8vfBAr9dUlBmbzQ
         bvBVreKUF4zOnsk1h9ZMiCQOyDmE2Y2/k5kn66WvYxru2qsJ66JJMb0jEAVmBbcllrAI
         1RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I99sMjDsAea5G8B1JlCQSCo9peQ47lkvT7dfS54M45M=;
        b=XWHKZj3Q+ksYQHo2MxuPlfkAu3Zlr5myCVcRH50txuKfvI/9CPebjcBYmot2OPmmmV
         qe15xHSe7ekbon2/KEI2aZHP+1y18eBDt7rb9WrKvR5qhPFlXLNB6zHhZv4q5Fezb01n
         FtOMQL+PM+XtlyUI5lfoOpFG7cHZuurg1LHJNq1mjfRQ4GNqNsJNPefsyBZDfbINcxBX
         FP8Q49GnxzrdKfK+g0y4f0r64NXjJ5cTR/5aoJRANDZbblMT4/CZUPM/jeIRcKIXdNNZ
         TEwR3Vj6KWH9o/8sHAKi3gLQsVo1fSSKVB8Hvvo/RxrGFSos6BiPATtKj5krdsrxAkuI
         ch8A==
X-Gm-Message-State: AFqh2krZGQ8qqac/Zxxyn60RK07Ko9nRQrrF7yzypyVQ+YTOVMOG3wIh
        HS+jGg7o+bP7T8AU5g+QqW1nzg==
X-Google-Smtp-Source: AMrXdXssihIaszrUcuTU8eNLzMHzUZ/xpoVxxYeRNpQn2Q6binlVJqVyxvuNZCFdmZU8cwkUlR4PIQ==
X-Received: by 2002:a05:6512:3e10:b0:4a4:68b8:f4f0 with SMTP id i16-20020a0565123e1000b004a468b8f4f0mr7868369lfv.54.1672234913056;
        Wed, 28 Dec 2022 05:41:53 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512202400b004b5979f9ba8sm2651230lfs.210.2022.12.28.05.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:41:52 -0800 (PST)
Message-ID: <6a45ded9-5a61-fec6-d1b8-91fbad4b0a04@linaro.org>
Date:   Wed, 28 Dec 2022 14:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 16/16] arm64: dts: qcom: msm8998: get rid of test clock
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
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-17-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-17-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 28.12.2022 14:32, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 18cc149b6be4..6d69dce14dba 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -2398,8 +2398,7 @@ mmcc: clock-controller@c8c0000 {
>  				      "dsi1byte",
>  				      "hdmipll",
>  				      "dplink",
> -				      "dpvco",
> -				      "core_bi_pll_test_se";
> +				      "dpvco";
>  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>  				 <&gcc GCC_MMSS_GPLL0_CLK>,
>  				 <0>,
> @@ -2408,7 +2407,6 @@ mmcc: clock-controller@c8c0000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>,
>  				 <0>;
>  		};
>  
