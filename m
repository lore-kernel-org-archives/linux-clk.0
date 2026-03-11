Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8219D3A6B96
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222363; cv=none; b=qkQQT6CloKyrv94tyi2IKDuqOCd4Tl2lt9nSZTThRvv1ZhDGjDpUd8/jfX1eEg4CGD0dYAfS/sg+oTyV7h88AgrQNETG0mJgq8BkO/DxPK4GRkHC2Eag1y1zyZpK5ymcpuGHD3pOcfZPah04qPh7P1XNAXXsJvfOogwbNa+kHgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222363; c=relaxed/simple;
	bh=mgL4T4zq8SrqOF5sZUo/cgqZOCX5LCBi8q1BG4HWIBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNN+7/pjrkYf8l+Npml5FpRtYKLu9bTN8Te/mGGgruUvSATu95M2iSk/aJtqvL0uNwOvThpp8cOqFhxHy2qJ8lELiShyhDKIOldlsA6FWpuf5HS0JMFlnyvSQklsv6W22F+Hschp44dXiQ4747cJwv/mMU/dsFqWQ8MocrWs+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvoqHCBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzakSXel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvoqHCBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzakSXel"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B502Cq3417072
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTqPkA63h/REyVYZEsOXgiUw3wOTyUtNc6lXzIT+I9Y=; b=lvoqHCBZR6ww30Ci
	yrqMq5AjjbUScuMKppWRtLL0PY6n6LMpRVG0B/z5FBjplEdfuZKtD6DkEpcCU74x
	UZmeQ2QC71GtcfBM/E/opdItRGluym9SS2hPweyagCluMzaY2y3EGkpOWJnGNdk4
	IgjRl5hlw+kIy5ibynCjYgDKL2jQIwUGm2H/QcNu2oE4X8mfsvyYv9FuZ2kZKRCX
	iDybS9F0OudnGLcEfq2adzzGow2NuezRoAAr27P8rtSXvsvXacmeIGLCEuuQJGui
	/JlIQ9wWwASavsy6jIxvJ7pIOIyAkWLCsHFIvfwmujHOZ6ZLJWvHq9CinbCAQEP/
	kbo4UA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2ccwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8298b363fb6so17038910b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 02:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222359; x=1773827159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTqPkA63h/REyVYZEsOXgiUw3wOTyUtNc6lXzIT+I9Y=;
        b=PzakSXelUyqil4du7gjKGYydiC4RUD5xgjP2Obf5zqIIY623Q4Kx97tEyHjGHu2Q9g
         DDyi/JlCgqZhPHdY5dpXRtnWJZy+BZWkS1R5OlHnfNJQw7TKAEkGm50pL3BhtPmjEcxC
         Qsgc7vSB/qyVmD59vs9hWudpnGbp6CwipiYCHNLHvIwKLFNe9rVm0KZ42VxojAfxpJHN
         V5THT68yHi1L7u3yQuUFo/yJQPJpbIp81my3zM6wbwYu/DJoLBSS1pNXVh1CPiKdwlg6
         8PFsVdS7pDmhrlu8M+o/B87SUDpNagIvyXYulbmi+abrlj8UTFFhHIb5K4eaBMGgoRSQ
         j0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222359; x=1773827159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTqPkA63h/REyVYZEsOXgiUw3wOTyUtNc6lXzIT+I9Y=;
        b=TH4tgdgT1YMUOYEULihRh31ESVUchzNkefCTRRTsc9aCAJA8hlyXl7+aB7yoBWca7w
         hfi+LPYCSs7gHKjcyMcDnt7hztGbRxPMYsY4VE1A86In50tYQjgmKe66QxhhNhV4l2aA
         HxHJb4C7Jf/CoIA7NNQVBUpmAril1Q5Ze23qHPGpkvNQljjSqEzEVWe8S1MzzwJnZR2I
         avgW/NDRtY3LwmhobWfOCI8Kaj6Dm6rpn48edvfINsPUEhaT0tYX/KAzSJXa+1C3XNAJ
         AmTJJv09Z6DaVRjAheYceXo0wSRTmn2gynpNMb2dabeSN3hbmGGq4Hs3NrNlE3E1nBvh
         5wvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2WpEKDJC7e/oW6saNVWuh04cPLXqVYZng0FXSnsre/MInUHPV6Spyy8U2Ev0RU+Tcq8abOvTCSgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgD9tY3Bip0dvUTPueQhVGT1dIWuq3UyGDMSQSnKl6kSvB2s0i
	sRLJC7pZ7PXISP2/uwVzV3hKtsgfRO59VPLXqTE5DcYW3sAWQIsKPstF5p2U5GVQQrkl5PkuEA6
	Ws5/AHn5wxL9hD9udmaJxBxBaI5WlhpdZxlt9VbSNiUpY/6ICwl16SNJ5Kj0FlQ8=
