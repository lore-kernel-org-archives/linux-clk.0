Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D05EB64DD
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jul 2023 18:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjGDSKV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jul 2023 14:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjGDSKS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 14:10:18 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96CF10D9
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 11:10:15 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso96457881fa.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 11:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688494214; x=1691086214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZVADByWajD+t+CUY4Se4uIQW6pfNssor2L/f13xpRE=;
        b=dcQRRcprAu3XN0C7BImZpG+nU0EeXSlVAvSXS/gC+47zSZaz01TLKMP9KySl7aUTwp
         cQXhYTUQ8eDK1SKWrXAFxccNlqtBGPB9y0+InNq9x14hKnx+nL/04R9eEmB6ROG37vwc
         nFYgWIVQTK6ehHTW8SQqgArQ2VcJDvnKCC605Qv0Gf9/deCOXsFFoAWKvgShznc6XtjW
         EI3uWxr0XE+oYPtuoXDJDLhBFIvK4J+raWc16Q6IxeYKaPrWy/nNou6oLmS1v+V9z/sb
         23DRaO3cMWXV2PKVq63FXemvDMbkcGzaqd1b/vWWgDmmtLZlHU74HQCd9xCD5gChXgTA
         DSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688494214; x=1691086214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZVADByWajD+t+CUY4Se4uIQW6pfNssor2L/f13xpRE=;
        b=IcuPNNsIXentchi9lpQ73eVOgQifRf7kPLpL467c2LdIqAB/N6S/Lgi+rvYKsb6e7Y
         VIGBoug08u7jxJHs4+EB0rzlNMIcLGCHCKY/tstQM1K/4iAQGzZZFcCv/R+DbSo2wLq0
         Pw27E689eJ1BIH5JBt21xAgpv6S80TDDSrBLUX8EBH5QSjTSod7UExAKMiq0vMOwAfEI
         OjRde+oqQJw404duC0JkpXuTmrKvGr8HL65E3ayRgRcN+vND3m/8c/mdrfylMs6fLeT6
         bdqlKwIXrzAGcBl47E9IQ663HyEKouswpeFCSHOInluRPHieLW+em5lmL8szBn1xB49n
         AynA==
X-Gm-Message-State: ABy/qLYhmrdRA4xwM1DskxTJ4dgZF6jDv951wPNQTi0q7hGD1gikWDX1
        PPMrYpXYDptFWSQSfp1V5Zyyyg==
X-Google-Smtp-Source: APBJJlHrnNrnwlPD56QQejDLxMHR4kGkWkgUG38Egxu3JAebh4cEXsTZQro1inS42seg91dtBKUAxg==
X-Received: by 2002:a2e:8215:0:b0:2b6:cf64:7a8e with SMTP id w21-20020a2e8215000000b002b6cf647a8emr9049787ljg.19.1688494213946;
        Tue, 04 Jul 2023 11:10:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm1152448ljj.54.2023.07.04.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 11:10:13 -0700 (PDT)
Message-ID: <10660989-4f1d-0107-f595-bcfd1ca5ea95@linaro.org>
Date:   Tue, 4 Jul 2023 20:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add support for the Xiaomi SM7125
 platform
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-9-davidwronek@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230704163848.169853-9-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4.07.2023 18:32, David Wronek wrote:
> There are 6 Xiaomi smartphones with the SM7125 SoC:
> 
> - POCO M2 Pro (gram)
> - Redmi Note 9S (curtana)
> - Redmi Note 9 Pro (Global, joyeuse)
> - Redmi Note 9 Pro (India, curtana)
> - Redmi Note 9 Pro Max (excalibur)
> - Redmi Note 10 Lite (curtana)
> 
> These devices share a common board design (a.k.a miatoll) with only a
> few differences. Add support for the common board, as well as support
> for the global Redmi Note 9 Pro.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7125-xiaomi-joyeuse.dts   |  16 +
>  .../boot/dts/qcom/sm7125-xiaomi-miatoll.dtsi  | 420 ++++++++++++++++++
>  3 files changed, 437 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7125-xiaomi-miatoll.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 337abc4ceb17..7ef9e7d43904 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -192,6 +192,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-laurel-sprout.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts
> new file mode 100644
> index 000000000000..670fd63f3416
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023, David Wronek <davidwronek@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm7125-xiaomi-miatoll.dtsi"
> +
> +/ {
> +	model = "Xiaomi Redmi Note 9 Pro (Global)";
> +	compatible = "xiaomi,joyeuse", "qcom,sm7125";
> +
> +	/* required for bootloader to select correct board */
> +	qcom,board-id = <0x50022 1>;
I think you need to amend some list in bindings to allow qcom,abcd-id properties

[...]

> +		rmtfs_mem: memory@fa601000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0x0 0xfa601000 0x0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
QCOM_SCM_VMID_MSS_MSA

from

include/dt-bindings/firmware/qcom,scm.h

> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm6150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_s1a_1p1: smps1 {
> +			regulator-min-microvolt = <1128000>;
> +			regulator-max-microvolt = <1128000>;
> +		};
> +
> +		vreg_s4a_1p0: smps4 {
> +			regulator-min-microvolt = <824000>;
> +			regulator-max-microvolt = <1120000>;
> +		};
> +
> +		vreg_s5a_2p0: smps5 {
> +			regulator-min-microvolt = <1744000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +
> +		vreg_l1a_1p2: ldo1 {
> +			regulator-min-microvolt = <1178000>;
> +			regulator-max-microvolt = <1256000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
You want HPM, LPM is not guaranteed to give you the desired voltages.

[...]

> +&sdhc_2 {
> +	status = "okay";
Status last, everywhere

Konrad
> +
> +	pinctrl-names = "default","sleep";
> +	pinctrl-0 = <&sdc2_on>;
> +	pinctrl-1 = <&sdc2_off>;
> +	vmmc-supply = <&vreg_l9c_2p9>;
> +	vqmmc-supply = <&vreg_l6c_3p0>;
> +
> +	cd-gpios = <&tlmm 69 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <34 4>, <59 4>;
> +
> +	sdc2_on: sdc2-on-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <16>;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <10>;
> +		};
> +
> +		data-pins {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <10>;
> +		};
> +
> +		sd-cd-pins {
> +			pins = "gpio69";
> +			function = "gpio";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +	};
> +
> +	sdc2_off: sdc2-off-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <2>;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +
> +		data-pins {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +
> +		sd-cd-pins {
> +			pins = "gpio69";
> +			function = "gpio";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +	};
> +};
> +
> +&usb_1 {
> +	qcom,select-utmi-as-pipe-clk;
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	maximum-speed = "high-speed";
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l4a_0p88>;
> +	vdda-pll-supply = <&vreg_l11a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l17a_3p1>;
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	status = "okay";
> +	vdda-phy-supply = <&vreg_l4a_0p88>;
> +	vdda-pll-supply = <&vreg_l3c_1p23>;
> +};
