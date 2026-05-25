Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98CE3E9C1A
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705990; cv=none; b=G9LuOgkMcm8zxANaA3D3nn7Ch9XC3n+fVItQ4dWc2OP9eCnxwCJRics1QQOyRRYllCbNa2uQUcA5msf7v6IOyI/Vas0nHnwpUqr8NOl7QnwOqXWv1v/PYJlLU3+Juzg8lt6OMuZkVJFHxt7WcJWPLcHSOBMcUP9S7ZfGOBnX/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705990; c=relaxed/simple;
	bh=41QQEsNriEBz6yXk/FYaQ9SbHf1IVwArxBrG16YlvOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKZ60KWtPWKZe2i/TbGJMf1pLROArCTHrJmm8tUqdvdPFSGHoqcgs1+BnITsZV77bWCLZo20WyAUhWRA8WCFk17Ckt3/qiHuEs46VjuKxceJ2wtCtzwn3t6gEuTKrsObVqM4K85MSqUK4ydhSOxeuIOA7j0n/znYZiZbeDlqN1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyujLfCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hqp2rLuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyujLfCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hqp2rLuX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P686ju803976
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=; b=hyujLfCl+/Vz1yng
	AFNgFf2wEJWfZp9aFWHwcwlwSswmQv17YNi5t/Vm+gEwzFN4h+pdHGCbwCIdg3J+
	9axuVT/NuLlIFaqZ3Q9c1VyBqeSyZmgsdFNCR2solExGuVsH0PQhfQLLMurY13sG
	FxefoQYHKLKo1L4xNY1xbJ2hp6eU2OnmhGqmXelmrPZBaJxgMSPmgRsj9lDM8kXX
	IM+nHRnZD6Ojm21sMIHDgVBOAJduFByFgybaxPBDaDlna83pLsZO2BkFRIwrttZV
	MW0xJfzq8oFfp+Q7iKiHU6lvOfUUnUQltWnDl0UDTWPcbGtBHxwFRcl3xa8IOBOu
	/8vPFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0wgtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:46:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so209725385ad.3
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705987; x=1780310787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
        b=Hqp2rLuXMXMycYXH9I0phcaMOa+PAeCI9gLu0GhjZtC60v6imQAHAzdKuCT+ViFJAE
         5NR16HcjZAQ/vovZt7pj52ors7nVzSFx3Fv5LSWpfxwNBSPt9w98X2N2HvBqE+qb6F+b
         dL4mhQDpMFcGtZiUIi4rKPrqP16/1mNY6cxHmeIYL/9rnLxVW0gZOXcF+KNcoO5LD0o6
         ruGKqQUzzAVxKwuD+M+XhfGZFgljeRGM78caEnHQh2xxrcCqoHL5KDG6y8NetX3O32EW
         JDKpKSFt5MIeSHZC9sjLAuFYd2oJw/aSiquVn8l0fSPvNuyx3gG0In411ZlbdSgU3bkz
         8VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705987; x=1780310787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
        b=k1CV06QJEA96rMgFsyMWkehTj+vUtT9D6smjPyku/tl/Wpab9lJms7ECLYS7yynD8L
         Me1qRC/3yV8HljezTDGXqnNmHRHB+8xFnnlu4oviiCcBumxsGNFbka017rHY5o4AAeUA
         CnK2syM+Bmr8Dmc+A7cXBeeRZnL1HOim4C2aXN2itxdmOXUKht5G1rKxchssbuB72JaF
         jkC114Ot1KQLN4uJwbduQr3kNJuWEY2Bmm3iguRZLa4VE57mMd9CRhsy1CppcsIsj75S
         bDrlnJGAyCM8YH2+sNw22aHRri6v8N4InmWGLfSX9EmCCLJW0bTS0hyUSAfFBb6dYyum
         RQ5w==
X-Forwarded-Encrypted: i=1; AFNElJ+dCqiI4QMgIhefmhJk2jE++FVT2pUrxcKHNeNA/ZrJWoZJU7SFyg2NMb9WlU80Hc9kCM4A8NpKUTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLH1GbnFhJhmmh3dHGhKldkGv28f9/ByRBoBlrwE6E+ydmin5j
	sG3seb14+IJhCyvRBUqbBCuJ6sy0ZHtrWGvwhvxU4qcjjXum5TKQ0a0pLOy0xu3vvC5QRKxNyFB
	D54K88hMk1+vQyoKJpkV+/P5P9pc2B92QWn8VxVYdUBxPpo91syXwzPdxOkHJThE=
X-Gm-Gg: Acq92OG9ySM7kCzZhwcHet8nXJzbIxJkDG3L9Kk+/AB2HaLxxjQyBv2BC1ql5dVS5p3
	EfDwrffMQ4+cXw1vFm5Dx1w8Nw0paQBpqvEoaoaExHhx0t4kgZxRjV+p5f7fpDHhnDR+7SldI4T
	PF6e2VhbDnsdDDJYF9+f5qEw456QhtkyxjCTcb7MzkCBpunyNo+hHB+yMSmMr1nMU3kIlHp7d0w
	81TAWSZTXBSf7lYiPBbScjsCNAY9J9U5HLupCKmNdbL//AMJBl8QwyoeA68xcCcM0KnbruWsTVY
	Mcni5wEafaH3GETm2LGuIimhOAzcxm3QWu4pLy7FqUtAKT7UPyUWWKWATc+yFKK2iay037iGkJk
	2IaG8ziUyzmJe3GhGuHWoCaNeHH2jqH0jpOVBctLu3gYr1A==
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2beb06552d6mr168809815ad.9.1779705986947;
        Mon, 25 May 2026 03:46:26 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2beb06552d6mr168809375ad.9.1779705986325;
        Mon, 25 May 2026 03:46:26 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:04 +0530
Subject: [PATCH v5 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: QM1riqt2kRQ-q4_L4GtMs1KLsta-HoT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX67gK3O+tf8Wy
 FmCjHxAH1RhcKiT0ETIG7OJyi38zYmIXCzolovAK5k16P8r2M+FawzANwCg25nfiNWiLj3iOErI
 YV1mcKpdSOrpLD/nqxV8GGsNGdzJ7VRwtybJsUAvsu7trYWYm0dPTmo8R6vBsw7TC5wYUl01BHT
 6uZvuTBSAG07KOusD5oDxu3EqEjrPutXCLjMYJMxssOZG6D1pax6repk+eetgmCuc4RgXsDuObb
 CN5Pw/HPXoekzyxdxilY0GtHfdWHHNPuq5XuONFolB2OzpQu8b2w3VYOJ+rFUK+vE09IT0oGcxM
 CjwaFz/hzLETh0lyhwsHgYmxRv2orfDTD1Uv9pKBst7PY27Bwk4YZarAmknAIaiLBw++jpwkDmu
 pbngsB1x5kmGxqJg+OMQXShSpcibXTuOgvSGJOs+rxu+LyWyF1qQY+m7q+nJkn2xbV2EFyQFE9M
 utJKzfC8CYJXUNDtMAA==
X-Proofpoint-GUID: QM1riqt2kRQ-q4_L4GtMs1KLsta-HoT7
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a142883 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

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

