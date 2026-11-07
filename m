Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073019;
	b=BnX+DuY7K2Sqc9LxrL7xrW/eNsq9EBIqDaDjUjlplJ5nYcYpDBSG2BjgIK9Doc9GKQkw
	 ow14LQ4AX6v66shAwVEplMZ1PwbuJg78QoToCNnCMKEXhFdtcUySg7PUUJ2bD5Z+vfwuI
	 I9RF08COyuT+VJLyEaQEeAk3dqLgwHqoyJnfL16imT0eY9kpXM/WVehnlsMraxJpctOVN
	 8yRWyGWOG6OifjBMkzVgoem+cgsBmU8EtiY2pi0CLBpkW6nxv1ZideeIfb1e9ECGSPmwo
	 VofPFGJUVSlV2gLIWt1UhdyUkERUsyOwc7LYKhxdwL+ajyvRtKupZ+KMHrmb3uVqpBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073019;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n/zxu3uM+mwjqv0t0wrZIKnh4J6TNr1J4GzbiYMxo7A=;
	b=mGFZQtNs4lpUyWEJ7RJF/cYh+KeufRe++MTKzAhN70MCh/zHgphWrfoRu9vRwgt4Djfs
	 lh26MBa8LLPNkc/ulQL5zUp/QKo8WDkGUzfLQ7axdKaDGyu9psuBx5oXSx2o8/qgHTgjz
	 pYdnHz0UKRfM+VkznvFIesgH4E+8fNhxEK07JjeHOoaeowNlycLnve2PR3vN030Vi7nDx
	 yTPx1gt8f5kScGfJarTdxa5zag+EW4la8FKgW3cBQ6VdiEskDr2SeuC6bQh+jSBeiLTrU
	 JeF90lb0LIzyjkKcCg7PFTPYuUyVfeCsp1gchqMEwVU6nBgbRAqOfW62voLO9PE8j+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9kkH3cJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0B2606A32E;
	Sat,  7 Nov 2026 17:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9kkH3cJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23521F008A1;
	Sat,  7 Nov 2026 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794073018;
	bh=n/zxu3uM+mwjqv0t0wrZIKnh4J6TNr1J4GzbiYMxo7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b9kkH3cJXqSDPu1o5HhVeDRO75pboST0fqclHYi49UeSviBMiadAHegcJHxQ3Kfuh
	 VsdNfZ3IGpw+4IElIeeAlyQlVNmYk+Rc9yyjRewluJq5fXAmLMTaNbDNMM+oRaVky2
	 J/RdN+zwS/KSjpQrA+MxyRarxTkI+lSUWSfC9g3+S4KE+5zHlF5KhsrER+HzTXIV5t
	 0fOJaCXP1CTw3ea8u496u8ELTKwv6RJy1mdOhWOJwx3Fy/x3KcOW5evxtoiUlPh7o2
	 90zxwk9aURaQ4egMa9DZ5Fz55gzjrJtN5E9OB1aNhk5djqNDr4jdwlV0pcvXmpuojr
	 Xrw6mgoivZFUA==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add SM8350 camera clock controller
Date: Sat,  7 Nov 2026 19:36:18 +0200
Message-ID: <20261107173621.3538964-2-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261107173621.3538964-1-vz@kernel.org>
References: <20261107173621.3538964-1-vz@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the camera clock controller on Qualcomm
SM8350 SoC.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../bindings/clock/qcom,sm8350-camcc.yaml     |  69 ++++++++
 include/dt-bindings/clock/qcom,sm8350-camcc.h | 149 ++++++++++++++++++
 2 files changed, 218 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8350-camcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8350-camcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8350-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8350-camcc.yaml
