Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64434BB286
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493593; cv=none; b=s7lMeKH4aSjog7RUydsmVXf1kFlcURx/NYXYgrazWIckr4jNH6PR2bNP9o7tp/Q4YZP57FsmGXSzphAHWqjf6pCgpjFZluPaH8aRCu62hXybiui6wvjEkV21fDodc+fp4om0rCKFZnLDoUdJtHyDmHUF6X2TnlcoM+L6VOMYFx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493593; c=relaxed/simple;
	bh=I5v3k4KuCQbDP/nwqPNIehICVFA4lqZJpL+PQlwxs+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaZgK3vHWNwkrjdJhFIWuWZMGHkUuhoEs4HfoIQuRXOt3xOisMLCC/2crt/k1Jp779UGdKaPav3R1a/O0H0sINLz9N5e/3RPCFcti0T2bQ7XvievkiVt4ZBo0hRsvrJjiCvsujZQcvm9ycXHEhT1eleNTeObWTAgU621A0zPyvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLTG3f/M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRrVrPaY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLTG3f/M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRrVrPaY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAUhR4176154
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 17:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4vtp18wWQHp5KYe8UnvPGPb7uXRvwtbsEkiZ41f9Co=; b=FLTG3f/MYbGSp6D/
	jyBMg6Ghf7h9DnJjzTfkLDZmf/3SN7wGmPOclHtjdMofQ/uJJyAy3xaC4pEyEcqp
	WO0ojR4neoOAzO2PhEK7Ch128GGLiBBw6b0tkznW5V9f4hEoArEgl+lU4NeSSBp2
	l1bPAvySWqfcxlGu8l6tEph/POfPWF45vSWIpQUClC+7Jy+sGFdt7yt6/Bl4aADa
	atL56qk+QQ7Q/q6VRDZm+4KdScCmLFRlIi/DoNbsMBdxFEQMyPFokxbxaKL+fT0h
	6uX+t51M5hPDIh53Mn8JiVcEOuq39tLLqtYpKgXSfEHspxPjvJt3cyK7HOGv+VT5
	tf7wlw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc2r5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 17:33:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso61276595ad.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789493590; x=1790098390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4vtp18wWQHp5KYe8UnvPGPb7uXRvwtbsEkiZ41f9Co=;
        b=QRrVrPaY+wWpFyRFiMrfeNkloHLNwdxpQRlUlwIb94vCHqodx6QFdADA51slvuP+nu
         xDAaHbLXbsbvV9fmrFXpYUrAXDjg8hZwZRgzJ7FFWoJII1m2mNhtIgBdje1InQyGCWtq
         6/o8Z3g5eiYAc1xKrLrvxpL1E1JuIqkf7/ZP012QYgatsJC56Vdn8tNXelwAaUIrqN7K
         6Oomv48c1hVXNSvttkTOTmEZTZZFAAnQ+HAI1BdKIA8RJuQHMMnoJ7XJ6BCNyDrEZFXw
         Ihq8RZ0Uph711i9mXBQxIkJhj+j6QeApOD6rxjfu3AfZ2JgO+yMYLFg8mawaeu9EsYrq
         ciEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493590; x=1790098390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4vtp18wWQHp5KYe8UnvPGPb7uXRvwtbsEkiZ41f9Co=;
        b=XaJi/zN0ODcmlN/l/v4RhVBgYZaXMTQp95nctbMxY7Ri274IC3OGI9iy5NF+BU/c9J
         XLuioaeqCcl4lBbC0JcWnfAw6ffb0wFTGm51wz1PH2O/fWBecJtfl2FdTo1Rzs6yKwCa
         S1q8JHxJ/PSRz46NIgrh5hhpWZIXVe85aXJeTgdELL+YvGi1/uCygjx2P3ruBIlzzeKb
         2dE29tiluUwelmHvuEDgsGkNyIDVOerxOwOLWTnfgTFhMaXVDcUV4PxQVyPUVW6THZpb
         oAeAcA+hT2rH6dBrhLpH7VEgp0ktCRohD9g8A7u22eHu/hGzi42I2z4aal6C4npgKQlO
         DnaA==
X-Forwarded-Encrypted: i=1; AKwUvBwuyIFl3CUN2N2bvKFQqaOfYsPCMXuvAdKz6juE60WgCOBkqupo4JnQ8pchY1IRALvMMYUP3n6ygHU=@vger.kernel.org
X-Gm-Message-State: AFuF++kwTicD7YFCeAaP+0dFC2kgkYmBy4PfDVgx9KqLb4PvEdwK27ur
	qPCffWy0eTQ37ihdUr2hXqMPt2SaE4+QiePGoiZg0HAp8iu0CYvNOZqevwoJ2ESs/bcGW2Oglew
	JggiCYqnaUJdnoIC8AGB9n9t79G4+9+3sWrD5QTd0S1E5WyzrGYHevFZNgQjED3c=
