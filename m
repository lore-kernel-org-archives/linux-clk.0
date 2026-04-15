Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DAB3B388A
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260016; cv=none; b=TKK/0bhR8IqN4M25/iS8jxyTKBnN1ILOoZ11vMdPvYQEEFs8Lu8K0CUzz7LyWBdYG1sZ4a3Zs5NgXCqnYu+i44XDtynEvRU2EBVBUD6EseEvFgMyuphpwzInKYnUPip3eUTgyEpcYMaWf/pJXtdJzjRBN49L4KYcvzGQcoJvQmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260016; c=relaxed/simple;
	bh=3IaTrOI1CGyyipf3GBAwoUzudda5VdE6I+EEydORhkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJ9O8gletjisvVrkMj3W57cVZ3jCJQr//6k8VPjr7lK/8aoktISrPM9YBftzcPKI8SoOi4caIuyF6k6CAQGKFN3QP+qkW98gceXGYIknSt7UAXJsg8ybLLFQUboFb3Z7DQJf3ItKTPp+nZKnp1gW1xk0bzEclkrtQD5vYL8R3CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IylJ3OFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JpAMFqtO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IylJ3OFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpAMFqtO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tSH9764284
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFTr3YCb4BFcTR2f/dxzQNU33KODHbTNeNARXugbBP8=; b=IylJ3OFw3DwOFceo
	cJoUsj60s3tgp3X0FrHkE/uf47cZKDjVTOBJsTdtZBhpnoGI95ldhNmh0ZgK+gVe
	o32nYNwUBVobp7IY74SJ86qV3iHRKu9YD0GSCOGhrGT1dzrdNXjya6393SDmjiXZ
	Q5akvy28j11NoRN76pd7Ww2PtfmRDgV2qbHlS4hMIJ5VnOuW7A0YWhUND4mrd3Pu
	hpuz9JL3ph/O70LySDg1lwOIplrrvztyNZN+UlWN++r47sbgthnWICJrh8vjDEXF
	t8TBWCr6szz25xqdXumlnf2j6rM9W9qh1a7ACa6/3OySxnnBwQOKLV5SFwxTU6Np
	K4veMw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7s6h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:33:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f70ae35c0so111049b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260011; x=1776864811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFTr3YCb4BFcTR2f/dxzQNU33KODHbTNeNARXugbBP8=;
        b=JpAMFqtOrS64LqNEoDbVb72JilfgL4CBcMfJy3iXFcfab/a22RcS7ByTROg9Xm9JsL
         qNOHPQPMydKm+XrOhlut6rg3cj09ke8c8PbM4o+LtkIseSV+0PDcTF2pegjY7+TSNaSN
         igTIgYSS/21If0asetrOK7RfRr9az3Dt+QN7rFiUNbT+OYzxk4yIsnQm/98/h0nIF65a
         kecBB+k33F/XWbFXn30YHLnsH6S8FIlAN1DO705gUIEkkdZZ/egAhBs4N7HUtnq+PoLx
         DpAIp6Snig2XkZyHUIf/Ld6hBNm0vT3I6/nsseeBvggvKIT3HII2kG94wg/sFQfOMJEE
         2G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260011; x=1776864811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DFTr3YCb4BFcTR2f/dxzQNU33KODHbTNeNARXugbBP8=;
        b=VWK36QuEDefCNZMvWVQiicZnvwW/FZ7YLvLLxdSMCiv4VVD1Rpl65EsgQ4m66b9rLU
         Lc/IjelAYNWd+qit69OwY8zClCpLsdIVsoRo7eAK54n4mpPSCHDcf+ugS8fg7wt7LCKt
         XBe7jkXmydNl3MLsSE9oq24iDxVTGBgehf0H805ptjXv0NInm69Q7M++eMDObJOdMm9Y
         rHo+V1s7V0ENIvSiLmfbeng3OMkCoWOKjcFPIifDPu5AWfTfLYRhLTfFcbLQPNuS7TUb
         MsphoI/F+YoXs3OsIAYf5BP3WbeoTeKohOh3loTjvgfomo9TQE/ZK+zlNTzW/qDwNWv0
         ORbA==
X-Forwarded-Encrypted: i=1; AFNElJ+2qJ018URmQiH+zX180gfqdqipNdLxBcm0w6ZGNT05IM3VqCVsy+zqpusy1An9GzHG5K1Qbrj0pto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyby1qbxkugLW4iD803TButNTjAmRsD8glUu/yEABH1N9uyU21l
	SICAJAeq+k7yf46N33Adx4K6RCsvowifpJUjiNAJjf2srEEKthd5diwTGo1rlVusDX7eZINWtfI
	AJxUBmRjro9AgBjwrOR1V0WQtvmLAg+V6DD4AQC5aKhMaM5l0i1WNiNeritBwlLQ=
