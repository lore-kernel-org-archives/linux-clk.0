Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BAAC38147
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 14:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjAROIf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 09:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjAROIQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 09:08:16 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98FF366BD
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:46:25 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id vm8so83312644ejc.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rtyOgSPdrngk0eJl8TvgbJaq9dw9SfAI0KMAgd3Q9JE=;
        b=iHnMcbD4glQ8DROmoGf7o8tkNb2iQ+rT3r8Ho5dqNbx4FxGBfiD1/JDqETAyhqaW+Q
         P3J8UEebvrmkqxgEvvc8RCEzPat2wZStO9JrGu5e3P3Tsnb2m1PwrnCEq/R4Bvco/8g/
         pAnCfvXjKRfCOTQawsdLJtvtYR2YLqAXzjgVYxYZRvGWwtMkI00O1ySmZdjQZYy6aPnK
         xxhZik/pPgcHVc57+Buh5NzcnLLKJyVLR6Qly8d5kU/10lZsJ6kPC+SrSq7lILXIPJS7
         Kp8MBlU5/xGbu6t2EskrBAi/LCJQf++oTdEMnLrWHRIdRoDTxZdAMfCSpVMyXRmHgPfJ
         908A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtyOgSPdrngk0eJl8TvgbJaq9dw9SfAI0KMAgd3Q9JE=;
        b=6gE8WVnsprBR0ULgTpy+6s1/oNqfoVVFzE2I10MioUXsNZnVIJhQj3CjgFmnQowodx
         QdgkctYRdsFqD4Q/tIamlU/cQy7ud9M6jSYDHFsNS71WSeqRaVOexVystZCSPNoILiwO
         M1jZyu3V7FtFmvAt56yroNQMn43nOg98LEEtMio2sGMPlFXqYQqUVBB28iXgptsLBf3+
         UGcPUrawTRr03NShvAQk1Akfi26r3VhUFQeMJ8LLYe3APCpGdei5mW+e4ZESe+wrEFbf
         2hhYL5qtASLdHD4ighsv0gNUVL5oH8tmGw0PWcD7xjEfMZeSWQT2vM17FwRM9pg3INpm
         bCuw==
X-Gm-Message-State: AFqh2kpbBUCcRysqDf9irXL4iOR8/sdu42Wjcenmn2SVupUq/1qvFy5N
        mAaExNoC/3fLVbfp1A2PIC/K+g==
X-Google-Smtp-Source: AMrXdXtzHm2ChmzPYuLKRBn9Jz+e4Xys+P6Q3Qu7ercQ5am1d/eEEp8PKn6xm/ok+bzeA4f2+fo6SQ==
X-Received: by 2002:a17:907:2c66:b0:7c4:f752:e959 with SMTP id ib6-20020a1709072c6600b007c4f752e959mr8103888ejc.33.1674049584235;
        Wed, 18 Jan 2023 05:46:24 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id y19-20020a1709060a9300b0084debc351b3sm11409979ejf.20.2023.01.18.05.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:46:23 -0800 (PST)
Message-ID: <4af2446e-bb8b-996f-17c4-71f28f1d9eb1@linaro.org>
Date:   Wed, 18 Jan 2023 14:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: msm8996: scale CBF clock
 according to the CPUfreq
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
 <20230117225824.1552604-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230117225824.1552604-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.01.2023 23:58, Dmitry Baryshkov wrote:
> Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
> according to CPU frequencies.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 50 +++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 7d8e31b84959..fc932a059d9f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -49,6 +49,7 @@ CPU0: cpu@0 {
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			capacity-dmips-mhz = <1024>;
>  			clocks = <&kryocc 0>;
> +			interconnects = <&cbf 0 &cbf 1>;
dt-bindings entries instead of magic numbers, pretty please?

The rest lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  			operating-points-v2 = <&cluster0_opp>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
> @@ -66,6 +67,7 @@ CPU1: cpu@1 {
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			capacity-dmips-mhz = <1024>;
>  			clocks = <&kryocc 0>;
> +			interconnects = <&cbf 0 &cbf 1>;
>  			operating-points-v2 = <&cluster0_opp>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
> @@ -79,6 +81,7 @@ CPU2: cpu@100 {
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			capacity-dmips-mhz = <1024>;
>  			clocks = <&kryocc 1>;
> +			interconnects = <&cbf 0 &cbf 1>;
>  			operating-points-v2 = <&cluster1_opp>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_1>;
> @@ -96,6 +99,7 @@ CPU3: cpu@101 {
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			capacity-dmips-mhz = <1024>;
>  			clocks = <&kryocc 1>;
> +			interconnects = <&cbf 0 &cbf 1>;
>  			operating-points-v2 = <&cluster1_opp>;
>  			#cooling-cells = <2>;
>  			next-level-cache = <&L2_1>;
> @@ -147,91 +151,109 @@ opp-307200000 {
>  			opp-hz = /bits/ 64 <307200000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-422400000 {
>  			opp-hz = /bits/ 64 <422400000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-480000000 {
>  			opp-hz = /bits/ 64 <480000000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-556800000 {
>  			opp-hz = /bits/ 64 <556800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-652800000 {
>  			opp-hz = /bits/ 64 <652800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <384000>;
>  		};
>  		opp-729600000 {
>  			opp-hz = /bits/ 64 <729600000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <460800>;
>  		};
>  		opp-844800000 {
>  			opp-hz = /bits/ 64 <844800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <537600>;
>  		};
>  		opp-960000000 {
>  			opp-hz = /bits/ 64 <960000000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <672000>;
>  		};
>  		opp-1036800000 {
>  			opp-hz = /bits/ 64 <1036800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <672000>;
>  		};
>  		opp-1113600000 {
>  			opp-hz = /bits/ 64 <1113600000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <825600>;
>  		};
>  		opp-1190400000 {
>  			opp-hz = /bits/ 64 <1190400000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <825600>;
>  		};
>  		opp-1228800000 {
>  			opp-hz = /bits/ 64 <1228800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <902400>;
>  		};
>  		opp-1324800000 {
>  			opp-hz = /bits/ 64 <1324800000>;
>  			opp-supported-hw = <0xd>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1056000>;
>  		};
>  		opp-1363200000 {
>  			opp-hz = /bits/ 64 <1363200000>;
>  			opp-supported-hw = <0x2>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1132800>;
>  		};
>  		opp-1401600000 {
>  			opp-hz = /bits/ 64 <1401600000>;
>  			opp-supported-hw = <0xd>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1132800>;
>  		};
>  		opp-1478400000 {
>  			opp-hz = /bits/ 64 <1478400000>;
>  			opp-supported-hw = <0x9>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1190400>;
>  		};
>  		opp-1497600000 {
>  			opp-hz = /bits/ 64 <1497600000>;
>  			opp-supported-hw = <0x04>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1305600>;
>  		};
>  		opp-1593600000 {
>  			opp-hz = /bits/ 64 <1593600000>;
>  			opp-supported-hw = <0x9>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1382400>;
>  		};
>  	};
>  
> @@ -245,136 +267,163 @@ opp-307200000 {
>  			opp-hz = /bits/ 64 <307200000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-403200000 {
>  			opp-hz = /bits/ 64 <403200000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-480000000 {
>  			opp-hz = /bits/ 64 <480000000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-556800000 {
>  			opp-hz = /bits/ 64 <556800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-652800000 {
>  			opp-hz = /bits/ 64 <652800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-729600000 {
>  			opp-hz = /bits/ 64 <729600000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <307200>;
>  		};
>  		opp-806400000 {
>  			opp-hz = /bits/ 64 <806400000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <384000>;
>  		};
>  		opp-883200000 {
>  			opp-hz = /bits/ 64 <883200000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <460800>;
>  		};
>  		opp-940800000 {
>  			opp-hz = /bits/ 64 <940800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <537600>;
>  		};
>  		opp-1036800000 {
>  			opp-hz = /bits/ 64 <1036800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <595200>;
>  		};
>  		opp-1113600000 {
>  			opp-hz = /bits/ 64 <1113600000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <672000>;
>  		};
>  		opp-1190400000 {
>  			opp-hz = /bits/ 64 <1190400000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <672000>;
>  		};
>  		opp-1248000000 {
>  			opp-hz = /bits/ 64 <1248000000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <748800>;
>  		};
>  		opp-1324800000 {
>  			opp-hz = /bits/ 64 <1324800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <825600>;
>  		};
>  		opp-1401600000 {
>  			opp-hz = /bits/ 64 <1401600000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <902400>;
>  		};
>  		opp-1478400000 {
>  			opp-hz = /bits/ 64 <1478400000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <979200>;
>  		};
>  		opp-1555200000 {
>  			opp-hz = /bits/ 64 <1555200000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1056000>;
>  		};
>  		opp-1632000000 {
>  			opp-hz = /bits/ 64 <1632000000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1190400>;
>  		};
>  		opp-1708800000 {
>  			opp-hz = /bits/ 64 <1708800000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1228800>;
>  		};
>  		opp-1785600000 {
>  			opp-hz = /bits/ 64 <1785600000>;
>  			opp-supported-hw = <0xf>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1305600>;
>  		};
>  		opp-1804800000 {
>  			opp-hz = /bits/ 64 <1804800000>;
>  			opp-supported-hw = <0xe>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1305600>;
>  		};
>  		opp-1824000000 {
>  			opp-hz = /bits/ 64 <1824000000>;
>  			opp-supported-hw = <0x1>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1382400>;
>  		};
>  		opp-1900800000 {
>  			opp-hz = /bits/ 64 <1900800000>;
>  			opp-supported-hw = <0x4>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1305600>;
>  		};
>  		opp-1920000000 {
>  			opp-hz = /bits/ 64 <1920000000>;
>  			opp-supported-hw = <0x1>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1459200>;
>  		};
>  		opp-1996800000 {
>  			opp-hz = /bits/ 64 <1996800000>;
>  			opp-supported-hw = <0x1>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1593600>;
>  		};
>  		opp-2073600000 {
>  			opp-hz = /bits/ 64 <2073600000>;
>  			opp-supported-hw = <0x1>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1593600>;
>  		};
>  		opp-2150400000 {
>  			opp-hz = /bits/ 64 <2150400000>;
>  			opp-supported-hw = <0x1>;
>  			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1593600>;
>  		};
>  	};
>  
> @@ -3567,6 +3616,7 @@ cbf: clock-controller@9a11000 {
>  			reg = <0x09a11000 0x10000>;
>  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
>  			#clock-cells = <0>;
> +			#interconnect-cells = <1>;
>  		};
>  
>  		intc: interrupt-controller@9bc0000 {
