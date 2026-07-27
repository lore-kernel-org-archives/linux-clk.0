Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D8B3C09FE
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131415; cv=none; b=IAC2BiSI3eAeIALiG1F034PoMF3cPYncTkhkR0r9yrAVDaq/q917CScyWQIXAwNHBg2962gH7pL/P567t34Ekl2vymLbP2vppJH/YGO39BW/qlYyztNfLWBx8oSa+/vcm1PoK2ZDl4IVhzSfko/Obsl1UIWRK/QqYkNypF5n6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131415; c=relaxed/simple;
	bh=T+/3fSRFw3A8HWWvriA1hEv3HJ1qFSuwfYVycpp4/Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adxFzamtUCPsoBGilr83Nr8QftM/F03QhqBme7V7fGeRcbZ6AkOM10DtKZEOa1XZT+1x3Rhtmq3nYUFGb/09Oh/O17XotpIcujVQ2hC95UfGO/abPLyqncHSczEVBs7leitYF8239v47bmz8B8NVFqN2bsewhKWB/IJngrZI09U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKrbSaUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OH8vpnOe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKrbSaUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OH8vpnOe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g3BB2381874
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rg2cLVCT+7mXMttiqg5O8SDWGQHK5gHK0XrYKUIEYJc=; b=hKrbSaULOFlowtTK
	ajSIGHfYHXc7g91shUf0jOutdf4ALwhW+3VY4pD8w/aoCXL89etqpSEP0eMnLrB/
	BdQTUVFqhH9zjUx6TKJkV1LEp/oD1P2JTPAPdVspibL1gwl1T4iJ5ONsAwohAnot
	dy/RfcEv9ipTBkIkDOXOCcJa6vU+Mc9JAj1O6Y+kZoWk4BUtTeQ6RYq3BRD2/yIe
	Mes11bdHo2BXualqZDJRwEAc0RoHl7ABf3AsVPxUOHoazEAr0S2WlBXF6QbRn4Z+
	tRDE4mYrIa+p1lA7HEdXFQlJiWtM3YeKL1zC/7qWJNtiGRWfElJTMNvLZwXcDteZ
	aF+8uA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vcmw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 05:50:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3026110a12.1
        for <linux-clk@vger.kernel.org>; Sun, 26 Jul 2026 22:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785131412; x=1785736212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rg2cLVCT+7mXMttiqg5O8SDWGQHK5gHK0XrYKUIEYJc=;
        b=OH8vpnOeQC1f8+kEj8nQ9d7IXItiE+0qakhMZyBOKaIT0Q+HNr8vheaC4DJUq4WcBo
         WntYi264RfuTDkTEMqcy1Bjkn3yJIMzk922i/pXK3jtprhNN5LNyzluFzJySA8A+HBSI
         eiealWTFONOX518cV+d1e63HAf6bIXzs29QjGOYnSr4CR1V+IEF2AdNZ0EBCAE3OzqjD
         00QD0mEFc+1h4ZhDKE6muPDn5hBn8FvsMQmFpzSF9X+xGdjHy/jfhCzeoU5LFuwCkehT
         XGMrXjyVqSMoJdRwpSrHSEpsXs1hLwdkboBihfV+idQd6xDzHaq/hBG9LxyJ+tz6d+0o
         BWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131412; x=1785736212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rg2cLVCT+7mXMttiqg5O8SDWGQHK5gHK0XrYKUIEYJc=;
        b=sNjdQ8BHIQ1/kPj/b/lSYxSfClGlbl7c0m0ZTknC5d+6JRD8PjwOjp2WTckmc0HOT/
         4dHvWLGF5MiWVqgyr+xoxhl3AHvcts3VH/qVpuqN6DELg5Dqweh5ULKEQiakhW0Iia2i
         sRhAPHFFNsYOvnjyKEA3xmLvLAradNZPtW9+M94aJXbrGVepypb3fMDOcDkwbrKvlh/C
         VJw6NAgJVUQv3zy/XekU2NOmosifpHINYtv7IqoBA2rbTjwo5Imhhcnt1LNJd3c6bF/d
         1OUkjxJChy4iTgfCVpFm/Ml8ckXKGsOg1aPJkvqhtkvQylRjBfTKhOHs7CSNkGijOukG
         9S0A==
X-Forwarded-Encrypted: i=1; AHgh+RqAC7MVVv2ZNCKJjf4gfux13gwY8/CEH5Akr2eOCWv5zci0Qe000Bil5HVXAb954t6+rE8AY5NJXKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyicm/84gnXwBKqkv3DZJeRV6g2cQ4LRKgpLH3/z/FTRDg7BzHU
	okcP5zPoRwKNyFeqLNMYQQCUvlsUFMmYyPljScT9OWZryxMmAKbTNj6AX4Ph3l9lEc4QtsrCPud
	XYV6EKKP3uqRG9dcfKCctgaC5DCcurTaXtWnsecFIg/xfp+PSsK1HT8E2ssJ9ZyY=
