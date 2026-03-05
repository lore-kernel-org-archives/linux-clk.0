Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0537D13A
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707224; cv=none; b=GdBNSTG/CfRei5zaXdC0qOA+UcS6GZul63iU1BLUrrupYMXhaPSBdORYXWN7cGXdN5bzfktZJTWILmPMnFnmJ52qFwuTqrlaw6f2RxshqnO+xibTYkBkEcgTF6e3lHpf/8DcFMUg7KWZkFOYLD8m+8bc9lmF5RWbQhibiKgHp2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707224; c=relaxed/simple;
	bh=m/VQMn2jp2mMRtt+R0rOjpAEwbBaQz/MuT9q1xzP0mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T051r8CfgnzybzWQz8kxzZzFPYjp+6fvVIuNNNmKQMp1/oSfU9gTrMfMBDSfJ7ghWCx2haasogAY5a/hu+d+hTOzj9gSc5aUz2M2VoQmrfabE4Z3+ZUrVpLmDnsKQQmDd/atEkAN/gkx7dt2A6SvF1wcO2+MeeoeeTPhW38kuUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1e3fyYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxkHzs7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1e3fyYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxkHzs7l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFpS51517923
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 10:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f2M8NDjO2Tnl5mGOoz4d4V+Wo7DeMPNXbyqK36ibgI=; b=c1e3fyYaC4HOdhX+
	6mzZp2G7Z6Oc+08KuLCVknKe4COu7aD+gB/Ydg/AbnEjrDbUZG7cAdEy8LcCOg2m
	j6f0Mc6VuUif9Wc8Ms2CgenjDnlIkj8ioLLcV3QdGc/TUmnmiUxVxBOhHsL0Yk/i
	714NjunSTWlxVehW4t/xE6h3uQHQyxA1REuwi69upiz7SA5esWNa/wbflY+IjJOW
	6aCvLa/iHFUTW61GSR566NwPWBlVm4fNeXdgv2d5mzOQIVsmZCwKPzNODNnhZEPn
	OYK1JekGim0PiKThKfMtWgqeCzVCqQTwRN50b6xtXPo//4tb3VKgnZxxS6IbXaYd
	IDjKTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptjc6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 10:40:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae62c87973so126015875ad.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772707222; x=1773312022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f2M8NDjO2Tnl5mGOoz4d4V+Wo7DeMPNXbyqK36ibgI=;
        b=FxkHzs7lLqpRbDzra5esy3w57TYWz6I9ECvKTdarqEwwEcJPw9i5thllhLuDIC92ph
         ePZyZUdwc1hL6uJwOnVvd54KQdGSugGiS4x4s6ZKBg07mSI38O/6IfDOet3glpCkA20s
         nOgHiwF0pK1TBBRVqtYfqPhmXt2quRdLbKYWT4MNhRWEP2N5frmSmdHNksiaJBB7TWHn
         hvtDjgr5c45qnLMLFRA8ECwO2B90HNLT9kLhHOTkIcyHnjvrkbc1pxdt8OPpGXMLoEfC
         PHT15v9PZK+ZKBD2ITlW5RcbJf/2D9OKlS5aWKKdXCoc1V/6+DfbTrAlYfZ/UJuPRGcz
         iYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707222; x=1773312022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8f2M8NDjO2Tnl5mGOoz4d4V+Wo7DeMPNXbyqK36ibgI=;
        b=RJbdEkE0ZsnyKYjJLMBq64jcmNUOpZlHIt/0bmufnr5/rzFlAos8Drl+3exZbB/1ML
         ikhWZwlvB6A78y5t5Bw7dgRyvnOqiXvb2RAk5PuCgB9pGGqlxKz5Sn18JfI6/4Yl2GbK
         7I6U/s838YvPnJNzYf8//MnLX4fHJ0UXck5aLcc27bzotE+zPJ3vaXq9xImuWZ/KKsLE
         szp/dRSklPV955oLTvOprKtsdGXiJ1VOOFXzUC1qkmOHf4xDIdyl/BkQn3oDsamKnvKl
         edQOK7qX4Egr7CAav8EyjWD1H6jMqIk2r+yQvYeeDnV6a2dp6M1iKD6G0uoh4Ltt0GLc
         l1xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNxnbyw8TiiKdQAhtmY2Ctj/GgQh+HOgp+TQhg9hi5GA9a6rDRskoiMguIEnZQDSV+woTyRDZ+BPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMWW/zf1bd57rAWnuR1iD6qjiN95jmm9M6IveGXWz7iw5DhTPk
	sWR9ySyNnKTf0mY/H2ZqZd7gFHZMmUC/1+YtrlnIr6LziMLONwYjBJoCI9m7cGC0kbP8ts4z/C5
	A8KM2TpVUp83SKXJkGk+ik8itJUnQZCzH3xOZeY6NjKgb53aFpTUk4LoAELO9vj4=
