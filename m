Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD14C27C76
	for <linux-clk@archiver.kernel.org>; Fri, 20 Jan 2023 11:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjATLOe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Jan 2023 06:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjATLOd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 06:14:33 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6436619C
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 03:14:27 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id v6so13079630ejg.6
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2X4s4BtpK/aJlH6LhfyKD6YkP3AiRfVscHdOk053Ic=;
        b=vjmUzd684UTNTFfBD6QCvS7yvGk6EDhT1p3tYE7wbGgEu5GiUVB+ovpOdfK1UtAR9M
         X9a5Y3G+iCMeMiX4iJ2sbKcMY/URztUrVK/21T3qNssiKBzTakBPnGD1/U7ILgu8YpIg
         VVj2E7rCyUzf56Qn8XZIxDjxgQWfw9aFKtrcjtdGIaMoUp0WQuJlrF+4EeqcW0ytnG8g
         zuri/9Y1cDLF7FROPiGo6d6rV7y3roRVOdJ/NrBT+m1Av+nmM7pzxl5YE+S2mjX/1BJ9
         d1TdJR7aRQiBMhH8aZmLCTQcCDL7gJzH84yk373PhOkZxhBnemh5AFzYFx2fHJC6mGco
         ZMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2X4s4BtpK/aJlH6LhfyKD6YkP3AiRfVscHdOk053Ic=;
        b=OYXTxkxLTCD+aXRqlRtxOSOm5GUD+6mMrPbcrXGJu36QFAK8nilJcBg6S29E5uN5YT
         4ybIPMyGdmCKGqkfhxBlzgw4BiAs5IuS5K0GPUfO2Cv1VNJ6cxD0vLtmH63OcTu3G66u
         j7rq9eW92BPsx5Y/RvXQqhnOdgnCjeDyxic0IoPPhDGMio8789HBVG5odCt1+i5HeWHM
         TS9Gpk+OGjxK8VmhpXyzaPdtyg9DZnWNkzCcmteuYubNUNsFDy8ooteNkgh7rq0NQvIM
         5psGYw4D7ArsacSYUDK70bjqHcpe/MFLhGkwF1SEbXqkmVDKs2iVVdRwgGA3Sb6RSEsR
         VohA==
X-Gm-Message-State: AFqh2kpwtJ78xrvQsywbG7sXDwarjfqQTz1KY2UUMmKqfICPiqjw3sRp
        DUIMige+0IX8nl+s8GRbi06KPg==
X-Google-Smtp-Source: AMrXdXvknQ0f7UQ0UYNxv8FK4qT+LCFtsjtVVHNCvOtv0KsLw++TkHUNbKKRJ+1WApT7aQniVff0wQ==
X-Received: by 2002:a17:907:a2c6:b0:7c1:92b2:fa9e with SMTP id re6-20020a170907a2c600b007c192b2fa9emr15504854ejc.59.1674213266512;
        Fri, 20 Jan 2023 03:14:26 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906218a00b0073d796a1043sm17512602eju.123.2023.01.20.03.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 03:14:26 -0800 (PST)
Message-ID: <64e32ee3-404e-3832-c451-a758db12158e@linaro.org>
Date:   Fri, 20 Jan 2023 12:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: msm8996: add CBF device entry
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
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <20230120061417.2623751-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230120061417.2623751-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 20.01.2023 07:14, Dmitry Baryshkov wrote:
> Add device tree node for the CBF clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 4427305f8a94..6f180a8efe77 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3572,6 +3572,13 @@ saw3: syscon@9a10000 {
>  			reg = <0x09a10000 0x1000>;
>  		};
>  
> +		cbf: clock-controller@9a11000 {
> +			compatible = "qcom,msm8996-cbf";
> +			reg = <0x09a11000 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_A_CLK_SRC>, <&apcs_glb>;
> +			#clock-cells = <0>;
> +		};
> +
>  		intc: interrupt-controller@9bc0000 {
>  			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>  			#interrupt-cells = <3>;
