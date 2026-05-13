Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB8442314C
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682249; cv=none; b=EtAO5SMVQCn/XR/iBiAlyJPlyxfPjQbojK2W8oYdeKsq97BSdldF6cfkHy6C6/CaHcfZnLX5IZg5He7WluBsJPvezFG6A0BQ+mTH1/OSiwcHTL9q21xDNz9gTETcXa/XpAGHvopLWI+sUnyl1N9qT+9yE/jw53cjIKDvMo9engg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682249; c=relaxed/simple;
	bh=d7hMOx395aOSc3mk2s7bGfKESt3HL65Usnpe/Jf9s/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iG8+Ghgb98gkploA9HyEybC1O1/VLXU0ytGqcz+e9IhlnKyAqmdRGFPS9Ivz9rPzV3j3x2qWEi5c1c+WliLqNla65KRtpDlsBJXSbPWdFU5SC8bdC5CmOIrMR6YcbhzVAwAPWGoGsdrotq9hTWaBp/hWBNd1TiXBM+c4cCPmdvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmUl7uW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFg97ypF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmUl7uW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFg97ypF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8xZNc4161609
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=; b=JmUl7uW1J5WFqGSX
	6F3nvyG9fAV3nWnhsroFhEN66SRZt/4N1PuJC85Ju8bMOAn3dQNcvhaJk3qkGDKK
	TS/D24r78CfTndlo7pqmSy0uP4xXuAfGRFv1ouh0Bs9NuNj77NPlSYjxyvAIS+Bj
	RvoCXzCW1i/YRpKATkw+gzu7VJKDnJdQvBx6Nb9iuKpaCJSToMn2OAKO9qevfkFo
	MAj5B0wYpu/sbtkMDhKOUsIL5Yw7phm5/KH3BFMqLckAASVfyAezgB/FVBr+mfiL
	CSVzJ/HBxLTGOxdAT5USJ852rb1u9yzz7SHZp/3BPlaiMriiZaTKDx0pGugTglvV
	IKM1jQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s7ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:24:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so96544965ad.3
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682246; x=1779287046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
        b=HFg97ypFmkrJJV9K6358aF95YMNNPr+lgHPB2b8XziAR9ecADvop7Y8+aY+38cv3M1
         ORnO1VkNJWKM6EKF7d3AWhhVU2cLUVlCk0dr4i7LfM4/UJRXrZsNVW5/onWJCn+AjD0M
         bxq1O2YPemuPxd6iBQP8IQ7E0+zQKaZs+l7/ecRBlkbmKAEwXS/U8rdn1nTh9Y7Q2w0R
         +QxnvwjvgszcqtC5KGMarECKYRcK9riPGrVHtZCq6uCwZ3g/za2JNlHJ5nqZYdaT+xyC
         fTv1BTLYSd8zBKBnRRX71nla/ZcOF8ECh0ZdsCyXCDIBnqXir0MP/HRm0TDSPZa0gQnp
         IdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682246; x=1779287046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
        b=HfDkLtvr23B6cnNHFhSBb2IPeu/dNZwJ/DDKhwC892ArtGALUhwPY96GbUE9xjGa1J
         9zH8Fppyr//gwZsaqWjkstJxuNdmjfO9/xqyez4BepYt9BN8fP5gzleqd47Swj6smVF6
         NlJSTR0ygKDAhC7lZj0oGPE77p2J5bZ9mfg3i1Ma2fjebmDIxtEz7jp+V8i89nucyb+t
         gNO/moz9lAoq+AXj8BAPFLuSQ7N9r5UQ9503auD3arY/IrlCVI9MjyJXG9a2Gkgx0qpG
         RjHit7M7NTZxY/zYn8j0NCnBDIuAL2rLZ9JIYuBZYRSsjVFKUrEsvW4vUtKLgI/l/7sp
         bT2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/q/eq65Sj1ekKkzKZZ2ED5ypjKVQlbaIyoz5zxvlMfy1Sa3wcGGN/EmQM3NMgGD6D1fT+MiqRgqIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsefFDYnqOSNV4V0ZGoHMZsrPMRDEyT3Gg0WZpeCg5rvXBq94w
	lrEIHd1P43kgNelpyOfIjE7NEqEfpu8FOaWNgc9zMn6F0csQ2WAtn+ucZXThG6JqYN3azpzk1om
	9Y5mfhI5MgvMpT7S3gi6J0yakkGy5f4/tC2tXb+zTBwdMHHt8el7lYr97OVJFz58=
X-Gm-Gg: Acq92OG6yewEphJAZLABPMEOV8VpvZooyIDZxOVLfRwt5R1WrdKAiYwgYoHWqZ6BlQV
	ukp4vR6DRoHIbwzA05Rn9qVhn58ws7HJIQRRbc3hLzr0x+oFOllC2G8hOexcbztwDrMsucWv0NB
	1OlBCIkx66KHhn/PYvS1/A73o9t4xnYDSjyO0MdADPdXE4zuMI7mH899pxzrhau3gIuFD5OQCx6
	y7Kxs8CZGs9qu44AusprCiaaGDUPdFfBi3ozf56m2voYMoMy6X7Onrb2gokTWwFuEgdLp1sduK7
	rP34zgJHLBbznelyeFyLiTSnZTduRhzEiisWsOWFVbHthGEJz0ZHFIEfsgKlHCQy3zrW8Hg795P
	TKY63Di5PVHTT/A+rr7VGNZjjopNajRIQ3LjWY+sAQR+6Bw==
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd2772e10cmr39657365ad.35.1778682246219;
        Wed, 13 May 2026 07:24:06 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd2772e10cmr39656995ad.35.1778682245716;
        Wed, 13 May 2026 07:24:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:24:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:12 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-7-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: a_H2RwSP6xW0HLbxgGpgvjO0aGN8nEcI
X-Proofpoint-GUID: a_H2RwSP6xW0HLbxgGpgvjO0aGN8nEcI
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a048986 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX67OTAC1qkg+A
 WlUOwM2E1Gpq2iBJqbbuLVbt+gtDFk1O2XVFBEfIDvieJ8eh9v/AtlBHMB13AqG4/3oqyCugqJZ
 V2kYEXUaNH9oGFq7LxOYXkb1Wm1w9WEYCIP/n1eT7szllxwCKMXLBg+4O4220kddP3Soh/A/In3
 2SWHdeVm5OCd6Uoa8cd2M2zesdnknRIhM3hfMB1DQUNjO0duFwg/Rx7GcWXyNDQXoa8DkgcEK0w
 AyfL/W8eqejVp5cdSrh7b5yfqKLH/puLvrOthOUKxtpA7b6Ch++GRvJBCHa1wx4VstpACk5i5Vu
 1IoDpsL2nX4tsplmhfFD+oQcQB6UcQFb7aQ4fKiic6yL4y0dbTcJzWU4xxsc0/1WGAHabRRCwXI
 DqAzgxo5CqKw+Q1RCR7fbPVFVhiWIgH6mq5KlzsQ9po9nljMK3l0bXbvwGcDFkbvSZuNKtRp4cf
 926Vf+Rrp7yylRbyAMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..07c871c1d4b0b22ccccd7753e8b7af26811c6956 100644
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
@@ -709,6 +713,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +878,23 @@ tcsr: clock-controller@1fbf000 {
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
@@ -883,6 +916,32 @@ lpass_lpicx_noc: interconnect@7420000 {
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
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1

