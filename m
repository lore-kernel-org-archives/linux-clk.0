Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3A93EFD0F
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459939; cv=none; b=nH599Fcx7ofjhMiD9hYk0ga4amCXGV/p+Dz7x/zlSKfutVdovgtFnqmV8E0zHcIHpFu5W3xXowrk0eoplJsv0sj1HDfx7h0IfuccnDr1MGKdtIfGg0s5V6FImvzJQzuupMPoIjA6gOzfFZ2GinNXQt9iGjFoLM8WOqi+njs9TOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459939; c=relaxed/simple;
	bh=P/vWPxBQslSJMBzQm+aWrXETwzKR81YPYEo9RIaqbKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwtS1xckRLTEjU4mh8ah0ep6crpLjQ7U94iD3seXrokoS3nJ17HIF3RGKxy4whBE2ZcfAQfJxVqU7ByMe+iyUxYzK8TmdgOZDwIPQLmyU3yDSf/cU2sG+L2+oKjApDLee22OyGlOjBcEoGsOjnMmnNxMLs/PqZoPKQ57qJfyi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6XRG0tQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdKokcRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6XRG0tQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdKokcRY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qbCw870121
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ev4MgCN65VfLU2h4cV0BPCR7evUuz2s5AOeepZvJpQ0=; b=b6XRG0tQojuQXgwC
	EdlnvG3ADIegtjPtwz7cTeNIAjIblJqrw4Gp9kpCvchnoocmxiBlfy/sARB63DX6
	KPV+n/rZdOp0fSFdnqgzWwBQ5VVplAG4EMGtkwFz/cRnE9aZYsXvHuH4AqH3ZUsb
	VpUmcqsfzocSB9f6+1pWl5glVmiokt7cNAdvMZpZ1fTdiA5tiva96HAhN8OtuzkB
	2croOzMl/DKdjRNSz+OIfAgydkrxsVBuTalXTjDQchtM0mcvpsNTJroTltQ2X1ee
	oybPzjH2FBdUHV23zj2nfZKdFJyWiK4cKrEvKXdXUugcSi8Z0wShVCZllRZ6BUwp
	Mwgm3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1uhx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b465bf993cso126419345ad.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459936; x=1778064736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ev4MgCN65VfLU2h4cV0BPCR7evUuz2s5AOeepZvJpQ0=;
        b=JdKokcRYlCEPLuW3W/6xoN+KufWSSAM5Z3QfFbZ1akDc/RHRqAvLP3o6lh4xZErZP5
         KVwrTAzgyY5SYdbSOLfzkqzOysftAsvlqe7yyI4IeflmQtOg0jI2eDIg13d22KI/39ky
         ciLRKP8R/GrMXq+5ainn46oIrgMGzGg8nzF0WzwnBFr7T71MhtDC8qQyH+ZBtYErPwcm
         9OE0IsLDh+CHyvXokJesPB7NoP6a30fInZhX+3xyAsTR0CPdao26qof1gvgblKqDHePj
         Aen2N3FkGihzQZO4RnO/lGm6+3TeAvbDwnwnBoArkJc4jO/EOxgTV6LUTyp/BaOAPMlW
         DONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459936; x=1778064736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ev4MgCN65VfLU2h4cV0BPCR7evUuz2s5AOeepZvJpQ0=;
        b=IRKmTIqW0X8o34Hr3+1RNEFp8CGGKLmbbq7pspIF4qTJIVWb7eGixbR3Og9zLaB2e8
         /hzgYP1NDZ50CBRZeP6hql7QMXrRKvu5Y7LB4NU3ytkA5+J/CNPsXFwI7qrhuhVBEtI9
         nIrUYzbjvX0rrynqMOzcLqGzcC1+RysdbmzzRHFmukVLMkZxaTJ/DdGdYoHtIL2Vqxa8
         R5QWezzJqox83rtA0c/gllMpY50QkqkvXZOzk1kXdPvcZmaXm7cz59Io1ezWUyDehMSD
         UUHxmKfS05w9c4lB99/YfUcFu+MIT30oyoq3pAVQAecx117OCcvzmRKBKh3sLF52Pd3n
         O0DQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h2O4F1+uZKOisivr2J4QNJJV1HI+QDpwZ7J7LxFqKwJD7/1s0P193NWBepVssudPKFx0RoaFa1nY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/rxrTt4annr95/fs8RZY3cJy3s8EtwJloK5hhiYP+a0LRUDj
	jfdIhhYvcy9jFeK9EnhP39o8cDaek0crhQZVEHjDQ/Knrc7hhsVwFMve1PKuiQkmpyB7YK7svCP
	oI+xIHUHc+pvVg5NrQr/84YinNVlipBzGoXk/JjGokPqwRIphId//7xgC6K9NpYk=
