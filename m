Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE24264A65
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530546; cv=none; b=iqqQEJD6O8isPmryz6Ql2QRAakNeRUGn9AlQ6b3AwqfuTYIpBTOFhR3oS7sTsbnhqcBYA123PGUzSu61R+tpf0JTlIRCZ5aIVAzscMjwBa1A+C6BCUrfe/jmuU+mh+xTe2NMkQ2iXz00pL8Adx++XVNn8XKjcAJXO7ygKSnmu2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530546; c=relaxed/simple;
	bh=m/VQMn2jp2mMRtt+R0rOjpAEwbBaQz/MuT9q1xzP0mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRC5n5B6jej2s2FDHPal47KO0hGfZ6By5eS/UX5H3yngyU5eC5MZUVxYbBkmxNZD3kJ2ebwwi+ozU/kWjXvvnHlLSk0EyzjZNbMtMgDyk2U0O8w7a87yA3oAGfvl2CJ6ApBnEjKY4QeKyckFwZON8NtaCLUu82et7d9dC4IwZnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRplpQOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PK0OR1MN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRplpQOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PK0OR1MN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239L2fh2553824
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 09:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f2M8NDjO2Tnl5mGOoz4d4V+Wo7DeMPNXbyqK36ibgI=; b=IRplpQOudnlOUVB/
	wgacD1kdqwkL8qIqUxMv7b/zNJaY3FkDnbnQqZooovZuGi28xmPq4H6z/aCovIg4
	6xVtbDWmzCrmNZxZ7yTKmL/tv8mIZAuQBIj4ph4+NAeeL8rKMUC2LEdCDs9BV0OR
	vwn3iymlLyGfmTKebDXnlW/CaQnn+y1zI+5rfNLpqaIb6qABdqI7xLIx3gYl+kHO
	HNQNQWIC/0ynTNppfvD1vhoOZWzm0dKIhWoo/C0iWClnuEkPkoYN2Axjmxoss+P9
	ldy0WmsSyJLFsh5awONGJtIABZoe2KBMDqp/dbC8qiIT3x2L4IU3DFOQdW8CMqBa
	Yheirg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxf81vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 09:35:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8274bb61b5eso1532271b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 01:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772530543; x=1773135343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f2M8NDjO2Tnl5mGOoz4d4V+Wo7DeMPNXbyqK36ibgI=;
        b=PK0OR1MNDAntoouaFBEu0besRpsJS/qJtroMNGGuP1+rjfgt5y/sQKoWiN3uvemdKm
         p0/OzKr+ylNROBDZaqliwMx4DGtf/j6x0OY1eyP7HAVEm+NceR971mQo13inX4U05Diy
         AqfdtgdYcQ4GZOvFA4n0hKcQ9wEvqFUSO/PE4l0sPhXls4ev1RorkYuAu3BLPCViF1s7
         CoLv0N5dMeoXwA60kdW2Y5HrzNDY94pjqS/ALdHmyi7iChRljEzsG49z1K3lglzyE08R
         HGa9XwwpYwVQxYwfXxVdAAEIk0DRNieD0hT29D1eHQXgfiAOys6ebBkyN4PMbnC6KEHt
         G5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772530543; x=1773135343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8f2M8NDjO2Tnl5mGOoz4d4V+Wo7DeMPNXbyqK36ibgI=;
        b=irZJ1/XlIkloBg5uUQsQwE8exMn8pLUHf2OOjHjKcHnu9xYWHUbd1SsiMr88hwYATc
         9Y+rRbIN5E/Oil9cAncoAttpgUWM5IR/LjvnZ5WVuu6/Ih9lAGeHJEPwdLfBP5XDvz8v
         FoaqoREQyQoBT6DLRRzDGXw0kHt4Ten9YLFPr1czyj2E1g9LV/tnO+ThFIxaLK/d+GwR
         g1sZsiEGewzeDdA+osyUz1Q7JU8CEzH1orzvuOiw3Dlz3eRwrlesb5Lfd1iyoTAnLwaA
         eTEhrX6jziGoptBOrcGRLlP8bICB80u29MA9uxmz2nOcHhgm4BtObi2mezHSKTpAwvxK
         aiDw==
