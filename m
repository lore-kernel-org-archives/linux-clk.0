Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C198C4167B
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 11:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiL0LdY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Dec 2022 06:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiL0LdW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Dec 2022 06:33:22 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8CEB1
        for <linux-clk@vger.kernel.org>; Tue, 27 Dec 2022 03:33:21 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id z26so19252556lfu.8
        for <linux-clk@vger.kernel.org>; Tue, 27 Dec 2022 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+uwmeC8cgwwNhOwqaWBQr6Qls/0UIDT6UTLmfxOw6Y=;
        b=R+ugUEyQS77A2PYAeNNxIs1XIgHvOTEZx+2vR4zx+FrLs5xDfMMa3AulwXPKyzl9j2
         /VEYdQLRauNmmq7VaXZIV2ZzY2jfJFj3w9dzuNleAe2pWwKmL9uEZ8L3orGkWntSxmDc
         vGhvdUxaOIYHDbTdwEX0L869h62oMQP5ROUrq671m3TQvmx10DVZ9ydqdRwp8CfSTHXr
         mHM10ddXEiwNqbhAfN+ODK7T6tWeZ6NzZyNwNTlZz3y/ngxc4S9lzNcCbqU1kjv7SJT4
         Tx+Ccw8vehCtNloVR0Dl73/SqSRsXCZq+oYOC5J5ZpSLa34ljTNZqmEwJa4RfGssK8X5
         N2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+uwmeC8cgwwNhOwqaWBQr6Qls/0UIDT6UTLmfxOw6Y=;
        b=zBnHWqInQQTChYpCaKc3hWKV8FKaSYe1ADLHenjJwBO9kRO9ffv7JhZVhvEkBQpc7t
         VVeOPmIQA3LD8nalJ+fz+qc4qSN+A3f2yIVyMlTs+QhZc7VXuegS58UeDdlregn/Q6ld
         M5ZiIE/caGAoZFyeqkSyUQXejQS+o1grWBIH8MOj2zEKwrdxfOGuPgl1J6623U+ppjul
         9GhfZs1/0DvmD9uivshJl2OJFHr0eyQTNkN+PCeagyFYeapx5AslEYPLCwEczxOHLcc8
         UzwUifpulP5G4dwyqfORjr1316/IJuxERLvHJMnD/EAHWDKNKwix528Y0KCr58Y0c3vS
         /v2w==
X-Gm-Message-State: AFqh2krKmx5LqTiaa7bmw096G9zv+2CxoKj8ksj/WEAaoBHaIpCkpEQr
        wY8BSNO5V+0KTOBDIsbyLpD6BA==
X-Google-Smtp-Source: AMrXdXv+l9z4RnHC8eYh6g1MxUZacAJCU7efctHJRWdCKFPT3HsDfvdF+ppXe/VC9C+s1zDhqpZ+RA==
X-Received: by 2002:ac2:551d:0:b0:4ca:fe5f:bc0e with SMTP id j29-20020ac2551d000000b004cafe5fbc0emr5275440lfk.21.1672140800075;
        Tue, 27 Dec 2022 03:33:20 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b004ae24559388sm2199521lfo.111.2022.12.27.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:33:19 -0800 (PST)
Message-ID: <5c8b8aa0-3286-e46d-635e-7eed9bd3b13c@linaro.org>
Date:   Tue, 27 Dec 2022 12:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: qcs404: add xo clock to rpm
 clock controller
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
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
 <20221226042154.2666748-17-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221226042154.2666748-17-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 26.12.2022 05:21, Dmitry Baryshkov wrote:
> Populate the rpm clock controller node with clocks and clock-names
> properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 9206ab13977f..4721b3139df0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -230,6 +230,8 @@ rpm_requests: glink-channel {
>  			rpmcc: clock-controller {
>  				compatible = "qcom,rpmcc-qcs404", "qcom,rpmcc";
>  				#clock-cells = <1>;
> +				clocks = <&xo_board>;
> +				clock-names = "xo";
>  			};
>  
>  			rpmpd: power-controller {
