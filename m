Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFCDC001B3
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jun 2023 20:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjF0Usn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jun 2023 16:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjF0Usf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jun 2023 16:48:35 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F831BEF
        for <linux-clk@vger.kernel.org>; Tue, 27 Jun 2023 13:48:33 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso58069481fa.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jun 2023 13:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687898911; x=1690490911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5cuxxD3O/wTB2BSSAaaa+aPcVHglRupuBRpkNvhp/4=;
        b=noeEPvhzwSHk1yr+PYO+SJGFRehpAwvLYYcJ2os8G6QThZlWNjba1cjaV/ACdEtn6y
         UkgnNucmSeKLRThSp14WbUOgibmopor+LCDEUGfG9b44wFXNCPblqIUQPa+67y5j8V22
         GuPubh8ldtsanayR27EljTM3iNBQY3JE+ylibTqf/PYwI8axRmq4n3jvsUKEN29XS9ej
         0R9XoDHjXrbH3h6IgyPV/NB1ObmjRHvPpFY0YxyKhrPLRO5ERD+mPjfayhPgfv0NLHjs
         Ui+UbzwHVTesR9K7j8C1qhVuSTtEW0VXMXQ9vfxGnadvqvxjsnqngQc7pkbbzirwXoHW
         ddoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687898911; x=1690490911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5cuxxD3O/wTB2BSSAaaa+aPcVHglRupuBRpkNvhp/4=;
        b=GBx/hwji98FdKavDUmhIiLpRQiIi6oQs4a+HM+XQW9j6XeT3afCMZxs8mDM2oWpaWp
         Ep5tWG6wR8fqJI+GFVh8rnJ80mG54WaTqwmUdMi1m1s2YO54F1RJYUKOdkTMo1etDlVp
         pgVoMnXcQmi0ngu5f5bcgiA7TwMPKn4huEUug8BiQBNXLo2C7+bjBO0iiFa4s+bW2ViB
         Aql2PYXR8Qqr34gxndA6DKqtUbq6h7f8tdmQB0dBIeKWNtIcb+EdfqvU4wPVGdC5irDK
         wmoyZY+R5eqqeWysDvSBBI3t9FkW7BOIcLPXHwluHSwDr5JdcrTdNlnzDCg0cdXcS/N5
         RzAQ==
X-Gm-Message-State: AC+VfDxFzHM115DIXMJ/G9j0gaThEJMm9/bU04lJGbbOS0GqaYcOiVBo
        ijqaE+vHlRr4U6Mi15kBLjoefA==
X-Google-Smtp-Source: ACHHUZ4b2TcqgSOIUXbuevAdQp4iFlsG08HkdF6Rm3hdzogpclAKk2cDmnKVJ3bFLNwK1Ffq8nl9oQ==
X-Received: by 2002:a05:6512:281f:b0:4fb:7665:9b0d with SMTP id cf31-20020a056512281f00b004fb76659b0dmr5269960lfb.12.1687898911109;
        Tue, 27 Jun 2023 13:48:31 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id n25-20020a195519000000b004fb6c61e79bsm1206591lfe.117.2023.06.27.13.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 13:48:30 -0700 (PDT)
Message-ID: <234628ff-359d-7058-a5ca-17b67be08ba5@linaro.org>
Date:   Tue, 27 Jun 2023 22:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: sm6125-seine: Configure MDSS,
 DSI and panel
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
 <20230627-sm6125-dpu-v2-15-03e430a2078c@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-15-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27.06.2023 22:14, Marijn Suijten wrote:
> Enable MDSS and DSI, and configure the Samsung SOFEF01-M ams597ut01
> 6.0" 1080x2520 panel.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> index 9f8a9ef398a2..08d96d05da2e 100644
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
> +		pinctrl-0 = <&mdss_dsi_active &mdss_te_active_sleep>;
> +		pinctrl-1 = <&mdss_dsi_sleep &mdss_te_active_sleep>;
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
> +	mdss_te_active_sleep: mdss-te-active-sleep-state {
> +		pins = "gpio89";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdss_dsi_active: mdss-dsi-active-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	mdss_dsi_sleep: mdss-dsi-sleep-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  };
>  
>  &usb3 {
> 
