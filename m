Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5F23F429
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767777; cv=none; b=kiKEcLFEig7rIKd7qpf4HPhEK5oX5g24zr8I6VX8NMzzIy0Ihn/YvK96rmK8lsr2wzWNkDAVowpYv2MxYQa4e69i9aLEpBEp2y/cPECeAjAQGpglPzmEZiwVIq35DW/wN59nEhTYXTc8+CgOzhK6SmWh51CXnW5UJVEW20qhvko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767777; c=relaxed/simple;
	bh=+wJgt/MZzfS8zX94B7YslhfyO7jaHuU3tElYwRHGIX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CrZqv+aTdk9S0lFqcrsOj5ZW0Nz1HLaa6QC9lVcFxYeM4EPN3iOKo5ZbSZjdiqEYs6nxiVqEdAT0sSzo+YL3lx1sRpAcEQPSPsoxEiMce8FmUB1/nWaqjUaGebR9RDEh2T3NR1FBGXaeemcaidGiXIxACAlCupg9YyXok/wwbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k70S/omx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k70S/omx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T033gA031181
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDFklMpNhOXJhUUzrt6WRg7BRReJ4cQT/Ou85+l3lNw=; b=k70S/omxwDDGZS3t
	IfyiJFu0OVn/kVwtI9c6iuBmWVLicjUtxP/te1cbY30lVzURDepa0wZflYlEte7r
	IQAUTQNZR4z5115R8odLC9bDn3XzbnKpPuQJC3qKt/INAmNoyJCdelu50l7MT9rr
	Lzb0RjYnq1dyRosA9qVMzgAeTfpCRKBAps76dK4QmMv6Wf/AG9sM63+xgJYtDwRy
	vsxVOyRq4G/LMaFsOE+gSKAjHjf9iXCFX12Sga3IbhPJJpDG1hLY0OX0PIvBW9+J
	2/AeTO0KOKZeGlte8HFgOedWNzn530xKpUZOi7u8/udy10gu08DaXq2T/xJIJnmf
	bO/rxQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkxusj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 05:42:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b38fc4d8dbaso6534197a12.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 22:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767774; x=1754372574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDFklMpNhOXJhUUzrt6WRg7BRReJ4cQT/Ou85+l3lNw=;
        b=BZBfvkAYovHxELcMBS/+tlFa7MfCI7NvoieO3JlX0/YBwubrOV+rvlODwwfK36ivZ4
         zsu8//COiGSwfTRisiuuARrjOcw7K4tZCY+STScHPnIRYUEsdGA9utz8iHPJUxcxQsOA
         W1oi4Mr8TuGeaFofS174lS8XPg/T1FX4O3DEODqogBoXfPs1aK16sJoZJhza/tsD98am
         /m4rdRdjACgjZA2awsgyKOzEdvmxOx7ce3ylQ+wAfskh3/JDgW7Fzc9lJpLtn7+RWEkn
         B3on1k+X0U/vw/FzEo0k4d2psQOGuSRULP50q956fUcAolAWtnC8kouRD/vTJuoGuqlf
         toTg==
X-Forwarded-Encrypted: i=1; AJvYcCVXEIptzIWThZ4anxi0EecerVNeSaKvoBGAXJN0NELStWKz3SO2+HRCK8pbmpEsVEJQcoo572Ro/qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YylsAiVI5eQXf66Su97HRVIB/Ib3qmUobtTMNFhIxsoBtViqUeD
	+pWG949OP0Xqr5a2c+t7c2J82hXxuxDwlWxEDPCJiJ3MJfxzjZe32fHIouuSufmcG+N+LkLfVjO
	EJKchE0D0bLO241LsJjkuIFg3HD0fxN3mXgtNKvTF6ptZhnVGlkTA0TahWiY/qK8=
