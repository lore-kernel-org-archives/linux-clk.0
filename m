Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D691EC001DD
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jun 2023 20:48:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjF0UsH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jun 2023 16:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjF0UsG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jun 2023 16:48:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B480E19A9
        for <linux-clk@vger.kernel.org>; Tue, 27 Jun 2023 13:48:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f954d78bf8so7243421e87.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jun 2023 13:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687898882; x=1690490882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OA45c/xaQm/8v0q3zdahN+3s7QemecX5vnNWDdTNmVE=;
        b=NrbYawTk+IbOjd0e+vE5nKImpTCP4PP0QeUjM/wDAxIZrtTMptQ38+OBbpg/ybppN2
         MOCUyAGEVFZYCWstAu7xPjpl4i3qPgOj8AdKVxRMAb8qY9M3tNRY4QPnd+9r7N5EGxrF
         ymLbqtUzDNz8K3PzP7L2pkb8/hhHtSKG/VA2N3W+g1xBuuOk1Wa1xXcKYS3M5SYr6ahm
         UBKuwoRY+9LY+AHU2ZvrNsUQ2pj4Q/eBo7e2wHi28eVg1L4FxPQG/2aoN09GkMOG28zJ
         O1rYX29H+o1vDa3zgYC/fjEv4OtW5yt+uQGzH1Gs035ZfnG/f+oeEvwBU9YdTyQC20Ys
         j1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687898882; x=1690490882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OA45c/xaQm/8v0q3zdahN+3s7QemecX5vnNWDdTNmVE=;
        b=VdFfwlzFs1zY15rad1CVMqUAEcB1vn+jJx/Mj+YCwFuouKC/Gga3INRCwC66FoSOMK
         cnO7vP6RgtyuNdrpWLbi2AkmBnnsE9rr6Hlk+m6TrH06gpObdpjbZk3pQf1LiqZbNkCK
         CjpZhPYjP0Alr+MA1sJvwexH90NIo0pfQt9H5xZgJc5asXfvjQvv9gO7vbCgXYb9WdX1
         OMYJHjHbHIkBjsRbuki7yATGGn1nZmPYXGFkzjwcx1sB6bcO4RjZTlBfus/+tbhI/Q97
         ZS9Ay/Gt3thDXvlrDw7+xheLFkUWyAjZzl9p6qmBZ6oj/uXCyiDojZhyxeEqHGfXqe7K
         RVHQ==
X-Gm-Message-State: AC+VfDyrjHuc/SoULsho1m1q5G5VF8fPeC8Fzqvd31mxV7dfEMfpB+vJ
        +YjW5gEX/GM34ogogkXyiHSZJA==
X-Google-Smtp-Source: ACHHUZ4x7OiookqL76PJ6QmT4hwDZzTCsj7kQ+WEHW63ZHmS7rrxNDUaxZu2JkPT4WtiQW7E3HQAoA==
X-Received: by 2002:a05:6512:10cf:b0:4f9:657d:e4bd with SMTP id k15-20020a05651210cf00b004f9657de4bdmr11208436lfg.24.1687898881728;
        Tue, 27 Jun 2023 13:48:01 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id q18-20020a19a412000000b004f3b319ed4bsm1647406lfc.120.2023.06.27.13.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 13:48:01 -0700 (PDT)
Message-ID: <3cc619fc-4d48-919c-7e17-4b11a4e4dcd5@linaro.org>
Date:   Tue, 27 Jun 2023 22:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: sm6125: Add display hardware
 nodes
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
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
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-14-03e430a2078c@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-14-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27.06.2023 22:14, Marijn Suijten wrote:
> Add the DT nodes that describe the MDSS hardware on SM6125, containing
> one MDP (display controller) together with a single DSI and DSI PHY.  No
> DisplayPort support is added for now.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 191 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 189 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index a5cc0d43d2d9..b21fa1256f95 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -1204,12 +1204,199 @@ sram@4690000 {
>  			reg = <0x04690000 0x10000>;
>  		};
>  
> +		mdss: display-subsystem@5e00000 {
> +			compatible = "qcom,sm6125-mdss";
> +			reg = <0x05e00000 0x1000>;
> +			reg-names = "mdss";
> +
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface",
> +				      "ahb",
> +				      "core";
> +
> +			power-domains = <&dispcc MDSS_GDSC>;
> +
> +			iommus = <&apps_smmu 0x400 0x0>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdss_mdp: display-controller@5e01000 {
> +				compatible = "qcom,sm6125-dpu";
> +				reg = <0x05e01000 0x83208>,
> +				      <0x05eb0000 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "iface",
> +					      "rot",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;
> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmpd SM6125_VDDCX>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
> +				};
> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-192000000 {
> +						opp-hz = /bits/ 64 <192000000>;
> +						required-opps = <&rpmpd_opp_low_svs>;
> +					};
> +
> +					opp-256000000 {
> +						opp-hz = /bits/ 64 <256000000>;
> +						required-opps = <&rpmpd_opp_svs>;
> +					};
> +
> +					opp-307200000 {
> +						opp-hz = /bits/ 64 <307200000>;
> +						required-opps = <&rpmpd_opp_svs_plus>;
> +					};
> +
> +					opp-384000000 {
> +						opp-hz = /bits/ 64 <384000000>;
> +						required-opps = <&rpmpd_opp_nom>;
> +					};
> +
> +					opp-400000000 {
> +						opp-hz = /bits/ 64 <400000000>;
> +						required-opps = <&rpmpd_opp_turbo>;
> +					};
> +				};
> +			};
> +
> +			mdss_dsi0: dsi@5e94000 {
> +				compatible = "qcom,sm6125-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x05e94000 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmpd SM6125_VDDCX>;
> +
> +				phys = <&mdss_dsi0_phy>;
> +				phy-names = "dsi";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +
> +				dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-164000000 {
> +						opp-hz = /bits/ 64 <164000000>;
> +						required-opps = <&rpmpd_opp_low_svs>;
> +					};
> +
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmpd_opp_svs>;
> +					};
> +				};
> +			};
> +
> +			mdss_dsi0_phy: phy@5e94400 {
> +				compatible = "qcom,sm6125-dsi-phy-14nm";
> +				reg = <0x05e94400 0x100>,
> +				      <0x05e94500 0x300>,
> +				      <0x05e94800 0x188>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +				clock-names = "iface",
> +					      "ref";
> +
> +				required-opps = <&rpmpd_opp_svs>;
> +				power-domains = <&rpmpd SM6125_VDDMX>;
> +
> +				status = "disabled";
> +			};
> +		};
> +
>  		dispcc: clock-controller@5f00000 {
>  			compatible = "qcom,sm6125-dispcc";
>  			reg = <0x05f00000 0x20000>;
>  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> -				 <0>,
> -				 <0>,
> +				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi0_phy 1>,
>  				 <0>,
>  				 <0>,
>  				 <0>,
> 
