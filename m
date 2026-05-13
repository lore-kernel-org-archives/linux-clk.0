Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DB7423165
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682219; cv=none; b=uBfRkZdhuUygN6pLxvFCD4uffMcni5VXvqKrr0jKdZRX4/O1HhzOAIvZ+lXhNd0PKDoP1vFSACwqXSw8qz3/04ViSktw/AP3Ma/qYcmULCuahdSZam2R01WFXHnwYvk05u7GPA9fS1U7Pi5sWodnaUI7CSzgWQJo92HH9BzYFg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682219; c=relaxed/simple;
	bh=4pHAiCPa/I4+70l4WTTxBfo7ZLYJXjIsYdQ2M+8BWJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MO4thhxa2GGUWPn8MBo0fj6qie9+hNW3aX4rx1VS6Ycz32ozD1xLh1/TFNkGwHrO80ePbjBRtCLomOB2GqsfUJ7Mj1bVV5H+vOtIaXnHCRwdXbcSVFrIBGTCCDTHWuotlhGxpPxtI5xtCv74A20aIH+MpS/HPGo2lzYSFwMi0ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7keGP9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckZLkpmp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7keGP9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckZLkpmp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWBIa978152
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=T7keGP9PZUy06gHb
	PBF4WB/ZORJ69mjF3HZqt6D7ndoN4RMfXxuvK6ti2/qIf2ElSSt6bsepvRx8WaRD
	l0Qdtq6hhOjDoRAK2DPk5h4nsVJdDqPTPItZGp2ZfRk/N5wQFfiRGuFXAAcJLFIe
	CCqoW+zn5rt+T+Z2IAOTuBD0s8a9AlQGMxznCFrB1DZq5pEZlLDpQ9dYVPNG5Xuh
	sjZZud8RwRANjL+2GM+snCZE5j6YEBpI8TwtRYSwqom5BuMeGSFGG69VvZJd0Hi9
	4SugpZx14bK8ZWGpu3EFkLxxJ4EOZh8PxT23OGSfYOzCdzQykqHPgrEnXLSeZlFg
	Ve2xoA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9vp2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:23:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso102953035ad.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682215; x=1779287015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=ckZLkpmpebrNyfBbLi+fxrhSrN0ZZ2Ra4xE2Rl8xUhe7m1GvlxzqolzDATy0z31OJB
         PmHRzU3AHGlvopVrhY0OAcLApRFm3V6/CVYykQpRlsfHQYFQUXzGRNfam1su75MPkkIW
         skuqtmXg6w5e+HL9l2wspu04evvxBNybd9maUDhnXbcAbbzFFhrKiyPHMoKhLYev6gU/
         nzUNmjwnScSOLYFUuxt/trCj+AsrGHS3SMJWm8cxvPfsB1QJGi0Rk1lP/Bh8wkkYScIE
         qpc5MFEHCh74stk1xL/8r/JdGeLexavU0jGE+Taj7qxn37v8skBDjoO8vuZePKZYBP5G
         wyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682215; x=1779287015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=g45MaFtU9e95F6pT3VDVg51CsSJ6q4Lt6175PGFM8idFyCFV/KGHJWTGbGGI7uN2Wb
         BWrYqz5KkrDyB7SrQtIgWLo0QCOJIB178886Qz5vrhtrnm897fLFxY1sW5s+4X0zdaPO
         uD3fIzrAyKakW+XJBeMyN8ylp4XIRg+wJBTsDq1x3h58KrJBPFsbRx9GyfSfDAQoOa/9
         GYx+pKaukev6yoSHDpZ7NwlskMZysByLxUQZxDHAuw7epWMEUTMzD5l60d4SKLJHzbIh
         E7J9R4w7y0rgkYA7qbvM8OCshunKRej074/osbVrx1OX9PygZ5IXtV5+xZ0+LmDcxdGI
         uGZw==