new file mode 100644
index 000000000000..f34562da4640
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8350-camcc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8350-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on SM8350
+
+maintainers:
+  - Vladimir Zapolskiy <vz@kernel.org>
+
+description: |
+  Qualcomm camera clock control module provides the clocks,
+  resets and power domains on SM8350.
+
+  See also:
+    include/dt-bindings/clock/qcom,sm8350-camcc.h
+
+properties:
+  compatible:
+    const: qcom,sm8350-camcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  power-domains:
+    items:
+      - description: MMCX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: MMCX performance point
+      - description: MX performance point
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    clock-controller@ad00000 {
+      compatible = "qcom,sm8350-camcc";
+      reg = <0x0ad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>,
+                      <&rpmhpd RPMHPD_MX>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_svs_l1>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm8350-camcc.h b/include/dt-bindings/clock/qcom,sm8350-camcc.h
new file mode 100644
index 000000000000..a854c9638df3
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8350-camcc.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8350_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8350_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_AREG_CLK					1
+#define CAM_CC_BPS_AXI_CLK					2
+#define CAM_CC_BPS_CLK						3
+#define CAM_CC_BPS_CLK_SRC					4
+#define CAM_CC_CAMNOC_AXI_CLK					5
+#define CAM_CC_CAMNOC_AXI_CLK_SRC				6
+#define CAM_CC_CAMNOC_DCD_XO_CLK				7
+#define CAM_CC_CCI_0_CLK					8
+#define CAM_CC_CCI_0_CLK_SRC					9
+#define CAM_CC_CCI_1_CLK					10
+#define CAM_CC_CCI_1_CLK_SRC					11
+#define CAM_CC_CORE_AHB_CLK					12
+#define CAM_CC_CPAS_AHB_CLK					13
+#define CAM_CC_CPHY_RX_CLK_SRC					14
+#define CAM_CC_CSI0PHYTIMER_CLK					15
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				16
+#define CAM_CC_CSI1PHYTIMER_CLK					17
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				18
+#define CAM_CC_CSI2PHYTIMER_CLK					19
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				20
+#define CAM_CC_CSI3PHYTIMER_CLK					21
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				22
+#define CAM_CC_CSI4PHYTIMER_CLK					23
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				24
+#define CAM_CC_CSI5PHYTIMER_CLK					25
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				26
+#define CAM_CC_CSIPHY0_CLK					27
+#define CAM_CC_CSIPHY1_CLK					28
+#define CAM_CC_CSIPHY2_CLK					29
+#define CAM_CC_CSIPHY3_CLK					30
+#define CAM_CC_CSIPHY4_CLK					31
+#define CAM_CC_CSIPHY5_CLK					32
+#define CAM_CC_FAST_AHB_CLK_SRC					33
+#define CAM_CC_GDSC_CLK						34
+#define CAM_CC_ICP_AHB_CLK					35
+#define CAM_CC_ICP_CLK						36
+#define CAM_CC_ICP_CLK_SRC					37
+#define CAM_CC_IFE_0_AHB_CLK					38
+#define CAM_CC_IFE_0_AREG_CLK					39
+#define CAM_CC_IFE_0_AXI_CLK					40
+#define CAM_CC_IFE_0_CLK					41
+#define CAM_CC_IFE_0_CLK_SRC					42
+#define CAM_CC_IFE_0_CPHY_RX_CLK				43
+#define CAM_CC_IFE_0_CSID_CLK					44
+#define CAM_CC_IFE_0_CSID_CLK_SRC				45
+#define CAM_CC_IFE_0_DSP_CLK					46
+#define CAM_CC_IFE_1_AHB_CLK					47
+#define CAM_CC_IFE_1_AREG_CLK					48
+#define CAM_CC_IFE_1_AXI_CLK					49
+#define CAM_CC_IFE_1_CLK					50
+#define CAM_CC_IFE_1_CLK_SRC					51
+#define CAM_CC_IFE_1_CPHY_RX_CLK				52
+#define CAM_CC_IFE_1_CSID_CLK					53
+#define CAM_CC_IFE_1_CSID_CLK_SRC				54
+#define CAM_CC_IFE_1_DSP_CLK					55
+#define CAM_CC_IFE_2_AHB_CLK					56
+#define CAM_CC_IFE_2_AREG_CLK					57
+#define CAM_CC_IFE_2_AXI_CLK					58
+#define CAM_CC_IFE_2_CLK					59
+#define CAM_CC_IFE_2_CLK_SRC					60
+#define CAM_CC_IFE_2_CPHY_RX_CLK				61
+#define CAM_CC_IFE_2_CSID_CLK					62
+#define CAM_CC_IFE_2_CSID_CLK_SRC				63
+#define CAM_CC_IFE_LITE_AHB_CLK					64
+#define CAM_CC_IFE_LITE_AXI_CLK					65
+#define CAM_CC_IFE_LITE_CLK					66
+#define CAM_CC_IFE_LITE_CLK_SRC					67
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				68
+#define CAM_CC_IFE_LITE_CSID_CLK				69
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				70
+#define CAM_CC_IPE_0_AHB_CLK					71
+#define CAM_CC_IPE_0_AREG_CLK					72
+#define CAM_CC_IPE_0_AXI_CLK					73
+#define CAM_CC_IPE_0_CLK					74
+#define CAM_CC_IPE_0_CLK_SRC					75
+#define CAM_CC_JPEG_CLK						76
+#define CAM_CC_JPEG_CLK_SRC					77
+#define CAM_CC_MCLK0_CLK					78
+#define CAM_CC_MCLK0_CLK_SRC					79
+#define CAM_CC_MCLK1_CLK					80
+#define CAM_CC_MCLK1_CLK_SRC					81
+#define CAM_CC_MCLK2_CLK					82
+#define CAM_CC_MCLK2_CLK_SRC					83
+#define CAM_CC_MCLK3_CLK					84
+#define CAM_CC_MCLK3_CLK_SRC					85
+#define CAM_CC_MCLK4_CLK					86
+#define CAM_CC_MCLK4_CLK_SRC					87
+#define CAM_CC_MCLK5_CLK					88
+#define CAM_CC_MCLK5_CLK_SRC					89
+#define CAM_CC_PLL0						90
+#define CAM_CC_PLL0_OUT_EVEN					91
+#define CAM_CC_PLL0_OUT_ODD					92
+#define CAM_CC_PLL1						93
+#define CAM_CC_PLL1_OUT_EVEN					94
+#define CAM_CC_PLL2						95
+#define CAM_CC_PLL3						96
+#define CAM_CC_PLL3_OUT_EVEN					97
+#define CAM_CC_PLL4						98
+#define CAM_CC_PLL4_OUT_EVEN					99
+#define CAM_CC_PLL5						100
+#define CAM_CC_PLL5_OUT_EVEN					101
+#define CAM_CC_PLL6						102
+#define CAM_CC_PLL6_OUT_EVEN					103
+#define CAM_CC_SBI_AHB_CLK					104
+#define CAM_CC_SBI_AXI_CLK					105
+#define CAM_CC_SBI_CLK						106
+#define CAM_CC_SBI_CPHY_RX_0_CLK				107
+#define CAM_CC_SBI_CPHY_RX_1_CLK				108
+#define CAM_CC_SBI_CSID_0_CLK					109
+#define CAM_CC_SBI_CSID_1_CLK					110
+#define CAM_CC_SBI_CSID_CLK_SRC					111
+#define CAM_CC_SBI_DIV_CLK_SRC					112
+#define CAM_CC_SBI_IFE_0_CLK					113
+#define CAM_CC_SBI_IFE_1_CLK					114
+#define CAM_CC_SBI_IFE_2_CLK					115
+#define CAM_CC_SLEEP_CLK					116
+#define CAM_CC_SLEEP_CLK_SRC					117
+#define CAM_CC_SLOW_AHB_CLK_SRC					118
+#define CAM_CC_XO_CLK_SRC					119
+
+/* CAM_CC power domains */
+#define BPS_GDSC						0
+#define IPE_0_GDSC						1
+#define SBI_GDSC						2
+#define IFE_0_GDSC						3
+#define IFE_1_GDSC						4
+#define IFE_2_GDSC						5
+#define TITAN_TOP_GDSC						6
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IFE_0_BCR					2
+#define CAM_CC_IFE_1_BCR					3
+#define CAM_CC_IFE_2_BCR					4
+#define CAM_CC_IPE_0_BCR					5
+#define CAM_CC_SBI_BCR						6
+
+#endif
-- 
2.51.0

