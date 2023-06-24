Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B50AEB64DC
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 13:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbjFXNwi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 09:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbjFXNwh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 09:52:37 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B1F10CC
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 06:52:35 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f86fbe5e4fso2026801e87.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687614754; x=1690206754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mjiEZV4jeag6OJr2dpUfso60xJEHHcCh9NKqh9NcVoI=;
        b=HIrUMg/1DiFIXr9Oxo/TxEkIN/SHzzu3j+KAkwb1dkBbJS18VkjhwY1eu3+wd4nz+Y
         O4lqCmvud8HypQeJ6xLov05tSLHSncrPVVygkl12vKMpaZNgKiRNKD+Rps8EeBt4eyeb
         oWOmFn4pGmCJNrGjsYKJMEHF8pUjvWL0cqZuJuDxRviBXBcHsxiaACc7YoBpcO6lcnOP
         bcNQZV1kSS44z8IaFxEAShgwlD4smb8LIyDa4pqpo7dOzaA1iQtdeDuK9EM9spbyFG9F
         d5eZHFAqyDpWRKwYdaKMR6bUUWQhPpbAuH32sxw5SYweV9o/02G8njD2oJWPs/uyblz6
         l77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687614754; x=1690206754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjiEZV4jeag6OJr2dpUfso60xJEHHcCh9NKqh9NcVoI=;
        b=ho94xYGdy5utWjA9ZKTvqmvTAzulBhRhJbOKYLK1/awH5rf18eEIEoXBBU+upi5YJb
         wK8cXAcGywonLKPoNL5upofksYPIbiKOnzF4sKRHh7mgkK1cABbtHygVYCc7Naor5zbz
         wcwzj7kFcPqKGZYpXkD+eRnZpHzfXCusa8XiBZJRyDwz8lPyJ5P24u1Cduv7AdLfzJFz
         vABj62Ct4PyAlD01INgzvPekZsJmoG1E8qioRmlxVSLHvb65skcXiHhA8T1Ls/Ab6SR4
         bnVBBU/SpokxovAIXvAMdXEPF/BsP24dM2w4hqNSc0uF4DZoh4tklwAvDRkcyINX1EHm
         bLGg==
X-Gm-Message-State: AC+VfDz/m1aJZZ0OR45h6XO2eE3VSVXyj1nNcvcUZKBX8L74cui/lUIs
        7iACMYyxtShf/pjXTVpwO+BtMg==
X-Google-Smtp-Source: ACHHUZ5bwkJUdGqwvE2xmfPDoF40i6IPYZFeCYu7hP9FSE6SMtCynuxZSEvR63zxka+bMXifTFwmlw==
X-Received: by 2002:a05:6512:3714:b0:4f8:5886:1868 with SMTP id z20-20020a056512371400b004f858861868mr233116lfr.24.1687614754001;
        Sat, 24 Jun 2023 06:52:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f76b40260esm285250lfo.146.2023.06.24.06.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 06:52:33 -0700 (PDT)
Message-ID: <dfbff674-ced9-9bc3-848d-91d5ecd4c1d5@linaro.org>
Date:   Sat, 24 Jun 2023 16:52:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 13/15] arm64: dts: qcom: sm6125: Add dispcc node
Content-Language: en-GB
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
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-13-1d5a638cebf2@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-13-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2023 03:41, Marijn Suijten wrote:
> Enable and configure the dispcc node on SM6125 for consumption by MDSS
> later on.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index edb03508dba3..7d78b4e48ebe 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
>    */
>   
> +#include <dt-bindings/clock/qcom,dispcc-sm6125.h>
>   #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>   #include <dt-bindings/clock/qcom,rpmcc.h>
>   #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1203,6 +1204,28 @@ sram@4690000 {
>   			reg = <0x04690000 0x10000>;
>   		};
>   
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,sm6125-dispcc";
> +			reg = <0x05f00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;

This clock is at the wrong position.

> +			clock-names = "bi_tcxo",
> +				      "gcc_disp_gpll0_div_clk_src",
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
>   		apps_smmu: iommu@c600000 {
>   			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0x0c600000 0x80000>;
> 

-- 
With best wishes
Dmitry

