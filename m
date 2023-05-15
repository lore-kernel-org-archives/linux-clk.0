Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1112C77B7D
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 12:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241211AbjEOM2H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 08:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjEOM2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 08:28:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA0AE5B
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 05:28:04 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso14573560e87.0
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684153683; x=1686745683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoeAd/K4QIDgkvT3+E4nIpalAbE2Kg0RA7njx4ZUB9o=;
        b=kkUhFgQBKR3CcOLZ9bFPHYivAdu25L9X8RiIypwoROJyetd8r0Ijm6NwyWGI6W3r45
         7swiHnN0HK80Quvm4j2vnlTESSyc0CS+V/ury/4G3CoQxRJQw6WvbTOQYc0dJCD529az
         A/It3iOj1E3njTHUq2RifrNr8b/l5hy4GAtN7grl8o7TEFLOikptTe4KBX2HY5uylhRP
         fObXZ6Ton5DY1CJmJx5nnLBpL30s8BsK250ocXTFe/5GyKeKiMOHVHDdw6t46PFDxyj1
         zx1u9vjrxa4F8JOfkE79XQs6jSN+hb8hgzpecphvsL7kFTXSaOzsi/lDbdzcMAknf+sN
         X7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684153683; x=1686745683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoeAd/K4QIDgkvT3+E4nIpalAbE2Kg0RA7njx4ZUB9o=;
        b=Vdl8xf8fx/RldlrJl6K9stOoN3kwXpGzTO5U3oEck4VecXf78Y1jX6DU/S41MafxqF
         1tWO3GpKNibT3W/txv4QU2NVwlJeAqvtBU4t75HRH4PVfbWz5U8XH1+ZKAtY98g+wTYt
         TnuI2B5QX3pWMhFsG8c1oObt58K1q282bHiBgYerdyiqw1lAnPC65lq7WU938xpfScku
         HNNHUNgyF2T4XqN1P0M4KfxSfY4swUazaO0FU6uFDeL1vaSV+4dZ4Vq4lihPj6wAQJ2E
         XGmi96vKI3Ws345fze53gaNx/3n+VrpUFnRYpaghnP6ebIWOHqi0hdC8iBh+ull0D294
         pyCA==
X-Gm-Message-State: AC+VfDw7FnvcOIm7SroTcfA4YIpx1JgXJmb4V5GQeL+LhZGTzSsivJo4
        0nJgkCmOLcmCQtM//+W7e6agGw==
X-Google-Smtp-Source: ACHHUZ5k7aoY9byMTZ4V9sueHRpljE0/O1NNZq32QU6twxBwfUwsRYGK2AsXbQMLig6sPqvQcM+5Eg==
X-Received: by 2002:a05:6512:66:b0:4ef:f5fe:bc76 with SMTP id i6-20020a056512006600b004eff5febc76mr6008797lfo.14.1684153682685;
        Mon, 15 May 2023 05:28:02 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id v3-20020ac25583000000b004f143c11cbcsm2559651lfg.51.2023.05.15.05.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 05:28:02 -0700 (PDT)
Message-ID: <7faf4c16-98ff-f27d-d1fd-3058370c06f5@linaro.org>
Date:   Mon, 15 May 2023 14:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8550: Add video clock controller
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230509161218.11979-1-quic_jkona@quicinc.com>
 <20230509161218.11979-5-quic_jkona@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230509161218.11979-5-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 9.05.2023 18:12, Jagadeesh Kona wrote:
> Add device node for video clock controller on Qualcomm SM8550 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 6e9bad8f6f33..e67e7c69dae6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,sm8550-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8550-tcsr.h>
>  #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
> +#include <dt-bindings/clock/qcom,sm8550-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -759,6 +760,17 @@ gcc: clock-controller@100000 {
>  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>  		};
>  
> +		videocc: clock-controller@aaf0000 {
This node should be moved down. Nodes with unit addresses
should be sorted alphanumerically.

> +			compatible = "qcom,sm8550-videocc";
> +			reg = <0 0x0aaf0000 0 0x10000>;
> +			clocks = <&bi_tcxo_div2>, <&gcc GCC_VIDEO_AHB_CLK>;
One per line, please

Also, any reason the XO clock does not come from RPMhCC?

Konrad
> +			power-domains = <&rpmhpd SM8550_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		ipcc: mailbox@408000 {
>  			compatible = "qcom,sm8550-ipcc", "qcom,ipcc";
>  			reg = <0 0x00408000 0 0x1000>;