X-Gm-Gg: AeBDietyJJVunFkawzAQaK9CHL1tHD6oFU7a8KFm+nczGYkmi+ii3bYNDb7+ib/HHTW
	59Yf9qct9JJFcsmhtPHUDD7stykNXQf0i9Ggo06GT9HnWAqTYV/0ES16ncF0Di1omOaUBnxcMM2
	8hKg7eFcVp2l4jCCChm9YVFx8++WN5fSa4r6X7JJBHmkgkZqsENjGkav2Fkr/zPvu9onEsfQEcS
	D8Od+Hkoi94nd8oAW0GZGgIlV2UwVqhi+efeRlaKDw/IMkViqBiJMOWD6rupdY4KaQx4TlETLka
	lpnCuz2PuDt96PruMfW9X8dibG7rM1AL6UyKB4nfnMUio3ILyVkQi6bmuaNIec9jdcA0nUGYBi4
	KwFqjL2czHIl8Ki2Z6WvRN1uTxb+UzM9U2ARb51Ix4bNIy5a14WWmXsIGt/OIyYIUVpicoasEWp
	p3lh+WeEYAYc8d49Y5wNIfVITgerJL/Qr4viWQchzh+gRuLbSRKN17PsVL
X-Received: by 2002:a05:6a00:808c:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82f0c281379mr20701086b3a.19.1776260010714;
        Wed, 15 Apr 2026 06:33:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:808c:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82f0c281379mr20701035b3a.19.1776260009963;
        Wed, 15 Apr 2026 06:33:29 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:16 +0530
Subject: [PATCH 1/5] dt-bindings: clock: add Qualcomm IPQ9650 GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-1-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=19616;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=3IaTrOI1CGyyipf3GBAwoUzudda5VdE6I+EEydORhkc=;
 b=sR7aLJViX3KLS6esj5K98Ztbx0Zix5RvmsJ9AUPKDDtGLr+B6RaGBMzSBGyio6Bt9Ulf84JUi
 lO+2hjB6kEaAO5hJk+EHY5MV+SemCqssuk013dUxfyPOFyP5ViMXR0W
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df93ab cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WFUcH46kpRkaEDnmzbAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: nNACQMPqLkQo-tIyVtLoxyu714UwFmLz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX0RYvXOZ/xmdD
 He9+aqp7Gn6eSZlYrKQK1jFBDl7UsnK/yZbobvNvKLA1sZQzInyc4Aq4LDyPL0COUyqvkWCpewo
 Xz6WvYC5wIWE168lAdA02h9ej0kT3sb0tzYUQ9fyOU/bZqDXDsW1mEbDK3rrMbcbwIoXEJejx8E
 cFYiMucR2LK2laVmUjpSFLJVT4j2PpMIPIk5bewp7s2ZdAU6ZzVyUoZXVCWG6om+xj0T4BFejYs
 3Wg7JMpbAtG6hKxP+fsVHGoMSyr405tGHOhiJFA2Y94/u69ZSWHBr4zAul0NcUH8cFmpGf8uOL4
 b0uRsA+cY6wfNCgLM1utUWZKVWxhYwFNZa2ZuZJtQFYJz9bnsw1Cdqo3WDvwqxZ+vqx05EBakaz
 5zFp5nCVX4vSgGzgE9+MtgejsXyMn0qukx+XuDi2EOnPvNha5+GW70SL9gpuC9lGd7Olahyc1WN
 dwVpVUzc0GcIYDxcqbg==
X-Proofpoint-ORIG-GUID: nNACQMPqLkQo-tIyVtLoxyu714UwFmLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150126

Add binding for the Qualcomm IPQ9650 Global Clock Controller.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |  68 ++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       | 190 +++++++++++++++++
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       | 228 +++++++++++++++++++++
 3 files changed, 486 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml
