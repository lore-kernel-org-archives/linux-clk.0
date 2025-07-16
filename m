Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389EF26E143
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679239; cv=none; b=QoZCei7tILtd9Ug4uA+fyyl1oFfEndgJwiIKKBu2tTE3RO3yeksOLDoevqzCMw146ix1MEt++36gmVOwMCm5kY6yHg3OUeZbDfivKPBre4Vgph7NRbpCQsS+0qkalFcW7P96fG/Ol4sjVdD7OpZMhqqYmeI4+bvues+x2kCg0sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679239; c=relaxed/simple;
	bh=FHbMUWIwDLjzzDs7EACZx+RwtXAev+AhH2JinKmvF9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K2Jc8kfiJWwEGg5KmPc7IOekq57hTJ8OY3XJvQY8Gau40UdzDd0hdyfH1McDp2izjFaPDeC8hCr3j2PWaJs4FrPDFR18mSfhMUp0u8iNP1s3aHcBIMrMMv4xZfil1amQLAYqqx7Q164KskToDtTTJuU/WWnLLczyuOVEhUtKkuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtDk9F8P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtDk9F8P"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDb2cG026001
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bH6uNs2EMbe
	7CtZfXiVtThZ2PeSVgjpvGZz47v2mqpE=; b=jtDk9F8PHMl9kNWkKwMSmXcULF+
	PUJpskpLrHiP5JfJTBa9vy8RPQ86XDjZYX2apQWb9vIw+IDGmmBtyE4BTyIUBCaX
	P+30Jrac+YckoyjfoBi9QDjmd1ABQBhxed6P8Mpt7voOnt65a3bkRf/p8BPiGhGb
	Wk06ACWBxQ85RVvKBhAFUjLJSJSFImZkht3cbEQv7nj6aUo1kBUmaL0Pg4817yb5
	cCk5jVzhph66+XXMqIrLppd9xuzauJK+VzSFqU/BnGUeFp9az3sFEt0SHRFaA4j/
	N7hqxiEcMYHxH4ZfeKQhM5SpWGRtyKvkSHjUhNZVxB1tdW745Ql1ntP+uzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca5pd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747ddba7c90so30956b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 08:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679236; x=1753284036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bH6uNs2EMbe7CtZfXiVtThZ2PeSVgjpvGZz47v2mqpE=;
        b=pt6DRZHYt086unCV9m+hOAcu8Nm+NNENbTL2O5sWOJ8NbJZgmnkRM4wIm9+m70UKQS
         bde3nWlE+3ytP/4WtaDGFb5uQA7yHn7xsrLYxobYpo9AKMT3Jg8g/05LQAEyNAE05HyG
         HOnyICuEm3pwhwWo9Bb3oymtY7o64MDTDLn5/Zr67Nsi1avt79VpupcbjEl242GWD1mK
         brGPrp0rRNKteDrcl4KtW0uIUXHmQVKgXXq5M5UqCXDaTVEG6NOLUDNvtRhCIW4Hk7ZL
         6siCLWWjS1CnAvF/Mcyl1RHFD3rUOwHcOodBNTo45ntzLL4YuNnaK1sTBZ+0Wnsj8lbP
         0b8A==
X-Gm-Message-State: AOJu0YznTntiYiUEcJ4U0kfffkIEBzV12HH0ZPF+fn48q3JV8PjHLhHy
	s/GupNAA2mZOAnH0SZFCfnD+bUdNwjc9FQgP1+fyTsOTRdrozL/evs0elShcSDct3IFwr5PAUWI
	sIQYfU5r56vbdwTOVA+Qm6C0W7+MOUOBUzBjzb2Fc6iaSDirpTWDPVhk09mUaWwI=
X-Gm-Gg: ASbGncuUBCI1Kxk1ZGURIIVcJ36L3q/UqoALRuAfz4G06rxJUwVIh0tOIwynOKYDsEv
	F+ejuRIu4b2WMHBXSSXa8yG4MVjHzsKhZ6hd2Rr7hty0NIaGlRKxh8ve+7yucYh8KIet4XOoOPC
	dPyA3ibzYFApPWlNiffz2R3PjN8spz1fMiPGru7HSWUo8KoujvaXgyDWgl13WqN9W5bPSqilXcR
	YpDp2Nt8Ezj0sKHhJmHntDOOMSIPyVbLlhdH+iDAbHBoAs6J6MAShbWFwAHL+HotwUWKKOUyPMc
	gIwK1d9yUgzd8El46oGnRoz6j5yFyD1dzCyuozQnZrPQf62hwz9u06TFL6wl1rFFXU+HrfgJagE
	VHcxFppY1YVQf+fOnbvwLb6uilIfi25DGrp7LinoNOaSPZbA4OHnwlBbVllpo
X-Received: by 2002:a05:6a21:6daa:b0:234:98ee:daae with SMTP id adf61e73a8af0-23812457aa5mr4461479637.21.1752679236029;
        Wed, 16 Jul 2025 08:20:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBtaZlHU0tQo2Ac+UAKtWkfyPrldBaiGlgpbsQEnA2s8MxScmuw65VlcnWVn6PGRrM3sdiZw==
X-Received: by 2002:a05:6a21:6daa:b0:234:98ee:daae with SMTP id adf61e73a8af0-23812457aa5mr4461416637.21.1752679235516;
        Wed, 16 Jul 2025 08:20:35 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:35 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: clock: qcom: Add bindings documentation for the Glymur TCSR
Date: Wed, 16 Jul 2025 20:50:12 +0530
Message-Id: <20250716152017.4070029-3-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfXxBxrcAZf4D4u
 iVZjnWv0Wt5nhhX83uuoTTSqq4JY+7TFBHTGZnQIWa1tzlCoh7R7q6n1arDccWGkBabNPyg6biF
 T/GpGJtpmsfqJgDndsk+0gs3toBhOLNd/XKkMtPFEVv2WvMQrG0Mm8UqB1BXIPM3eKvZ2VDq405
 X7aOR8Li84IUL0VdwKeKSHp5vrc6QVwTUqLr15ukBJS6f4dZWHb5b+QSuCz1jpg73Xhww5MZqYC
 Y4RROpb76GdXErkEa/zyoFPdbWRYnRqqKTOa9xqkbnQk+eduGa/77s1d075JEJ4Zsmqewo+BOSK
 9nuUbTXIXa/tPkfN5BBKby9gHSz8TApy4NbTcQFzSVt1Tu78LN3LlN/9VYYt8J8TNIgj5kW8c3C
 2AWnhm4hTUn1HleeQnyv3qphjbvGxfJSrM6cVIX28pCKE3TcU4UkukCw65TI6WAgzf1UV15F
X-Proofpoint-GUID: lqW6Pesmm2jXXwsq8ygbeSP6Firg_ljl
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6877c345 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NoBSHRPQAjGLFGKXj-wA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: lqW6Pesmm2jXXwsq8ygbeSP6Firg_ljl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

The Glymur TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
this to the TCSR clock controller binding together with identifiers for
the clocks

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml      |  3 +++
 .../dt-bindings/clock/qcom,glymur-tcsrcc.h    | 24 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-tcsrcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index f3afbb25e868..9fbf88836782 100644
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
diff --git a/include/dt-bindings/clock/qcom,glymur-tcsrcc.h b/include/dt-bindings/clock/qcom,glymur-tcsrcc.h
new file mode 100644
index 000000000000..72614226b113
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-tcsrcc.h
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