X-Gm-Gg: AYBFou2AWnALw+KEA+69sAFCWjE5PwwTZm/K0yFm0AQjbAXoVuAvtYeRfsl2ydZbyEe
	M5syhdIwkJIwlNrV8HJceoXZABoCll6E+4L6yWIJEE33MKe5UrQQZxrGU8gr8h/p9wF6KORUqEq
	3c+tOgo1FkVGxtbYpi7N+gUeH/5YpWz7Snr1qZp70NgZUbIbcTh5RExBLSTDP8caM3+GbrtCKOD
	zvG7hFPXvOq5RsCUmJS6JqG4XxwYIbziRkUeQzDzqDrNttkgevoxkZmc4x409MINaOLmKYV2lCB
	Yb+rNFq4lHjVELhMsICOCi23MGGoUE+XfSl84vkGDLLvhM8Zdq0F7iCQx1FStZh17NoIZF3O1Zg
	dO3pt86O6SonSlS1B6hIWjenpp3gMEnHhVr3E3DdWRvT8duIkHsZFw+E=
X-Received: by 2002:a17:903:22d0:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2dd6c70ac50mr176323885ad.17.1789493589924;
        Tue, 15 Sep 2026 10:33:09 -0700 (PDT)
X-Received: by 2002:a17:903:22d0:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2dd6c70ac50mr176323085ad.17.1789493589316;
        Tue, 15 Sep 2026 10:33:09 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm71567305ad.62.2026.09.15.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:33:08 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:33:01 -0700
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add Hawi CAMCC compatible
 strings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camcc-hawi-v3-1-5b57f45477f1@oss.qualcomm.com>
References: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
In-Reply-To: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789493584; l=10553;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=I5v3k4KuCQbDP/nwqPNIehICVFA4lqZJpL+PQlwxs+k=;
 b=mycYEnsHOhRmgEZhUAQqkXpOO8whLASG7FbRTznuGuW0GpgeqQ3Qg/giRRsCXDOUv4jhmE7oU
 d+Nkq5+j/mfDFUrrLktpxjLLCwO5TfYaMgvYcM+PnhejN/kyn5fDVN3
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: GxtTCfzyxMtwnuNp1IBBvbmV2bqUwcPh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1NSBTYWx0ZWRfX1b7CEdCLTbwV
 btX5LtsjuqCA02/r09xoe5T/svnDfU2btLr96nbMdrM2HqLbXgjHwmQ8OepqLnIJL4LwgBzlU3d
 yTCsbyKGVJaoRv+3k2JvnbRspUP0xAg=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa98156 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RNlHf_2cRKinjC6Nl1QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1NSBTYWx0ZWRfX6MEzi+m0+pDO
 9yyEfLQHtAfH4r1j5Gcb8jLNYkciMrPdHZErV0+b0Pr0akBHzK06Y86G/3YyVuDRV3NAnErRXhY
 9+IJj2Wqit5WwBb7JXOY7nM8AQuNEq8SbUbP4pJpTRazXWfpKxgdw+63eUOpf4epKGw0bcbviZH
 kWpkqbMcMnfYcY1iR0bgxS1Q+NK8I+KgjoUxcYPi3h3QinUHhRqBpBZ7JLnNQh8mdGzSOsm//8W
 6iyA7HCzCb7pI7qsJDTsRVjQlrfGEFfv5JgnqcbB9dpsmBYQRlIyaPFyYKkh/QKuBXq8PqKASgS
 my42Hofx3SsKBoHMkKIwC1RfM8k3Gfh8a6q3B73JYcCzQcCYZgbjPIFFfSn8jviAMcbbgPkSJB6
 xp/vnDCB6KvGuNN9uK+1WGf7j4adEOtrAVzY6YpYX5+1FxwN90gWtHOgPY1XR2pCKwmRGmK/aAK
 Ke+i2v9gV1dtNRhnwEg==
X-Proofpoint-GUID: GxtTCfzyxMtwnuNp1IBBvbmV2bqUwcPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150255

The Hawi SoC is a derivative of Kaanapali  with an updated camera
clock controller (CAMCC). While the overall block structure is
similar, Hawi's CAMCC differs from Kaanapali in the following ways:

  - Uses Taycan EHA-T PLLs instead of Taycan EKO-T PLLs, with an
    additional ninth PLL (PLL8)
  - Adds a SQPF block with its own GDSC, AHB clock, and BCR reset
  - Adds a CX GDSC (CAM_CC_TITAN_TOP_CX_GDSC) for the camera subsystem
  - Expands ICP from one to two instances (ICP_0 and ICP_1)

Due to these differences, Hawi requires its own 'qcom,hawi-camcc'
compatible string and a dedicated driver.