X-Gm-Gg: AR+sD13DTwp5eBTXUvZtUONwux8L/Eog2hqM9b3x8bVOK467sOBn8iMSxU1STdJHx7L
	XUB1tqhj6EwJY4GR6KnWcnO1OTSPQg82SdlWc/11pmIzQiW6TYEem5waI7yl1Tqve5GuoiYbrsJ
	+hzpBW7OBrNu4e+OCe5g8BqDEheUEifHCPIRl7FTfxjLG5bXItUKCYx+GBTlpBomE1xEPTJFNYK
	yaKcuh4+bdL7UrwcDHxQfSxzrD+VTlSceZEB8JMKGuuL9PyeyjkhYJON6rdsSrYRg0lg71mvQqM
	HB4FUJ90Yv5jsS8jh2wc867u0MvfHYXhhl2x0FXWJWjrdCW3moyvam1aWmsupgRz1yhqvsJDb+w
	yNtMjtUpXr9O+y4/BNXE5D2oeroLKndMkG4fArGsIYT2ABnSqpg==
X-Received: by 2002:a05:6a21:4cc1:b0:3c3:c71d:9030 with SMTP id adf61e73a8af0-3c67e1589d4mr7131323637.65.1785131411628;
        Sun, 26 Jul 2026 22:50:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc1:b0:3c3:c71d:9030 with SMTP id adf61e73a8af0-3c67e1589d4mr7131299637.65.1785131411213;
        Sun, 26 Jul 2026 22:50:11 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm27934761eec.16.2026.07.26.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:50:10 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 22:49:53 -0700
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi GPU clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-gpucc-hawi-v1-1-224e7884cf9a@oss.qualcomm.com>
References: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
In-Reply-To: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
To: sboyd@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, mturquette@baylibre.com
Cc: mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        taniya.das@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785131393; l=6798;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=T+/3fSRFw3A8HWWvriA1hEv3HJ1qFSuwfYVycpp4/Vg=;
 b=7jrpdJ5BMg3gXntwVSqpHxb01htVI3XXTgB1sRfa95k7N1tXGGWH7OsPmV2SoxnlVfSa7/SVv
 BE/QzZaU902AVx7gM8JfcwAbtJfpPjGWgM8a5Bi0EM20EGBuJsoytUm
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a66f194 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1q_97lxy2FG9aqMPMkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: rl5qnSwkYazaG6BYgx8-sdq0ThU_HwzG
X-Proofpoint-ORIG-GUID: rl5qnSwkYazaG6BYgx8-sdq0ThU_HwzG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfXxOami9uTZ+en
 PmC+YqyJinrLx0BOFgUhVzp/Ml7uRmNmoyBTDl7iAadgd+6ehQ+alCus9hCLYq+Iy4n1WyKX/Ys
 smSYkRymmn83VIxcaYmUJPyIkrhJ00w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfX3guS1Wvn0iRz
 f6nz6RVKB9+keHH/VfCOq0ar/nz6FjLG4qXDhlU9ZAlxapOOmVrrZbskHdIDenZPAJtyTu5q3iA
 FgH2OX+Hq2uMrnFcyUAr0NAorR6VpSGobEYZ9qdkCHe6T9T/Jx4hUVFO35WvHQOyk3mWscccarP
 uMrdhZtPeAOvpb4vxIgYvfI9nhTSPvUy3idCSz33RwFFnHz+HayWk/GAAi2x5hN8OcZSDNQCJd4
 1DbUy2LQV89IIIOiipTN38OlVy4BaSYQU8+FIb4NzENhpfupgKKjZdH/YGoMQ4e3zH+N5P34BV/
 Obc9wlMRE5n9WiiR85qLkHJb3DQi/AF2brJehpMfMGFoGzK/awBagFFrebDXJOA4UbsUizybPDu
 NzhfpmSTkJLjBkVHrimtLtrkS2TRRkKyjl6ca55qjA19V528eR/kcb54hShrqyqOUWvz2uZaCZR
 ZvzzScxl4xNTNkl/x6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270055

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
index 000000000000..3ba6e4d212ed
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
+      - description: A phandle to the CX power-domain
+      - description: A phandle to the MX power-domain
+      - description: A phandle to the GMXC power-domain
+
+  required-opps:
+    items:
+      - description: A phandle to an OPP node describing CX performance points
+      - description: A phandle to an OPP node describing MX performance points
+      - description: A phandle to an OPP node describing GMXC performance points
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
+            power-domains = <&rpmhpd RPMHPD_CX>,
+                            <&rpmhpd RPMHPD_MX>,
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

