Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1038D476043
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865874; cv=none; b=pJxZ5NDBl2b+YqYr8OjjMtk8MmetDYNv3vXF/hBENwlaVj1zueb7niPAAa2rHoojWeB8LuZ4WgdXJI8y9pCzw8GaQ83NdomtYP2O6pAEoJ4MHsCITaAJac6RZc4kDae65C4RJl1OWev3H5MGpAGIOvzkReNI4IoDVFypoxKCdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865874; c=relaxed/simple;
	bh=bAnJzL5nLMKzmc490vK/S9JEOOf+TuZ+2sbk011AeJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqQe4XZn0LeCioNBHYkyNis8k7FHe3zr0F/zxKEivYPFZFbJNqLj3tZYWxLlvk212scF4sn/Oi/wm24Pqvyx2/vVfOSsfRfYfhg6sTahNo7icsgY6pXo6mTZrXO0QgqWjtLUMoyx0r1CT+otyKV9iXTBWZNihhdpTptRW5uAhUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GInJQocP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHhPX83r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GInJQocP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHhPX83r"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H3cv6404785
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 17:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=; b=GInJQocPDqFnfqzj
	cLx07Q+ofcw2HykRMzzvJtbPNG7/V/bUvRKQfPxmxJFKX9RTVb4NnUAV4EVUnBXW
	BNQwTHnleAYDS/45m3DsHrFx41I7lr/O+8koUCE6WrjD/ii7nqjgJ0gbz97ECC14
	ucWWYjOS8lyVTBIrxRbvLjRRlvbZ6w0FtFBvWV8M5PqBYN6r+7aV2uAeQUIsHreb
	8Ih3XPr/fHJgtv5t33M0mYMkBPmUMdgOIH9qvzV8qBgBt2wOhPHXz1twS5j7ZXLE
	xBRvW7QeIKKStr+z2Jmnewbn1vNwFalu4ABCie44JDTyXm9PRfzvQneMUJCgRlIJ
	xaVanA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56g7dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 17:51:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso989576a12.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 10:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865868; x=1786470668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=BHhPX83rwKPuP+BUwY3Vchj5GBshZd/TCMjVgeFZyXj5k/EwMzRYL9UAyzwD+Zw4QA
         9fBgeYUOt2hLvax3XvugB46frLFiIAPdvipBH4cohrLJj5PhnrqIGmAkQ/+pDQpk0fMB
         ZIHdqMvTcOwxlzoq15y/djdedfPuAJ0hk9NExbeAdh7kHe8Pb05BHbH1juKp+kphtd46
         YR8HrZG5y6sChkde49WFpowEPQ4H1xrBkNuHFl9GInwhvhx83bvPPOClOptThH30kzGS
         CPu1NFd7u6zAFRdJtaxzEShY9Wmhx8TOFnmFz9MhM/1/ehUaEOJFihmwzWNqrnquLi9l
         g0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865868; x=1786470668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=oVR9+ao2zLhPUZ/K4GHY3DMUje7ci5JJ8hCz6SveeakTlOsZf6Ik8+e+UiRiNULUX+
         uGzXM5O1jubbI0WWjUj2pjQUucXPCeuWJh5Mr6ohC8Gj/55yjuHIgk+SEtJUnMrS6ZqU
         umN/0fa3W4LqyRmLq6eWmMMdZvUEMbgfuvSathaR7yoa1NGEyJkCSRrDBSujZ90Q1Tox
         +YQDRoiDQrdZBwlspwdiAMLxnNMdhYXIksszinmYwElBzY44YAym4mgCKaQmS299EZvT
         fjQPymadnE65GD/TLyXGyLjpcTHjtgAALxYJ6Zj5OsEtlKec7vD3ngI2HtECip9hbu3B
         39tw==