X-Forwarded-Encrypted: i=1; AJvYcCXHtwsby7zOjP8I9843dZfogESMCx0Xe5rklpnZ9kDygvy930tEcBv33qd8d+0H3FlNA8CO/X+xJzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/yVPt5L3fSYxgrqxT6qgBXp4rAFrtNv2K9G5QLr1Iq6SLyHMM
	rFUhQ+dBZk2p34ijQzbJVG+3zj7buhfF89vk2r4x3ReFfIsI4Ba4amBMmGi3dxGqdjeYzNbIYew
	D8dGRoA44lmzmGlYK1J4PkTp4a9tB0iWK0p8pEsx2ohgj1uMzH9ljt/M4cv6rn3E=
X-Gm-Gg: ATEYQzwY+eA8O5ZrDGfqbVqfqLjAtQOofUwwt6ERJv/GcUBJxxdaJb/sqE24VxHGcoh
	LVfam2XsEaT8VBWdnqLsaNCwRL7ELS8GB5Od7rzonmA5rrA5V76LjNCBPNa30ERQzr0HF4dBslD
	PPe0o2RdkPRWvskuA9Ij+uwzztCZjAL70/g7LfPcOxfefdRfNHZ68UJxvwWgyDcQtYKh507Qgm/
	8HdLVmaKCcitrpfDR/15j0Nh303GNSAvmbG39w8BzytEtJaLo39XBysCYhp/j/8JYPD9EyQEFzX
	Rj906CdCnQE+SZlv5zQSGjv/38co+D8lnljQ2E0afiZXkIZXmll+9UnImF0wa/rM17G3BEElRA9
	DR6Q06zWFvAa5qrXFuSWF+KBLpbst/vzaqEX+cjYRmX4ISA==
X-Received: by 2002:a05:6a00:4143:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-8274d972743mr12354323b3a.7.1772530542776;
        Tue, 03 Mar 2026 01:35:42 -0800 (PST)
X-Received: by 2002:a05:6a00:4143:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-8274d972743mr12354283b3a.7.1772530542133;
        Tue, 03 Mar 2026 01:35:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ba6275sm19644212b3a.0.2026.03.03.01.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:35:41 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 15:05:25 +0530
