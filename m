Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202143745C
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954524; cv=none; b=JzVJo5qecN3YDeJtZY/7bfjJbJgYeS7fHT6mR0IyOeogu9ccrVFl6nD0GklpTuypIrrcPDvdiZpNHCAXRsi7tzHvNeoMRHWZH9DqHmRM2zhb7RJr0vWWhCgdC3Y0U28ksCsLYWg3O8gNuH/SzmxvxaXNU2BDhb83/UQHYCjj+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954524; c=relaxed/simple;
	bh=3RYoy3NwCnlF9xpy5kV6jgraHpowonDh8P0V9h6Z3hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lqr/QsQXymX3rZIcAbVmvA97LREvC6yOStLSiwB/ZEa5RjvB8iTl6WefTdVW7guGHjCSLf+ooK35FnxM5CEN6djUGwLdex+GrbPaDAf/PLiP5wLd8juyZ0ZSctCx5t8Nenx6ijW6G1h6F4jSOi3wokk24UbhUYHnp4CJCGdIXfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnVlKmxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATF1k2px; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnVlKmxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATF1k2px"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDwkO1428369
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=hnVlKmxnXPMktPQm
	yk+j1bTsKNGPKreQoVJyWZI/ztaKVl+Ut8GfBihC5lBvInp+KDtkC2twuPxM6qXP
	KCP8vKxoAzeYtn9k8ajpbo2hYYSU7W1ZnL9pME2qWyV0SgZHoBv5obpTE9t3WJVs
	N79RNddngnMcn+/UNmdcOBZanpXOPEqZw1FsscxRGGH9gi4m9VMnErj1C0TbhJeV
	q25dyT0/VhNThOUFN8ntuYiQY92PdtrrbQxLd4EvdqETLmLAX02QUD0WonTP9Cqd
	Pq48ZODrm9HvvVB0Dr3k/2UzB778ujlRLhuQnMPt3AGekDMNpY6/D9wIcA7xCBcM
	Nmz6sw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn1p13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:55:21 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb89852728so1965652a34.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954521; x=1784559321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=ATF1k2pxhfYdVKErt4tKwri+F31Y1u2wKo8sZf3TKTwTwZe8BidA6iDTFmX15cmxiA
         sXxSsq2rbhBKnJ2Z6uExkWb9mBigxhiN9VbqG9A8n3zF4al7LUDeNmAU71527KzgcJKA
         xtJfU1MF5OroZ5GXX9MWpOiBNyvInAdt4hAPi0KuYtPe6YHKv5afJxm7Fu76VL074fK9
         PvgLX4BzYIw+AKvinRr9KWgmp4Va7Ka88QAOmH3rzThe3KBu/WiEEYR5gOTtLrn/lXsZ
         lg0LdhWDNv5EO7qDqUNzmY5a/A+TcbGfOK8c9tGciKKDEDfzyKhxgkSO8MoTGiTzrTQ0
         qhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954521; x=1784559321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=aBor9bHhjPOiZxOFCPGFnBd4JHNRTSj/mBcDh3p2Sw1AX8w3hyWHNojLz6Dk7R11V+
         oYv0x93RS/clPC0ZnNImeSkyZ1YUcd3hCoFFjjaTQf4T4Ghaq9jroX3+KzdRMQiVvUXq
         s2rsW9wmOy8jUzm4WlBuh34qITCLuABNM+1ARAz0WFmmrGrlkOnxQN5UNFi8uA7r9d0z
         NEV37g2iVKSz664f/np0BWj33bMz/YQLq1H1rW3wVoc0CLjbzFGdQRYC3Nr9uTm/+1G7
         s07r6Gn6wXZ6+YIVz6hhi24CZTuyfpgTBvsYRIMYwXvbrf+wWWTXnWcGXILqkYrh9Q2u
         nt9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/I7RDnnLBGI8yfq9rGGLF9Z2po3CsjoRKggMoVP19SFNP59VmNsX3ey1W5HoeSwnpKmD/7TXO2Lio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2E+VYKQSwRuzGuLTtI2HX4VFlxeqac9qmswuMqoCU5h0yJCM0
	IgCwv7GNRixoX6M7c5r7wKDaiGfaYwlI0rnV34kN0+SF4LkkaVdcnYP6MFYprjI7n7TFVs5W++O
	kt5X6bVMnmwX+cfIeMsSwvmj/7Xv/yttKevkrKryNOvr3mslPm7nDpzhqEZ9GINs=
