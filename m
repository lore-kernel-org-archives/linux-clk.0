Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A143F35F18D
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 05:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477234; cv=none; b=bCR8d87YD3HFcvD9jbhoSr5ihvDt4p3yXQ0S8I8BQ+YjmMWIRcXWdc8FKEpF5ZbCoKGe/wdRRaqfmSY1mVFRFaDJXcAangaqXIfZhJnwGsLfNvRLb7L7IfVA/GnhcNUnWeQCe7/p0HtlpvYmUIViHwbIAFtv03CWXcpWudQf4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477234; c=relaxed/simple;
	bh=TbWn2omPVPJIUFrb413uT0CtEMn7ALcSOCfFDea8q0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4+GWU7sDaAQjt7XexTkV1EUcwjHgXqdUmyNPai8OX5uA/peswNxqYqykHeBolC/JVFiGOtsME+KAisp/mh6LhudQ7n+I58MqPawt3/7UmyOzy+jIesZ4YQTeOSEdVitBnZPg0/blXGht5Ed8m7KEK9mxmmci26MpzgL+PKLkGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYeqRl0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQTFw7QJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYeqRl0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQTFw7QJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5F8c5028616
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 05:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6XBW2VUOMNQTO5Y3M800/LxQKX1APaxx1lbkAE2luv4=; b=aYeqRl0edc5CDyaN
	bYQy48/jHDbsg3yC8Lv3J98el965SUJJjH6nK4BNc/CccvwSdK4QPFCothHjAFDa
	frfFNTbd9Bc72IwmDqT3Ot8QwVcppNsbncmWYxTUTE9laFaakZ1czHH2eNpykMaZ
	r5URikCdqfscqycBn5aXE+TRepAjxyko2fr+EvuYuRWR57TQ4Y+sAZ7nMMykpd4L
	MJj1lzGdiZQYAc7GxgLZgBaNlCgLDIYV1zauePHs9w9pJ0XJDoyzW36yv+uqS+u1
	Ri+RzWSCh8tUvCjgbE1vRrkVWQGBfMGQTlen5qNK2Y7XMzZYSEOlEUDQ4ovwkFYi
	iqAIqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnd5844h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 05:53:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so498446a12.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 22:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477231; x=1786082031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XBW2VUOMNQTO5Y3M800/LxQKX1APaxx1lbkAE2luv4=;
        b=RQTFw7QJvNVjLbYBNQJoIIYHEhkHfgzfLql1Ns0qEpo0F+ddWAfeTk9ZEWemPiLOKK
         A6E7ZStabvEMmLAYkS2KmjUrl1V286n7ROJSFEkNZLBApZ6liaJfnFW9pv3xN5FK308o
         GPZ7MUhGFF3h3zxdXyAZLN9NIzSFF+7B6LYeS40lh/QQjzw/hTZtbDtmRZiXXjUIqDSF
         xTZTdtXC7exTSUCpryxUPgSaEEbGLP6yjnUTyBCKuCRTshYyfXNz2QbTS6bz2oSwXAKF
         qSKLeeWAII4jxRgTciLTnZO3NIBx2agGMr/jwlWhkPf1VXFFN7rxSZo/9dWt6StsuWev
         nxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477231; x=1786082031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XBW2VUOMNQTO5Y3M800/LxQKX1APaxx1lbkAE2luv4=;
        b=GvzFCdSO+QVcUaGBr4yZEJpxftvW8tS6NnJy/SjtFtlgMsb1uflwkeiALBoDsqlH/D
         9TksO98V9Jop8rb0TBUhXFZJKziZaHoXD8BFep2k1BniZb3UB0puVU3SPOxLWAoZICEq
         yW6eyE+cuv0I1dFLvXUSVcIlRXIOaaXJABAlmcKf8xNGWLe+N4ydKOPMvuEoHYsRcagi
         4IG7WCeuZvXWENJRWR109QXF8l2hrDddKHxjuFrXTQyW8fJuzY8RRcGzq2zKDguQzexQ
         bJ7ryTZwNvuTfWB3S6irpYXd7f43btFoMYeWG8/43MkezT6nHt3W4vL0npzzDCSHtJUW
         qXGg==
