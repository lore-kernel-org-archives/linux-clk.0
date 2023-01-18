Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5593C32793
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 14:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjAROEW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 09:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbjARODo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 09:03:44 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA63D86B3
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:39:35 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id tz11so18900776ejc.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLiOrZS+WePAJkBX0TaxEKJrTVBXquxBTcodLqsMjNk=;
        b=eQtyOvP/X/xRyZAMWXl1+VsOoSBoK9UqH4812U/gp0c3KR1Ok/o0d39KuOqXx4BEvI
         TgUgq1CHKl9jhe4ltarotU2DqcAoUmPCLTjVJMsjLlyIvQvIVuXZDk0DUhq+ywbGmcq7
         hLPR8N4XsE8ly9XJ2VH84UGy2TiBnR9kpqGexZv7xhWEHA6EAs8NKDchld+dh27l/bZG
         hGA/puaB/TKzI7avyRrXcIbO4UOZCbBsHCn3NEyAAcQ+HmBkdx7E5fy78WWqASzKu+wv
         LR06IuZRLCCeqxIDxS2xPesq2lFLkn6QanU+5df2HgApLM4sGvQS9aQecF/ee0s8hDmj
         E8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLiOrZS+WePAJkBX0TaxEKJrTVBXquxBTcodLqsMjNk=;
        b=nmFP3fuRdPLQv5VvDyetBz42/SaW0qjeZNBGyCxwgauDQgx1E+z7UexqAUakBt/EiI
         P5szkRYcYCHEoLH6Ft1uZ18A9N6J2Fs8qM+ypY8vb3UzuHZhCN3LhdKPzdj6+S47rP4Q
         pLrfO9PlxOUa0mYL1Hg81vf8/sWR+qGO1bqFnzMw+SddCis0DA35NMtxRDvbDkbGBv1S
         Qi3x12f08qhqgwuxGP9MzxNdojaM5EdW8fN3BzEm9V++OkHxmpmY0ZpxNqQk/q6QZ2Wz
         6p691o/lby/Esk5dMR3wpkNHpFTt2EfSMez3OzHKHgR4/aUUuqYn1pJCR3nDgtOqsRMy
         E0ZQ==
X-Gm-Message-State: AFqh2kovjLVckcxdSSwSiEaD7aVqg89+5DMaMT1aMP6/Izbsl67w2okQ
        tq3kuSueRdc0elnRekDR0KxeQA==
X-Google-Smtp-Source: AMrXdXthsaKA+8RRlnzNfg9Kt6lw3j+0TnVTjJTV2+ax7ChEa3T445vCDL0tAo066OGm338qxTbz2Q==
X-Received: by 2002:a17:907:10d4:b0:7ec:27d7:1838 with SMTP id rv20-20020a17090710d400b007ec27d71838mr7595357ejb.22.1674049174405;
        Wed, 18 Jan 2023 05:39:34 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id gn19-20020a1709070d1300b00815835b4b5fsm14543624ejc.134.2023.01.18.05.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:39:34 -0800 (PST)
Message-ID: <e4bf03b3-2097-0f71-a40c-d2a0e0f58401@linaro.org>
Date:   Wed, 18 Jan 2023 14:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/7] arm64: qcom: dts: msm8996 switch from
 RPM_SMD_BB_CLK1 to RPM_SMD_XO_CLK_SRC
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230117225824.1552604-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.01.2023 23:58, Dmitry Baryshkov wrote:
> The vendor kernel uses RPM_SMD_XO_CLK_SRC clock as an CXO clock rather
> than using the RPM_SMD_BB_CLK1 directly. Follow this example and switch
> msm8996.dtsi to use RPM_SMD_XO_CLK_SRC clock instead of RPM_SMB_BB_CLK1.
> 
> Fixes: 2b8c9c77c268 ("arm64: dts: qcom: msm8996: convert xo_board to RPM_SMD_BB_CLK1")
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index a8544c4158ac..150d13c0f4b8 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -713,7 +713,7 @@ gcc: clock-controller@300000 {
>  			#power-domain-cells = <1>;
>  			reg = <0x00300000 0x90000>;
>  
> -			clocks = <&rpmcc RPM_SMD_BB_CLK1>,
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>  				 <&rpmcc RPM_SMD_LN_BB_CLK>,
>  				 <&sleep_clk>,
>  				 <&pciephy_0>,
> @@ -1055,7 +1055,7 @@ dsi0_phy: phy@994400 {
>  				#clock-cells = <1>;
>  				#phy-cells = <0>;
>  
> -				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
> +				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  				clock-names = "iface", "ref";
>  				status = "disabled";
>  			};
> @@ -1123,7 +1123,7 @@ dsi1_phy: phy@996400 {
>  				#clock-cells = <1>;
>  				#phy-cells = <0>;
>  
> -				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
> +				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  				clock-names = "iface", "ref";
>  				status = "disabled";
>  			};
> @@ -2952,7 +2952,7 @@ kryocc: clock-controller@6400000 {
>  			reg = <0x06400000 0x90000>;
>  
>  			clock-names = "xo", "sys_apcs_aux";
> -			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
>  
>  			#clock-cells = <1>;
>  		};
> @@ -3071,7 +3071,7 @@ sdhc1: mmc@7464900 {
>  			clock-names = "iface", "core", "xo";
>  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
>  				<&gcc GCC_SDCC1_APPS_CLK>,
> -				<&rpmcc RPM_SMD_BB_CLK1>;
> +				<&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			resets = <&gcc GCC_SDCC1_BCR>;
>  
>  			pinctrl-names = "default", "sleep";
> @@ -3095,7 +3095,7 @@ sdhc2: mmc@74a4900 {
>  			clock-names = "iface", "core", "xo";
>  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
>  				<&gcc GCC_SDCC2_APPS_CLK>,
> -				<&rpmcc RPM_SMD_BB_CLK1>;
> +				<&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			resets = <&gcc GCC_SDCC2_BCR>;
>  
>  			pinctrl-names = "default", "sleep";
> @@ -3417,7 +3417,7 @@ adsp_pil: remoteproc@9300000 {
>  			interrupt-names = "wdog", "fatal", "ready",
>  					  "handover", "stop-ack";
>  
> -			clocks = <&rpmcc RPM_SMD_BB_CLK1>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			clock-names = "xo";
>  
>  			memory-region = <&adsp_mem>;
