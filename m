Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02366C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 17:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbiI1RN4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbiI1RNa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 13:13:30 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A861F08A3
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:13:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 10so21364294lfy.5
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=M7Ue80YEuoCIOWAQgLo+SUfvh7l5ryKbVSWPKQvrAK8=;
        b=enrbMhtk9diLQuM0JIaOskWc0RZbLWujXPbpp8llfK1JzNHr/Ao5mHKJgX5cRyxJl+
         UxcaKHCLtKXdNJ8ffRnyk9bu3nDO8RQ9N7+YFcb7rnhcpDvyklU8oFqZRLjLrPtEmGAX
         DXBCiEv75cKbVwm7HDq6WrbELs3yzDvbNWicuv0DWPd0ppLi7MjfcPetH+Xx/oqo+7eE
         MooRxoHtCJSsmsJr5EBzfb/lmehuQjTOe9pjgzGp/tw9oS50oxJ7nD7mVigH8We5a1oU
         zcdzxm1J864V3A2ltTHosFPf51vgisyNWJvRDVUqINWAsHbwP5C+wlfzrc6RLeAu9JSk
         Jfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=M7Ue80YEuoCIOWAQgLo+SUfvh7l5ryKbVSWPKQvrAK8=;
        b=1ss3bYuB+6IUlnpCGHy9i2Es/09FqBN576EqCNBeJe7203w6OiD5hfHvc4IaqOov2P
         JUlnBxG2uQE/qg1CXZP2S4CYUNiXM3CK1Ex1MJAryvOFUXkcUWfLMer17oP8wynQoYGl
         Yn/uBEuy7DgFZ3J1uGFUekGS3kP7iPth65TGNU7KKxHv3ADHDEPt/9KyoSD9ncHj7nww
         wY2Xu+j9M3YdmlBhQfspOlG97DHUDt/yhDak59Omq7kqDvVMf40PHzOy8LMhqhUISid6
         tZxkWDTEq49RBiP58XPW5XGzZTVl+sg1RVF0u3uAYqg24HbXrZTBNkYnLkLGNB+qQ8p1
         o3VA==
X-Gm-Message-State: ACrzQf3tzveZiCmCi2W3HmXOn/qjIbz+ePyjxH6m4e9j7EY7gYG4NZYZ
        iK4FFQTrwbc4keasL/xh6AJFFQ==
X-Google-Smtp-Source: AMsMyM40BhxbF90DTbMrHArQq6jsjUGS9GskBzU5zFLkvrYuTSg8rAT4p0UOIgA/KNm/I1giiYdt7w==
X-Received: by 2002:ac2:4c48:0:b0:4a0:606f:3e85 with SMTP id o8-20020ac24c48000000b004a0606f3e85mr10878909lfk.675.1664385180613;
        Wed, 28 Sep 2022 10:13:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q5-20020a2eb4a5000000b0026c2d2a9b92sm476056ljm.101.2022.09.28.10.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:13:00 -0700 (PDT)
Message-ID: <06c01215-1423-9834-10fa-234394d13381@linaro.org>
Date:   Wed, 28 Sep 2022 19:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 09/11] ARM: dts: qcom: msm8974: add second DSI host and
 PHY
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-10-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145958.376288-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Add second DSI host and PHY available on the msm8974 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 78 +++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 7a9be0acf3f5..810a163ca14f 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1541,6 +1541,13 @@ mdp5_intf1_out: endpoint {
>  							remote-endpoint = <&dsi0_in>;
>  						};
>  					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdp5_intf2_out: endpoint {
> +							remote-endpoint = <&dsi1_in>;
> +						};
> +					};
>  				};
>  			};
>  
> @@ -1614,6 +1621,77 @@ dsi0_phy: dsi-phy@fd922a00 {
>  
>  				status = "disabled";
>  			};
> +
> +			dsi1: dsi@fd922e00 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0xfd922e00 0x1f8>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MDSS_BYTE1_CLK>,
> +					 <&mmcc MDSS_PCLK1_CLK>,
> +					 <&mmcc MDSS_ESC1_CLK>,
> +					 <&mmcc MMSS_MISC_AHB_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core",
> +					      "core_mmss";
> +
> +				phys = <&dsi1_phy>;
> +				phy-names = "dsi-phy";

I think this is being removed, isn't it?

> +
> +				status = "disabled";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi1_in: endpoint {
> +							remote-endpoint = <&mdp5_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi1_phy: dsi-phy@fd923000 {

And this you change into "phy"?


Best regards,
Krzysztof