X-Gm-Gg: AeBDieuVPV2xvcqpzLxg8fl2/b7Vmx1WE3T2bwnhkPPZGVHLpi5uA4eRcM0zXiN9qTE
	6ha8K5xxEp/w/DM9qkyaYma+aK4qCNaqB4Jv4gmuAZ2ae5I1x+PYBskRSwibKwqF3oHcbWM0kPS
	CAlXYyWiGMimdOd34byR81PYfBRklbHzNH0WtgyBYKmIVAH78zYgiODSN+23IdFVz9TOnR75h3y
	3mIba6Fj8pbKn4THOnX+alxncqqD5ebzPUnO/umNB9fKiKkk2xki6UPt2zErg2K12KSL5TZZ2gQ
	4J6yTsz4kS9Co+ePVKuKferYG/sf8GFK9C6dU6puv66xSBvRBuLwOf0MQUyexZO+3GprL+tEja5
	xW0cBeZph98wYC7UQnGRM6/UiKRo8BwKctvx9D6cPe+LsGYifX+6pKld66taJLnA=
X-Received: by 2002:a17:903:2c0e:b0:2b9:78cb:3477 with SMTP id d9443c01a7336-2b9872f82a1mr31777405ad.8.1777459935622;
        Wed, 29 Apr 2026 03:52:15 -0700 (PDT)
X-Received: by 2002:a17:903:2c0e:b0:2b9:78cb:3477 with SMTP id d9443c01a7336-2b9872f82a1mr31777085ad.8.1777459935107;
        Wed, 29 Apr 2026 03:52:15 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:21:50 +0530
