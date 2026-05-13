Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0347ECC2
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686084; cv=none; b=t7PURH/hx4VLZTNMNaVA6Bq8v4gQidomyxyK7diD8S5FtGHgcaPItVS/rvShSCFzmMdZ9if1PrChlX+E/WY+f5EuSpoB1cGBM+Vh1z014eenLx/u50fkI9zPnBbaFz37d+HYlLDKuYstoKCMRS+22IaXoEFGHBWW0MbsRmvr1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686084; c=relaxed/simple;
	bh=4pHAiCPa/I4+70l4WTTxBfo7ZLYJXjIsYdQ2M+8BWJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5oZ79+UFQM1JtgIBEd/AGNTNNxVhY0dMNJc/2gMQ3Cal1RBLFA5QHbGRpx1B3sv7p6BYJlfth07czbWtYLeKOsR6v399VUUfF1dvWQnkLi764FysfIUTAkvCxAyEyAAi3KY73QrT1gIbIFezhWGxd2pCQKhI1YCJ4jPClcL/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6vaBLC9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTKweZBB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6vaBLC9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTKweZBB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWCSU2321270
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=Q6vaBLC9Q5RyNtb6
	EcVgfERi3pa3bddoaQvnjIRvFdK80K7jrtX8Fau+FiMlDGCstKUV0Suz8lSYTv1f
	CIQfuOtVdwXdPKh+4G8QF5imNQ1hJe1I6ayDDjAAWaOhcnt3SgBI9/hNAtkVoQ4I
	RDDhV6HZ7C0GF7LgTSldz+6J28/1Z3n3/A42WrdQL3kpIHyGnmw9yE7m0/0A8Y+5
	9KBujGKvtbXAYLDdQjmD+53dhWXG7b0HXzCclOIEAueQN6z9dODF94bZ5yavGu4U
	eYCnyRCgtgW5K+eZt33Y6n+7cHEJ5fivsRVQluuH1WSIiqe4NwqF/fL5d547uCC9
	klBZgA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguapug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd15c00a1fso19988415ad.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686082; x=1779290882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=FTKweZBBF/PXBhfv11RSGjOyxM8TvLMPYOjRddWKUN3XELK3Cozy/qg4vA4b2bb6A1
         ovTl/pMX/KpjKrsRtJHA4em6XSnhz/+TqYguRsgALWJMRMa+HbVJRZs/G/AoJRy6ayJ2
         K6psfF/9XZ+a78DrGqatdeiL8ZErFGhuYLtGiON2+bRWW1UUHubsvWzeAWvfc9e26pny
         eijuyae0u7YsdU/7qQtPkfPbXEjbgn0O0kyJ/rldVfONB4JGDGu6oEDGmkCq45b+HvFI
         WczgV/NzqLzdh4WU6LZ5pUL3LYntndvHnb5keeBC6h+e9wMbRtcuSkF9coymDQfKVm4N
         BUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686082; x=1779290882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=slHC0S9Ku727kATlRD2qf91Zs2sRK7QODriuwiUpvRQv7uUTFJWuh4Pk6GRCg4PCLS
         WZ7CSxTrP9fvqQqNL7xJ0E37K3bbe8j4y3isn3ocmqpY1xg9FspG6owyOa7QHpJLG15z
         LW9M1uBd/SatHntl7f/yTf7H+HRa5kuSJAh6yo+gxYnSG/EkymgaW6/d1AhSNvRgPXzR
         II5vK7S2ppRjBxa0VjQ4aOH21I3pEC+SLvlS8GQZ+V786DVWvAgGg9416Pd6mJnYz786
         lsMHhZ/aLYmmFQt2pSQYZXbdMYTTfB6y0YW4lwxRl50Erzw1rx+yynGylL7SGeRq08bg
         VJkg==
X-Forwarded-Encrypted: i=1; AFNElJ8D8N9f18uau4wyHU6koERHOk8EV0cwOCpCaeLPJ6dyxJZVsu2CshvZy+S+dSFXyoSEI6HobJAJUBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKXHkFHD9sDT/a9cChO+Vvug/aZ9hWLAsy7OkvfSCcneotz3f
	r7rOxFzKfAAQ3HqoVjhIns/aI6zIgYqIzwYiIqt1Lda1LtM6uj2KU6v12JGefEMSePFFKKbRMdv
	zNL+gcgv+ScbmU/+n+EXznznnOA1OOsxPUJ7lS6XWZeKN3y+KLDI1buxKf6xlIxo=
X-Gm-Gg: Acq92OF1vgv4cnIDPqxZS/cnfWEvuVPV4XWUPVCPRpc6Dhw0gdKQofGNzFN3hlqzmPU
	XaC6gkBqqNpLVvYY5wllH2DhcpAa2Qfq5wJA2sc/szYegbAwboDgNmxbw8E5IffAOoy8SQNN+K3
	AIFNa082PrNjv2p8i2U1/gbz0nOJ8kuOBVTSdISxopjkPYcKgfPpeRnqZEJYFpwzFN1vuEFFk7u
	tjtlOu0KlnNMdUU4+viMyf9cHWnjvb/V0EzlqKzk/QVxK/0xVGseDdDjqwwBOHxXImXZ6Wbueys
	ifyqCNDqeQqUCtvLF0zzwn4VrdJkW2yVno9qgPQu6oFNHZoZUQbD/VKQYBVpDV8DJYr5vQxvzoY
	jqhI/73qxLIR1axCV6g9K3SOBFdl90iA8AjV7ey2LkAEXlg==
X-Received: by 2002:a17:903:1786:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bd526ce854mr48335ad.5.1778686082019;
        Wed, 13 May 2026 08:28:02 -0700 (PDT)
X-Received: by 2002:a17:903:1786:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bd526ce854mr47645ad.5.1778686081455;
        Wed, 13 May 2026 08:28:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:28:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:37 +0530
Subject: [PATCH v4 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-2-e61b5434e8d9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a049882 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: SG9ilduOHCNWa0yhkU9Bym5JHFrbRH-M
X-Proofpoint-ORIG-GUID: SG9ilduOHCNWa0yhkU9Bym5JHFrbRH-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfXzs/C2nvpccwZ
 W8MF6Lp8zVDMgfIrXR7kG22tpmvVDFubKtRi3fqMC3NBjHIooZJChlo8nLvmB1WwmTBvphamu5G
 ++9+YMY98Nxz4infaD1fy9MGWy71WkCDgujZj9ru70C9sZe1+gc4Sjo7ov9KJcGLQr8B/W0KDW4
 q5CXp/vB31wM0/gqg8sfeVPy2hLXy9j+yp/fPI/u2Y/lPqPG6SFCFlnzsN5G/l1hgVsqG8/l3QR
 KcbPnPqVyIKqglWTHKZFr4r7U6wb+IuJrgtWMl4QCPXssvOlAsDOyyLZw+5M4tSQDT7M64tjtqB
 mDnO73Z4tgxbBRzohDiOIOC4ETMK8BP+vb6giETI/KmvbTuieTrZklFga2CeIFqW0bj2a+YOeji
 8xhqNR83Nxy4hAdcGRnKC5yrfR3cA55Uyi8cfuPCY0bg/p8euPeOiDRWgNSnjAbBFI+v7YX6Viz
 B9RPbUokiHKGmsdsc0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130158

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