X-Gm-Gg: ATEYQzxarqorEkUtBgWjzossx2doi5OYMn0KADObW3nAcxue3aUNJkrRMRJtODzJKe4
	y53Fdz+OSW2T+iCVUbpNxuKLDB6Zog3gEO04ZTItVMANLQYIWbQK+IM6+fGYQdusnnYioaZEb4x
	v1rfzuEKPwQC52PG1Lsf2yQqjf4FAbyoly5LOHzCkmzYAlp96UjscaRd7wgy4O1pQ7CDDIIa4xT
	R9UyhBtIsTKMq3ty42w8QE3XVmhI6CDj+xN8zgGIc6OYdFLoyTYv6V19uVJWl1jc+MxYdGiB8QI
	EUDvSExud7cHJuX9oKGLv+wrjcEumbiTZmto/r6/VFC8TbYI4Qqld/db53Hk9DLL3/ibZo/z46e
	C3D2+/DRV39HN0t/F5sx9zJu0y7AfrabXFy++iWMMhNzzHIMG7+vfo/GCnbmhrz/12sVlyfP+j6
	36rRddKHkDAuk7T5u52svSGvkmL68vJBz9FMwqNLPdLuZZeZmzdsc+fZzV
X-Received: by 2002:a05:6a00:2d13:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-829f703e38amr1889037b3a.25.1773222359331;
        Wed, 11 Mar 2026 02:45:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d13:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-829f703e38amr1889002b3a.25.1773222358826;
        Wed, 11 Mar 2026 02:45:58 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:45:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:43 +0530
Subject: [PATCH 1/9] dt-bindings: clock: add Qualcomm IPQ5210 GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-1-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=12446;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=mgL4T4zq8SrqOF5sZUo/cgqZOCX5LCBi8q1BG4HWIBU=;
 b=BxsL64DCF52v6B14atw2V1xnuPaNV8aYRauuRv0NHt6OzjE4xTcvUbMWFwzu+NNO6dHynG0Xi
 uRSTdjm1RR9CBConlgtkDettTLCVuakcH/4PRhY+iWZ3EEhYnEw1fWA
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b139d8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=os79_l1IAaEW0h9aLhsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: UF20L5BCEEDkpv467wh36qgKbg6c--UU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfXxKLCc9j9mZD0
 DN6KpRzJRhhC8aqwFF7v10LNQ1Uxaq2vY4x1KReUJORA3hEjDg7vlIjcZqxMHyXHn/jUUmoVG1/
 KtMMtixSRHhJCBlRk2RBds4GBwUGlz6SQtcM14k19BiKEdRXDzm7TqyngkceY783h7qqMYoDBmn
 LBxlHyluIvs0NsKafTYgXdRJXh5sEZHiuiyknCRQ3SYsUwb9SFZfWj8ZOQoCInFUAObufPtmof1
 g0CEEZEAXefTR0oR3SzJhv+Wyt8++vaqZAcx5XHjUxmj4UMTAbmu+WMsXl1ZwOnAIDA69jVUBqK
 j7uV/Tbp3tOONYkJ/aDcQtxG5rPwbcEgQSLsuzv+mzfx9xA6NxlS6z7lgykHOTI8qsGvxM/VrkE
 sUDSO7r/vXrREPhGNMTUVnCRVH/3fnq+DlkiSFm36+SnV+Ihd4zOCgBEQP1mCQBj8sf3vUlPivA
 JPTgXYPxSsLP1PG7HPg==
