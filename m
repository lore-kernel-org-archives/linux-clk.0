Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66596C77B7E
	for <linux-clk@archiver.kernel.org>; Fri, 21 Apr 2023 21:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbjDUVHH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Apr 2023 17:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjDUVHH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 17:07:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC421FE4
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 14:07:04 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ec8399e963so2207405e87.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682111222; x=1684703222;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82dMk4mt/EjUUXDK3gwazIb7If9XP1IvoU6IArIL6n8=;
        b=dPdnLjphGPi5Yca8Po1OlnshGQ8H0HTl0QRcZVZ2+e0BY/y4/MsiOczEkloFJ9wUbo
         tbNCvXliE+TRW5odTMh0hV3if8bE4XAhUiF7AaVQsktkO9llNzf8BvORpSGk0D8w2ccg
         5Lik5Bvz4m/TNcrhkGi2kkpn3S6OXGX35uebgnWyxb+sqM841fkLkVDG4u9EGKtK/E7p
         d/Wwx6hzO4E62WdK9ctkbeOl0rOb9NyTXGIfpXp4gGWaivRs2w7YyNlf/YthwcFxvaj/
         FBVZf7R2S6JcWtJZ6qv1KrAoDL50YYSk8Jc4HzAv8F3JaTg15c46MFpRmg6I+4tz0blo
         hodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682111222; x=1684703222;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82dMk4mt/EjUUXDK3gwazIb7If9XP1IvoU6IArIL6n8=;
        b=GXtI2YIx2Oj9z+n03PbIThCQ7QW0+NpTTXJ0Lk0Wg0d6hBUsFZNLKl6n+aZU8T0lGE
         tUmACg9EB2E03KithJ9TrqrpxtHVeJRh7PxcJTBQ6nEEnYAKOEk91yQtCkrYzUvIcCWo
         r/PcWgVqnMwiTjA8dNmMnfw9xjusX1XgLnIv4pULve8M40JnXauRoaLdYskKoLEbEA1L
         ev2Ml6EvkrKksTJkUNbWwq3k8A/tLbJKEKNVvlQO4vLdeCBEcTkcnVGMQRBR5vEah1gI
         ULxACdgF187WvfTjZ+O0dU8vkoKdB8QFPkEpBQMmpAalLHoopmkSyNytIqdOmtoaUyu1
         ysUw==
X-Gm-Message-State: AAQBX9eTrDv55Ym0kyGTj3RaO4xKe5v81T4aC2TxrxAdAcVdfVA5CDLk
        56TmZn/NEuAXEqkDdH7stcMJKw==
X-Google-Smtp-Source: AKy350bqoCFN01OEXtQlGn2CeqSMEabbxAwFrZ72ZtfGWyK5b3OyapH7u9ISCIcCajwZC32ofWYANg==
X-Received: by 2002:ac2:5098:0:b0:4ed:c3c9:cb06 with SMTP id f24-20020ac25098000000b004edc3c9cb06mr1517113lfm.27.1682111222182;
        Fri, 21 Apr 2023 14:07:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d9-20020a05651221c900b004edca9174bbsm673949lft.148.2023.04.21.14.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 14:07:01 -0700 (PDT)
Message-ID: <e142ff5d-543f-80bb-94f9-3f1fb90f1b83@linaro.org>
Date:   Sat, 22 Apr 2023 00:07:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: ipq9574: Add USB related nodes
Content-Language: en-GB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1680693149.git.quic_varada@quicinc.com>
 <55db8487a7cbf3354749dd2d3a35c05bfd9fa4fc.1680693149.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <55db8487a7cbf3354749dd2d3a35c05bfd9fa4fc.1680693149.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/04/2023 14:41, Varadarajan Narayanan wrote:
