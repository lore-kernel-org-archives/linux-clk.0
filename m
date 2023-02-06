Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E7CC05027
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 14:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjBFO5Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjBFO5X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 09:57:23 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73FF234C1
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 06:57:16 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id hr39so5345386ejc.7
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzeGxqTBPrxIjG9qLHd24E7JXaEtDXkcFzdjyXT/GCk=;
        b=n1iigRfIDJ4id4dlaMsdX1m8lKOu7PqozI43UZe8WtJ9shvpv4gUaq50yzkLogIm58
         MZQ5GwDKEuRSJRFFFU/P/IVQmTgwph9bAekrg0iu9PJZMMt7sCRvGTfxuSB1ecFDlKCF
         8QaRzeVY/qpHA/bwi/wRHifnJlod7GCJvRR4+oCnchw8/cPFjdCfK7/09qFYin8ZBToc
         fC89AIoQT0gEABqEox8ydlMR7hIneaRhTLUKhb7wa6OMYSGAwev9FBhK9Fx3SBPk3PJN
         Tn/3fOvJSYtFvs0PYRdjTSPjHpe8GWV3xuz6qnKRYkruuZLW0Z31/Gzw71e4TmPd9m2D
         /hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzeGxqTBPrxIjG9qLHd24E7JXaEtDXkcFzdjyXT/GCk=;
        b=Hskly8PPFCvKPSJLFWgOQY2+YvytVfgDOIJTmXbKbr2WPXn0IWdbL/c89Y8l+RiF6l
         Qm8+/5ta1kV0Ag/BPikDXkLrXTFV/jboONSIg+cPrg/4EX1FzVYQke79WGignXDr6BRU
         G34ScdpkiJtsyXt6a6IVOZ9qIK5gFFNMQdXgu7OTs+v9OHvMTbSgXDbMaOTTZZgJdh/m
         xo2nbLplwPMO1t7Y+KvEPErUakgoaAp1eaKmXhr9uIJoAwE2va2B/fu3B0aFlpkMSCIx
         Xi7nvWd/O0j41hPuwZXTPedaSAVBt/UGvQxVMIZB8kH6c9LDtT2Aj6cF4p9jFTFPj6kC
         cf4w==
X-Gm-Message-State: AO0yUKVTSp1cVCaXkYtZlkgh1qWDDHkEoXFwVR4h+W2S5UV9CtBdWt1k
        KjffqsN8QnU2uGZbv7L2MFLcWA==
X-Google-Smtp-Source: AK7set8+Ka8xWRBWRyo8CYeuiSZaBpz6OfvHTEatEvkOqVzvGaK3uE3CsOn+nTCz1oPIWG/MQmVnkA==
X-Received: by 2002:a17:906:7e4a:b0:878:66bc:2280 with SMTP id z10-20020a1709067e4a00b0087866bc2280mr19981633ejr.12.1675695435324;
        Mon, 06 Feb 2023 06:57:15 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 5/8] arm64: dts: qcom: sm8350: move more nodes to correct place
Date:   Mon,  6 Feb 2023 16:57:04 +0200
Message-Id: <20230206145707.122937-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Continue ordering DT nodes. Move RNG, UFS, system NoC and SLPI nodes
to the proper position.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 314 +++++++++++++--------------
 1 file changed, 157 insertions(+), 157 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 061aa3fec1c4..c327dc925793 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1423,6 +1423,13 @@ spi13: spi@a94000 {
 			};
 		};
 
+		rng: rng@10d3000 {
+			compatible = "qcom,prng-ee";
+			reg = <0 0x010d3000 0 0x1000>;
+			clocks = <&rpmhcc RPMH_HWKM_CLK>;
+			clock-names = "core";
+		};
+
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8350-config-noc";
 			reg = <0 0x01500000 0 0xa580>;
@@ -1643,18 +1650,76 @@ pcie1_phy: phy@1c0f000 {
 			status = "disabled";
 		};
 
-		lpass_ag_noc: interconnect@3c40000 {
-			compatible = "qcom,sm8350-lpass-ag-noc";
-			reg = <0 0x03c40000 0 0xf080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			iommus = <&apps_smmu 0xe0 0x0>;
+
+			clock-names =
+				"core_clk",
+				"bus_aggr_clk",
+				"iface_clk",
+				"core_clk_unipro",
+				"ref_clk",
+				"tx_lane0_sync_clk",
+				"rx_lane0_sync_clk",
+				"rx_lane1_sync_clk";
+			clocks =
+				<&gcc GCC_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_UFS_PHY_AHB_CLK>,
+				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			freq-table-hz =
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<0 0>,
+				<0 0>;
+			status = "disabled";
 		};
 
