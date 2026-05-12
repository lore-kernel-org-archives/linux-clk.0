Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD719330662
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562785; cv=none; b=c6rmblf+0mV5Band0yZ29RYP+fDqQPVDphTOEWdTOUjKt3onSi2+U8+yzKHz4Dz+OXMDdJAZNg9H4CBjyixftz513VxKmZg0hjYeIz3GlD0RE9qn/uS4N2qHuCcgZLsfJToeDnUngykKy3K3T6dnW1IQR/lWrvgCNMUAA9dMfuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562785; c=relaxed/simple;
	bh=URXmzihZClebBRtL+ucHVphnVNQdG49SaHYtboC22Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mcwq5YZsqOXNRzQ1vHwswh+SBvLEoSRjAk51aRDrUbI91OU0T8FPOUOH9+lkky3W/GMX+4dspp1BkvJU3mbs557i3s8/HyQffshKStN7aWyGJ9Aio/FdkT4Vxa5u39hI2LpeY85vn7eVJuE0u3yDtYQcbp5qoau05aBCYeociMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aP0pqRPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTs/bTim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aP0pqRPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTs/bTim"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C58SdB2518442
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VaIe2oUP3V9SreQeGbSNfPtcl3cbS30FFJdsXTMmk9c=; b=aP0pqRPxV3OF2sSr
	NMIPs7cq/PiJpqR5aZS0kjSVBo9ZyOH3HhRkH3QsWdTtPCW+qquvTwlv6nM7+Itp
	QgANbRIScN3OLNPgfQzZ1Gl6y0fbV0G6VBdebg+F3/JYJ1/USaB1KeIksTbf3UMZ
	2nA2iGOGeZie/LAL0J2W9x31/qLYX2A0Pj6IRJ6ldQmUeCYzuCTa/eEmRhuiF7jN
	Sl0tRrYUUaCg5IOz6o1LKyxBTW+ejHAdlXQj9hwLGbyrhqS1IKAs9mOL58FNZIn4
	1DCVrLzZmbwsvy7GKayvJXDS1/f1jz+QFEp+JV9f+jhyMBnMbulfwD/njcHzKluN
	Z+9wxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1hk9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 05:13:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso922358a91.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 22:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778562782; x=1779167582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaIe2oUP3V9SreQeGbSNfPtcl3cbS30FFJdsXTMmk9c=;
        b=TTs/bTimV2MY3b7v2Kg0fe7mrBx3Wi8iONDIw4t2pHD5jw+v8WH3z3lv4RSySA5Ta3
         MPQjkVPKgO1DSg2Riy42GT3kvr7NlpOUifcJAD/cRy7sQ2M89+KrDdOIambLAI0ViLcR
         fKTuHunelxrBp1VfS0HNej3GP4POQeC2ZicNhY7nyVhXSDQ8OnvfnwQjWKrkf1YVsPxK
         xoTADzAjXPhvSwX6rjIhrITd4a0oThQsbatIc3HUhhfwAt4PGe88QUZ/X9H/BYFlS+UP
         rmjLfPT6GYxGQEvgH021oXpe54sYbT3/ot3HrR32ozsDAFfMBZMkZETWsPSDp55WmG1w
         fbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562782; x=1779167582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VaIe2oUP3V9SreQeGbSNfPtcl3cbS30FFJdsXTMmk9c=;
        b=gKMf1A9TdB8lrHIknSOSENWJ0TT/1qSB3/hCIKKF3B6dgH0jarg4EZlXiZuAzsIcrx
         k/cTp6MswuJH1xFgk8pVpaBoryUBVpy8T5hw7oU/fBKy4S+QsqE/Pa5CWcn3yDrtWFik
         peXJc++9zjq9jN4KpEb9ifLDlkl/kAM7hYMZwt9kIg6XfskemvaxIn2rx/Bg9PqiLUPg
         g9ofMCz20p2mwgLCTE2szFy38/vB1dk94vIUs0aOD5ZJ/+Kle94+8iDNhC6kEtEIR/Ll
         Aw7/VZnhaalFz6DXW9paFjaVtH0oDhIyC0CPjVKCj0eHyfoiKD+0HM2P93G9jIkI3UFF
         hqMw==