X-Forwarded-Encrypted: i=1; AFNElJ+DiD0qIuweIesI58f3C8RY2FvKC6LpHXOmHUb4CmkMFKBIOv5Ez2jWtV9uyM5UgKtn4pWRcShsInk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkaHaz9+oPy/+f81gOsFo9Fh+GNYKBivmc2TUivuB3ETj+BqkY
	wCVJAT7y7iBddoPNr53+DrITDi76LiKMsCH1mFalwf7CBOTHyU9hkjkb3JhyNFxua9N2HEwshv6
	pZUj2JDW/tQ0khBv27IL4/Nj+n6n49V+J6Ttqf0oIvIDG8+Y8zYu+H/NEXkGnXnM=
X-Gm-Gg: Acq92OHB6teWJSpxYVEcVYWvwBR2KVboTW+OpwkbO+1zTghuS5Mv0sc2vzj2IDZkyBk
	G+WXkI9KxHlWnNBuJaRiCnHRgxBvn7UYUFYbFvqFypG33GJa7l4lDEAXeq3ZhEs9kRJy/Nmyvdq
	QYjHfP7A1dnv9zXhNPyaArcS0DnGH6YR3LLvX+7961WltXplNOx8HRY5cVgrU7g12mUNOB3+5t0
	p4AEDnRPgkinw3+/mRYD506TEjtxxD3liaijFJzsKpFbJ42kwjJxjA/+4YREvrB+was79+utfbK
	sxrqoysDhBHEWVab6N+PAQrq8hSG35/MMNsbd2UxgT4CuP/eyVTkvs2kE/BLUBnEGDXUxZiwuYx
	se7a4tIgwvw7C6/vq35pcsFB/2nzkC9543NPGg7I0asxtBA==
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr22226225ad.7.1778682214386;
        Wed, 13 May 2026 07:23:34 -0700 (PDT)
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr22225835ad.7.1778682213847;
        Wed, 13 May 2026 07:23:33 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:33 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:07 +0530
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-2-b59c370dc281@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX2i40B9ak6deX
 Ggl/EdSMuZITn47pfz1hpmtbJ4gx4qvfUa+a2ivQOvphxLJ/XW0VRfhVVnKxqtifzXYZpYqEVJM
 N+RwzOeaEsXhLpSBeWqcoY3jAxMhrAg+NyS4Gjnh4wOWjeRlezpQY36vAFl+4akyaT+CeiWHOkS
 cEFWWsKQVH8kyj1O0k2hkFIV9ry3Hwy9Z130/cg52euNgvPiQy4FNlRoER6pBEcfSLVtocmZnHC
 htCfRZeFW25YmRqwnFKdKjx3rLYKaCY/vWPUthNp4meQCK3cpbfFBXFZsnpPniJw42KVCFDUdMb
 DWmJT+8zySaHVRnDmm04hNpA3hmZRNmSF8MfLxsaWe2OrWi9M73TzHqOLzdNj85edxCiqFKAyYV
 RExq+PIRxs65lO6iZB3oZk1BcKUhm3bXcVx/GXRyW7EU4JfEwUT32ChD+DHxE1J6r/optw8jrhR
 eQb9In5aevp6tm5zxUw==
X-Proofpoint-GUID: asoTdx2GlU84M2qYZkD0q-0PFWDjc4iM
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a048967 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: asoTdx2GlU84M2qYZkD0q-0PFWDjc4iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 52 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..706e1c93240a8234dd8017ee181d19e58091fd6d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,52 @@
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
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_MEMNOC_GFX_CLK					17
+#define GPU_CC_MND1X_0_GFX3D_CLK				18
+#define GPU_CC_MND1X_1_GFX3D_CLK				19
+#define GPU_CC_PLL0						20
+#define GPU_CC_PLL1						21
+#define GPU_CC_SLEEP_CLK					22
+#define GPU_CC_XO_CLK_SRC					23
+#define GPU_CC_XO_DIV_CLK_SRC					24
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

