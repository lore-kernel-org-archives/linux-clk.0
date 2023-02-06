Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EE7C63797
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 00:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjBFA15 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Feb 2023 19:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjBFA1y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Feb 2023 19:27:54 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52665134
        for <linux-clk@vger.kernel.org>; Sun,  5 Feb 2023 16:27:49 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id gr7so29843189ejb.5
        for <linux-clk@vger.kernel.org>; Sun, 05 Feb 2023 16:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qihQsYdtJCahwJpWLDALc1e7O10EBuldtlHHokb8NR8=;
        b=Odc6i3zFe2tmTl2Sl0TZzYMrE2PmtzWG8bJ/gT74EKTMET+ixz+WnTVR6U7s7bepdI
         l351sgeHwA8dxKPuo0BsU5H2acZboCM4DAzX9dxbbeyFDhjpEThW3AWEUB1T5aIt7RQ8
         EluMBs6Nu5XVmKMkiT0ZmitJgZNur46awOpoomYFxucHIUBivGBp6+A3Efe8uTfVDMm5
         JJKc4tSqnIHpTQJWNgnyQW4Vg7jpdRYKXc/HXwULJFiu3u4Tn8KlEH4kkn5GpRNrTyhg
         6hu4KkIT1cn96Pj3w2wQaYI3Kh6z9s5IPGlFH2K4tzySgw0NzqXhs+2jISC9cIm2XJoZ
         jN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qihQsYdtJCahwJpWLDALc1e7O10EBuldtlHHokb8NR8=;
        b=4OfMqKM2GJYc/h1aG8+SWDMDvqYCItqGeZy5B5pH7aFJsU9vAlZgc/AfjD0qwoyb7x
         xQW+3bvSkULLJ5PmQ/IkzPxqYanM7M7FIQ6McB9s6tdNwowYJGOX/CL+4xge7/+5vQfo
         jRJXHVkPLu6r5Z6dsQyW1Ej025z48Z/8lzoufSy4yEGPHkwAkKiic5ASpTtbO4OQBX2L
         5d6Iw9jvbJRl5EHog65VVDPtzaTHxjaaJduIFvxB94FGNUtuSwq7Y2uzrS/IXlDO2q4S
         k7WPydqZpZZoaKtOlqSp6qJMdeMEhYBQSYgdCPj3/0UN1xq+hjFgKBCHMjsadqJrX1s8
         Sr9A==
X-Gm-Message-State: AO0yUKW39ifIVQgKMzJHZnB/TWjB7/x+aVEFyymPBBkpYnIju1YdXzu0
        mdSS7LdkrD8wAVYzRIxaLMcSog==
X-Google-Smtp-Source: AK7set+cmDwCHRhKk1O/LKCmbA3jONFt7GnDejDmNPnEn7Qx8PovBEeKxnUDclUKYXb1xvfJICqmLA==
X-Received: by 2002:a17:906:6d42:b0:88c:3a48:715b with SMTP id a2-20020a1709066d4200b0088c3a48715bmr18870492ejt.30.1675643267566;
        Sun, 05 Feb 2023 16:27:47 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 16:27:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
Date:   Mon,  6 Feb 2023 02:27:34 +0200
Message-Id: <20230206002735.2736935-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device nodes required to enable GPU on the SM8350 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 179 +++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e5b308957f88..a73cd9eb63e0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+#include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1767,6 +1768,184 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-660.1",
+				     "qcom,adreno";
+
+			reg = <0 0x03d00000 0 0x40000>,
+			      <0 0x03d9e000 0 0x1000>,
+			      <0 0x03d61000 0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x400>, <&adreno_smmu 1 0x400>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+
+			status = "disabled";
+
+			zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			/* note: downstream checks gpu binning for 670 Mhz */
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* not for v1 */
+				opp-840000000 {
+					opp-hz = /bits/ 64 <840000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				};
+
+				/* not for v1 */
+				opp-778000000 {
+					opp-hz = /bits/ 64 <778000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				/* not for v1 */
+				opp-738000000 {
+					opp-hz = /bits/ 64 <738000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				/* for v1
+				opp-710000000 {
+					opp-hz = /bits/ 64 <710000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+				*/
+
+				opp-676000000 {
+					opp-hz = /bits/ 64 <676000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				opp-608000000 {
+					opp-hz = /bits/ 64 <608000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+				};
+
+				opp-540000000 {
+					opp-hz = /bits/ 64 <540000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				/* not for v1 */
+				opp-491000000 {
+					opp-hz = /bits/ 64 <491000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+				};
+
+				opp-443000000 {
+					opp-hz = /bits/ 64 <443000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				/* not for v1 */
+				opp-379000000 {
+					opp-hz = /bits/ 64 <379000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+				};
+
+				opp-315000000 {
+					opp-hz = /bits/ 64 <315000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-660.1", "qcom,adreno-gmu";
+
+			reg = <0 0x03d6a000 0 0x34000>,
+			      <0 0x03de0000 0 0x10000>,
+			      <0 0x0b290000 0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub",
+				      "smmu_vote";
+
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5 0x400>;
+
+			operating-points-v2 = <&gmu_opp_table>;
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
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sm8350-gpucc";
+			reg = <0 0x03d90000 0 0x9000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sm8350-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
+			reg = <0 0x03da0000 0 0x20000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "ahb", "bus", "iface";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		lpass_ag_noc: interconnect@3c40000 {
 			compatible = "qcom,sm8350-lpass-ag-noc";
 			reg = <0 0x03c40000 0 0xf080>;
-- 
2.39.1

