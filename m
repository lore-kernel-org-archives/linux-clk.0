Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC238AC9E
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686121; cv=none; b=t0YAtK9F6U6XV5957AFJnIDAkKG/XDk678o64toeWBVx6GzrNQhcoLaGxKMwene43+nH5GpkWRg8h2nuaFByqjLCA1eCq3SyphRWbHUu9QtRznNboDJI6NngELoojw7VZRKLGcGM2dhHRgxzW2K20hHsb9homb3GONJr0F0hxIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686121; c=relaxed/simple;
	bh=Zet80yGH2Wsf7rssHrQxPFjARZlF0KRaDSyB904g8Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDwcIApAdSeqXPtqR6gtkqaSqeVhE8LbyAam+NxeIN29AD8eX4K2JxCFMPrin5/OR9rSJLYSUhz0gnoMupfvH1sybTYmMmiqKO/UuxJQLBWm5c35bBHPb7Vm9+WYx2UCMBlnsQa7iRm/MOL0oaf1zrgxXqzmAg8Kha5e2iY/V9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NugxWcVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBxQTCnR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NugxWcVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBxQTCnR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF49hY2887975
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=; b=NugxWcVnbPC0SIzn
	jD5buxOhkIkG+XVwRsLyXqay5wcrGanDz85Q6clFz0r82jB+Wphm9XU9CbqvUJ8R
	ejeqQKBmbdZ2hmq1qu+X4yMjce0bsYYG/rq7BCPftggA47GnmyYtefj33/gdOb7B
	stbxsiagNbESjC9tq2udMGWmZEKqtuxwXwewIkzd1kEl3CqqIHLkHJ4uRzZa9xax
	nDU1miCehQv66Zmts+T1YdaaJp3N5CkveTe55KjyvGa6buhpDp+KyQFl4pNfdm3l
	TFzHkdgr6bZTyMx4HavY7fwqWmaSRwOwJ7JffNAClPfUjqOUewkTWJRTMps4ksRs
	sYeBuA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghk6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so4914045a12.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686118; x=1779290918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
        b=VBxQTCnRmG5Iy8kGrzYxN087G2AakQi6N3T0XDAq8eZsD3GDKUGe98WroCIR9vzxAv
         a2DuyDyi7SPIlAYQlkMK8WN5y5aHnWxqPdhG6ZBVNRjA5L76kDZWHYXFjkXje9nkbmse
         27BtLZWoyQIRSYJq4TpxpYy3IzUWluR0K7GfB/awNTZrHBzZtSMQNNA8q4Xz6Ew/tugz
         a+6Ku32AY7N+HFAAZ29YnlAkz7xk6jGfLrIvbhk/vtbEXqjL0BzDGqd0lDBe5U6e4f0s
         vdKSH3mYNRvABP1BnU7T/3rttBGZC9hr+8zfYTFZFbTF1BkJUa/SZ8c5ecjjUtsD6mFK
         VmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686118; x=1779290918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
        b=b/CnKeHuHWs9x5cuGPL1F2Pqs7pSu8x8HjzMkFW6hfIR5ZOTQjIbTkiYp7gL55Yw+Y
         DCEiyYNJ5TlwljGPkaC7HTQHq6qfZ9oSgGN3n9rqqOzn+3vSZRzzwhRkLENtFAsZlbrb
         LzOJEc6KwJvF2FJzsTIjlc/Mh5dw5HZEj/nlwb7HyvpUK4p8zQmskqzXgb0NpzgLl+lw
         es7E7xTX9D7IrwTBk1oUz7CYap+ZxdlihnrDnwe17qfpMLjrVjOEJRO5Fw3dIrNdofRG
         b5RLkjWiss7avqMXfXhPlan9AyKFTZHUYR48OSOEb7ejxLPzHiVJdCAfrC9rsC/bA8Vi
         q9DQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nl4qfyxw7lF/NtHVjJK3z4ELBvX7zneOclO7b4YGyx0LvRYJL37yj/24CLjHrJTYad3oZoi2FC2A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf957lzER9o1Rp8wwo7HHxHNCITUB5oO39Xis95hDGMRPSX/TQ
	5nnQrrxfNFlJMbqhrWmCKYoaxghaDXIv+uKUvUyZqQ1ccXZ0uVzu3sO1GqwRDylhuclvzCdsMV7
	rlefBPoNhFqoSO3mG7kHdM66QpSHUNc+srb9fm25GwbUwbduYg7zFX+XkYEGxScw=
X-Gm-Gg: Acq92OFqLezzjw/q4rRLw6JTXhAhHMur+4CUkOiD8MvOytIXjSRTSZAPlBktBgZBuSU
	7RJ64EKF6iliI3/75fMzTtE5uxBtWi9t18atSrnt+L2Lccqdn14vNaLrzio0jH8l8TWkSL7s7YN
	XdsHArQiDfkuJEwlzNBoX3Tn+lmuMX0O7EdUGWPek63iKIFmQe2wsOklpZhj9twrNHfU37Cy/9D
	YDs8WExjNG4BYm/sJfKwtlaI0oQcWUab3xJiIzGOjOnYbcRJBsWMLNXYKA0cGui64LSLQhHAg+0
	QSzRfYXb6PElt5EII746s76goaTEt0PQeZY5bo8rZcDtm6DmqdbIyXzaS5iysL5suvWU6F/hEOj
	mkc/+iWlLmfWgOuEEe5ParECjZj7fqIbMVq5rSTaDI+mPbg==
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id d9443c01a7336-2bcfd379c0amr80738135ad.15.1778686118404;
        Wed, 13 May 2026 08:28:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id d9443c01a7336-2bcfd379c0amr80737665ad.15.1778686117892;
        Wed, 13 May 2026 08:28:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:28:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:42 +0530
Subject: [PATCH v4 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-7-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
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
X-Proofpoint-GUID: ml5O0ViZpzVtX1DLjMhajNnTFDMANyXu
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a0498a7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ml5O0ViZpzVtX1DLjMhajNnTFDMANyXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX/251/HJtQETv
 QPOuu3mCRxaB3KhXNgPCH2fT30Fc3lnRmbvua5op6o83FsFMy/3nEsB1+DKgDAuniRWK/N9R1rv
 sXjaNXQdn0tR7SAR98xgxD3CPBXzXKMExqnGfWJwrMvwlQ4X9sQGdcUTFJNXwIQIHDXAbCpKNXS
 1I3zGU+ZXqOciAeh4uTt2vDdoOLG75OLUNq1bOAZRejN0CADKpj9euU3YD4KhYH1UUwr6rmSGTV
 OolGVTq5+ecsEv3sSbZS8jReJZLnxbnSCTiEw9NokXRdeL3TihKPK+nH+FKwnu6IB+vcAsI9hV9
 Sig4LSz36zkqXFeDFpXdhNAlxBsI/OR0OQ4tLHV3iJe4u3+IyPnzbcgGVsJP4zk27RpO+Bsy8j4
 UQYXDBUEEDQlmbzkrCOMvFWoFSnIoVM/C6WzsRCmJhneOv0TbactNdi48EzEVgWvKFVjguVWfQl
 Ql3NNbwEfhko2WwsakQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..1a47eb2a865717dde3fa0ff82665eecc8ffb87e2 100644
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
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
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
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
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

