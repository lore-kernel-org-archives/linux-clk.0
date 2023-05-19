Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E72C77B7A
	for <linux-clk@archiver.kernel.org>; Fri, 19 May 2023 16:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjESQxA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 May 2023 12:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbjESQw6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2023 12:52:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BD9B9
        for <linux-clk@vger.kernel.org>; Fri, 19 May 2023 09:52:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f14468ef54so3996597e87.0
        for <linux-clk@vger.kernel.org>; Fri, 19 May 2023 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684515175; x=1687107175;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKNMa0s4Vk4CkoiOAyA9DUfRZyyAScSWwyf79QsupZg=;
        b=T3kEGXtQkNq9tMLqkKPuXcX5Hwe7JZrZnODT8hWYVSVNv51ycYlxBGrhCxXdgtSnOB
         DgN000U/z4upaQRc9BBUs9+0+VfgjiWk6bMMXhTCUgTE0EbmwIuCtKUlmcEUcAGxpZCD
         Dp1eK8JZpvv8PdPCz36WLmYsVWAthILLNgL8pQU+jAH0TZOiFpUA/QOGjBV+zHWC0jtO
         JpO5HvNRFyRFfltfo+TcBVO4XGprcpCMcmPvNcusTie1Fw+iQAo7/MWzdgrXUhShRGPh
         LJn3iQQ5GpIsv/tPzTWzP+OEaP13gHsbb+sAzIg6bn+o+/C7T8OffztR9KcLQxX763IJ
         vdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684515175; x=1687107175;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKNMa0s4Vk4CkoiOAyA9DUfRZyyAScSWwyf79QsupZg=;
        b=ZBvTVHFqFm8q424WIlrI1EVuXZ4F2RPnCqSITQXmsvAsNKJTd5AQ9PVQCyQdwqbhns
         D5VZZ6tcvsCpKaAPwipskCpiLUFxuB9kSjuDc1epfEIShLzqY/c7R4+QDSgjz+AFzT08
         1Cy1m3zvdqAQ38CBrW7TVJu6pW7xTfbKcwL51K5vquZjbFlMgdojEcEaUmpZDrcvV+Uo
         pZFH+o+jloTI41ruPpN193UI4dt5sn++K4vJ/fh0HsQlffQoHTUVgtMWn8HumCat9YiI
         VLMWXbT182YajXL0aBRsSOYFehS97oUyPoYZSvVdQ78jRImCCuDIS5+JmjacHUbRU55T
         HKTA==
X-Gm-Message-State: AC+VfDzqcc+zP8XPYVqjEVHEnmp+VK1up8oVX4/55YekhtsIhpLAy4y2
        g1LFSPUuFA6FSKgK8oukSj9qCA==
X-Google-Smtp-Source: ACHHUZ5GRnZEXcAAo1HGUkRBvXlAE5ebGSOeGchueyWmdk7Arl/6Rvf1X0Uq6sPltP51ozwaEDXP8A==
X-Received: by 2002:ac2:5503:0:b0:4ec:8816:f4fc with SMTP id j3-20020ac25503000000b004ec8816f4fcmr966012lfk.6.1684515174867;
        Fri, 19 May 2023 09:52:54 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id r4-20020a056512102400b004f24db9248dsm656008lfr.141.2023.05.19.09.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 09:52:54 -0700 (PDT)
Message-ID: <634c80b4-5007-4f66-9114-1dedf3c95f1f@linaro.org>
Date:   Fri, 19 May 2023 18:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8550: Add camera clock controller
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20230519155602.6642-1-quic_jkona@quicinc.com>
 <20230519155602.6642-5-quic_jkona@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230519155602.6642-5-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 19.05.2023 17:56, Jagadeesh Kona wrote:
> Add device node for camera clock controller on Qualcomm
> SM8550 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e67e7c69dae6..ac82d3774ed8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8550-camcc.h>
>  #include <dt-bindings/clock/qcom,sm8550-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8550-tcsr.h>
>  #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
> @@ -2397,6 +2398,20 @@ opp-202000000 {
>  			};
>  		};
>  
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm8550-camcc";
> +			reg = <0 0xade0000 0 0x20000>;
Please pad the non-zero address part to 8 hex digits

Konrad
> +			clocks = <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>;
> +			power-domains = <&rpmhpd SM8550_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible = "qcom,sm8550-mdss";
>  			reg = <0 0x0ae00000 0 0x1000>;
