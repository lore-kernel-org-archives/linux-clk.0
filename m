Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A22EB64D7
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 01:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjFXBxL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 21:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjFXBxK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 21:53:10 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264302941
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 18:53:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so1632471e87.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 18:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687571586; x=1690163586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNrGZecLKe91T/RJadHDeBwRyXg51e++/hjjgaZ5Zfo=;
        b=fd2xR/W9T3VNdMGl2gDzFiJvpXAZKGwDScUe9qk28QUYT5uPn+DR6U3858yc+v8zsL
         lEJU+cSGuI3Ijm2JKHXTQ9EmcEVoiMwwPAc1VP1XB9j0knwLfBI+PgBYqdw7S9XIlfAL
         eVqXcrxzzeYSVZ1Yzsn7ZgUDtshcO02Ido4mlJGmVBBIO+A1+jHwNWFon6h3VOYqTMz3
         XGUIWBHc+Xg0zoADXhnSMWiMcjTyv093GYwBI2V8/4XhfesVkLy0mEBfof8XM+04eRtt
         KFDqQsmoe/+FtKNvAGR+06TddSqfymXySspmZJbZ8SC8J1/Vqg/L/kFi6CA5FPGRroGl
         a27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687571586; x=1690163586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNrGZecLKe91T/RJadHDeBwRyXg51e++/hjjgaZ5Zfo=;
        b=c16Uw3Wc20HjZ2G2Xk7Qpc0kZdqYbBw25/LFCxaTEhnWEZZ5j0oREC0Gr5lqAqvdFM
         pEaVokaC5Y65zIXmDYJpz6PnMARRvWKm4s54mnJtGeP7gRyPbkiVXWjrePL07RzukCOY
         DSFcUxoiCNwuAfnBJvbdomRqTZUHkzoUVmUPnre/8csX3BkuoWbooLb/i1ddIxXDX4vP
         LtjVxiz2sbUd6Gjeq1RxdU/JysZleNXk0piNZOkdxjYw107gcFrMJvQkSypTBduJn+LJ
         U4xtMP/Xm7K+SSpk1Ah94jGl5wnOSDe9wEllRutp5x+8kcKGS3Dkn/4tI3NByhBhaLp1
         HTyg==
X-Gm-Message-State: AC+VfDwTc9r/dhUWK3wwgWAajwmfRKYFABN4lpwlOtpLEdBM2lte1zN5
        SAVL0FQ4eH5hsAGhXmcB7MilOg==
X-Google-Smtp-Source: ACHHUZ4NbvdAMNbfgXRrkwClNB4QE38qmcc1+X8dG5c7wHh6GLwbGWLie6OsLeycuVureCf+/9Mf+w==
X-Received: by 2002:a05:6512:6d6:b0:4f6:e06:50bb with SMTP id u22-20020a05651206d600b004f60e0650bbmr11455242lff.30.1687571586381;
        Fri, 23 Jun 2023 18:53:06 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id c6-20020ac244a6000000b004f85df6e650sm90971lfm.276.2023.06.23.18.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 18:53:05 -0700 (PDT)
Message-ID: <f061e2ee-7e9f-474e-c86e-24fa1d4bd10b@linaro.org>
Date:   Sat, 24 Jun 2023 03:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 13/15] arm64: dts: qcom: sm6125: Add dispcc node
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-13-1d5a638cebf2@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-13-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24.06.2023 02:41, Marijn Suijten wrote:
> Enable and configure the dispcc node on SM6125 for consumption by MDSS
> later on.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index edb03508dba3..7d78b4e48ebe 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
>   */
>  
> +#include <dt-bindings/clock/qcom,dispcc-sm6125.h>
>  #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1203,6 +1204,28 @@ sram@4690000 {
>  			reg = <0x04690000 0x10000>;
>  		};
>  
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,sm6125-dispcc";
> +			reg = <0x05f00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <0>,
are you..

> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_disp_gpll0_div_clk_src",
..sure?

Konrad
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_dsiclk",
> +				      "dp_phy_pll_link_clk",
> +				      "dp_phy_pll_vco_div_clk";
> +			power-domains = <&rpmpd SM6125_VDDCX>;
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		apps_smmu: iommu@c600000 {
>  			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
> 
