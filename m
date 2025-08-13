Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8872E36E8
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071767; cv=none; b=PzlXexCrGne/Uqgp+nlCL+8HaFayVv5AbTOxdm16qDglHmsW3znFRZixxDAd/IvEkXtw6vz0ZN5FzOPMstT9TpLxW4Kk5SMBO1xLq/FXBGsjDdRKF0mYt4yaZSENGfjR+D7FEkCsWEVh3/8ObMG0BppkUJK/Y+HXHsNnFgIGhW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071767; c=relaxed/simple;
	bh=sHf7vbULTz2C/ybAwmFsk/gb/8n1wIkojTIqqM9GJ2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tz6KbPc0oCDjtk/YaAoANQ2botpqc3C0PnQcEl2ovbpeFnu1uwlK7OTJTGuJVsyafTQrYiCn55IRmOgWaVOaIA+DKv6/wck4PekxtTe81Dnbox+QPZOf00EzSrznIH8lADXNR+tg6G4iJ0gDIaUrCrSSYBWiQWBBkfSv/Ol17kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSWPPfEs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSWPPfEs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mK5G027086
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fUsD0dVnhmqkRsajdXDAuWEgzh80GlwERn+EBG0yzc4=; b=VSWPPfEsZhieDTOx
	To8YnaE13MmNjVCN3ulAKV6jKfDBHs+tvKwn6z0RsLGwjr1olOGwihF67pjLMlAm
	pYT2UqTEAXReCQK6KNHclJ00TROfOGtH17Z21I69vj8TP0omGeGh8Gu6mHX0fdWY
	JkOJWE4MaZptPVlN+S75I43XrJYMrbega7JfX0tlIu54m7sJUM7YHdro3viXiYfi
	i7AMUPOgwkrRBPL2g9DL4HwPnB5osjvKzQUhzxw+vqGUXUlOCb/h09H8eABdQz9h
	QNDjsfxoT9bPhiZA6ORqzbxh/AtvC+abKphmpCA1zsyR3z7fr9T33uEucsRBkjCA
	i3d/dQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmawfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 07:56:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76c47324232so4400799b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 00:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071764; x=1755676564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUsD0dVnhmqkRsajdXDAuWEgzh80GlwERn+EBG0yzc4=;
        b=h/uZ+zpt7mOjQKdB4y484GY9jsDBxrxtzwa5TTpp9/HO71joKd0PRmVPdb8sHxEUPI
         eNe8x/Fbxyw/C1Q3IzIpJ6UxXqYd049MXe2NHEE0UHph1swB0DXEn/npeegdRlOZyV4h
         37r0FdCjBNlgYgI0tTv8kvlGOvoAqdzN2Xu1K+kLLv27nXf9hpKHFUZuUTxTU8+szsfn
         VapwekOb9BPIYSMtsZHiRUaxs53Uq1AdczgS4hXZ+exJkzsNnJKCc5nvpfVIB/ASyDU6
         Zhrsboiko0l+WzNxG/n9kdzO1LlwBzxYmHrfiGx+nTihCESgx0IjjQl7xP4RLfZ4u0J1
         PnKg==
X-Forwarded-Encrypted: i=1; AJvYcCVlVFhrrAONmxffD+0pqS2ISdSS+vCrBF5/NT8DHIb6ztqSB21eTZFFDfPB1DaQjMfKHALmEMc5vOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVLWGPvd3ARN1MtxFxZaN8Rng/yEIJyHrITlq1zcRBKDUoDDmU
	A2PODmhtO0A7DLMBBkmWCpmqjyjqNmMLvLD2w2CZbalthrHUGAsA0vDM4MmYfQcXBxYOjRZvm/R
	VoRKa4dBdJc97VBxWDF2Dy2mRfsPakbfJN/I08bXY7yHBNntbMtmFxrJlk21R9Mj4yeb6gVs=
X-Gm-Gg: ASbGncvyWJnmD41HO5ZISJrDqaHtDICIE6cR2oFbkFql6VxCSpDj+aYKEePsA9K6nuy
	t9H/XvGGyA8ymnIEMtKCh0pP3MfMu8r/jsxHYL4sXKOuvwZOsoZy0KP818ziODfXlYHiixjAyFf
	7DEP61gFMYis1vZcZR0BzfObA4feNFm+GLNtKfX6jC4x0zv+OTcgLCm7510aBA0CkJkL5YhWpIt
	OixMj4fV9t03ynXHJ9zFCRhE0I/rF4GagoXIG5pA7qGOtsTK16ywHkZVxVr5gjsQL9M49wZv1aa
	ZCP+7jG1tsYusrI5++YtV4HLLTUOKgPeW3XlY6d+MoKaLUnjJKB+BAxYjVenS6wB
X-Received: by 2002:a05:6a00:2396:b0:76b:f1c0:224b with SMTP id d2e1a72fcca58-76e20fd02b7mr3433295b3a.23.1755071763967;
        Wed, 13 Aug 2025 00:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERFxv9gFWTq8pe8BgE9fFX8Kld5lCGhSgqJZoo2m38yCdBawTCYOPwqUMppj5BB8hBCFL8Dw==
X-Received: by 2002:a05:6a00:2396:b0:76b:f1c0:224b with SMTP id d2e1a72fcca58-76e20fd02b7mr3433259b3a.23.1755071763502;
        Wed, 13 Aug 2025 00:56:03 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd22csm31395754b3a.65.2025.08.13.00.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:56:03 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:25:18 +0530
Subject: [PATCH v4 2/7] dt-bindings: clock: qcom: Document the Glymur SoC
 TCSR Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXxzBqwH5P6Hd7
 GBqr8nsHHsM1LaV3uOqCpiIQ6QXl3F+Avh23G16I8rCrd24fl/2dJ7tAuA4KDWbChwqUwxCWff8
 28WYZS9WCw801YUUJUW83h310p7v+dAPBOmjxCLOSdLz9kLssDzAAG6qDhTuYnboLgm6+lmfGI4
 HZM9tLUIsB2nZyT1tCHvh6EF0DqvR4GFAtLYXDywA577m3dnfx4uKgHPXZVQJKyxjpaGYPAzeov
 ntOGWfQiYEObrNS8cfzrs1jfwCliXzR/ye5FaCC9feCh+D7x29o8U+rvZg9htAjkmhk4vipWOl/
 OnKtWj3CzbtGl7S/45jkwrIHGZ6Ya41T9lk4bnXHT7N4oQmCaM0RRxITxC04pTVQYRh2DZgbM9H
 0VUsHbM9
X-Proofpoint-GUID: yW8icG_mcIPguQZqgufjTrZRRjnKb2I5
X-Proofpoint-ORIG-GUID: yW8icG_mcIPguQZqgufjTrZRRjnKb2I5
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689c4515 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=NoBSHRPQAjGLFGKXj-wA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

The Glymur SoC TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
this to the TCSR clock controller binding together with identifiers for
the clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  3 +++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 2ed7d59722fc7e1e8ccc3adbef16e26fc44bf156..2c992b3437f29b38d9c73e3c600f2c55e0b8ae98 100644
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
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
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