X-Forwarded-Encrypted: i=1; AFNElJ90TeSK7D7CNKrXz9TomYscZ2GDigP7ySTKJGCrbXiqASGeNkfwvW5z1icwfsHiWsQCOsXu5ZJzYes=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjVQ0+2bbXrH3y24QfUNQXZmAcnwp4J42Lx2MI8W1/SoA9Ggx
	WzO3eNVY/nBqoYU4L01VKWi9jXZ9tlqCDkK0G1C4fjbW+U5nW1dBFe09SpT+iU8WAohj7q5T28h
	nydlCIoYrDdC9GXtm0TFBk9b6TYjMLMONlNPIV34z5v3Mcj9f7rMLY9qCvzRYQ6I=
X-Gm-Gg: Acq92OGZNQl7rWlseyzoiqMbKn7ORhy1pwuRSVMzA8dcVv2qV/FFUYEsMFvtyrJIFHO
	DxUQT6Knn8QkJOnE9I53WFm+DfdAt2EqVNAbiVZBFkMGjKRp4fFrFcYo1uVGmOpdPK6bXVkJjMk
	mX8V5vKnhFh+xLkpD1SgsWwRq1qll4cmqJ/NDabagzsfE8txvqeXYJ5EDLadPd2LQAlR+fNhyEH
	zFQVkWaM2we0UZRZOqErNomF5gR0Sz4KH0U617177UHhCjH1ZHvyI3WuBH623mhFYEpPoXEFPS5
	JMbnZ1t/DtluSCAv+loBcgpbq+YA3afZUvAIe9VFsMBs1zSZgYX17PhhKsesfod70qVRujoczew
	TPBCHJkJjaXUdyOafXpImgbdZCKra0RzudWFLU1ljQ3SNL3vhMR2B2kk2zSBlU0GaU+cjUTNolJ
	NKTY5P6OXfQg9e7gzEZeau3w51LXqVJ7mrQQ4nUxj0GK7FuICzRvIBPMUz
X-Received: by 2002:a17:90b:45:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-367d468cf75mr13480248a91.6.1778562781509;
        Mon, 11 May 2026 22:13:01 -0700 (PDT)
X-Received: by 2002:a17:90b:45:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-367d468cf75mr13480211a91.6.1778562780989;
        Mon, 11 May 2026 22:13:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b06d6b33sm425701a91.10.2026.05.11.22.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 22:13:00 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:42:47 +0530
Subject: [PATCH v4 1/4] dt-bindings: clock: add Qualcomm IPQ9650 GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_boot_to_shell-v4-1-1e87c8326e59@oss.qualcomm.com>
References: <20260512-ipq9650_boot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_boot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778562771; l=18429;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=URXmzihZClebBRtL+ucHVphnVNQdG49SaHYtboC22Ek=;
 b=YVIBvv5FoXbS+3FDTPAPhukeBmPU/n3Ov6MGs0kBDqG9gP5sK+yoSYqz5xqPQMhn8ODi36n21
 hkdPFIb1ZzhC6bvxML4FnfQfYJVlz+awjWF/YCGvdaBVm6nY/iSoYTU
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: Fy00I3y23GFAX1cJTB6JBzf9ygHtYhEW
X-Proofpoint-ORIG-GUID: Fy00I3y23GFAX1cJTB6JBzf9ygHtYhEW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0NyBTYWx0ZWRfX68Q6bvO+lWsi
 dk5SAmOgBR5uYgOxWvVisfqzwaH0gU5V0Z9etDp171sFZ77NvRu0sNNrSTMiqYu/xCkcr+TXLjL
 /INT1ktlR+IJKd8x0Zjmbwso/G53zbyRu4NF8ZzDPR93V9+zNsPIVVaRqiLWFJwW2mZSZIUyIHr
 rI5yfjWC+q9bq6C+5ilHqxmcheTfX9ACMxlKAL4460nCqsWtWo9rnCcjZIqM7oTI7J3vXgEuVXc
 6vwM/7Xsvhl6V/50S7qeZTMUIPfK3uONwcikc1gLlzblR8LhST9hkIwKwWuStMp06CIJvP7UW26
 7Zo41sGr5lfiGAlK/ER1ELPen4iAXS++pdDCgOq63/+23J5mrEa9OWO/EmjyzoL5SrpS5uU+r3D
 SNE8fc3rTvPZXaKWNeI9mYqS1suA1l1OEW4rdXAZVzH9lThvMCdBk3maLpjEU4Rikb4HM8H96tf
 MGVNRAlu/RG664asdaA==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02b6de cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=z-CoNLzUiGfn8knxhFMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120047

