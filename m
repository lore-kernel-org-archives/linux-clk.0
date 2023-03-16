Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2508C6FD19
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 11:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjCPLRf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 07:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjCPLR3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 07:17:29 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11381C4E82
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 04:17:15 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y20so1869995lfj.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678965434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgn5Rzo7pAc2gmOTsd/K9TH2CYoJoK0uHcYeDBOw4do=;
        b=efFinTnc8QS1mBoA9uCdV/SXWzwA8sh5tk5FbqCJYw5381q/zqDj748bOIDVzCN9dR
         oGHw+b9aOa1FOW/j/cGwjeJulbCOt3wuhJ+YnMCW57PvhcEuXwsVxa3kF/bnxM1twxWt
         jLFPJXm0zDBV1xztNOg3o4PFMo73dRjzwTKlPRjSlVSlRxAmSz0SsfhFFzN5gLfSqimt
         0Z7JGjOiNGZ5Xpf3oNiW6/Q85grZEeG6vztlueciu4aCaT4nNRjxHRjBtE3tzqqKVlWr
         izrp9UoKXQF/Y96NmumZJ5GN9HV5ncCU4JH2uL6GSxnJF+O9ubs/jFktr6iBOF/KdOrs
         Bh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678965434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgn5Rzo7pAc2gmOTsd/K9TH2CYoJoK0uHcYeDBOw4do=;
        b=I8qtQA+4UCvISalma2E3fDK24fiLBai8ENhuo7vjGTVtSLfn3kMh2JI57S38yN/0F1
         t3EnksbWhXgSl0Y4Xvtupxrt6YWYiABURQA6ud3505PwFVVUg9j3sm8ewM3DDhZrK3Ph
         6mrv7g7UuKxHksrn3xoJ6zlqZkrJepxgQXekYggq5ekNCtaG1qFF9Xj3WmFO1iv6TUYq
         OlvjjBWSTJnE+gQaxBhXoJb3Hn5epa8oEjUSlKxVzFS6kM0peWMeh+/wKIYx75XHfyG7
         w3RxM6A6IscVM/0XLrAUDJcYCC0Y+Xe1LIaXBi/QMoeoGyJdvKoMG/1xmCCgWz7/Ms14
         aQSQ==
X-Gm-Message-State: AO0yUKUkdb5yYRUP+N2Z5Z/ONJipMRDNZgHMjBOBb31Ly6ly6oay/0B7
        r41IneGOvHlGpHbeUZTs43ujEw==
X-Google-Smtp-Source: AK7set/y8ewUjgD5CuRTQ5fFoBnEEX0Mgw0Zot/b/iaPMaUSbomGi8Z1HyaEl4xOAt02T5enLabc6g==
X-Received: by 2002:ac2:4202:0:b0:4cc:a107:82f4 with SMTP id y2-20020ac24202000000b004cca10782f4mr2489622lfh.64.1678965433697;
        Thu, 16 Mar 2023 04:17:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u28-20020ac243dc000000b004db2978e330sm1194222lfl.258.2023.03.16.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:17:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 12:16:59 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: sm6350: Add GPU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230315-topic-lagoon_gpu-v1-4-a74cbec4ecfc@linaro.org>
References: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
In-Reply-To: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678965426; l=4819;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JbPANomzx98OqH3bbW/ckEJ9GniS0ZAyl4OszIK8VjY=;
 b=q8EnwRUIAkOg07OqiaMV5aWHa2/9a8PcMNld4DFAi0BHSrjIzEd6WbwKJgD5CMTCoakRkM4ZGN0/
 cmA9feRhCVYh9+CM1lEy8L+8C1qxytmNUAaqDtUr+2ufKQB4/Fu9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add Adreno, GPU SMMU and GMU nodes to hook up everything that
the A619 needs to function properly.

Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 140 +++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 60b68d305e53..e967d06b0ad4 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1138,6 +1138,74 @@ compute-cb@5 {
 			};
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-619.0", "qcom,adreno";
+			reg = <0 0x03d00000 0 0x40000>,
+			      <0 0x03d9e000 0 0x1000>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0>;
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			status = "disabled";
+
+			zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-850000000 {
+					opp-hz = /bits/ 64 <850000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-supported-hw = <0x02>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-supported-hw = <0x04>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-supported-hw = <0x08>;
+				};
+
+				opp-565000000 {
+					opp-hz = /bits/ 64 <565000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-supported-hw = <0x10>;
+				};
+
+				opp-430000000 {
+					opp-hz = /bits/ 64 <430000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-355000000 {
+					opp-hz = /bits/ 64 <355000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0xff>;
+				};
+
+				opp-253000000 {
+					opp-hz = /bits/ 64 <253000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0xff>;
+				};
+			};
+		};
+
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sm6350-gpucc";
 			reg = <0 0x03d90000 0 0x9000>;
@@ -1152,6 +1220,78 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3d40000 {
+			compatible = "qcom,sm6350-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
+			reg = <0 0x03d40000 0 0x10000>;
+			#iommu-cells = <1>;
+			#global-interrupts = <2>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "ahb",
+				      "bus",
+				      "iface";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-619.0", "qcom,adreno-gmu";
+			reg = <0 0x03d6a000 0 0x31000>,
+			      <0 0x0b290000 0 0x10000>,
+			      <0 0x0b490000 0 0x10000>;
+			reg-names = "gmu",
+				    "gmu_pdc",
+				    "gmu_pdc_seq";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc";
+
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			status = "disabled";
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,sm6350-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x4040>;

-- 
2.39.2

