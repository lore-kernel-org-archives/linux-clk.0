Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C07EB64DD
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 02:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjFXCGM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 22:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbjFXCGL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 22:06:11 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCD42947
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 19:06:09 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b45a71c9caso21527841fa.3
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 19:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687572367; x=1690164367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MOwxqMlgkTFrWJc8xA5MXozWw0nmlbcyc7nF9imMwjs=;
        b=LmI/TqWqL8JE93EDyN0jv4MZehgjF0j017lDfAxYTDzUHoHT+51Hj6GLAWbyzAa6WK
         vkLXUiMDV5y9bZ4du2Ii5dKRC5P5W2mq+/+vMK8Du/Cs1nwDIk7s3bUVWobl+JhjZ143
         xrvNypKeKaLwimIlC3wfrj3a3XpTSmyrlRTaCzyVVmOgYLjarD3vVcU9vdpZTfCsyH1n
         jkWxZdwaBGtVAJbPyF/hIIFlH1yOIkVAGLt9oARXDQT8dfKQk4pY4U8g+ZW7ZRa7oH2t
         OLrYxF9EsrcM7/r8eMBXzzcg69brgs36ZWAeHOw8gmXNZ9bmWjyWZ8xoWCMoiBsDy7Tx
         6IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687572367; x=1690164367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOwxqMlgkTFrWJc8xA5MXozWw0nmlbcyc7nF9imMwjs=;
        b=I/LKIxkjgOvqip/bLCH53gmVQPwAo4sJ87U8CO1ZJMPX4W+X322QJsfOAf+NUPRqzJ
         oRK9OB2Gg8DeIJY9SqO1/lhNYdSMF1BpgByU7nAdIeo4tVXrspL7jm7EU/JnjIty6qPU
         R5OpYF63ifk1DbYzSt35mfNX3j8/GY9Pc0efE/oLnxot7bU8fCLHkEaJbft5fOt2l3yR
         bverT7GIRGrnfn3NT1gfhgBtPU9Xa19LHuMP35l8IyzIPIuGw/9eR2qwca3R63bp2ru/
         I2K4WYoogN49b2fZKNY0a7P/yi1M3GoBK3LsFQwGNbU2ab71QI7dKYH1q+BKY8CQVLQ7
         dObw==
X-Gm-Message-State: AC+VfDzP3vJCu16HeN+c2WAG05wWTamN4uFml4BSWixHce3dd6jc3s1x
        zDCH/cfLrRCDijQzolDItOphbg==
X-Google-Smtp-Source: ACHHUZ5Uyb9e3UGC2DMWmWQNTma/OZe4osi82kXN3QhHkzSBwWLzAJWxu7afEjLAdtcbj+f8GaA2hw==
X-Received: by 2002:a2e:a0d5:0:b0:2b4:5cad:f246 with SMTP id f21-20020a2ea0d5000000b002b45cadf246mr14478160ljm.7.1687572367335;
        Fri, 23 Jun 2023 19:06:07 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id x8-20020a2e7c08000000b002b330580377sm58705ljc.66.2023.06.23.19.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 19:06:07 -0700 (PDT)
Message-ID: <c10b9ffe-bfb5-d6ba-f682-8b7d2f5f1461@linaro.org>
Date:   Sat, 24 Jun 2023 04:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 15/15] arm64: dts: qcom: sm6125-seine: Configure MDSS, DSI
 and panel
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
 <20230624-sm6125-dpu-v1-15-1d5a638cebf2@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-15-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24.06.2023 02:41, Marijn Suijten wrote:
> Enable MDSS and DSI, and configure the Samsung SOFEF01-M ams597ut01
> 6.0" 1080x2520 panel.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> index 9f8a9ef398a2..bdf7c15f9b83 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> @@ -179,6 +179,43 @@ &i2c3 {
>  	/* Cirrus Logic CS35L41 boosted audio amplifier @ 40 */
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm6125_l18>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "samsung,sofef01-m-ams597ut01";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
> +
> +		vddio-supply = <&pm6125_l12>;
> +
> +		pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
> +		pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +};
> +
>  &pm6125_adc {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm &rf_pa1_therm>;
> @@ -469,6 +506,28 @@ vol_down_n: vol-down-n-state {
>  		drive-strength = <2>;
>  		bias-disable;
>  	};
> +
> +	sde_te_active_sleep: sde-te-active-sleep-state {
> +		pins = "gpio89";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_dsi_active: sde-dsi-active-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_sleep: sde-dsi-sleep-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
s/sde/mdss as per Dmitry's recent request

Konrad
> +
>  };
>  
>  &usb3 {
> 
