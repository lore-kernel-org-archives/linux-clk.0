Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B683E9C0C
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706024; cv=none; b=PnQ6CYxGzlJwOYezfClWdO7Fq6p1FSft131fyxYqOdHqtYeSdAOH7yLK9WJLzjl1dvDJahOWgX8n+vxxYK7xdDIEDK9d8jpVEPgQBXoXd3zzXLtL+LBb26agwaM4R5k6p9eMXmz2p9pka2ghkz88SgNuDrwL+mEYXOLRw2yYvmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706024; c=relaxed/simple;
	bh=BpkrJZIwOoOmknc998FqklvIzt2YbIRvEWZvMafgO0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qb2Frr0D4iRp6/78RcK0kOpfgIwmX9h40N55pECMRlU56US9XTWdKzKXJzW5zxN9/ibWmuZ/ostEdCu+4nr5AoAcIzOagETcs4f3ALMyia8WFXEDmSl2GxEPQjXvINtraum0z4AJII0eqvDuzyTjXYG9K6g8TsFNZIbkgBCQqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPCBmmv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dM8P6aJo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPCBmmv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dM8P6aJo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9gOMY3890153
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=; b=YPCBmmv1j1oD2Rzs
	9KFYS60zUJ+4ap74UyWpRcQKuJtpnlXowA94aQIzNm7BXU0KpLlcZekyszuEGenN
	+aHtYHyXffKyjOSsOXX3kLtgsaGCJfBdT7pM/SQjy0bZkDuHRVli2VuPhubJSlp1
	0ugp5ZkSdHQBHWQxvdvuUSp2tLL0WzAmD5ib4csuQg0rZt7Y5uyzZAVcKiLe+C+v
	ieBG/l0GOXPLPw/ad1icgL/ZBUtSugp2Q/7oJQLn3c0KDQQBXUaR7GABUZ2BC1pj
	T7O+YyuTBy3Ah47U9QR+M/gUmaaaU5RuCELfRbxogxTCeIQVjk3UKozVa8pzhOXH
	7Yqkwg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asxbqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:47:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc6899bfb1so98196085ad.2
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779706021; x=1780310821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=;
        b=dM8P6aJoVobh7QmLXblyILl6XG63xVgFWL6YGkSe5QBojyXsmgoQAOSrFbF3+q+DYj
         1gukTm7I+u+N6hhNfVrfdrc+VkFmtedMhuCdetC38I7NONWKGM50kzRj/abo18rD/8k0
         AGXSjWwlf04b4D8ntkWX0i37lrhRIesLMkiGew5MY0JN7kQljwv7VIfo6x69zIdnSrP0
         4tixfKw0kYZ94jbieViYjX4RNDiLv9GlLuUlW4rd0dZNWB4n07UnGVJueIPcUJnt2Kog
         8OY8uv8DOda6ZQJfHQRksiipLNij0uRjA191dz+yWPBxi3nWOjAerpxLTwwoODOqDzVO
         rNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706021; x=1780310821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=;
        b=NXE+90jP78snHaWTrELfxZHEJw31pa8fRH3qcaELgAr9Ehsy8VVjZSdkwmzYx5N7B6
         r29f9cfT27iJRMqFUVWDkzFlRppFLPPQwxKwJO9BjXgelBOB80KUiDk8WkhUuYEcptO6
         j9cgp9XD3X9ubuldT+gi6ZqhEivGRszbxyPSJAWf116ifqkFdsmZ3hO6VaUk6Kjb1kx2
         U1V096n9CZbVz/GfQvtKpcpvFb8TClZcZQaUMn/1ZpSMMHsE2QJx6a4BFpL8f/DQka2Q
         +3Zr84tiYKb7LQDVoqKkIi9QX4frnWQRuODZri1Krrc4BfoPZeFC/xocXtVCeiV7/Jl2
         67QQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MEnCJsfN1NeHZHHXQzQ9ABKADFl/cX7JFvkt7/MXwDpMaaSJg7/cjufedTdOemCoCcXvZReD+43o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6AUh2rF4Q9+qWA0iM6HxwhLIu+TSLk7L5ePlqgN97dQn5STII
	l4vkQNxUapxNHvG6mer9r4vFppAYAmjXcYcmOAJMJ7wOmdU+5IQxTckHZ/8cXoAG8/00bTQR4vD
	wTjF/DuYEUR9Mc1HH1N+T4c/YiyicPdyv1uw6SH/fgIKMSjRa6OYhE2KPwiTsIxw=
X-Gm-Gg: Acq92OHSjYV0ayHU5NlWaECJIHotmCrQaKf+FXnqCZdHzUaSK+r0AdCJGMCS4IvJpCv
	boL0SGsTe452jJP7poyfiia+CL5uCRXZqWMosuBaEq0K4epLKQhNMkh2McfgttaAxFUHBny/CIy
	i+rP5VTxEU7FpMLFA71UuiOeH/IBf+P/u9CmY3jjCgX56gFedU77HKJ52Ri9nh+Oghx2Sbgvfxs
	kb2tJeDvJyTrzCKt1raz3+Tg/L7H7rObE5E/1pRpUHdMWsivDC16oqRDOzu8T3wnPfGLK2L7MZx
	yE2QZgeNKzYhJTUgXsEWA3dlTjUlpAOfM5bXVbIumR6rrKDrJnY3e1nh1omx3zEPjkqXiobF6gM
	zc37mmTxBjCDmeA2mhO7DEyikQboUEwqc7+Uxy7DpX3qA8w==
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr150819605ad.17.1779706020581;
        Mon, 25 May 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr150819125ad.17.1779706020078;
        Mon, 25 May 2026 03:47:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:09 +0530
Subject: [PATCH v5 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfXx3+zkE59BnEX
 ORJzSgRgkgWiS3zoA7oCqdfE8i3BTg16lIn4BwQiH3maRgU8DniakT6vbcn/sI1PdOjOfPjbP/N
 q+XsTtbJi69WDowu/y08FqKlindWKFoUXYJ0ceIfIHw6+F19wU4VpZyPbXFWoq5og9UAcRC0JVg
 sNO7QprecO0JDs5wbo68aEtrK6tdPG2yVhk85QTYAeXPHaUsxKfsZjU1ZjUnYk6jB42iAKtvleq
 S5WyuJYgVJop45UhR2OZQZGFJJ6D2zEogfAyM06hwfsajFCRC8fDVHYPv7IvZg/iwmk5tRDD42n
 BYm9q0a4ND2FJDEa0WrP9SUuTyHSLCFjzzUr5NnSx8+IthfQMSMRuQ2cyvTAoAa/DmY5/9L3U2/
 HJwfvpP3moQn3fNDK0zqsAmgGMhzFhSKE3An4ZiQqql+A6u6XTqFpJ8W/JXySuG9OhejrySJMX4
 KyZLAKm91keUDFhLR4Q==
X-Proofpoint-ORIG-GUID: FgSWr1z7i-UaEmdxZDCWgg42ZB4zAIAr
X-Proofpoint-GUID: FgSWr1z7i-UaEmdxZDCWgg42ZB4zAIAr
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a1428a5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..88673e7b2a5f0b38675aea517daceed9c3f9a386 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3,8 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -709,6 +713,19 @@ aggre2_noc: interconnect@1700000 {
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
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +879,23 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
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
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +917,33 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
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
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1