X-Gm-Gg: AfdE7ckZWoYIwYG7bUaBbyL6odN5XhGt/6rKBs18nvsHPmWj/gpdm6DZBzjwrIlPAQ0
	yoJ3VS8/r9SFnm6cchV7Fi7iRAqLcMsRdRVySQZYAsVVwtejqblVYbSuvn/9v98hDtR5gPl3fdq
	illWAgXsRNKWJXr+VHR95+RINJPXdKbUSxeuhtGAvXpDsevM9wcZNEAxogzj8hUALJ5q0n3ue9Z
	s+/vPh0ycal5FFYOtCMGjdqwyDn927iMecl7UsY0gUJA4NBNtFmbWMTluXAug2mWhW6M1gMluFI
	0PiVVikUVyoPba0nJuuFVTVN6lyHO9qSMTJKetbfFC+/12Xy70WcA6vCb2ECWAs0Uj99m/IluFq
	LkVA/F3u0QLryWeG6ieQ2x762AtKwxqbTXes=
X-Received: by 2002:a05:6820:134a:b0:6a3:c52b:b95a with SMTP id 006d021491bc7-6a3c52bbe58mr48672eaf.29.1783954520800;
        Mon, 13 Jul 2026 07:55:20 -0700 (PDT)
X-Received: by 2002:a05:6820:134a:b0:6a3:c52b:b95a with SMTP id 006d021491bc7-6a3c52bbe58mr48636eaf.29.1783954520268;
        Mon, 13 Jul 2026 07:55:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:55:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:48 +0530
Subject: [PATCH v7 10/10] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-10-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: MFt5KRQfAiM1Ba_xkddJtFnV3TvbE9Hh
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54fc59 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX1CvT/fdE/h9p
 CDhMnheIVyLgvP5zNzcwdxD2Halbt9ImGlHnNyOfGTvxHGnKh6QTOenC4pd897f1dZ1Pgsv3ggI
 me/EljHheYCZVUFUh7vevt6E+vHxszw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX9OSfRn1i6ytN
 tOf1n88VRz+wq5GRHVCWRfDdXaHKGA4sjbYN7iK4wJubip5qg9FeIgW4S48Q1XN4gyfuxzXsXlF
 XZjXiRmfZFYC6JHblydiJSyB7um1RK+swEyLTcseYWquWMdjExJt7Zwm+UFDdXJBK3k5lm1gieA
 Vi4dl0SxioOzILRSJKbwMtZNxQznS7srSdJRPk+GjSA0Ty1sNKpXRxXcPD1OLG239gxrEOMVB1u
 8shHWPGjxT5LryW/Foq2YfrbZQOBntaE8KU84xWRsS3SV9Xw/2UQxND04NnfO/kkl7nYKc/ANO+
 d61zQADlmDb2kMy+a2UvsMNvyKzjhnhY7RxZla+dPpvQKExQGnaq/ROklG0+j6I4JZbDJs3KXFG
 Bws2idXH5INUfKObUK5R+ldfIkUm5rZFe7CHK9hUbvNNY86p5D3caSbFpRrYejNq4TppIMKiSg4
 XsrRRrSD12gxiVEtMfA==
X-Proofpoint-GUID: MFt5KRQfAiM1Ba_xkddJtFnV3TvbE9Hh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..fed88a699fc264cc49e0bda79870a8dfb0b6c7f7 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1779,6 +1783,24 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2679,60 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