The BIST MCLK clock controller (CAMBISTMCLKCC) is unchanged between
Hawi and Kaanapali, allowing the existing Kaanapali CAMBISTMCLKCC
driver to support both SoCs without modification.

Add the 'qcom,hawi-camcc' and 'qcom,hawi-cambistmclkcc' compatible
strings to the binding, along with the corresponding clock ID header.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |  43 ++++--
 include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
 2 files changed, 198 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index f65380747220..e2a126925e9d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -16,6 +16,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,hawi-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
     include/dt-bindings/clock/qcom,nord-camcc.h
@@ -27,16 +28,22 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-cambistmclkcc
-      - qcom,kaanapali-camcc
-      - qcom,nord-camcc
-      - qcom,sm8450-camcc
-      - qcom,sm8475-camcc
-      - qcom,sm8550-camcc
-      - qcom,sm8650-camcc
-      - qcom,sm8750-cambistmclkcc
-      - qcom,sm8750-camcc
+    oneOf:
+      - enum:
+          - qcom,hawi-camcc
+          - qcom,kaanapali-cambistmclkcc
+          - qcom,kaanapali-camcc
+          - qcom,nord-camcc
+          - qcom,sm8450-camcc
+          - qcom,sm8475-camcc
+          - qcom,sm8550-camcc
+          - qcom,sm8650-camcc
+          - qcom,sm8750-cambistmclkcc
+          - qcom,sm8750-camcc
+      - items:
+          - enum:
+              - qcom,hawi-cambistmclkcc
+          - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
     items:
@@ -45,6 +52,10 @@ properties:
       - description: Board active XO source
       - description: Sleep clock source
 
+  interconnects:
+    items:
+      - description: Interconnect path to enable the MultiMedia NoC
+
   power-domains:
     description:
       Power domains required for the clock controller to operate