X-Forwarded-Encrypted: i=1; AHgh+RoyHcPVHJLNv18FoYD5eGUHTH4pkw98CTpnHGBPooQjiPYc954TjRLK1UBC12TRIar6iq3dYxuPnDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfAtG5CW8FyIQ/NJ8iNI5FIWc1Mp9CVPr2p2EwZEZnOwhSjkG
	Z8JYunAQWtVzqXMNAX+4/X8eN1QYAbosbfDnA6h65l8o91j5GGVlfwKAJCYry7YvfE51vJLC1Cz
	uxPSSYaJpveOKhmuD3akzTX3NY+WywGlv0hHfxpSxRIjLlyuMiIUTzJOIc/9ybtQ=
X-Gm-Gg: AR+sD10OC/8SGOPCwHU62ek2PQVKf/l04KokzrMrtVVe1Em4X7tpxxrpNej0LK8EowX
	xnhVCbhBzG9Qt53lp+v3KzmUo+ybc+vrToW6YuD5ySvNHKx0hBaVdESu7Pn+eWnvigpvNT1lIn4
	UnoRhomdPbyovRR5VuNXABw0P+3S3iJQU7dwgeaUvafCPc5ifK17XYvGTiT7nvFrs9pHljJox3O
	Egi92H5BcurjpiMzUxT6mZpZ4IhprTCUwsynwgMDrU8VeOhfOsPcawL5H7Q2YZEHY80n9ML0tPn
	MFs+jX9Y2kj0J60SlGrEdWQaVRGZdeh4W07qzUfK4machgCaQA++UufNhbXhzrS9x6sUVF32eC+
	95jZLixnd+dmYOAQeakGM4pW5RweBkvokAATG7maZedGWipxLAA==
X-Received: by 2002:a05:6a20:7b20:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c91b0bf2a3mr469230637.5.1785477230811;
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:7b20:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c91b0bf2a3mr469213637.5.1785477230358;
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm1643675eec.7.2026.07.30.22.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:53:48 -0700
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi GPU clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.com>
References: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
In-Reply-To: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
To: mturquette@baylibre.com, robh@kernel.org, andersson@kernel.org,
        conor+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, taniya.das@oss.qualcomm.com,
        bmasney@redhat.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785477228; l=6690;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=TbWn2omPVPJIUFrb413uT0CtEMn7ALcSOCfFDea8q0o=;
 b=Lpr4jff/WunGOZzFx51LAO2b7vBuX/mRxMATPtmKcSQw8y0hQsi014jobANWP5t3BXl4rSpLf
 5Tjja03Y1yvB12BjBvWPsasxG+py0F+2kD1Obe+0s05xenvIizYm26t
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-ORIG-GUID: HkiEfVvT9LmXucPl4cBIOhSfbS0nJWoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX19008RZmeWsd
 nq3rHWXuscNEmpbFGBktXTknUg9yppaDHhN22AoN4DZVCL2Cln1S0CHs8CXNTqrLZ/VyxrjEDAN
 2LlNHuMFhOBN0j8zkBuF4b/WITun5Ol4F121eYrjluBs9ISZndSHfessJzSjf1vGYJE6iOtHIwS
 /ocZGqG2zfgHAq3T/XwDM+K+cFoduS1WfgRhO6p5LTa8oCzpJiPzqQRui7W3slTbiDdwXbXKe6s
 ouMECelekQfR8Hz82G0kCaIpMgfpsNGmZYJXBbVBj4/G9v11/JE7Y4hPO/aFbeURdbFbcJd6OVg
 5G9jxtOHtxYZ2JXDUUsvFEkPvlcZXMPCic+QevmJJ9DCePYcsZpJ9wNXnZfn97G+d917i4kLFM5
 bmGoRZ8MPAXjRKR//+ZhsXIofnjtne+BIWDLBBuhiVBkGBrUUMfvzQ3sJ8cmTUHrCQjsqts2yC0
 mMl6R/hH/RQvtOHqIeQ==
X-Proofpoint-GUID: HkiEfVvT9LmXucPl4cBIOhSfbS0nJWoS
X-Authority-Analysis: v=2.4 cv=MLBQXsZl c=1 sm=1 tr=0 ts=6a6c386f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1q_97lxy2FG9aqMPMkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX4iFgP1JPwk45
 lmPLRFUlRjyghfgwfgV4NG6X+j4HwK/rsdyOZdNyV7706MlTQwT1Fads5xvAjRBqVdA5lQ2uVFn
 eFjOa2Yp9rGTAj59YKpCT3tcfWm7CSo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310038