> Add USB phy and controller related nodes
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>   Changes in v8:
> 	- Change clocks order to match the bindings
>   Changes in v7:
> 	- Change com_aux -> cfg_ahb
>   Changes in v6:
> 	- Introduce fixed regulators for the phy
> 	- Resolved all 'make dtbs_check' messages
> 
>   Changes in v5:
> 	- Fix additional comments
> 	- Edit nodes to match with qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> 	- 'make dtbs_check' giving the following messages since
> 	  ipq9574 doesn't have power domains. Hope this is ok
> 
> 		/local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: phy@7d000: 'power-domains' is a required property
>          	From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> 		/local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: usb@8a00000: 'power-domains' is a required property
>          	From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> 
>   Changes in v4:
> 	- Use newer bindings without subnodes
> 	- Fix coding style issues
> 
>   Changes in v3:
> 	- Insert the nodes at proper location
> 
>   Changes in v2:
> 	- Fixed issues flagged by Krzysztof
> 	- Fix issues reported by make dtbs_check
> 	- Remove NOC related clocks (to be added with proper
> 	  interconnect support)
> ---
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 120 ++++++++++++++++++++++++++++++++++
>   1 file changed, 120 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 43a3dbe..1242382 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -150,6 +150,33 @@
>   		method = "smc";
>   	};
>   
> +	reg_usb_3p3: s3300 {

The node names do not look generic enough. Please take a look at other 
platforms.

> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-name = "usb-phy-vdd-dummy";

This also doesn't look correct. This regulator should not just fill the 
gap. Does it represent a generic voltage network on the board?

Please do not add 'dummy' voltage regulators if there is no real voltage 
wire.

> +	};
> +
> +	reg_usb_1p8: s1800 {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-name = "usb-phy-pll-dummy";
> +	};
> +
> +	reg_usb_0p925: s0925 {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <925000>;
> +		regulator-max-microvolt = <925000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-name = "usb-phy-dummy";
> +	};
> +
>   	reserved-memory {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> @@ -179,6 +206,52 @@
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0xffffffff>;
>   
> +		usb_0_qusbphy: phy@7b000 {
> +			compatible = "qcom,ipq9574-qusb2-phy";
> +			reg = <0x0007b000 0x180>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +				 <&xo_board_clk>;
> +			clock-names = "cfg_ahb",
> +				      "ref";
> +
> +			vdd-supply = <&reg_usb_0p925>;
> +			vdda-pll-supply = <&reg_usb_1p8>;
> +			vdda-phy-dpdm-supply = <&reg_usb_3p3>;
> +
> +			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +			status = "disabled";
> +		};
> +
> +		usb_0_qmpphy: phy@7d000 {
> +			compatible = "qcom,ipq9574-qmp-usb3-phy";
> +			reg = <0x0007d000 0xa00>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&gcc GCC_USB0_AUX_CLK>,
> +				 <&xo_board_clk>,
> +				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +				 <&gcc GCC_USB0_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			resets = <&gcc GCC_USB0_PHY_BCR>,
> +				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
> +			reset-names = "phy",
> +				      "phy_phy";
> +
> +			vdda-pll-supply = <&reg_usb_1p8>;
> +			vdda-phy-supply = <&reg_usb_0p925>;
> +
> +			status = "disabled";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "usb0_pipe_clk";
> +		};
> +
>   		pcie0_phy: phy@84000 {
>   			compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy";
>   			reg = <0x00084000 0x1000>;
> @@ -548,6 +621,53 @@
>   			status = "disabled";
>   		};
>   
> +		usb3: usb@8a00000 {
> +			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
> +			reg = <0x08af8800 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_SNOC_USB_CLK>,
> +				 <&gcc GCC_USB0_MASTER_CLK>,
> +				 <&gcc GCC_ANOC_USB_AXI_CLK>,
> +				 <&gcc GCC_USB0_SLEEP_CLK>,
> +				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi";
> +
> +			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +			assigned-clock-rates = <200000000>,
> +					       <24000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event";
> +
> +			resets = <&gcc GCC_USB_BCR>;
> +			status = "disabled";
> +
> +			dwc_0: usb@8a00000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x8a00000 0xcd00>;
> +				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +				clock-names = "ref";
> +				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb_0_qusbphy>, <&usb_0_qmpphy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				tx-fifo-resize;
> +				snps,is-utmi-l1-suspend;
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_u3_susphy_quirk;
> +				dr_mode = "host";
> +			};
> +		};
> +
>   		intc: interrupt-controller@b000000 {
>   			compatible = "qcom,msm-qgic2";
>   			reg = <0x0b000000 0x1000>,  /* GICD */

-- 
With best wishes
Dmitry

