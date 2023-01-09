Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05E1C678D8
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 13:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236492AbjAINt3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 08:49:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236646AbjAINtK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 08:49:10 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3462C271A8
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 05:49:09 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bt23so13002398lfb.5
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 05:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFyuWtUTcWsP31saXV4wicdxhnvV5KIBkcOmoyb9lFE=;
        b=WJXfFKhPwKXDltMs22tB7AKxS9jGxZZDCddo/D/RnFONaMNk5JcEXh3klmFicz4pmc
         YCgcmdzTKF4xXEnDozOKxXX3/VTljq4qYtoKg2sRf0rBCgk62GI24E1xYrpR6mMXvZvq
         bKLST1GloqIdTrfRcYCmxqtzSZo1fTsfAwT3x91ZvQdVuRCAMbEZScGwrdxFNJ0vC0SU
         Mp/EFMkRS99m4ks22K4pMj98xjHZb6f36e3hftXJzIKit9p3jGViEpVe0cyAE91Xdpsq
         VRxrhkHiQDxUh21tmSZafgRWiOBL5iGrFgK6fHqT+dliHW0p1FEDb4mDMHcw4OzOb4R2
         suiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFyuWtUTcWsP31saXV4wicdxhnvV5KIBkcOmoyb9lFE=;
        b=OAwZ6Sf0fECmGQcSNbFRqaG7L6CPoJyK9k0pqPKl6SV44A4v36Mi9B346OCgTq/KP7
         0p8iEtkl27+3Izh7SumYpv5coAsjiIwH4fJ1fbto81rZVcl+WdCj1ogWPPxN7PrQAiWK
         Ob9kJi7MDTvlzjhKKmVZ/gyGsaBCck3Y3qakYNAdbgRnX31/jHmoh1/y4GYXhXmskPnM
         CE+/JVu0FZC4JVWDWlqZ6O8yVwYgZeWaRz6StdUpyWuYnwZvR05MTXaof9mr0/O04vmL
         eGVkDM1+1sfH89vAd3x/HR23OaFPAJjMKpt3Ny6YSKRO3ryJvCDO+32jFGQJWr/04md6
         LOiw==
X-Gm-Message-State: AFqh2kqieI0lyv2jNX6dTChCZJeCRfWmkvwAQj3yWeg36jRUVghfC0tW
        sm4uDuT871Hlg4wCi40/Fp/gaQ==
X-Google-Smtp-Source: AMrXdXsgC5KrYhu3K82qlufN5zyMSiBHuxrxSS+z08yD2eUx0ZdYHyj7x8PsOT/8kgUlckzVwaVwkg==
X-Received: by 2002:ac2:598f:0:b0:4cb:df5:92a6 with SMTP id w15-20020ac2598f000000b004cb0df592a6mr106200lfn.30.1673272147624;
        Mon, 09 Jan 2023 05:49:07 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id w34-20020a0565120b2200b004b5ab5e904esm1618881lfu.306.2023.01.09.05.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 05:49:07 -0800 (PST)
Message-ID: <c20e34e7-24c7-4113-407f-d07cfa154a8c@linaro.org>
Date:   Mon, 9 Jan 2023 14:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: sm8150: drop the virtual
 ipa-virt device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
 <20230109002935.244320-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230109002935.244320-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 9.01.2023 01:29, Dmitry Baryshkov wrote:
> Drop the virtual ipa-virt device. The interconnects it provided are
> going to be represented as <&rpmhcc RPMH_IPA_CLK> clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 99750987c9d6..0759bc22d0c2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -2057,13 +2057,6 @@ ufs_mem_phy_lanes: phy@1d87400 {
>  			};
>  		};
>  
> -		ipa_virt: interconnect@1e00000 {
> -			compatible = "qcom,sm8150-ipa-virt";
> -			reg = <0 0x01e00000 0 0x1000>;
> -			#interconnect-cells = <1>;
> -			qcom,bcm-voters = <&apps_bcm_voter>;
> -		};
> -
>  		tcsr_mutex: hwlock@1f40000 {
>  			compatible = "qcom,tcsr-mutex";
>  			reg = <0x0 0x01f40000 0x0 0x20000>;