Add the device tree binding and clock, reset and power-domain IDs for the
Hawi graphics clock controller. This lets Hawi device trees describe the
GPU clocks, resets and power domains, and lets dtbs_check validate those
nodes.

Add the qcom,hawi-gxclkctl compatible for the Hawi GX clock controller,
using qcom,kaanapali-gxclkctl as the fallback because the register layout
is identical.

Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml | 78 ++++++++++++++++++++++
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 22 +++---
 include/dt-bindings/clock/qcom,hawi-gpucc.h        | 47 +++++++++++++
 3 files changed, 139 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
new file mode 100644
index 000000000000..3e40bc3c061d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,hawi-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on Hawi
+
+maintainers:
+  - Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
+
+description: |
+  Qualcomm graphics clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also: include/dt-bindings/clock/qcom,hawi-gpucc.h
+
+properties:
+  compatible:
+    const: qcom,hawi-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+
+  power-domains:
+    items:
+      - description: A phandle to the MX power-domain
+      - description: A phandle to the CX power-domain
+      - description: A phandle to the GMXC power-domain
+
+  required-opps:
+    items:
+      - description: MX performance points
+      - description: CX performance points
+      - description: GMXC performance points
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d90000 {
+            compatible = "qcom,hawi-gpucc";
+            reg = <0x0 0x03d90000 0x0 0x9800>;
+            clocks = <&bi_tcxo_div2>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            power-domains = <&rpmhpd RPMHPD_MX>,
+                            <&rpmhpd RPMHPD_CX>,
+                            <&rpmhpd RPMHPD_GMXC>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d3>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index e868963f659b..28b653f6b64d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -4,25 +4,31 @@
 $id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Graphics power domain Controller on Kaanapali
+title: Qualcomm Graphics GX Power Domain Controller
 
 maintainers:
   - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
-  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
-  Power domains (GDSC). This module provides the power domains control
-  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+  The Qualcomm graphics GX clock controller (GXCLKCTL) contains PLLs, clocks
+  and power domains (GDSC). This module provides the power domain control of
+  GXCLKCTL on Qualcomm SoCs, which helps the recovery of the graphics
+  subsystem.
 
   See also:
     include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
 
 properties:
   compatible:
-    enum:
-      - qcom,glymur-gxclkctl
-      - qcom,kaanapali-gxclkctl
-      - qcom,sm8750-gxclkctl
+    oneOf:
+      - enum:
+          - qcom,glymur-gxclkctl
+          - qcom,kaanapali-gxclkctl
+          - qcom,sm8750-gxclkctl
+      - items:
+          - enum:
+              - qcom,hawi-gxclkctl
+          - const: qcom,kaanapali-gxclkctl
 
   power-domains:
     description:
diff --git a/include/dt-bindings/clock/qcom,hawi-gpucc.h b/include/dt-bindings/clock/qcom,hawi-gpucc.h
new file mode 100644
index 000000000000..181534771b10
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-gpucc.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_HAWI_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_GMU_CLK					3
+#define GPU_CC_CXO_AON_CLK					4
+#define GPU_CC_CXO_CLK						5
+#define GPU_CC_DEMET_CLK					6
+#define GPU_CC_DPM_CLK						7
+#define GPU_CC_FREQ_MEASURE_CLK					8
+#define GPU_CC_GMU_CLK_SRC					9
+#define GPU_CC_GPU_SMMU_VOTE_CLK				10
+#define GPU_CC_GX_ACCU_SHIFT_CLK				11
+#define GPU_CC_HUB_AON_CLK					12
+#define GPU_CC_HUB_CLK_SRC					13
+#define GPU_CC_HUB_CX_INT_CLK					14
+#define GPU_CC_HUB_DIV_CLK_SRC					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MXG_AHB_CLK					17
+#define GPU_CC_MXG_XO_CLK					18
+#define GPU_CC_PLL0						19
+#define GPU_CC_RSCC_HUB_AON_CLK					20
+#define GPU_CC_RSCC_XO_AON_CLK					21
+#define GPU_CC_SLEEP_CLK					22
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_MXG_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_GMU_BCR						3
+#define GPU_CC_GX_BCR						4
+#define GPU_CC_MXG_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif

-- 
2.43.0