Subject: [PATCH v4 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-gpucc_sm8750_v2-v4-1-2f28562db7c9@oss.qualcomm.com>
References: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
In-Reply-To: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3MSBTYWx0ZWRfX8h8U+vgwZOl5
 aPX4roxjL2+eDd7SrY5XSnI/8zTRbhjetxgemuzWfYEponC1SfhpDk47eHg8xOJ8C+pOfMcXpS6
 1msqIBvA4qNSx/Hcg9fsS50BwDXSU75x2W0emOD5eRL9tUq3Dh6rM5rEdpmmcd4h8yvK2+wsZP7
 pOdqdK/vQ9XYXj8rfBq5mQwczeQaVRN6h8QU9MU3Oou0xQp1OzznUgZpLqNuhwuJhPtElyzdjmt
 zPGJGtaFL1wA8Q0GjH2CNcHMrOpW5BWhIUJekRSvxw9FqiUxRdqOcUn38r+as+GtXEKEpoql1+q
 TDQzeWB+vnYw0e6A2OOZxc5Gshm9FmavN/tYk3FMQe9Rc9oTybE7MqouGxvPnuzdlJtGPIxNzu7
 2KlIIHjmkeqAWH86Qim2Fq/2VimeNHXmg4Tt1P79NxEJiHjp6dRt7wFArSdiEOucPgjPOs1m9A8
 eDuAKj5PlH15Np+lWmA==
X-Proofpoint-ORIG-GUID: Y4vYgbMrc_9C3X6ZSyPxILYPXpviMVmM
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a6ab6f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lJl75u3uZd5g0oXYmjoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Y4vYgbMrc_9C3X6ZSyPxILYPXpviMVmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030071

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The SM8750 features a "traditional" GPU_CC block, much of which is
controlled through the GMU microcontroller. GPU_CC block requires the MX
and CX rail control and thus add the corresponding power-domains and
require-opps. Additionally, there's an separate GX_CC block, where
the GX GDSC is moved.

Update the bindings to accommodate for SM8750 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          | 23 ++++++++++
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      | 50 ++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index 5490a975f3db7d253a17cc13a67f6c44e0d47ef3..1876f23c174e4ede590847d80222e49b4200d8ba 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,kaanapali-gxclkctl
+      - qcom,sm8750-gxclkctl
 
   power-domains:
     description:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 6feaa32569f9a852c2049fee00ee7a2e2aefb558..d8828f905bc017172eb8442a8bb760781feb372a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -8,6 +8,7 @@ title: Qualcomm Graphics Clock & Reset Controller on SM8450
 
 maintainers:
   - Konrad Dybcio <konradybcio@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm graphics clock control module provides the clocks, resets and power
@@ -22,6 +23,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8550-gpucc.h
     include/dt-bindings/reset/qcom,sm8450-gpucc.h
     include/dt-bindings/reset/qcom,sm8650-gpucc.h
+    include/dt-bindings/reset/qcom,sm8750-gpucc.h
     include/dt-bindings/reset/qcom,x1e80100-gpucc.h
 
 properties:
@@ -35,6 +37,7 @@ properties:
       - qcom,sm8475-gpucc
       - qcom,sm8550-gpucc
       - qcom,sm8650-gpucc
+      - qcom,sm8750-gpucc
       - qcom,x1e80100-gpucc
       - qcom,x1p42100-gpucc
 
@@ -44,6 +47,16 @@ properties:
       - description: GPLL0 main branch source
       - description: GPLL0 div branch source
 
+  power-domains:
+    items:
+      - description: A phandle to the MX power-domain
+      - description: A phandle to the CX power-domain
+
+  required-opps:
+    items:
+      - description: A phandle to an OPP node describing MX performance points
+      - description: A phandle to an OPP node describing CX performance points
+
 required:
   - compatible
   - clocks
@@ -51,6 +64,16 @@ required:
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-gpucc
+    then:
+      required:
+        - power-domains
+        - required-opps
 
 unevaluatedProperties: false
 
diff --git a/include/dt-bindings/clock/qcom,sm8750-gpucc.h b/include/dt-bindings/clock/qcom,sm8750-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..e2143d905fece19f4ef5cf413724f1597daa85ba
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-gpucc.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8750_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DPM_CLK						8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GX_ACCU_SHIFT_CLK				12
+#define GPU_CC_GX_ACD_AHB_FF_CLK				13
+#define GPU_CC_GX_AHB_FF_CLK					14
+#define GPU_CC_GX_GMU_CLK					15
+#define GPU_CC_GX_RCG_AHB_FF_CLK				16
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				17
+#define GPU_CC_HUB_AON_CLK					18
+#define GPU_CC_HUB_CLK_SRC					19
+#define GPU_CC_HUB_CX_INT_CLK					20
+#define GPU_CC_HUB_DIV_CLK_SRC					21
+#define GPU_CC_MEMNOC_GFX_CLK					22
+#define GPU_CC_PLL0						23
+#define GPU_CC_PLL0_OUT_EVEN					24
+#define GPU_CC_RSCC_HUB_AON_CLK					25
+#define GPU_CC_RSCC_XO_AON_CLK					26
+#define GPU_CC_SLEEP_CLK					27
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+/* GPU_CC resets */
+#define GPU_CC_GPU_CC_CB_BCR					0
+#define GPU_CC_GPU_CC_CX_BCR					1
+#define GPU_CC_GPU_CC_FAST_HUB_BCR				2
+#define GPU_CC_GPU_CC_FF_BCR					3
+#define GPU_CC_GPU_CC_GMU_BCR					4
+#define GPU_CC_GPU_CC_GX_BCR					5
+#define GPU_CC_GPU_CC_XO_BCR					6
+
+#endif

-- 
2.34.1