X-Proofpoint-GUID: UF20L5BCEEDkpv467wh36qgKbg6c--UU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081

Add binding for the Qualcomm IPQ5210 Global Clock Controller.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |  62 ++++++++++
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       | 126 ++++++++++++++++++++
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       | 127 +++++++++++++++++++++
 3 files changed, 315 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..aeb5d9a3f8322d5d36d2fd19a1d23b275efc34b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq5210-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on IPQ5210
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on IPQ5210
+
+  See also::
+    include/dt-bindings/clock/qcom,ipq5210-gcc.h
+    include/dt-bindings/reset/qcom,ipq5210-gcc.h
+
+properties:
+  compatible:
+    const: qcom,ipq5210-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE30 PHY0 pipe clock source
+      - description: PCIE30 PHY1 pipe clock source
+      - description: USB3 PHY pipe clock source
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
+      compatible = "qcom,ipq5210-gcc";
+      reg = <0x01800000 0x40000>;
+      clocks = <&xo_board_clk>,
+               <&sleep_clk>,
+               <&pcie30_phy0_pipe_clk>,
+               <&pcie30_phy1_pipe_clk>,
+               <&usb3phy_0_cc_pipe_clk>,
+               <&nss_cmn_clk>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,ipq5210-gcc.h b/include/dt-bindings/clock/qcom,ipq5210-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..84116f34ee4d0433a092987e8d189c2aa95da204
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5210-gcc.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ5210_H
+#define _DT_BINDINGS_CLOCK_IPQ_GCC_IPQ5210_H
+
+#define GCC_ADSS_PWM_CLK					0
+#define GCC_ADSS_PWM_CLK_SRC					1
+#define GCC_CMN_12GPLL_AHB_CLK					2
+#define GCC_CMN_12GPLL_SYS_CLK					3
+#define GCC_CNOC_LPASS_CFG_CLK					4
+#define GCC_CNOC_PCIE0_1LANE_S_CLK				5
+#define GCC_CNOC_PCIE1_2LANE_S_CLK				6
+#define GCC_CNOC_USB_CLK					7
+#define GCC_GEPHY_SYS_CLK					8
+#define GCC_LPASS_AXIM_CLK_SRC					9
+#define GCC_LPASS_CORE_AXIM_CLK					10
+#define GCC_LPASS_SWAY_CLK					11
+#define GCC_LPASS_SWAY_CLK_SRC					12
+#define GCC_MDIO_AHB_CLK					13
+#define GCC_MDIO_GEPHY_AHB_CLK					14
+#define GCC_NSS_TS_CLK						15
+#define GCC_NSS_TS_CLK_SRC					16
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
+#define GCC_PCIE0_AHB_CLK					31
+#define GCC_PCIE0_AUX_CLK					32
+#define GCC_PCIE0_AXI_M_CLK					33
+#define GCC_PCIE0_AXI_M_CLK_SRC					34
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK				35
+#define GCC_PCIE0_AXI_S_CLK					36
+#define GCC_PCIE0_AXI_S_CLK_SRC					37
+#define GCC_PCIE0_PIPE_CLK					38
+#define GCC_PCIE0_PIPE_CLK_SRC					39
+#define GCC_PCIE0_RCHNG_CLK					40
+#define GCC_PCIE0_RCHNG_CLK_SRC					41
+#define GCC_PCIE1_AHB_CLK					42
+#define GCC_PCIE1_AUX_CLK					43
+#define GCC_PCIE1_AXI_M_CLK					44
+#define GCC_PCIE1_AXI_M_CLK_SRC					45
+#define GCC_PCIE1_AXI_S_BRIDGE_CLK				46
+#define GCC_PCIE1_AXI_S_CLK					47
+#define GCC_PCIE1_AXI_S_CLK_SRC					48
+#define GCC_PCIE1_PIPE_CLK					49
+#define GCC_PCIE1_PIPE_CLK_SRC					50
+#define GCC_PCIE1_RCHNG_CLK					51
+#define GCC_PCIE1_RCHNG_CLK_SRC					52
+#define GCC_PCIE_AUX_CLK_SRC					53
+#define GCC_PCNOC_BFDCD_CLK_SRC					54
+#define GCC_PON_APB_CLK						55
+#define GCC_PON_TM_CLK						56
+#define GCC_PON_TM2X_CLK					57
+#define GCC_PON_TM2X_CLK_SRC					58
+#define GCC_QDSS_AT_CLK						59
+#define GCC_QDSS_AT_CLK_SRC					60
+#define GCC_QDSS_DAP_CLK					61
+#define GCC_QDSS_TSCTR_CLK_SRC					62
+#define GCC_QPIC_AHB_CLK					63
+#define GCC_QPIC_CLK						64
+#define GCC_QPIC_CLK_SRC					65
+#define GCC_QPIC_IO_MACRO_CLK					66
+#define GCC_QPIC_IO_MACRO_CLK_SRC				67
+#define GCC_QRNG_AHB_CLK					68
+#define GCC_QUPV3_AHB_MST_CLK					69
+#define GCC_QUPV3_AHB_SLV_CLK					70
+#define GCC_QUPV3_WRAP_SE0_CLK					71
+#define GCC_QUPV3_WRAP_SE0_CLK_SRC				72
+#define GCC_QUPV3_WRAP_SE1_CLK					73
+#define GCC_QUPV3_WRAP_SE1_CLK_SRC				74
+#define GCC_QUPV3_WRAP_SE2_CLK					75
+#define GCC_QUPV3_WRAP_SE2_CLK_SRC				76
+#define GCC_QUPV3_WRAP_SE3_CLK					77
+#define GCC_QUPV3_WRAP_SE3_CLK_SRC				78
+#define GCC_QUPV3_WRAP_SE4_CLK					79
+#define GCC_QUPV3_WRAP_SE4_CLK_SRC				80
+#define GCC_QUPV3_WRAP_SE5_CLK					81
+#define GCC_QUPV3_WRAP_SE5_CLK_SRC				82
+#define GCC_SDCC1_AHB_CLK					83
+#define GCC_SDCC1_APPS_CLK					84
+#define GCC_SDCC1_APPS_CLK_SRC					85
+#define GCC_SDCC1_ICE_CORE_CLK					86
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				87
+#define GCC_SLEEP_CLK_SRC					88
+#define GCC_SNOC_LPASS_CLK					89
+#define GCC_SNOC_PCIE0_AXI_M_CLK				90
+#define GCC_SNOC_PCIE1_AXI_M_CLK				91
+#define GCC_SYSTEM_NOC_BFDCD_CLK_SRC				92
+#define GCC_UNIPHY0_AHB_CLK					93
+#define GCC_UNIPHY0_SYS_CLK					94
+#define GCC_UNIPHY1_AHB_CLK					95
+#define GCC_UNIPHY1_SYS_CLK					96
+#define GCC_UNIPHY2_AHB_CLK					97
+#define GCC_UNIPHY2_SYS_CLK					98
+#define GCC_UNIPHY_SYS_CLK_SRC					99
+#define GCC_USB0_AUX_CLK					100
+#define GCC_USB0_AUX_CLK_SRC					101
+#define GCC_USB0_MASTER_CLK					102
+#define GCC_USB0_MASTER_CLK_SRC					103
+#define GCC_USB0_MOCK_UTMI_CLK					104
+#define GCC_USB0_MOCK_UTMI_CLK_SRC				105
+#define GCC_USB0_MOCK_UTMI_DIV_CLK_SRC				106
+#define GCC_USB0_PHY_CFG_AHB_CLK				107
+#define GCC_USB0_PIPE_CLK					108
+#define GCC_USB0_PIPE_CLK_SRC					109
+#define GCC_USB0_SLEEP_CLK					110
+#define GCC_XO_CLK_SRC						111
+#define GPLL0_MAIN						112
+#define GPLL0							113
+#define GPLL2_MAIN						114
+#define GPLL2							115
+#define GPLL4_MAIN						116
+#endif
diff --git a/include/dt-bindings/reset/qcom,ipq5210-gcc.h b/include/dt-bindings/reset/qcom,ipq5210-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..09890a09087c39288683d105437fc68f3d68be4c
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq5210-gcc.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_RESET_IPQ_GCC_IPQ5210_H
+#define _DT_BINDINGS_RESET_IPQ_GCC_IPQ5210_H
+
+#define GCC_ADSS_BCR						0
+#define GCC_ADSS_PWM_ARES					1
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR			2
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_GPLL0_ARES		3
+#define GCC_APSS_AHB_ARES					4
+#define GCC_APSS_ATB_ARES					5
+#define GCC_APSS_AXI_ARES					6
+#define GCC_APSS_TS_ARES					7
+#define GCC_BOOT_ROM_AHB_ARES					8
+#define GCC_BOOT_ROM_BCR					9
+#define GCC_GEPHY_BCR						10
+#define GCC_GEPHY_SYS_ARES					11
+#define GCC_GP1_ARES						12
+#define GCC_GP2_ARES						13
+#define GCC_GP3_ARES						14
+#define GCC_MDIO_AHB_ARES					15
+#define GCC_MDIO_BCR						16
+#define GCC_MDIO_GEPHY_AHB_ARES					17
+#define GCC_NSS_BCR						18
+#define GCC_NSS_TS_ARES						19
+#define GCC_NSSCC_ARES						20
+#define GCC_NSSCFG_ARES						21
+#define GCC_NSSNOC_ATB_ARES					22
+#define GCC_NSSNOC_MEMNOC_1_ARES				23
+#define GCC_NSSNOC_MEMNOC_ARES					24
+#define GCC_NSSNOC_NSSCC_ARES					25
+#define GCC_NSSNOC_PCNOC_1_ARES					26
+#define GCC_NSSNOC_QOSGEN_REF_ARES				27
+#define GCC_NSSNOC_SNOC_1_ARES					28
+#define GCC_NSSNOC_SNOC_ARES					29
+#define GCC_NSSNOC_TIMEOUT_REF_ARES				30
+#define GCC_NSSNOC_XO_DCD_ARES					31
+#define GCC_PCIE0_AHB_ARES					32
+#define GCC_PCIE0_AUX_ARES					33
+#define GCC_PCIE0_AXI_M_ARES					34
+#define GCC_PCIE0_AXI_S_BRIDGE_ARES				35
+#define GCC_PCIE0_AXI_S_ARES					36
+#define GCC_PCIE0_BCR						37
+#define GCC_PCIE0_LINK_DOWN_BCR					38
+#define GCC_PCIE0_PHY_BCR					39
+#define GCC_PCIE0_PIPE_ARES					40
+#define GCC_PCIE0PHY_PHY_BCR					41
+#define GCC_PCIE1_AHB_ARES					42
+#define GCC_PCIE1_AUX_ARES					43
+#define GCC_PCIE1_AXI_M_ARES					44
+#define GCC_PCIE1_AXI_S_BRIDGE_ARES				45
+#define GCC_PCIE1_AXI_S_ARES					46
+#define GCC_PCIE1_BCR						47
+#define GCC_PCIE1_LINK_DOWN_BCR					48
+#define GCC_PCIE1_PHY_BCR					49
+#define GCC_PCIE1_PIPE_ARES					50
+#define GCC_PCIE1PHY_PHY_BCR					51
+#define GCC_QRNG_AHB_ARES					52
+#define GCC_QRNG_BCR						53
+#define GCC_QUPV3_2X_CORE_ARES					54
+#define GCC_QUPV3_AHB_MST_ARES					55
+#define GCC_QUPV3_AHB_SLV_ARES					56
+#define GCC_QUPV3_BCR						57
+#define GCC_QUPV3_CORE_ARES					58
+#define GCC_QUPV3_WRAP_SE0_ARES					59
+#define GCC_QUPV3_WRAP_SE0_BCR					60
+#define GCC_QUPV3_WRAP_SE1_ARES					61
+#define GCC_QUPV3_WRAP_SE1_BCR					62
+#define GCC_QUPV3_WRAP_SE2_ARES					63
+#define GCC_QUPV3_WRAP_SE2_BCR					64
+#define GCC_QUPV3_WRAP_SE3_ARES					65
+#define GCC_QUPV3_WRAP_SE3_BCR					66
+#define GCC_QUPV3_WRAP_SE4_ARES					67
+#define GCC_QUPV3_WRAP_SE4_BCR					68
+#define GCC_QUPV3_WRAP_SE5_ARES					69
+#define GCC_QUPV3_WRAP_SE5_BCR					70
+#define GCC_QUSB2_0_PHY_BCR					71
+#define GCC_SDCC1_AHB_ARES					72
+#define GCC_SDCC1_APPS_ARES					73
+#define GCC_SDCC1_ICE_CORE_ARES					74
+#define GCC_SDCC_BCR						75
+#define GCC_TLMM_AHB_ARES					76
+#define GCC_TLMM_ARES						77
+#define GCC_TLMM_BCR						78
+#define GCC_UNIPHY0_AHB_ARES					79
+#define GCC_UNIPHY0_BCR						80
+#define GCC_UNIPHY0_SYS_ARES					81
+#define GCC_UNIPHY1_AHB_ARES					82
+#define GCC_UNIPHY1_BCR						83
+#define GCC_UNIPHY1_SYS_ARES					84
+#define GCC_UNIPHY2_AHB_ARES					85
+#define GCC_UNIPHY2_BCR						86
+#define GCC_UNIPHY2_SYS_ARES					87
+#define GCC_USB0_AUX_ARES					88
+#define GCC_USB0_MASTER_ARES					89
+#define GCC_USB0_MOCK_UTMI_ARES					90
+#define GCC_USB0_PHY_BCR					91
+#define GCC_USB0_PHY_CFG_AHB_ARES				92
+#define GCC_USB0_PIPE_ARES					93
+#define GCC_USB0_SLEEP_ARES					94
+#define GCC_USB3PHY_0_PHY_BCR					95
+#define GCC_USB_BCR						96
+#define GCC_PCIE0_PIPE_RESET					97
+#define GCC_PCIE0_CORE_STICKY_RESET				98
+#define GCC_PCIE0_AXI_S_STICKY_RESET				99
+#define GCC_PCIE0_AXI_S_RESET					100
+#define GCC_PCIE0_AXI_M_STICKY_RESET				101
+#define GCC_PCIE0_AXI_M_RESET					102
+#define GCC_PCIE0_AUX_RESET					103
+#define GCC_PCIE0_AHB_RESET					104
+#define GCC_PCIE1_PIPE_RESET					105
+#define GCC_PCIE1_CORE_STICKY_RESET				106
+#define GCC_PCIE1_AXI_S_STICKY_RESET				107
+#define GCC_PCIE1_AXI_S_RESET					108
+#define GCC_PCIE1_AXI_M_STICKY_RESET				109
+#define GCC_PCIE1_AXI_M_RESET					110
+#define GCC_PCIE1_AUX_RESET					111
+#define GCC_PCIE1_AHB_RESET					112
+#define GCC_UNIPHY0_XPCS_ARES					113
+#define GCC_UNIPHY1_XPCS_ARES					114
+#define GCC_UNIPHY2_XPCS_ARES					115
+#define GCC_QDSS_BCR						116
+
+#endif

-- 
2.34.1