Add binding for the Qualcomm IPQ9650 Global Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |  68 +++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       | 172 +++++++++++++++++
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       | 215 +++++++++++++++++++++
 3 files changed, 455 insertions(+)

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
index 000000000000..afd17c00d96e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
@@ -0,0 +1,172 @@
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
+#define GCC_PCNOC_BFDCD_CLK_SRC					89
+#define GCC_QDSS_AT_CLK						90
+#define GCC_QDSS_AT_CLK_SRC					91
+#define GCC_QDSS_DAP_CLK					92
+#define GCC_QDSS_TSCTR_CLK_SRC					93
+#define GCC_QPIC_AHB_CLK					94
+#define GCC_QPIC_CLK						95
+#define GCC_QPIC_CLK_SRC					96
+#define GCC_QPIC_IO_MACRO_CLK					97
+#define GCC_QPIC_IO_MACRO_CLK_SRC				98
+#define GCC_QPIC_SLEEP_CLK					99
+#define GCC_QUPV3_2X_CORE_CLK					100
+#define GCC_QUPV3_2X_CORE_CLK_SRC				101
+#define GCC_QUPV3_AHB_MST_CLK					102
+#define GCC_QUPV3_AHB_SLV_CLK					103
+#define GCC_QUPV3_CORE_CLK					104
+#define GCC_QUPV3_SLEEP_CLK					105
+#define GCC_QUPV3_WRAP_SE0_CLK					106
+#define GCC_QUPV3_WRAP_SE0_CLK_SRC				107
+#define GCC_QUPV3_WRAP_SE1_CLK					108
+#define GCC_QUPV3_WRAP_SE1_CLK_SRC				109
+#define GCC_QUPV3_WRAP_SE2_CLK					110
+#define GCC_QUPV3_WRAP_SE2_CLK_SRC				111
+#define GCC_QUPV3_WRAP_SE3_CLK					112
+#define GCC_QUPV3_WRAP_SE3_CLK_SRC				113
+#define GCC_QUPV3_WRAP_SE4_CLK					114
+#define GCC_QUPV3_WRAP_SE4_CLK_SRC				115
+#define GCC_QUPV3_WRAP_SE5_CLK					116
+#define GCC_QUPV3_WRAP_SE5_CLK_SRC				117
+#define GCC_QUPV3_WRAP_SE6_CLK					118
+#define GCC_QUPV3_WRAP_SE6_CLK_SRC				119
+#define GCC_QUPV3_WRAP_SE7_CLK					120
+#define GCC_QUPV3_WRAP_SE7_CLK_SRC				121
+#define GCC_SDCC1_AHB_CLK					122
+#define GCC_SDCC1_APPS_CLK					123
+#define GCC_SDCC1_APPS_CLK_SRC					124
+#define GCC_SDCC1_ICE_CORE_CLK					125
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				126
+#define GCC_SLEEP_CLK_SRC					127
+#define GCC_SNOC_USB_CLK					128
+#define GCC_SYSTEM_NOC_BFDCD_CLK_SRC				129
+#define GCC_TLMM_AHB_CLK					130
+#define GCC_TLMM_CLK						131
+#define GCC_UNIPHY0_AHB_CLK					132
+#define GCC_UNIPHY0_SYS_CLK					133
+#define GCC_UNIPHY1_AHB_CLK					134
+#define GCC_UNIPHY1_SYS_CLK					135
+#define GCC_UNIPHY2_AHB_CLK					136
+#define GCC_UNIPHY2_SYS_CLK					137
+#define GCC_UNIPHY_SYS_CLK_SRC					138
+#define GCC_USB0_AUX_CLK					139
+#define GCC_USB0_AUX_CLK_SRC					140
+#define GCC_USB0_EUD_AT_CLK					141
+#define GCC_USB0_MASTER_CLK					142
+#define GCC_USB0_MASTER_CLK_SRC					143
+#define GCC_USB0_MOCK_UTMI_CLK					144
+#define GCC_USB0_MOCK_UTMI_CLK_SRC				145
+#define GCC_USB0_MOCK_UTMI_DIV_CLK_SRC				146
+#define GCC_USB0_PHY_CFG_AHB_CLK				147
+#define GCC_USB0_PIPE_CLK					148
+#define GCC_USB0_PIPE_CLK_SRC					149
+#define GCC_USB0_SLEEP_CLK					150
+#define GCC_USB1_MASTER_CLK					151
+#define GCC_USB1_MOCK_UTMI_CLK					152
+#define GCC_USB1_MOCK_UTMI_CLK_SRC				153
+#define GCC_USB1_MOCK_UTMI_DIV_CLK_SRC				154
+#define GCC_USB1_PHY_CFG_AHB_CLK				155
+#define GCC_USB1_SLEEP_CLK					156
+#define GCC_XO_CLK_SRC						157
+#define GPLL0							158
+#define GPLL0_MAIN						159
+#define GPLL2							160
+#define GPLL2_OUT_MAIN						161
+#define GPLL4							162
+#endif
diff --git a/include/dt-bindings/reset/qcom,ipq9650-gcc.h b/include/dt-bindings/reset/qcom,ipq9650-gcc.h
new file mode 100644
index 000000000000..a2cbb114addd
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq9650-gcc.h
@@ -0,0 +1,215 @@
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
+#define GCC_QDSS_APB2JTAG_CLK_ARES				125
+#define GCC_QDSS_AT_CLK_ARES					126
+#define GCC_QDSS_BCR						127
+#define GCC_QDSS_CFG_AHB_CLK_ARES				128
+#define GCC_QDSS_DAP_AHB_CLK_ARES				129
+#define GCC_QDSS_DAP_CLK_ARES					130
+#define GCC_QDSS_ETR_USB_CLK_ARES				131
+#define GCC_QDSS_EUD_AT_CLK_ARES				132
+#define GCC_QDSS_STM_CLK_ARES					133
+#define GCC_QDSS_TRACECLKIN_CLK_ARES				134
+#define GCC_QDSS_TSCTR_DIV16_CLK_ARES				135
+#define GCC_QDSS_TSCTR_DIV2_CLK_ARES				136
+#define GCC_QDSS_TSCTR_DIV3_CLK_ARES				137
+#define GCC_QDSS_TSCTR_DIV4_CLK_ARES				138
+#define GCC_QDSS_TSCTR_DIV8_CLK_ARES				139
+#define GCC_QDSS_TS_CLK_ARES					140
+#define GCC_QPIC_AHB_CLK_ARES					141
+#define GCC_QPIC_BCR						142
+#define GCC_QPIC_CLK_ARES					143
+#define GCC_QPIC_IO_MACRO_CLK_ARES				144
+#define GCC_QPIC_SLEEP_CLK_ARES					145
+#define GCC_QUPV3_2X_CORE_CLK_ARES				146
+#define GCC_QUPV3_AHB_MST_CLK_ARES				147
+#define GCC_QUPV3_AHB_SLV_CLK_ARES				148
+#define GCC_QUPV3_BCR						149
+#define GCC_QUPV3_CORE_CLK_ARES					150
+#define GCC_QUPV3_WRAP_SE0_BCR					151
+#define GCC_QUPV3_WRAP_SE0_CLK_ARES				152
+#define GCC_QUPV3_WRAP_SE1_BCR					153
+#define GCC_QUPV3_WRAP_SE1_CLK_ARES				154
+#define GCC_QUPV3_WRAP_SE2_BCR					155
+#define GCC_QUPV3_WRAP_SE2_CLK_ARES				156
+#define GCC_QUPV3_WRAP_SE3_BCR					157
+#define GCC_QUPV3_WRAP_SE3_CLK_ARES				158
+#define GCC_QUPV3_WRAP_SE4_BCR					159
+#define GCC_QUPV3_WRAP_SE4_CLK_ARES				160
+#define GCC_QUPV3_WRAP_SE5_BCR					161
+#define GCC_QUPV3_WRAP_SE5_CLK_ARES				162
+#define GCC_QUPV3_WRAP_SE6_BCR					163
+#define GCC_QUPV3_WRAP_SE6_CLK_ARES				164
+#define GCC_QUPV3_WRAP_SE7_BCR					165
+#define GCC_QUPV3_WRAP_SE7_CLK_ARES				166
+#define GCC_QUSB2_0_PHY_BCR					167
+#define GCC_QUSB2_1_PHY_BCR					168
+#define GCC_SDCC1_APPS_CLK_ARES					169
+#define GCC_SDCC1_ICE_CORE_CLK_ARES				170
+#define GCC_SDCC_BCR						171
+#define GCC_TLMM_AHB_CLK_ARES					172
+#define GCC_TLMM_BCR						173
+#define GCC_TLMM_CLK_ARES					174
+#define GCC_UNIPHY0_AHB_CLK_ARES				175
+#define GCC_UNIPHY0_BCR						176
+#define GCC_UNIPHY0_PMA_BCR					177
+#define GCC_UNIPHY0_SYS_CLK_ARES				178
+#define GCC_UNIPHY0_XPCS_ARES					179
+#define GCC_UNIPHY1_AHB_CLK_ARES				180
+#define GCC_UNIPHY1_BCR						181
+#define GCC_UNIPHY1_PMA_BCR					182
+#define GCC_UNIPHY1_SYS_CLK_ARES				183
+#define GCC_UNIPHY1_XPCS_ARES					184
+#define GCC_UNIPHY2_AHB_CLK_ARES				185
+#define GCC_UNIPHY2_BCR						186
+#define GCC_UNIPHY2_PMA_BCR					187
+#define GCC_UNIPHY2_SYS_CLK_ARES				188
+#define GCC_UNIPHY2_XPCS_ARES					189
+#define GCC_USB0_AUX_CLK_ARES					190
+#define GCC_USB0_MASTER_CLK_ARES				191
+#define GCC_USB0_MOCK_UTMI_CLK_ARES				192
+#define GCC_USB0_PHY_BCR					193
+#define GCC_USB0_PHY_CFG_AHB_CLK_ARES				194
+#define GCC_USB0_PIPE_CLK_ARES					195
+#define GCC_USB0_SLEEP_CLK_ARES					196
+#define GCC_USB1_BCR						197
+#define GCC_USB1_MASTER_CLK_ARES				198
+#define GCC_USB1_MOCK_UTMI_CLK_ARES				199
+#define GCC_USB1_PHY_CFG_AHB_CLK_ARES				200
+#define GCC_USB1_SLEEP_CLK_ARES					201
+#define GCC_USB3PHY_0_PHY_BCR					202
+#define GCC_USB_BCR						203
+#define GCC_UNIPHY1_XLGPCS_ARES					204
+#define GCC_UNIPHY2_XLGPCS_ARES					205
+#endif

-- 
2.34.1