@@ -80,12 +91,22 @@ allOf:
     then:
       required:
         - required-opps
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,hawi-camcc
+    then:
+      required:
+        - interconnects
 
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sm8450.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8450.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@ade0000 {
@@ -99,6 +120,8 @@ examples:
                       <&rpmhpd RPMHPD_MXC>;
       required-opps = <&rpmhpd_opp_low_svs>,
                       <&rpmhpd_opp_low_svs>;
+      interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                      &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
diff --git a/include/dt-bindings/clock/qcom,hawi-camcc.h b/include/dt-bindings/clock/qcom,hawi-camcc.h
new file mode 100644
index 000000000000..6ef731738e6e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-camcc.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_HAWI_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_IPE_SCALERS_CLK			6
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				7
+#define CAM_CC_CAMNOC_NRT_SQPF_CLK				8
+#define CAM_CC_CAMNOC_RT_AXI_CLK				9
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				12
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				13
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				14
+#define CAM_CC_CCI_0_CLK					15
+#define CAM_CC_CCI_0_CLK_SRC					16
+#define CAM_CC_CCI_1_CLK					17
+#define CAM_CC_CCI_1_CLK_SRC					18
+#define CAM_CC_CCI_2_CLK					19
+#define CAM_CC_CCI_2_CLK_SRC					20
+#define CAM_CC_CORE_AHB_CLK					21
+#define CAM_CC_CPHY_RX_CLK_SRC					22
+#define CAM_CC_CRE_AHB_CLK					23
+#define CAM_CC_CRE_CLK						24
+#define CAM_CC_CRE_CLK_SRC					25
+#define CAM_CC_CSI0PHYTIMER_CLK					26
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSI1PHYTIMER_CLK					28
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				29
+#define CAM_CC_CSI2PHYTIMER_CLK					30
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				31
+#define CAM_CC_CSI3PHYTIMER_CLK					32
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				33
+#define CAM_CC_CSI4PHYTIMER_CLK					34
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				35
+#define CAM_CC_CSI5PHYTIMER_CLK					36
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				37
+#define CAM_CC_CSID_CLK						38
+#define CAM_CC_CSID_CLK_SRC					39
+#define CAM_CC_CSID_CSIPHY_RX_CLK				40
+#define CAM_CC_CSIPHY0_CLK					41
+#define CAM_CC_CSIPHY1_CLK					42
+#define CAM_CC_CSIPHY2_CLK					43
+#define CAM_CC_CSIPHY3_CLK					44
+#define CAM_CC_CSIPHY4_CLK					45
+#define CAM_CC_CSIPHY5_CLK					46
+#define CAM_CC_CX_GDSC_CLK					47
+#define CAM_CC_DRV_AHB_CLK					48
+#define CAM_CC_DRV_XO_CLK					49
+#define CAM_CC_FAST_AHB_CLK_SRC					50
+#define CAM_CC_GDSC_CLK						51
+#define CAM_CC_ICP_0_AHB_CLK					52
+#define CAM_CC_ICP_0_CLK					53
+#define CAM_CC_ICP_0_CLK_SRC					54
+#define CAM_CC_ICP_1_AHB_CLK					55
+#define CAM_CC_ICP_1_CLK					56
+#define CAM_CC_ICP_1_CLK_SRC					57
+#define CAM_CC_IFE_LITE_AHB_CLK					58
+#define CAM_CC_IFE_LITE_CLK					59
+#define CAM_CC_IFE_LITE_CLK_SRC					60
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				61
+#define CAM_CC_IFE_LITE_CSID_CLK				62
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				63
+#define CAM_CC_IPE_NPS_AHB_CLK					64
+#define CAM_CC_IPE_NPS_CLK					65
+#define CAM_CC_IPE_NPS_CLK_SRC					66
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				67
+#define CAM_CC_IPE_PPS_CLK					68
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				69
+#define CAM_CC_IPE_SCALERS_CLK					70
+#define CAM_CC_IPE_SCALERS_FAST_AHB_CLK				71
+#define CAM_CC_JPEG_CLK						72
+#define CAM_CC_JPEG_CLK_SRC					73
+#define CAM_CC_MMSS_AHB_CLK					74
+#define CAM_CC_OFE_AHB_CLK					75
+#define CAM_CC_OFE_ANCHOR_CLK					76
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				77
+#define CAM_CC_OFE_CLK_SRC					78
+#define CAM_CC_OFE_HDR_CLK					79
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				80
+#define CAM_CC_OFE_MAIN_CLK					81
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				82
+#define CAM_CC_OFE_MP_CLK					83
+#define CAM_CC_OFE_MP_FAST_AHB_CLK				84
+#define CAM_CC_PLL0						85
+#define CAM_CC_PLL0_OUT_EVEN					86
+#define CAM_CC_PLL0_OUT_ODD					87
+#define CAM_CC_PLL1						88
+#define CAM_CC_PLL1_OUT_EVEN					89
+#define CAM_CC_PLL2						90
+#define CAM_CC_PLL2_OUT_EVEN					91
+#define CAM_CC_PLL3						92
+#define CAM_CC_PLL3_OUT_EVEN					93
+#define CAM_CC_PLL4						94
+#define CAM_CC_PLL4_OUT_EVEN					95
+#define CAM_CC_PLL5						96
+#define CAM_CC_PLL5_OUT_EVEN					97
+#define CAM_CC_PLL6						98
+#define CAM_CC_PLL6_OUT_EVEN					99
+#define CAM_CC_PLL6_OUT_ODD					100
+#define CAM_CC_PLL7						101
+#define CAM_CC_PLL8						102
+#define CAM_CC_PLL8_OUT_EVEN					103
+#define CAM_CC_QDSS_DEBUG_CLK					104
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				105
+#define CAM_CC_QDSS_DEBUG_XO_CLK				106
+#define CAM_CC_SLEEP_CLK					107
+#define CAM_CC_SLOW_AHB_CLK_SRC					108
+#define CAM_CC_SQPF_AHB_CLK					109
+#define CAM_CC_SQPF_CLK						110
+#define CAM_CC_SQPF_CLK_SRC					111
+#define CAM_CC_SQPF_FAST_AHB_CLK				112
+#define CAM_CC_TFE_0_BAYER_CLK					113
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				114
+#define CAM_CC_TFE_0_CLK_SRC					115
+#define CAM_CC_TFE_0_MAIN_CLK					116
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				117
+#define CAM_CC_TFE_1_BAYER_CLK					118
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				119
+#define CAM_CC_TFE_1_CLK_SRC					120
+#define CAM_CC_TFE_1_MAIN_CLK					121
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				122
+#define CAM_CC_TFE_2_BAYER_CLK					123
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				124
+#define CAM_CC_TFE_2_CLK_SRC					125
+#define CAM_CC_TFE_2_MAIN_CLK					126
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				127
+#define CAM_CC_TITAN_CAMNOC_XO_CLK				128
+#define CAM_CC_TITAN_MNOC_HF_CLK				129
+#define CAM_CC_TITAN_MNOC_SF_CLK				130
+#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK				131
+#define CAM_CC_XO_CLK_SRC					132
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_SQPF_GDSC					2
+#define CAM_CC_TFE_0_GDSC					3
+#define CAM_CC_TFE_1_GDSC					4
+#define CAM_CC_TFE_2_GDSC					5
+#define CAM_CC_TITAN_TOP_CX_GDSC				6
+#define CAM_CC_TITAN_TOP_GDSC					7
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_SQPF_BCR						5
+#define CAM_CC_TFE_0_BCR					6
+#define CAM_CC_TFE_1_BCR					7
+#define CAM_CC_TFE_2_BCR					8
+
+#endif

-- 
2.34.1