X-Gm-Gg: ASbGncs0xBLF59P1mHt47cn/8b0tTSsnKia5fcWOS7LhCykjCcbKG/HNgz5mzBImjSa
	45vbCZojL9T917LKMoKZ5jbyy6XN0PbIze9UZuOutk/Dp3QJf3uh3l12nEejtYCvO83etKAFAV9
	m43j2czeCxR1hlJ299RT8WwDGaf5WhHWgTv/jHBSKgcgkVw5SfNPxuQNXGbn2qGT5yQJKM2Okly
	aOzxXTOg2eLl/h1zszU5hJQt44GGmMrA7XBoPGnl0ZviS+H+xzuGnLVrhMsjXG+LLTVqwLDtIsq
	Eo/8GOntjOCns7IJNJdXqsIkNuN5aDIOYLA5r4XP8lLFrpcU7hSXiW6YNmwzNtUQ
X-Received: by 2002:a17:903:22c1:b0:240:2610:a057 with SMTP id d9443c01a7336-2402610a284mr76973825ad.0.1753767773587;
        Mon, 28 Jul 2025 22:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuyijweDxrMiwgBqN/idRldkyPp8drzrqj6AfWgmXdWv7KrRn2IrpZsZxZOMXJWFqdnEi80g==
X-Received: by 2002:a17:903:22c1:b0:240:2610:a057 with SMTP id d9443c01a7336-2402610a284mr76973435ad.0.1753767772540;
        Mon, 28 Jul 2025 22:42:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:42:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:36 +0530
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68885f5f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=NoBSHRPQAjGLFGKXj-wA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX6rxw/+H7em4C
 XBarv3PsCBW6k5H+QK2YH8iePgS+QodW2MebTI8x64DBkEdE1uvGchW0l0I6xMUORHAczCtGgTX
 1ZwwfGzzNx4ajoGSXmS/kfCvycnVmeqFJL5wmr4fHy1i/vfW1G947p29WU1Dz1SngJZ4fe8Bv4o
 5OgPd8G17O/8IfjKxIg/XAhVMC/sDqcIH3HgcG/7RvZq+eBGfCr+9XiTDbIz9Ft9hW+YL4zJO73
 9/ebsE0x56N59DWeFlmD6et8XY5SAQIuv/ibOBQQNBH1i5RTPrGuTFLm6PooAA6dTYE93zbE2fZ
 epLhFB2SNDWhBRCIEy753MuTpI06+ecEezdoFOX34W84FHhD3K+qV9hWxfZF2aOyBlBJAnQCN2e
 DCP7VAy+8ELxoENNUeXZ+yBVBGHFJXOaxKhhVqrL+8zlOzwVycG8yqB5oq674f4u6EvOh52U
X-Proofpoint-ORIG-GUID: afidIP_6o3sG8qaHlDoBTxBLjL6q2NVA
X-Proofpoint-GUID: afidIP_6o3sG8qaHlDoBTxBLjL6q2NVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290041

Add bindings documentation for the Glymur TCSR Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  3 +++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index f3afbb25e8682de83fb16acaa35448545f77ce77..9fbf8883678245b20d99c13cd1a7cd8c0feee11b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -8,12 +8,14 @@ title: Qualcomm TCSR Clock Controller on SM8550
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm TCSR clock control module provides the clocks, resets and
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -22,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
new file mode 100644
index 0000000000000000000000000000000000000000..72614226b113bb60f1e430fc18e13c46c8b043d3
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
+
+/* TCSR_CC clocks */
+#define TCSR_EDP_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_PCIE_2_CLKREF_EN					2
+#define TCSR_PCIE_3_CLKREF_EN					3
+#define TCSR_PCIE_4_CLKREF_EN					4
+#define TCSR_USB2_1_CLKREF_EN					5
+#define TCSR_USB2_2_CLKREF_EN					6
+#define TCSR_USB2_3_CLKREF_EN					7
+#define TCSR_USB2_4_CLKREF_EN					8
+#define TCSR_USB3_0_CLKREF_EN					9
+#define TCSR_USB3_1_CLKREF_EN					10
+#define TCSR_USB4_1_CLKREF_EN					11
+#define TCSR_USB4_2_CLKREF_EN					12
+
+#endif

-- 
2.34.1

