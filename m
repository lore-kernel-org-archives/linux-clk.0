Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537B2C7EE23
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 20:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbjEIURo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 16:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjEIURn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 16:17:43 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33583AAB
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 13:17:41 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso7171306e87.0
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 13:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683663460; x=1686255460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmKVHCAiBGkNJofbRMAYwGbo69F3rhrv1LxXEw31Bzo=;
        b=wAHhbwYUYf9+Gs5pUZCZb+r0+cQ0ORE/ARjL/woK17v39IQb9oOT/EhqI/tn2jHBRY
         DWofXYhP9rh6wYKTZp75OxjTEXIgNdxJMmHRfF4CIUWtbhAY7Ka561iyhb67ykBzlZlF
         0lN8NRUjQcnAdygar4FaNoyPk8rvnNUeSE8q5w2NVQ/W9PnZ0AGw4ofJfq2Aqlcra78z
         fI3UwazHiChgA9FdEWkJTU0pUHpVEhdEbd370oULvQVfGE9A5Sdm+MfpiHA0VjPqc9f2
         10x9YmS1m1x97Nhjz7w4cM8RGI5Nkjsul5f8q8AGuaqR3U5Vqtj1YLJhfLXrApA8LNlH
         cWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683663460; x=1686255460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmKVHCAiBGkNJofbRMAYwGbo69F3rhrv1LxXEw31Bzo=;
        b=St1o+k5qOT0RAIaTZ3nNV1xbTeHydraees12htcdjbiIe32y/+lTeKqVOYzm0G0IA3
         G1kTe36hSS3RWcpnd8NeirFDt+DX2aVYhmYGcr4eFec7lD6Pu4fsZPPBKLhoMb2cH0f6
         bFSdBgkJrw6jrNdcGwx3H6Aj5wjzA2X30k6kB9HCNGDoil9dMWsthIvgwb3bEEF71EZa
         PbcoURcNAPErZ9k3po1voG/CfYyLdWL9vU0v40Nb7o/GoDIlG2W1p27Uby95HA82nEoq
         J5dliM04WKk/arhKr/t/CiAoj5NthigEROHlM3TXVpb5swL8CnnBIKpZp0SKmFLtBh+B
         xw2w==
X-Gm-Message-State: AC+VfDxjhKBvh8vtk0akiGnhq8PCXw9CPdHB3ZbA+bW/d76KB53zDwI+
        dBbxEG8lQwXJ3E3tJnWuedeawFQ3O4X2iRPOJQs=
X-Google-Smtp-Source: ACHHUZ5SKD+Ozv6eTQcH5cELV8WI2V191mkwa2V0T63BkkXI6/q6WzUzJWsS7SAAvpIcDX2XhWvziw==
X-Received: by 2002:ac2:446b:0:b0:4ef:b18c:89b2 with SMTP id y11-20020ac2446b000000b004efb18c89b2mr1219862lfl.56.1683663460066;
        Tue, 09 May 2023 13:17:40 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id l26-20020a19c21a000000b004e88a166eb6sm454048lfc.46.2023.05.09.13.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 13:17:39 -0700 (PDT)
Message-ID: <d95365c2-016a-9f04-3bea-77bb418b9b29@linaro.org>
Date:   Tue, 9 May 2023 22:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V4 3/3] arm64: dts: qcom: sm8450: Add video clock
 controller
Content-Language: en-US
To:     Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_skakitap@quicinc.com, quic_jkona@quicinc.com
References: <20230509172148.7627-1-quic_tdas@quicinc.com>
 <20230509172148.7627-4-quic_tdas@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230509172148.7627-4-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 9.05.2023 19:21, Taniya Das wrote:
> Add device node for video clock controller on Qualcomm SM8450 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> Changes since V3:
>  - None.
> 
> Changes since V2:
>  - No changes.
> 
> Changes since V1:
>  - No changes.
> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 595533aeafc4..00ff8efa53c7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -756,6 +756,18 @@
>  				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
>  		};
>  
> +		videocc: clock-controller@aaf0000 {
Nodes should be sorted by unit address.
This one belongs before cci@ac15000.

> +			compatible = "qcom,sm8450-videocc";
> +			reg = <0 0x0aaf0000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>;
Older SoCs used to provide a vote on XO_A for videocc ahb_clk_src,
I'd assume that's now taken care of internally?

Konrad
> +			power-domains = <&rpmhpd SM8450_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		gpi_dma2: dma-controller@800000 {
>  			compatible = "qcom,sm8450-gpi-dma", "qcom,sm6350-gpi-dma";
>  			#dma-cells = <3>;