X-Gm-Gg: ATEYQzzJTXt7kD9OsNDImL8kV1999CJkDK2pW6Uw5f7hGjqum8zEziYgjn1YFPim79W
	2ev6yzPk5hqF5SkQSUFbgxLFBuK6Xn1nP/NtZm/XV/oJY/G9A4r3HBX1vG5Rq4lBo/7qLndVQyt
	iVGrM7jc4vVpPOYs7vTc/p7nY1wsBJe1QGBlCVJNPSEOkm19b36YrI6PZVEWpfc5B+8MFLSXWH3
	Nw0E/8wRmphAucPTt/GuoCJdLiPBx4uxKwXRqpOiHys6LIseWR4EmJjpTIHY+E9LWJ2y7QRHT5m
	iVX2yy7c7yBghXXppP35S7DzCE0eSdX4whqn+4KT7F1YBq7yvL1yTB74QG8IJj5JaKSauNoztID
	b/2sK9tqo4Rz8SBNVWMliGROOxMnDdPcPcRx5d5rN8fWinA==
X-Received: by 2002:a17:903:320d:b0:2ae:4300:af82 with SMTP id d9443c01a7336-2ae6ab4c143mr61178745ad.42.1772707221979;
        Thu, 05 Mar 2026 02:40:21 -0800 (PST)
X-Received: by 2002:a17:903:320d:b0:2ae:4300:af82 with SMTP id d9443c01a7336-2ae6ab4c143mr61178395ad.42.1772707221488;
        Thu, 05 Mar 2026 02:40:21 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4650000dsm134429325ad.54.2026.03.05.02.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:40:21 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:10:08 +0530
Subject: [PATCH v5 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpucc_sm8750_v2-v5-1-78292b40b053@oss.qualcomm.com>
References: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
In-Reply-To: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4NiBTYWx0ZWRfX39depFCmAQ3l
 eB8rIG0f66+WNFPtYAAniVR1NuZnzeQp2UAfeiumA8lEjMXmv4zGTn9u14xvX0FJmme0VVngLay
 MT+fql6wwlbWVJRCURiZGqvWwZWpzthjOyFO8+xE0S3RH5N9kgErMbAsP5j9FEyaVLdZzp9h9/A
 5YI3OPKTlbOV4nuLhQoyifK8oLUfXQL5Onhh1+PQ1ZqboULb9HEB7elE7CV6RlvEbHqCraoWbVl
 tuWTNnCfShYY9ryzI/Lmqaruo2tr6lO7ESjR5c4q+Po6l8JgJA4YE/1XVIJDaB+aasLiIRDXKMQ
 ZG/mfJ9n4YXoLfsMu9Ls4l7O/nmWyGb/DH5QpWbStv/j6/xabb1JGqP580Wn3MsTaGadK1sN8f7
 yl+yyNL7vf0gcnXrykPhjsndb9KZKqCOIUlFcbdqKJQdiLI9RprTM+zjyPIhAG4St5L+Snk3gu1
 P9bivcPjSm93cykA8xg==
X-Proofpoint-ORIG-GUID: 6apbYEsqyQTcQJNheOKMGRsukesRDxpw
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a95d96 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lJl75u3uZd5g0oXYmjoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6apbYEsqyQTcQJNheOKMGRsukesRDxpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050086

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

