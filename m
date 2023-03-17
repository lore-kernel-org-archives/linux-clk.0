Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6026C7618A
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 08:57:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbjCQI5H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 04:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjCQI4v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 04:56:51 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F1F6701A
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 01:56:19 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id er8so5837914edb.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 01:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1679043376;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXPml0L2FvWT/P6LsYduii0VEz4PvjP2XGtEFW2HUq4=;
        b=4ehrPnQOB0XrxGXZW32Fzhnptnmb+Hw335tL+IIYTZNVisk43LRgtfmm31kJO8BG2h
         1z4Yo4xZLnLPDFZIdtTCkNoGRnJ+RYMoSXmUKwO7tNfWhRttVOizMWl0Vlsbj5NL9OCu
         uBVhU5J76g+VchukPCgKHC8zeZeFbfZ+Y6RNCN0LCEyh6VlFTb9Y5H6yTtnXCompaZrx
         ANVel6uPYlJKgtDkeCFiyhJ9zQtvOY5GjlHvS4vMYuiWCIY81FtTkiDUFYXSrCsLCXty
         SIF84nfJV4GygkeUWye74JovGwtoSqBzwSlCUD1OIaRLsCh15fHjWPSk3roTgxZyFnW6
         iiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043376;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oXPml0L2FvWT/P6LsYduii0VEz4PvjP2XGtEFW2HUq4=;
        b=3u9K3CKVtmxU7xtEHLF65KIGwwOI0h/SL7JdI1r3jutQHKdXwTEFEhePddxx2Wbcv/
         CFSJeiUWqfRDUQvoBc5uHebo0MFb3FiRCB9NemlUnv5Gpswj489fOa6BGk/BGMEK2TUS
         5W3NTXhlnBgB0+QTW6bgzYkIR8VSh+6BsLHhL414vFfxu41vMTuVUR18NPvWNxxRI7rh
         J+16L7QR2/moMw0/PMCziNkvXSb8OHn0au5Rr1yWA/GbIQNJu8hneswkMg3D2XGf8We3
         0oO8F0bl3PijZt1VbzYoPNDBMy2c18mH/76HBnCyUQucl55/NpThq37kv2QQYPzOaE2x
         0QAQ==
X-Gm-Message-State: AO0yUKVoR8KIbbK5yFb6Do2d5N1ewqWKcZVMr93bBGlwM1isgcO/3gQZ
        W/84XlNaIeX6JqDpkfNh6lb5HQ==
X-Google-Smtp-Source: AK7set9NxTBVIQmtSDubH5be+XCsaEEwrVBJdBHJw3BTSJEXc4IgmfFhk5P/hmvEos14ccyaleWa5w==
X-Received: by 2002:a17:906:2357:b0:931:7709:4c80 with SMTP id m23-20020a170906235700b0093177094c80mr2387795eja.71.1679043376333;
        Fri, 17 Mar 2023 01:56:16 -0700 (PDT)
Received: from localhost (2a02-8388-6582-fe80-0000-0000-0000-000b.cable.dynamic.v6.surfer.at. [2a02:8388:6582:fe80::b])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b004bef1187754sm744557edj.95.2023.03.17.01.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:56:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 17 Mar 2023 09:56:15 +0100
Message-Id: <CR8J7A4RGCHZ.293RWUBS367M2@otso>
Cc:     "Marijn Suijten" <marijn.suijten@somainline.org>,
        "Rob Herring" <robh@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: Add GPU nodes
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "AngeloGioacchino Del Regno" 
        <angelogioacchino.delregno@somainline.org>
X-Mailer: aerc 0.14.0
References: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
 <20230315-topic-lagoon_gpu-v1-4-a74cbec4ecfc@linaro.org>
