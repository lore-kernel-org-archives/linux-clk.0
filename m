Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6E0C77B6C
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 20:45:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240622AbjDFUpv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240375AbjDFUpg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 16:45:36 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D840EFBA
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 13:42:29 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y7so9471187ljp.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oB69DSrkZMHLxeLz+MD4z51xSrPE6ffX9rBh1gZABiE=;
        b=mkFMzH+BEicrut05oGmaOycHLT6ow6xlh9osbF8WZXs/W06vyUTr+ib1EpUiD8ORKv
         AUBoW3rtpQQYA56EsLC/v/Mq2pW6aCYUWX0w41U1zg88KDmMcOYa6mZzm+2l15TOYhEc
         Y4wy2R3Ctaok/GkVQRVRI2VmE80vTgv31Ok33BER/p67mCtgqifqhCmo397Ez8ldKn2l
         Un0xFSuN6FEPbzMfXN3JGeSmR39LJSqPRihUGv9719QDLRyslQBbUNo48Vh2I+XQkTjU
         RdTfIb+xAy+d+rRZCEwB3PMzoxUf9FnOAc3Wp219Z4zDmLtY7zvd3dobAV0J1w77r5uk
         BZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oB69DSrkZMHLxeLz+MD4z51xSrPE6ffX9rBh1gZABiE=;
        b=f8HNnBzeE2oetdId8gEXE0gB0fgPkGzSYYIvnbOaLaisJxexm/Y9ointxcX5nmtJTu
         L+kXSLZ03lXU57oVijZ6q5FpnyhAQ573syhOMvfuyBPaA3I07rMHwZvpYftBYjvvMAiL
         gW6pptlDCEX1do8iDdojl+Z6gHQgoqlDuhhMBi4jJhee5xLeYMatli/XStOikDO2cQCo
         wJS6WlGPPZ8iZtOuy+k0MsGiYlBQJP45WZKMNpBPj039e/YcWyzGabLdwKkT1aox+aWt
         /B4XMwkBo+70usTW72m2Yg9ABlng9+SYIpA1EdZhijMZnJmNnq0zCelGlqytVI8tDzLj
         WnrA==
X-Gm-Message-State: AAQBX9fea+T1nNoT2XjfdUAMc+stLbbG9m0ycOoU3M+zjtW0QVtGyF4A
        jl97ru2zq5kLhicDI5dNwuLJMA==
X-Google-Smtp-Source: AKy350aNMspDMW30urIo3bqf6HZ2PhRAb/JmXga8ppMJl7ItG7FPMh734ib0vh8JP9kGqYGstrXRUg==
X-Received: by 2002:a2e:980b:0:b0:2a0:202c:93b3 with SMTP id a11-20020a2e980b000000b002a0202c93b3mr3253362ljj.49.1680813747643;
        Thu, 06 Apr 2023 13:42:27 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id a2-20020a2e8602000000b002a6406c610fsm436118lji.34.2023.04.06.13.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 13:42:27 -0700 (PDT)
Message-ID: <b5260847-d766-dd17-99ce-0646fa2f72b2@linaro.org>
Date:   Thu, 6 Apr 2023 22:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: ipq9574: Add support for APSS
 clock controller
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        dmitry.baryshkov@linaro.org, arnd@arndb.de,
        geert+renesas@glider.be, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_ipkumar@quicinc.com
References: <20230406061314.10916-1-quic_devipriy@quicinc.com>
 <20230406061314.10916-5-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230406061314.10916-5-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6.04.2023 08:13, Devi Priya wrote:
> Add the APCS & A73 PLL nodes to support CPU frequency scaling.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  Changes in V3:
> 	- No change
> 
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 068c3950dcec..7c820463a79d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -525,6 +525,24 @@
>  			timeout-sec = <30>;
>  		};
>  
> +		apcs_glb: mailbox@b111000 {
> +			compatible = "qcom,ipq9574-apcs-apps-global",
> +				     "qcom,ipq6018-apcs-apps-global";
> +			reg = <0x0b111000 0x1000>;
> +			#clock-cells = <1>;
> +			clocks = <&a73pll>, <&xo_board_clk>;
> +			clock-names = "pll", "xo";
> +			#mbox-cells = <1>;
> +		};
> +
> +		a73pll: clock@b116000 {
> +			compatible = "qcom,ipq9574-a73pll";
> +			reg = <0x0b116000 0x40>;
> +			#clock-cells = <0>;
> +			clocks = <&xo_board_clk>;
> +			clock-names = "xo";
> +		};
> +
>  		timer@b120000 {
>  			compatible = "arm,armv7-timer-mem";
>  			reg = <0x0b120000 0x1000>;