new file mode 100644
index 000000000000..f33105217a06
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq9650-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on IPQ9650
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on IPQ9650
+
+  See also:
+    include/dt-bindings/clock/qcom,ipq9650-gcc.h
+    include/dt-bindings/reset/qcom,ipq9650-gcc.h
+
+properties:
+  compatible:
+    const: qcom,ipq9650-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE30 PHY0 pipe clock source
+      - description: PCIE30 PHY1 pipe clock source
+      - description: PCIE30 PHY2 pipe clock source
+      - description: PCIE30 PHY3 pipe clock source
+      - description: PCIE30 PHY4 pipe clock source
+      - description: USB PCIE wrapper pipe clock source
+      - description: NSS common clock source
+
+  '#power-domain-cells': false
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@1800000 {
+      compatible = "qcom,ipq9650-gcc";
+      reg = <0x01800000 0x40000>;
+      clocks = <&xo_board_clk>,
+               <&sleep_clk>,
+               <&pcie30_phy0_pipe_clk>,
+               <&pcie30_phy1_pipe_clk>,
+               <&pcie30_phy2_pipe_clk>,
+               <&pcie30_phy3_pipe_clk>,
+               <&pcie30_phy4_pipe_clk>,
+               <&usb3phy_0_cc_pipe_clk>,
+               <&nss_cmn_clk>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,ipq9650-gcc.h b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
new file mode 100644
index 000000000000..600240227c3d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ9650_H
+#define _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ9650_H
+
+#define GCC_ADSS_PWM_CLK					0
+#define GCC_ADSS_PWM_CLK_SRC					1
+#define GCC_ANOC_PCIE0_1LANE_M_CLK				2
+#define GCC_ANOC_PCIE0_1LANE_S_CLK				3
+#define GCC_ANOC_PCIE1_2LANE_M_CLK				4
+#define GCC_ANOC_PCIE1_2LANE_S_CLK				5
+#define GCC_ANOC_PCIE2_2LANE_M_CLK				6
+#define GCC_ANOC_PCIE2_2LANE_S_CLK				7
+#define GCC_ANOC_PCIE3_2LANE_M_CLK				8
+#define GCC_ANOC_PCIE3_2LANE_S_CLK				9
+#define GCC_ANOC_PCIE4_1LANE_M_CLK				10
+#define GCC_ANOC_PCIE4_1LANE_S_CLK				11
+#define GCC_CMN_12GPLL_AHB_CLK					12
+#define GCC_CMN_12GPLL_APU_CLK					13
+#define GCC_CMN_12GPLL_SYS_CLK					14
+#define GCC_CMN_LDO_CLK						15
+#define GCC_MDIO_AHB_CLK					16
+#define GCC_NSSCC_CLK						17
+#define GCC_NSSCFG_CLK						18
+#define GCC_NSSNOC_ATB_CLK					19
+#define GCC_NSSNOC_MEMNOC_1_CLK					20
+#define GCC_NSSNOC_MEMNOC_BFDCD_CLK_SRC				21
+#define GCC_NSSNOC_MEMNOC_CLK					22
+#define GCC_NSSNOC_MEMNOC_DIV_CLK_SRC				23
+#define GCC_NSSNOC_NSSCC_CLK					24
+#define GCC_NSSNOC_PCNOC_1_CLK					25
+#define GCC_NSSNOC_QOSGEN_REF_CLK				26
+#define GCC_NSSNOC_SNOC_1_CLK					27
+#define GCC_NSSNOC_SNOC_CLK					28
+#define GCC_NSSNOC_TIMEOUT_REF_CLK				29
+#define GCC_NSSNOC_XO_DCD_CLK					30
+#define GCC_NSS_TS_CLK						31
+#define GCC_NSS_TS_CLK_SRC					32
+#define GCC_PCIE0_AHB_CLK					33
+#define GCC_PCIE0_AUX_CLK					34
+#define GCC_PCIE0_AXI_M_CLK					35
+#define GCC_PCIE0_AXI_M_CLK_SRC					36
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK				37
+#define GCC_PCIE0_AXI_S_CLK					38
+#define GCC_PCIE0_AXI_S_CLK_SRC					39
+#define GCC_PCIE0_PIPE_CLK					40
+#define GCC_PCIE0_PIPE_CLK_SRC					41
+#define GCC_PCIE0_RCHNG_CLK					42
+#define GCC_PCIE0_RCHNG_CLK_SRC					43
+#define GCC_PCIE1_AHB_CLK					44
+#define GCC_PCIE1_AUX_CLK					45
+#define GCC_PCIE1_AXI_M_CLK					46
+#define GCC_PCIE1_AXI_M_CLK_SRC					47
+#define GCC_PCIE1_AXI_S_BRIDGE_CLK				48
+#define GCC_PCIE1_AXI_S_CLK					49
+#define GCC_PCIE1_AXI_S_CLK_SRC					50
+#define GCC_PCIE1_PIPE_CLK					51
+#define GCC_PCIE1_PIPE_CLK_SRC					52
+#define GCC_PCIE1_RCHNG_CLK					53
+#define GCC_PCIE1_RCHNG_CLK_SRC					54
+#define GCC_PCIE2_AHB_CLK					55
+#define GCC_PCIE2_AUX_CLK					56
+#define GCC_PCIE2_AXI_M_CLK					57
+#define GCC_PCIE2_AXI_M_CLK_SRC					58
+#define GCC_PCIE2_AXI_S_BRIDGE_CLK				59
+#define GCC_PCIE2_AXI_S_CLK					60
+#define GCC_PCIE2_AXI_S_CLK_SRC					61
+#define GCC_PCIE2_PIPE_CLK					62
+#define GCC_PCIE2_PIPE_CLK_SRC					63
+#define GCC_PCIE2_RCHNG_CLK					64
+#define GCC_PCIE2_RCHNG_CLK_SRC					65
+#define GCC_PCIE3_AHB_CLK					66
+#define GCC_PCIE3_AUX_CLK					67
+#define GCC_PCIE3_AXI_M_CLK					68
+#define GCC_PCIE3_AXI_M_CLK_SRC					69
+#define GCC_PCIE3_AXI_S_BRIDGE_CLK				70
+#define GCC_PCIE3_AXI_S_CLK					71
+#define GCC_PCIE3_AXI_S_CLK_SRC					72
+#define GCC_PCIE3_PIPE_CLK					73
+#define GCC_PCIE3_PIPE_CLK_SRC					74
+#define GCC_PCIE3_RCHNG_CLK					75
+#define GCC_PCIE3_RCHNG_CLK_SRC					76
+#define GCC_PCIE4_AHB_CLK					77
+#define GCC_PCIE4_AUX_CLK					78
+#define GCC_PCIE4_AXI_M_CLK					79
+#define GCC_PCIE4_AXI_M_CLK_SRC					80
+#define GCC_PCIE4_AXI_S_BRIDGE_CLK				81
+#define GCC_PCIE4_AXI_S_CLK					82
+#define GCC_PCIE4_AXI_S_CLK_SRC					83
+#define GCC_PCIE4_PIPE_CLK					84
+#define GCC_PCIE4_PIPE_CLK_SRC					85
+#define GCC_PCIE4_RCHNG_CLK					86
+#define GCC_PCIE4_RCHNG_CLK_SRC					87
+#define GCC_PCIE_AUX_CLK_SRC					88
+#define GCC_PCIE_CMN_HCLK					89
+#define GCC_PCIE_CMN_LDO_CLK					90
+#define GCC_PCNOC_BFDCD_CLK_SRC					91
+#define GCC_PRIMESS_AHBM_CLK					92
+#define GCC_PRIMESS_AHBM_CLK_SRC				93
+#define GCC_PRIMESS_AHBM_PARTIAL_CLK				94
+#define GCC_PRIMESS_AHBS_CLK					95
+#define GCC_PRIMESS_ATB_CLK					96
+#define GCC_PRIMESS_AXIM_CLK					97
+#define GCC_PRIMESS_AXIM_CLK_SRC				98
+#define GCC_PRIMESS_AXIM_PARTIAL_CLK				99
+#define GCC_PRIMESS_CLK						100
+#define GCC_PRIMESS_CLK_SRC					101
+#define GCC_PRIMESS_XO_CLK					102
+#define GCC_QDSS_AT_CLK						103
+#define GCC_QDSS_AT_CLK_SRC					104
+#define GCC_QDSS_DAP_CLK					105
+#define GCC_QDSS_TSCTR_CLK_SRC					106
+#define GCC_QPIC_AHB_CLK					107
+#define GCC_QPIC_CLK						108
+#define GCC_QPIC_CLK_SRC					109
+#define GCC_QPIC_IO_MACRO_CLK					110
+#define GCC_QPIC_IO_MACRO_CLK_SRC				111
+#define GCC_QPIC_SLEEP_CLK					112
+#define GCC_QUPV3_2X_CORE_CLK					113
+#define GCC_QUPV3_2X_CORE_CLK_SRC				114
+#define GCC_QUPV3_AHB_MST_CLK					115
+#define GCC_QUPV3_AHB_SLV_CLK					116
+#define GCC_QUPV3_CORE_CLK					117
+#define GCC_QUPV3_SLEEP_CLK					118
+#define GCC_QUPV3_WRAP_SE0_CLK					119
+#define GCC_QUPV3_WRAP_SE0_CLK_SRC				120
+#define GCC_QUPV3_WRAP_SE1_CLK					121
+#define GCC_QUPV3_WRAP_SE1_CLK_SRC				122
+#define GCC_QUPV3_WRAP_SE2_CLK					123
+#define GCC_QUPV3_WRAP_SE2_CLK_SRC				124
+#define GCC_QUPV3_WRAP_SE3_CLK					125
+#define GCC_QUPV3_WRAP_SE3_CLK_SRC				126
+#define GCC_QUPV3_WRAP_SE4_CLK					127
+#define GCC_QUPV3_WRAP_SE4_CLK_SRC				128
+#define GCC_QUPV3_WRAP_SE5_CLK					129
+#define GCC_QUPV3_WRAP_SE5_CLK_SRC				130
+#define GCC_QUPV3_WRAP_SE6_CLK					131
+#define GCC_QUPV3_WRAP_SE6_CLK_SRC				132
+#define GCC_QUPV3_WRAP_SE7_CLK					133
+#define GCC_QUPV3_WRAP_SE7_CLK_SRC				134
+#define GCC_REFGEN_CORE_CLK_SRC					135
+#define GCC_REFGEN_PCIE_CORE_CLK				136
+#define GCC_REFGEN_PCIE_HCLK					137
+#define GCC_SDCC1_AHB_CLK					138
+#define GCC_SDCC1_APPS_CLK					139
+#define GCC_SDCC1_APPS_CLK_SRC					140
+#define GCC_SDCC1_ICE_CORE_CLK					141
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				142
+#define GCC_SLEEP_CLK_SRC					143
+#define GCC_SNOC_USB_CLK					144
+#define GCC_SYSTEM_NOC_BFDCD_CLK_SRC				145
+#define GCC_TLMM_AHB_CLK					146
+#define GCC_TLMM_CLK						147
+#define GCC_UNIPHY0_AHB_CLK					148
+#define GCC_UNIPHY0_SYS_CLK					149
+#define GCC_UNIPHY1_AHB_CLK					150
+#define GCC_UNIPHY1_SYS_CLK					151
+#define GCC_UNIPHY2_AHB_CLK					152
+#define GCC_UNIPHY2_SYS_CLK					153
+#define GCC_UNIPHY_SYS_CLK_SRC					154
+#define GCC_USB0_AUX_CLK					155
+#define GCC_USB0_AUX_CLK_SRC					156
+#define GCC_USB0_EUD_AT_CLK					157
+#define GCC_USB0_MASTER_CLK					158
+#define GCC_USB0_MASTER_CLK_SRC					159
+#define GCC_USB0_MOCK_UTMI_CLK					160
+#define GCC_USB0_MOCK_UTMI_CLK_SRC				161
+#define GCC_USB0_MOCK_UTMI_DIV_CLK_SRC				162
+#define GCC_USB0_PHY_CFG_AHB_CLK				163
+#define GCC_USB0_PIPE_CLK					164
+#define GCC_USB0_PIPE_CLK_SRC					165
+#define GCC_USB0_SLEEP_CLK					166
+#define GCC_USB1_MASTER_CLK					167
+#define GCC_USB1_MOCK_UTMI_CLK					168
+#define GCC_USB1_MOCK_UTMI_CLK_SRC				169
+#define GCC_USB1_MOCK_UTMI_DIV_CLK_SRC				170
+#define GCC_USB1_PHY_CFG_AHB_CLK				171
+#define GCC_USB1_SLEEP_CLK					172
+#define GCC_USB_CMN_HCLK					173
+#define GCC_USB_CMN_LDO_CLK					174
+#define GCC_XO_CLK_SRC						175
+#define GPLL0							176
+#define GPLL0_MAIN						177
+#define GPLL2							178
+#define GPLL2_OUT_MAIN						179
+#define GPLL4							180
+#endif
diff --git a/include/dt-bindings/reset/qcom,ipq9650-gcc.h b/include/dt-bindings/reset/qcom,ipq9650-gcc.h
new file mode 100644
index 000000000000..0b8dd3ff4257
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq9650-gcc.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_RESET_IPQ_GCC_IPQ9650_H
+#define _DT_BINDINGS_RESET_IPQ_GCC_IPQ9650_H
+
+#define GCC_ADSS_BCR						0
+#define GCC_ADSS_PWM_CLK_ARES					1
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR			2
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_GPLL0_CLK_ARES		3
+#define GCC_APSS_AHB_CLK_ARES					4
+#define GCC_APSS_ATB_CLK_ARES					5
+#define GCC_APSS_AXI_CLK_ARES					6
+#define GCC_APSS_TS_CLK_ARES					7
+#define GCC_BOOT_ROM_AHB_CLK_ARES				8
+#define GCC_BOOT_ROM_BCR					9
+#define GCC_CMN_12GPLL_AHB_CLK_ARES				10
+#define GCC_CMN_12GPLL_APU_CLK_ARES				11
+#define GCC_CMN_12GPLL_SYS_CLK_ARES				12
+#define GCC_CMN_BLK_BCR						13
+#define GCC_CMN_LDO_CLK_ARES					14
+#define GCC_CPUSS_TRIG_CLK_ARES					15
+#define GCC_GP1_CLK_ARES					16
+#define GCC_GP2_CLK_ARES					17
+#define GCC_GP3_CLK_ARES					18
+#define GCC_MDIO_AHB_CLK_ARES					19
+#define GCC_MDIO_BCR						20
+#define GCC_NSSCC_CLK_ARES					21
+#define GCC_NSSCFG_CLK_ARES					22
+#define GCC_NSSNOC_ATB_CLK_ARES					23
+#define GCC_NSSNOC_MEMNOC_1_CLK_ARES				24
+#define GCC_NSSNOC_MEMNOC_CLK_ARES				25
+#define GCC_NSSNOC_NSSCC_CLK_ARES				26
+#define GCC_NSSNOC_PCNOC_1_CLK_ARES				27
+#define GCC_NSSNOC_QOSGEN_REF_CLK_ARES				28
+#define GCC_NSSNOC_SNOC_1_CLK_ARES				29
+#define GCC_NSSNOC_SNOC_CLK_ARES				30
+#define GCC_NSSNOC_TIMEOUT_REF_CLK_ARES				31
+#define GCC_NSSNOC_XO_DCD_CLK_ARES				32
+#define GCC_NSS_BCR						33
+#define GCC_NSS_TS_CLK_ARES					34
+#define GCC_PCIE0PHY_PHY_BCR					35
+#define GCC_PCIE0_AHB_CLK_ARES					36
+#define GCC_PCIE0_AHB_RESET					37
+#define GCC_PCIE0_AUX_CLK_ARES					38
+#define GCC_PCIE0_AUX_RESET					39
+#define GCC_PCIE0_AXI_M_CLK_ARES				40
+#define GCC_PCIE0_AXI_M_RESET					41
+#define GCC_PCIE0_AXI_M_STICKY_RESET				42
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK_ARES				43
+#define GCC_PCIE0_AXI_S_CLK_ARES				44
+#define GCC_PCIE0_AXI_S_RESET					45
+#define GCC_PCIE0_AXI_S_STICKY_RESET				46
+#define GCC_PCIE0_BCR						47
+#define GCC_PCIE0_CORE_STICKY_RESET				48
+#define GCC_PCIE0_LINK_DOWN_BCR					49
+#define GCC_PCIE0_PHY_BCR					50
+#define GCC_PCIE0_PIPE_CLK_ARES					51
+#define GCC_PCIE0_PIPE_RESET					52
+#define GCC_PCIE1PHY_PHY_BCR					53
+#define GCC_PCIE1_AHB_CLK_ARES					54
+#define GCC_PCIE1_AHB_RESET					55
+#define GCC_PCIE1_AUX_CLK_ARES					56
+#define GCC_PCIE1_AUX_RESET					57
+#define GCC_PCIE1_AXI_M_CLK_ARES				58
+#define GCC_PCIE1_AXI_M_RESET					59
+#define GCC_PCIE1_AXI_M_STICKY_RESET				60
+#define GCC_PCIE1_AXI_S_BRIDGE_CLK_ARES				61
+#define GCC_PCIE1_AXI_S_CLK_ARES				62
+#define GCC_PCIE1_AXI_S_RESET					63
+#define GCC_PCIE1_AXI_S_STICKY_RESET				64
+#define GCC_PCIE1_BCR						65
+#define GCC_PCIE1_CORE_STICKY_RESET				66
+#define GCC_PCIE1_LINK_DOWN_BCR					67
+#define GCC_PCIE1_PHY_BCR					68
+#define GCC_PCIE1_PIPE_CLK_ARES					69
+#define GCC_PCIE1_PIPE_RESET					70
+#define GCC_PCIE2PHY_PHY_BCR					71
+#define GCC_PCIE2_AHB_CLK_ARES					72
+#define GCC_PCIE2_AHB_RESET					73
+#define GCC_PCIE2_AUX_CLK_ARES					74
+#define GCC_PCIE2_AUX_RESET					75
+#define GCC_PCIE2_AXI_M_CLK_ARES				76
+#define GCC_PCIE2_AXI_M_RESET					77
+#define GCC_PCIE2_AXI_M_STICKY_RESET				78
+#define GCC_PCIE2_AXI_S_BRIDGE_CLK_ARES				79
+#define GCC_PCIE2_AXI_S_CLK_ARES				80
+#define GCC_PCIE2_AXI_S_RESET					81
+#define GCC_PCIE2_AXI_S_STICKY_RESET				82
+#define GCC_PCIE2_BCR						83
+#define GCC_PCIE2_CORE_STICKY_RESET				84
+#define GCC_PCIE2_LINK_DOWN_BCR					85
+#define GCC_PCIE2_PHY_BCR					86
+#define GCC_PCIE2_PIPE_CLK_ARES					87
+#define GCC_PCIE2_PIPE_RESET					88
+#define GCC_PCIE3PHY_PHY_BCR					89
+#define GCC_PCIE3_AHB_CLK_ARES					90
+#define GCC_PCIE3_AHB_RESET					91
+#define GCC_PCIE3_AUX_CLK_ARES					92
+#define GCC_PCIE3_AUX_RESET					93
+#define GCC_PCIE3_AXI_M_CLK_ARES				94
+#define GCC_PCIE3_AXI_M_RESET					95
+#define GCC_PCIE3_AXI_M_STICKY_RESET				96
+#define GCC_PCIE3_AXI_S_BRIDGE_CLK_ARES				97
+#define GCC_PCIE3_AXI_S_CLK_ARES				98
+#define GCC_PCIE3_AXI_S_RESET					99
+#define GCC_PCIE3_AXI_S_STICKY_RESET				100
+#define GCC_PCIE3_BCR						101
+#define GCC_PCIE3_CORE_STICKY_RESET				102
+#define GCC_PCIE3_LINK_DOWN_BCR					103
+#define GCC_PCIE3_PHY_BCR					104
+#define GCC_PCIE3_PIPE_CLK_ARES					105
+#define GCC_PCIE3_PIPE_RESET					106
+#define GCC_PCIE4PHY_PHY_BCR					107
+#define GCC_PCIE4_AHB_CLK_ARES					108
+#define GCC_PCIE4_AHB_RESET					109
+#define GCC_PCIE4_AUX_CLK_ARES					110
+#define GCC_PCIE4_AUX_RESET					111
+#define GCC_PCIE4_AXI_M_CLK_ARES				112
+#define GCC_PCIE4_AXI_M_RESET					113
+#define GCC_PCIE4_AXI_M_STICKY_RESET				114
+#define GCC_PCIE4_AXI_S_BRIDGE_CLK_ARES				115
+#define GCC_PCIE4_AXI_S_CLK_ARES				116
+#define GCC_PCIE4_AXI_S_RESET					117
+#define GCC_PCIE4_AXI_S_STICKY_RESET				118
+#define GCC_PCIE4_BCR						119
+#define GCC_PCIE4_CORE_STICKY_RESET				120
+#define GCC_PCIE4_LINK_DOWN_BCR					121
+#define GCC_PCIE4_PHY_BCR					122
+#define GCC_PCIE4_PIPE_CLK_ARES					123
+#define GCC_PCIE4_PIPE_RESET					124
+#define GCC_PCIE_CMN_LDO_BCR					125
+#define GCC_PRIMESS_AHBM_CLK_ARES				126
+#define GCC_PRIMESS_AHBM_PARTIAL_CLK_ARES			127
+#define GCC_PRIMESS_AHBS_CLK_ARES				128
+#define GCC_PRIMESS_ATB_CLK_ARES				129
+#define GCC_PRIMESS_AXIM_CLK_ARES				130
+#define GCC_PRIMESS_AXIM_PARTIAL_CLK_ARES			131
+#define GCC_PRIMESS_CLK_ARES					132
+#define GCC_PRIMESS_XO_CLK_ARES					133
+#define GCC_PRIME_SS_BCR					134
+#define GCC_QDSS_APB2JTAG_CLK_ARES				135
+#define GCC_QDSS_AT_CLK_ARES					136
+#define GCC_QDSS_BCR						137
+#define GCC_QDSS_CFG_AHB_CLK_ARES				138
+#define GCC_QDSS_DAP_AHB_CLK_ARES				139
+#define GCC_QDSS_DAP_CLK_ARES					140
+#define GCC_QDSS_ETR_USB_CLK_ARES				141
+#define GCC_QDSS_EUD_AT_CLK_ARES				142
+#define GCC_QDSS_STM_CLK_ARES					143
+#define GCC_QDSS_TRACECLKIN_CLK_ARES				144
+#define GCC_QDSS_TSCTR_DIV16_CLK_ARES				145
+#define GCC_QDSS_TSCTR_DIV2_CLK_ARES				146
+#define GCC_QDSS_TSCTR_DIV3_CLK_ARES				147
+#define GCC_QDSS_TSCTR_DIV4_CLK_ARES				148
+#define GCC_QDSS_TSCTR_DIV8_CLK_ARES				149
+#define GCC_QDSS_TS_CLK_ARES					150
+#define GCC_QPIC_AHB_CLK_ARES					151
+#define GCC_QPIC_BCR						152
+#define GCC_QPIC_CLK_ARES					153
+#define GCC_QPIC_IO_MACRO_CLK_ARES				154
+#define GCC_QPIC_SLEEP_CLK_ARES					155
+#define GCC_QUPV3_2X_CORE_CLK_ARES				156
+#define GCC_QUPV3_AHB_MST_CLK_ARES				157
+#define GCC_QUPV3_AHB_SLV_CLK_ARES				158
+#define GCC_QUPV3_BCR						159
+#define GCC_QUPV3_CORE_CLK_ARES					160
+#define GCC_QUPV3_WRAP_SE0_BCR					161
+#define GCC_QUPV3_WRAP_SE0_CLK_ARES				162
+#define GCC_QUPV3_WRAP_SE1_BCR					163
+#define GCC_QUPV3_WRAP_SE1_CLK_ARES				164
+#define GCC_QUPV3_WRAP_SE2_BCR					165
+#define GCC_QUPV3_WRAP_SE2_CLK_ARES				166
+#define GCC_QUPV3_WRAP_SE3_BCR					167
+#define GCC_QUPV3_WRAP_SE3_CLK_ARES				168
+#define GCC_QUPV3_WRAP_SE4_BCR					169
+#define GCC_QUPV3_WRAP_SE4_CLK_ARES				170
+#define GCC_QUPV3_WRAP_SE5_BCR					171
+#define GCC_QUPV3_WRAP_SE5_CLK_ARES				172
+#define GCC_QUPV3_WRAP_SE6_BCR					173
+#define GCC_QUPV3_WRAP_SE6_CLK_ARES				174
+#define GCC_QUPV3_WRAP_SE7_BCR					175
+#define GCC_QUPV3_WRAP_SE7_CLK_ARES				176
+#define GCC_QUSB2_0_PHY_BCR					177
+#define GCC_QUSB2_1_PHY_BCR					178
+#define GCC_REFGEN_PCIE_BCR					179
+#define GCC_REFGEN_PCIE_CORE_CLK_ARES				180
+#define GCC_SDCC1_APPS_CLK_ARES					181
+#define GCC_SDCC1_ICE_CORE_CLK_ARES				182
+#define GCC_SDCC_BCR						183
+#define GCC_TLMM_AHB_CLK_ARES					184
+#define GCC_TLMM_BCR						185
+#define GCC_TLMM_CLK_ARES					186
+#define GCC_UNIPHY0_AHB_CLK_ARES				187
+#define GCC_UNIPHY0_BCR						188
+#define GCC_UNIPHY0_PMA_BCR					189
+#define GCC_UNIPHY0_SYS_CLK_ARES				190
+#define GCC_UNIPHY0_XPCS_ARES					191
+#define GCC_UNIPHY1_AHB_CLK_ARES				192
+#define GCC_UNIPHY1_BCR						193
+#define GCC_UNIPHY1_PMA_BCR					194
+#define GCC_UNIPHY1_SYS_CLK_ARES				195
+#define GCC_UNIPHY1_XPCS_ARES					196
+#define GCC_UNIPHY2_AHB_CLK_ARES				197
+#define GCC_UNIPHY2_BCR						198
+#define GCC_UNIPHY2_PMA_BCR					199
+#define GCC_UNIPHY2_SYS_CLK_ARES				200
+#define GCC_UNIPHY2_XPCS_ARES					201
+#define GCC_USB0_AUX_CLK_ARES					202
+#define GCC_USB0_MASTER_CLK_ARES				203
+#define GCC_USB0_MOCK_UTMI_CLK_ARES				204
+#define GCC_USB0_PHY_BCR					205
+#define GCC_USB0_PHY_CFG_AHB_CLK_ARES				206
+#define GCC_USB0_PIPE_CLK_ARES					207
+#define GCC_USB0_SLEEP_CLK_ARES					208
+#define GCC_USB1_BCR						209
+#define GCC_USB1_MASTER_CLK_ARES				210
+#define GCC_USB1_MOCK_UTMI_CLK_ARES				211
+#define GCC_USB1_PHY_CFG_AHB_CLK_ARES				212
+#define GCC_USB1_SLEEP_CLK_ARES					213
+#define GCC_USB3PHY_0_PHY_BCR					214
+#define GCC_USB_BCR						215
+#define GCC_USB_CMN_LDO_BCR					216
+#define GCC_UNIPHY1_XLGPCS_ARES					217
+#define GCC_UNIPHY2_XLGPCS_ARES					218
+#endif

-- 
2.34.1