X-Forwarded-Encrypted: i=1; AHgh+RohmCauQK5pGj3b8gg8GwjjPjbNydPBGG5aTq24DO+3EpSUx4PS/zE3EGpGU0wOpFubbZbPL2D+q1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyEONLuachrQvacGthyZjQt38fdGgtr2u0Udklx3gjhUzVBQh
	qn+ObfNhpAJl4GzHoCKus9+5JsjnrgVF7tq+KTkwBnc5wsR2Lee0EPoFvZgeHHvM/jRM6Ed/38Y
	Zi+umj4pQ1u0nVINWIQ7OjRazhZDuXyvxA2m8c8uuJvomSkJjG1YR5WtheYUWGXs=
X-Gm-Gg: AR+sD11W2Yjr0rUai8Sqq7Gw/FVX0qzbFDq+IsMHKDAKFrM1jxcYC0zKzTSpQBaCNRa
	qIShXEsgn9HHTE1u/P05kdrYcH5sagKhLKXVq901My+2/vh03mqGCSH3SRll1ao0uLF/eRH9eFV
	EuplqrWV/F1Me660C4/wxdyQQYWg5q+Tfqq9SWe4kJL8nhpdmqWedw1rgSPAMCx8+lIuIFkfxmv
	T7r9N75pJEL5AmyrOpgcluU+b9bW3QoRdZJT6i9z/Pl+2DFSZlwd6Y28/qB5MRIvu3FnYIjbU41
	QD1hv4FFfleFBTmp7zIlro3equTkG5OSLHrtz1BPU0YhMS1Vuk1o+0dx327AWTMC0mSWc9OEnoL
	bjKmMtYHSy9vIgYSZzXjB1si8
X-Received: by 2002:a05:6a20:a10b:b0:3c3:b57b:645a with SMTP id adf61e73a8af0-3cb85a5cbdemr749913637.21.1785865867664;
        Tue, 04 Aug 2026 10:51:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10b:b0:3c3:b57b:645a with SMTP id adf61e73a8af0-3cb85a5cbdemr749862637.21.1785865867214;
        Tue, 04 Aug 2026 10:51:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:51:06 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:18 +0530
Subject: [PATCH v9 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-5-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: PWBV4uUpHm32skiZycLHEqJmGqlt1NB1
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a72268c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=005LtiolIcJ_eoEmTSIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX15Jl5TxTSEIh
 LBH44EIZhuuTFRON4cWox2nAAuBRg3h38/DWrPZqUiVbQiBDR36EP8tK26QqkgeWZzR2/Gsi9c+
 HydzelmsiErDoDcib+b3PZ/moOlvkwI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX9lsjUABeLv0+
 ubP3nV0yOGpvH3sXyRVxyYgZbSYYfm8unNz0HarhMOJ2jgAUM+NlyriPugtu/R3gkdGbOsFP9kE
 pyyqT6OiMclwuaG0nVWbK7R/fEWhtt1GaJuQnQekl9PmSDVyI1tMhT4wAMXaPp4S54pFK4yWCnX
 7y0Yghohvnw2MyK49vWS1/PBSAXp1RAa+qPYD8uVLcAk/29TOWE63t965GgJ1Dq1JzDbjIRjYcL
 vJSanEVKqBPw//wrQoVQoHRBjt+Uhswbh9W7R8MfB3Iu9JyySVFtd+WsvPxxQdEi6FLGkONENR1
 arQ/B3CBrZIf8VoJbaeOj4fZAi61T9oFZdZhoA15moQ8sjsN76TXmDahfB5kMozm5VfK61PKvtZ
 sEkMfaP25GxOZV6gv6Uy4kwNtjrUGxLNzOOaY9fsx0DEuYcIHgSDCTKEstkiX1z+XPMz+ccEY3W
 m4199PGzrcUx+BC6pHw==
X-Proofpoint-GUID: PWBV4uUpHm32skiZycLHEqJmGqlt1NB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 2a2d37c59442de427874dfe42849cd0ec1a8b752..7eca456211e476b86cad274a81426f52cf24d527 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -32,6 +33,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -75,6 +77,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1