-		compute_noc: interconnect@a0c0000 {
-			compatible = "qcom,sm8350-compute-noc";
-			reg = <0 0x0a0c0000 0 0xa180>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm8350-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0x1c4>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			status = "disabled";
+
+			ufs_mem_phy_lanes: phy@1d87400 {
+				reg = <0 0x01d87400 0 0x188>,
+				      <0 0x01d87600 0 0x200>,
+				      <0 0x01d87c00 0 0x200>,
+				      <0 0x01d87800 0 0x188>,
+				      <0 0x01d87a00 0 0x200>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+			};
 		};
 
 		ipa: ipa@1e40000 {
@@ -1702,6 +1767,13 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		lpass_ag_noc: interconnect@3c40000 {
+			compatible = "qcom,sm8350-lpass-ag-noc";
+			reg = <0 0x03c40000 0 0xf080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8350-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x4040>;
@@ -1744,6 +1816,74 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		slpi: remoteproc@5c00000 {
+			compatible = "qcom,sm8350-slpi-pas";
+			reg = <0 0x05c00000 0 0x4000>;
+
+			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&pil_slpi_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_slpi_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_SLPI
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "slpi";
+				qcom,remote-pid = <3>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0541 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0542 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0543 0x0>;
+						/* note: shared-cb = <4> in downstream */
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8350-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
@@ -2014,153 +2154,6 @@ qup_i2c19_default: qup-i2c19-default-state {
 			};
 		};
 
-		rng: rng@10d3000 {
-			compatible = "qcom,prng-ee";
-			reg = <0 0x010d3000 0 0x1000>;
-			clocks = <&rpmhcc RPMH_HWKM_CLK>;
-			clock-names = "core";
-		};
-
-		ufs_mem_hc: ufshc@1d84000 {
-			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
-				     "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>;
-			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
-			phy-names = "ufsphy";
-			lanes-per-direction = <2>;
-			#reset-cells = <1>;
-			resets = <&gcc GCC_UFS_PHY_BCR>;
-			reset-names = "rst";
-
-			power-domains = <&gcc UFS_PHY_GDSC>;
-
-			iommus = <&apps_smmu 0xe0 0x0>;
-
-			clock-names =
-				"core_clk",
-				"bus_aggr_clk",
-				"iface_clk",
-				"core_clk_unipro",
-				"ref_clk",
-				"tx_lane0_sync_clk",
-				"rx_lane0_sync_clk",
-				"rx_lane1_sync_clk";
-			clocks =
-				<&gcc GCC_UFS_PHY_AXI_CLK>,
-				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				<&gcc GCC_UFS_PHY_AHB_CLK>,
-				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
-				<&rpmhcc RPMH_CXO_CLK>,
-				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
-			status = "disabled";
-		};
-
-		ufs_mem_phy: phy@1d87000 {
-			compatible = "qcom,sm8350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-
-			resets = <&ufs_mem_hc 0>;
-			reset-names = "ufsphy";
-			status = "disabled";
-
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
-		};
-
-		slpi: remoteproc@5c00000 {
-			compatible = "qcom,sm8350-slpi-pas";
-			reg = <0 0x05c00000 0 0x4000>;
-
-			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
-					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd SM8350_LCX>,
-					<&rpmhpd SM8350_LMX>;
-			power-domain-names = "lcx", "lmx";
-
-			memory-region = <&pil_slpi_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_slpi_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-				mboxes = <&ipcc IPCC_CLIENT_SLPI
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				label = "slpi";
-				qcom,remote-pid = <3>;
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "sdsp";
-					qcom,non-secure-domain;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@1 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
-						iommus = <&apps_smmu 0x0541 0x0>;
-					};
-
-					compute-cb@2 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
-						iommus = <&apps_smmu 0x0542 0x0>;
-					};
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-						iommus = <&apps_smmu 0x0543 0x0>;
-						/* note: shared-cb = <4> in downstream */
-					};
-				};
-			};
-		};
-
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
@@ -2309,6 +2302,13 @@ system-cache-controller@9200000 {
 			reg-names = "llcc_base", "llcc_broadcast_base";
 		};
 
+		compute_noc: interconnect@a0c0000 {
+			compatible = "qcom,sm8350-compute-noc";
+			reg = <0 0x0a0c0000 0 0xa180>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
-- 
2.39.1