Subject: [PATCH 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra SoC
 Global Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-2-c3cd77558b7a@oss.qualcomm.com>
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: rPzDavL_i4Wi2vjk7ZG4Gi0YZcziYcVd
X-Proofpoint-ORIG-GUID: rPzDavL_i4Wi2vjk7ZG4Gi0YZcziYcVd
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1e2e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=z2lVzDD_EwnTmjuFXOsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX7eoLkped/YY/
 7ryxxCiyvnqh2sW8+0/zzk84mNBCTFDQBVqmDD44SOK1ZyjTCBjLoghe9qHAJFD6cK89VRj8eJf
 BJM+6xwh6NiKAd+RZC0lucdz0FvmgiGJ7ye70I/TO7kgNpPpItN98Nva0SwghvI1IMWpNilu8jh
 Nxg/q/x2gkLDEUBK0gQJBxMcw/XsoagGAvWxQQ8VwJrZKJRK/vOSyonRNO93iGQ1i3EtLaaCC8W
 4dR7XsOxnDe5apMcb/Nget/09dNj/n/YLS6W1w2Ao9qhaLilSZrtens1QFcWPcdOjRLxXFCZ3T2
 B/nsqgkbaGQ20UpCtOWVWa/NjgGiC3/gFAlK1WMlEK8wIP8WJz4BbQrIVEIa/MKhbKc5xaOq8zl
 M6F5ZIUA2xAjs1pJrN9qtJTFDDfJw/cnMlQmZv4xY+33bj3NZE/4IwazgeWeO1w0F02xEyAIaEn
 YKfYlnAEJOveE+bOcdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290109

Add device tree bindings for the global clock controller on Qualcomm
Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |  63 +++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        | 259 +++++++++++++++++++++
 2 files changed, 322 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..20010ccaae5c3297677b000bdff7a5a02795ea04
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-gcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Global Clock & Reset Controller on Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Global clock control module provides the clocks, resets and power
+  domains on Qualcomm Shikra SoC platform.
+
+  See also: include/dt-bindings/clock/qcom,shikra-gcc.h
+
+properties:
+  compatible:
+    const: qcom,shikra-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: EMAC0 sgmiiphy mac rclk source
+      - description: EMAC0 sgmiiphy mac tclk source
+      - description: EMAC1 sgmiiphy mac rclk source
+      - description: EMAC1 sgmiiphy mac tclk source
+      - description: PCIE Pipe clock source
+      - description: USB3 phy wrapper pipe clock source
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@1400000 {
+        compatible = "qcom,shikra-gcc";
+        reg = <0x01400000 0x1f0000>;
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                 <&sleep_clk>,
+                 <&emac0_sgmiiphy_rclk>,
+                 <&emac0_sgmiiphy_tclk>,
+                 <&emac1_sgmiiphy_rclk>,
+                 <&emac1_sgmiiphy_tclk>,
+                 <&pcie_pipe_clk>,
+                 <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..2e88a9cd9f5356fa3f5594770fb41d29bebd3563
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -0,0 +1,259 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SHIKRA_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_AUX2						1
+#define GPLL1							2
+#define GPLL10							3
+#define GPLL11							4
+#define GPLL12							5
+#define GPLL12_OUT_AUX2						6
+#define GPLL3							7
+#define GPLL3_OUT_MAIN						8
+#define GPLL4							9
+#define GPLL5							10
+#define GPLL6							11
+#define GPLL6_OUT_MAIN						12
+#define GPLL7							13
+#define GPLL8							14
+#define GPLL8_OUT_MAIN						15
+#define GPLL9							16
+#define GPLL9_OUT_MAIN						17
+#define GCC_AHB2PHY_CSI_CLK					18
+#define GCC_AHB2PHY_USB_CLK					19
+#define GCC_BOOT_ROM_AHB_CLK					20
+#define GCC_CAM_THROTTLE_NRT_CLK				21
+#define GCC_CAM_THROTTLE_RT_CLK					22
+#define GCC_CAMERA_AHB_CLK					23
+#define GCC_CAMERA_XO_CLK					24
+#define GCC_CAMSS_AXI_CLK					25
+#define GCC_CAMSS_AXI_CLK_SRC					26
+#define GCC_CAMSS_CAMNOC_ATB_CLK				27
+#define GCC_CAMSS_CAMNOC_DRAGONLINK_ATB_CLK			28
+#define GCC_CAMSS_CAMNOC_NTS_XO_CLK				29
+#define GCC_CAMSS_CCI_0_CLK					30
+#define GCC_CAMSS_CCI_CLK_SRC					31
+#define GCC_CAMSS_CPHY_0_CLK					32
+#define GCC_CAMSS_CPHY_1_CLK					33
+#define GCC_CAMSS_CSI0PHYTIMER_CLK				34
+#define GCC_CAMSS_CSI0PHYTIMER_CLK_SRC				35
+#define GCC_CAMSS_CSI1PHYTIMER_CLK				36
+#define GCC_CAMSS_CSI1PHYTIMER_CLK_SRC				37
+#define GCC_CAMSS_MCLK0_CLK					38
+#define GCC_CAMSS_MCLK0_CLK_SRC					39
+#define GCC_CAMSS_MCLK1_CLK					40
+#define GCC_CAMSS_MCLK1_CLK_SRC					41
+#define GCC_CAMSS_MCLK2_CLK					42
+#define GCC_CAMSS_MCLK2_CLK_SRC					43
+#define GCC_CAMSS_MCLK3_CLK					44
+#define GCC_CAMSS_MCLK3_CLK_SRC					45
+#define GCC_CAMSS_NRT_AXI_CLK					46
+#define GCC_CAMSS_OPE_AHB_CLK					47
+#define GCC_CAMSS_OPE_AHB_CLK_SRC				48
+#define GCC_CAMSS_OPE_CLK					49
+#define GCC_CAMSS_OPE_CLK_SRC					50
+#define GCC_CAMSS_RT_AXI_CLK					51
+#define GCC_CAMSS_TFE_0_CLK					52
+#define GCC_CAMSS_TFE_0_CLK_SRC					53
+#define GCC_CAMSS_TFE_0_CPHY_RX_CLK				54
+#define GCC_CAMSS_TFE_0_CSID_CLK				55
+#define GCC_CAMSS_TFE_0_CSID_CLK_SRC				56
+#define GCC_CAMSS_TFE_1_CLK					57
+#define GCC_CAMSS_TFE_1_CLK_SRC					58
+#define GCC_CAMSS_TFE_1_CPHY_RX_CLK				59
+#define GCC_CAMSS_TFE_1_CSID_CLK				60
+#define GCC_CAMSS_TFE_1_CSID_CLK_SRC				61
+#define GCC_CAMSS_TFE_CPHY_RX_CLK_SRC				62
+#define GCC_CAMSS_TOP_AHB_CLK					63
+#define GCC_CAMSS_TOP_AHB_CLK_SRC				64
+#define GCC_CFG_NOC_USB2_PRIM_AXI_CLK				65
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				66
+#define GCC_DDRSS_GPU_AXI_CLK					67
+#define GCC_DDRSS_MEMNOC_PCIE_SF_CLK				68
+#define GCC_DISP_AHB_CLK					69
+#define GCC_DISP_GPLL0_CLK_SRC					70
+#define GCC_DISP_GPLL0_DIV_CLK_SRC				71
+#define GCC_DISP_HF_AXI_CLK					72
+#define GCC_DISP_THROTTLE_CORE_CLK				73
+#define GCC_DISP_XO_CLK						74
+#define GCC_EMAC0_AHB_CLK					75
+#define GCC_EMAC0_AXI_CLK					76
+#define GCC_EMAC0_AXI_CLK_SRC					77
+#define GCC_EMAC0_AXI_SYS_NOC_CLK				78
+#define GCC_EMAC0_CC_SGMIIPHY_RX_CLK				79
+#define GCC_EMAC0_CC_SGMIIPHY_RX_CLK_SRC			80
+#define GCC_EMAC0_CC_SGMIIPHY_TX_CLK				81
+#define GCC_EMAC0_CC_SGMIIPHY_TX_CLK_SRC			82
+#define GCC_EMAC0_PHY_AUX_CLK					83
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				84
+#define GCC_EMAC0_PTP_CLK					85
+#define GCC_EMAC0_PTP_CLK_SRC					86
+#define GCC_EMAC0_RGMII_CLK					87
+#define GCC_EMAC0_RGMII_CLK_SRC					88
+#define GCC_EMAC1_AHB_CLK					89
+#define GCC_EMAC1_AXI_CLK					90
+#define GCC_EMAC1_AXI_CLK_SRC					91
+#define GCC_EMAC1_AXI_SYS_NOC_CLK				92
+#define GCC_EMAC1_CC_SGMIIPHY_RX_CLK				93
+#define GCC_EMAC1_CC_SGMIIPHY_RX_CLK_SRC			94
+#define GCC_EMAC1_CC_SGMIIPHY_TX_CLK				95
+#define GCC_EMAC1_CC_SGMIIPHY_TX_CLK_SRC			96
+#define GCC_EMAC1_PHY_AUX_CLK					97
+#define GCC_EMAC1_PHY_AUX_CLK_SRC				98
+#define GCC_EMAC1_PTP_CLK					99
+#define GCC_EMAC1_PTP_CLK_SRC					100
+#define GCC_EMAC1_RGMII_CLK					101
+#define GCC_EMAC1_RGMII_CLK_SRC					102
+#define GCC_GP1_CLK						103
+#define GCC_GP1_CLK_SRC						104
+#define GCC_GP2_CLK						105
+#define GCC_GP2_CLK_SRC						106
+#define GCC_GP3_CLK						107
+#define GCC_GP3_CLK_SRC						108
+#define GCC_GPU_CFG_AHB_CLK					109
+#define GCC_GPU_GPLL0_CLK_SRC					110
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				111
+#define GCC_GPU_MEMNOC_GFX_CLK					112
+#define GCC_GPU_SMMU_VOTE_CLK					113
+#define GCC_GPU_SNOC_DVM_GFX_CLK				114
+#define GCC_GPU_THROTTLE_CORE_CLK				115
+#define GCC_MMU_TCU_VOTE_CLK					116
+#define GCC_PCIE_AUX_CLK					117
+#define GCC_PCIE_AUX_CLK_SRC					118
+#define GCC_PCIE_AUX_PHY_CLK_SRC				119
+#define GCC_PCIE_CFG_AHB_CLK					120
+#define GCC_PCIE_CLKREF_EN					121
+#define GCC_PCIE_MSTR_AXI_CLK					122
+#define GCC_PCIE_PIPE_CLK					123
+#define GCC_PCIE_PIPE_CLK_SRC					124
+#define GCC_PCIE_RCHNG_PHY_CLK					125
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				126
+#define GCC_PCIE_SLEEP_CLK					127
+#define GCC_PCIE_SLV_AXI_CLK					128
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				129
+#define GCC_PCIE_TBU_CLK					130
+#define GCC_PCIE_THROTTLE_CORE_CLK				131
+#define GCC_PCIE_THROTTLE_XO_CLK				132
+#define GCC_PCIE_TILE_AXI_SYS_NOC_CLK				133
+#define GCC_PDM2_CLK						134
+#define GCC_PDM2_CLK_SRC					135
+#define GCC_PDM_AHB_CLK						136
+#define GCC_PDM_XO4_CLK						137
+#define GCC_PWM0_XO512_CLK					138
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				139
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				140
+#define GCC_QMIP_DISP_AHB_CLK					141
+#define GCC_QMIP_GPU_CFG_AHB_CLK				142
+#define GCC_QMIP_PCIE_CFG_AHB_CLK				143
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				144
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				145
+#define GCC_QUPV3_WRAP0_CORE_CLK				146
+#define GCC_QUPV3_WRAP0_S0_CLK					147
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				148
+#define GCC_QUPV3_WRAP0_S1_CLK					149
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				150
+#define GCC_QUPV3_WRAP0_S2_CLK					151
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				152
+#define GCC_QUPV3_WRAP0_S3_CLK					153
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				154
+#define GCC_QUPV3_WRAP0_S4_CLK					155
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				156
+#define GCC_QUPV3_WRAP0_S5_CLK					157
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				158
+#define GCC_QUPV3_WRAP0_S6_CLK					159
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				160
+#define GCC_QUPV3_WRAP0_S7_CLK					161
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				162
+#define GCC_QUPV3_WRAP0_S8_CLK					163
+#define GCC_QUPV3_WRAP0_S8_CLK_SRC				164
+#define GCC_QUPV3_WRAP0_S9_CLK					165
+#define GCC_QUPV3_WRAP0_S9_CLK_SRC				166
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				167
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				168
+#define GCC_SDCC1_AHB_CLK					169
+#define GCC_SDCC1_APPS_CLK					170
+#define GCC_SDCC1_APPS_CLK_SRC					171
+#define GCC_SDCC1_ICE_CORE_CLK					172
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				173
+#define GCC_SDCC2_AHB_CLK					174
+#define GCC_SDCC2_APPS_CLK					175
+#define GCC_SDCC2_APPS_CLK_SRC					176
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				177
+#define GCC_SYS_NOC_USB2_PRIM_AXI_CLK				178
+#define GCC_SYS_NOC_USB3_PRIM_AXI_CLK				179
+#define GCC_TSCSS_AHB_CLK					180
+#define GCC_TSCSS_CLK_SRC					181
+#define GCC_TSCSS_CNTR_CLK					182
+#define GCC_TSCSS_ETU_CLK					183
+#define GCC_UFS_CLKREF_EN					184
+#define GCC_USB20_MASTER_CLK					185
+#define GCC_USB20_MASTER_CLK_SRC				186
+#define GCC_USB20_MOCK_UTMI_CLK					187
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				188
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			189
+#define GCC_USB20_SLEEP_CLK					190
+#define GCC_USB30_PRIM_MASTER_CLK				191
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				192
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				193
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			194
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		195
+#define GCC_USB30_PRIM_SLEEP_CLK				196
+#define GCC_USB3_PRIM_CLKREF_EN					197
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				198
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				199
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				200
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				201
+#define GCC_VCODEC0_AXI_CLK					202
+#define GCC_VENUS_AHB_CLK					203
+#define GCC_VENUS_CTL_AXI_CLK					204
+#define GCC_VIDEO_AHB_CLK					205
+#define GCC_VIDEO_AXI0_CLK					206
+#define GCC_VIDEO_THROTTLE_CORE_CLK				207
+#define GCC_VIDEO_VCODEC0_SYS_CLK				208
+#define GCC_VIDEO_VENUS_CLK_SRC					209
+#define GCC_VIDEO_VENUS_CTL_CLK					210
+#define GCC_VIDEO_XO_CLK					211
+
+/* GCC power domains */
+#define GCC_CAMSS_TOP_GDSC					0
+#define GCC_EMAC0_GDSC						1
+#define GCC_EMAC1_GDSC						2
+#define GCC_PCIE_GDSC						3
+#define GCC_USB20_GDSC						4
+#define GCC_USB30_PRIM_GDSC					5
+#define GCC_VCODEC0_GDSC					6
+#define GCC_VENUS_GDSC						7
+
+/* GCC resets */
+#define GCC_CAMSS_OPE_BCR					0
+#define GCC_CAMSS_TFE_BCR					1
+#define GCC_CAMSS_TOP_BCR					2
+#define GCC_EMAC0_BCR						3
+#define GCC_EMAC1_BCR						4
+#define GCC_GPU_BCR						5
+#define GCC_MMSS_BCR						6
+#define GCC_PCIE_BCR						7
+#define GCC_PCIE_PHY_BCR					8
+#define GCC_PDM_BCR						9
+#define GCC_QUPV3_WRAPPER_0_BCR					10
+#define GCC_QUSB2PHY_PRIM_BCR					11
+#define GCC_QUSB2PHY_SEC_BCR					12
+#define GCC_SDCC1_BCR						13
+#define GCC_SDCC2_BCR						14
+#define GCC_TSCSS_BCR						15
+#define GCC_USB20_BCR						16
+#define GCC_USB30_PRIM_BCR					17
+#define GCC_USB3PHY_PHY_PRIM_SP0_BCR				18
+#define GCC_USB3_PHY_PRIM_SP0_BCR				19
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				20
+#define GCC_VCODEC0_BCR						21
+#define GCC_VENUS_BCR						22
+#define GCC_VIDEO_INTERFACE_BCR					23
+
+#endif

-- 
2.34.1