In-Reply-To: <20230315-topic-lagoon_gpu-v1-4-a74cbec4ecfc@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu Mar 16, 2023 at 12:16 PM CET, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
>
> Add Adreno, GPU SMMU and GMU nodes to hook up everything that
> the A619 needs to function properly.
>
> Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 140 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 140 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index 60b68d305e53..e967d06b0ad4 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1138,6 +1138,74 @@ compute-cb@5 {
>  			};
>  		};
> =20
> +		gpu: gpu@3d00000 {
> +			compatible =3D "qcom,adreno-619.0", "qcom,adreno";
> +			reg =3D <0 0x03d00000 0 0x40000>,
> +			      <0 0x03d9e000 0 0x1000>;
> +			reg-names =3D "kgsl_3d0_reg_memory",
> +				    "cx_mem";
> +			interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus =3D <&adreno_smmu 0>;
> +			operating-points-v2 =3D <&gpu_opp_table>;
> +			qcom,gmu =3D <&gmu>;
> +			nvmem-cells =3D <&gpu_speed_bin>;
> +			nvmem-cell-names =3D "speed_bin";

What about adding interconnect already? I also have opp-peak-kBps
additions in the opp table for that. I'll attach the diff I have at the
end of the email.

> +
> +			status =3D "disabled";
> +
> +			zap-shader {
> +				memory-region =3D <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-850000000 {
> +					opp-hz =3D /bits/ 64 <850000000>;
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-supported-hw =3D <0x02>;
> +				};
> +
> +				opp-800000000 {
> +					opp-hz =3D /bits/ 64 <800000000>;
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-supported-hw =3D <0x04>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz =3D /bits/ 64 <650000000>;
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-supported-hw =3D <0x08>;
> +				};
> +
> +				opp-565000000 {
> +					opp-hz =3D /bits/ 64 <565000000>;
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-supported-hw =3D <0x10>;
> +				};
> +
> +				opp-430000000 {
> +					opp-hz =3D /bits/ 64 <430000000>;
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-supported-hw =3D <0xff>;
> +				};
> +
> +				opp-355000000 {
> +					opp-hz =3D /bits/ 64 <355000000>;
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-supported-hw =3D <0xff>;
> +				};
> +
> +				opp-253000000 {
> +					opp-hz =3D /bits/ 64 <253000000>;
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-supported-hw =3D <0xff>;
> +				};
> +			};
> +		};
> +
> +
>  		gpucc: clock-controller@3d90000 {
>  			compatible =3D "qcom,sm6350-gpucc";
>  			reg =3D <0 0x03d90000 0 0x9000>;
> @@ -1152,6 +1220,78 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		adreno_smmu: iommu@3d40000 {

This and gmu should be above gpucc @3d90000?

> +			compatible =3D "qcom,sm6350-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-=
v2";
> +			reg =3D <0 0x03d40000 0 0x10000>;
> +			#iommu-cells =3D <1>;
> +			#global-interrupts =3D <2>;
> +			interrupts =3D <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks =3D <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
> +			clock-names =3D "ahb",
> +				      "bus",
> +				      "iface";
> +
> +			power-domains =3D <&gpucc GPU_CX_GDSC>;
> +		};
> +
> +		gmu: gmu@3d6a000 {
> +			compatible =3D "qcom,adreno-gmu-619.0", "qcom,adreno-gmu";
> +			reg =3D <0 0x03d6a000 0 0x31000>,
> +			      <0 0x0b290000 0 0x10000>,
> +			      <0 0x0b490000 0 0x10000>;
> +			reg-names =3D "gmu",
> +				    "gmu_pdc",
> +				    "gmu_pdc_seq";
> +
> +			interrupts =3D <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "hfi",
> +					  "gmu";
> +
> +			clocks =3D <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> +			clock-names =3D "ahb",
> +				      "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc";
> +
> +			power-domains =3D <&gpucc GPU_CX_GDSC>,
> +					<&gpucc GPU_GX_GDSC>;
> +			power-domain-names =3D "cx",
> +					     "gx";
> +
> +			iommus =3D <&adreno_smmu 5>;
> +
> +			operating-points-v2 =3D <&gmu_opp_table>;
> +
> +			status =3D "disabled";
> +
> +			gmu_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz =3D /bits/ 64 <200000000>;
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +
>  		mpss: remoteproc@4080000 {
>  			compatible =3D "qcom,sm6350-mpss-pas";
>  			reg =3D <0x0 0x04080000 0x0 0x4040>;
>
> --=20
> 2.39.2

Here's the diff I have for interconnect on top of this:

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qco=
m/sm6350.dtsi
index 4954cbc2c0fc..51c5ac679a32 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1142,6 +1142,8 @@ gpu: gpu@3d00000 {
 			iommus =3D <&adreno_smmu 0>;
 			operating-points-v2 =3D <&gpu_opp_table>;
 			qcom,gmu =3D <&gmu>;
+			interconnects =3D <&gem_noc MASTER_GRAPHICS_3D 0 &clk_virt SLAVE_EBI_CH=
0 0>;
+			interconnect-names =3D "gfx-mem";
 			nvmem-cells =3D <&gpu_speed_bin>;
 			nvmem-cell-names =3D "speed_bin";
=20
@@ -1157,42 +1159,49 @@ gpu_opp_table: opp-table {
 				opp-850000000 {
 					opp-hz =3D /bits/ 64 <850000000>;
 					opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps =3D <8371200>;
 					opp-supported-hw =3D <0x02>;
 				};
=20
 				opp-800000000 {
 					opp-hz =3D /bits/ 64 <800000000>;
 					opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps =3D <8371200>;
 					opp-supported-hw =3D <0x04>;
 				};
=20
 				opp-650000000 {
 					opp-hz =3D /bits/ 64 <650000000>;
 					opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps =3D <6220000>;
 					opp-supported-hw =3D <0x08>;
 				};
=20
 				opp-565000000 {
 					opp-hz =3D /bits/ 64 <565000000>;
 					opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps =3D <5412000>;
 					opp-supported-hw =3D <0x10>;
 				};
=20
 				opp-430000000 {
 					opp-hz =3D /bits/ 64 <430000000>;
 					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps =3D <4068000>;
 					opp-supported-hw =3D <0xff>;
 				};
=20
 				opp-355000000 {
 					opp-hz =3D /bits/ 64 <355000000>;
 					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps =3D <3072000>;
 					opp-supported-hw =3D <0xff>;
 				};
=20
 				opp-253000000 {
 					opp-hz =3D /bits/ 64 <253000000>;
 					opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps =3D <2188000>;
 					opp-supported-hw =3D <0xff>;
 				};
 			};

