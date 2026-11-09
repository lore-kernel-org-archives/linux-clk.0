Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184169;
	b=460dguSucK2GMBy07/M3ocYuh3YBdaa5zdCWQYgTiKDlLK6nI2JOydIbL3WBHN3BJAh8
	 gTbl4aJsxPQ93JUsc0qp7u7G2Ni89jCPvBqjjHssQch+FxoCfQcnn1k8HgQqCGMW6xSDd
	 k5ZJdXJkhuwTVnKz0F0y98tiKcTsBdI8vmu2Ki1OQjf6loEkmg8uZ1xrhz+vA3sImt81y
	 etlyJyIB50Udn5HPBvWkK7anKyi/5W/KugFDCWOZv3bemvFDLcVH16sibOy/qgw2j9FHD
	 PEgz1Jju3iRhebZrZk0CtdQsZiQ5Yl0Qetet0MXbFvB8ihBsRcmeJUTS0Ur2EaPWq4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3wAgTaab8TZ2g1APpo6j0apDeN3Jl2/yccr2SvGFVds=;
	b=oOnNmllDQNC6FEFFoHWC9Y1gRxsYTkCniem0Rach45PJWhwRpJWfJ/Iy4Q666D6wNhXL
	 CPhnGMtjZMIhE5XD9mW3PlfTOvcZ0PZeX9Q/TmyaudHP/jEMSgNNvHgeJDAYxOT0yfumy
	 nlky9O3VxpY3eNQOwY/4ANf3lJnndnzFKfjfNAaakJKrovbZ+Z1Vin1x37i/nzVN+HqXc
	 7YHK9dYiduXqA3vD6VWqOkmkLg70ML8Fmec93t1V3iGf51MML+EY/p0zXDrze+IIsHMwQ
	 Kgai8E/guSsD2ew7J1z/Zsm17yb09Fia4+qShJa1bMrRs30XBcSVVtX+G+jMVUgPneQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9z85iQj;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7958606A337
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 00:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7958606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9z85iQj
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so2146855e9.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 16:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184167; x=1794788967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wAgTaab8TZ2g1APpo6j0apDeN3Jl2/yccr2SvGFVds=;
        b=l9z85iQjdu37RwyH9hzt+8+GcdeIaZ9BLioqWHk6xyLZceFwIjY8Fgr3/vwLoIdmP2
         uHW43g+6H7iEBXCG5EhDNWVr1i4JUSil8bswHK/rBkWIYNAwkJ2qP709MLViybTV+SsI
         5xeC1i4SMxpXyf/v0Qp6T/wHbjXnVNGx1m8gK18KrMM5X+zWVYAx/Vbo9lg+2PwhfP/Z
         pVl/R1eq44HkeWLAvLuCvS/rm87/Fe+X4p5Xv/p4u7LJ6jQHFxW7l//pr6ldPfTXdG6E
         L5NV5cpXsyBjJxT6Aw8obJeE0Un9nTEwfk8RwJjMzAXBQZ70pJr0kPYht4WHbkRkyw4X
         uw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184167; x=1794788967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wAgTaab8TZ2g1APpo6j0apDeN3Jl2/yccr2SvGFVds=;
        b=GkpzYxNCHio5WfqYAkvAMEz9HK/m5b0n9+0FCvELqStZDGLNP5qAVhg7KZe80BDhbH
         ojzLbdEwcxNeFjGVIFZQNK8Ch6jhWsrAVYLExkOQiPr9mAIWNVI9P6jJfTk0lDdN7Cd2
         FHVCf3fU5S1IFhBgAF08V1iEzk7LUVOAMUEymzPHPxV72682STXIrcAz1CEL/1uFnNdK
         x2faDcioNiyfEmxgmfXdqj4a8dCoJtMQQQq1lRx8ITbe75uWwknLvC8j1EcJt5dqy79m
         2JVXEUH/XGipjHC6wZ4PducmJiaB3zXrJ5WWYlYEvRPPfOlyCzo0fRn2ODecOfYMEWj8
         Dqtg==
X-Forwarded-Encrypted: i=1; AL+hErH0F4lbuWC71gRdl328Ord/hY7jDwHYWk5wDIPs7Lvun+NteKVuUrJ2EPhrqj9v1/Yzfxkrlj4chxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F5jAuvu47NQS7sjWeg/UrsJE+PYQEI3alkHv2bnJOV4QZ3y/n
	uhaq4bBHcSBnyCgA9E/iKLHrwZSYSTJlRAVALEGIkmG8ZA8Fl2nnY8oB
X-Gm-Gg: AYBFou2s6OC3tX+yK+QVRgtq20t8UQZ/J7pt+x/xLc2Az6eUL193JM8nCxULQnh0zZm
	Wcq3tZM6kZs5tmZlKkVXThPGHBLjYhGWKjYQWDYQJt1T99uA2I1IXt27elbIU8V4v7Inr2+t2ym
	8Oi5vH2bmsW477d/1aWV6jWjekp34yVzk8Y0YZ/c7BcQvWJqvyXjv6BBpmUA+Ean1bBhn0f+KmQ
	+Rdo/C8A/S/wxFICdUB5yb26S+EsN03XmLWsFF9F/ZVxXqVwSEXhDo2B9BZ6/8wMyDZIiHZL7nK
	YAnkHW2px2/TJQLi+J8wFD4jWdhIqXaQixv+Lqw2qOo/p+966+iFUauZVQRAtyUdjfgmbB3SODW
	y8cArsoj62Zt6BhGaIA7Mr39VHccXkpzjGzmxtxugxDyzDA3VGQvOTfMfQFSmR8slbBD84OJsDs
	fepMGlozIo+vPbyRMxfo8agxz+jEccyc3SChZwDprnv3y0bMfRBKNEBPl4x9Xrv85xbQk9eJRDC
	Ft/GsqsOLyH3oQ11zlkjMeJl/VLp0CofyuyhM7Du9oWhFRPuu7CMmKZuotoTYB3IQ2JSCjQYiGS
	ah5Ejh9P7Q6OLxOca8Hc9tKO8Jqh74VEj4Il8sYZ
X-Received: by 2002:a05:600c:1d08:b0:4a5:87a:50ba with SMTP id 5b1f17b1804b1-4b963c91b61mr45173905e9.33.1794184167275;
        Sun, 08 Nov 2026 16:29:27 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:26 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:12 +0000
Subject: [PATCH 3/5] dt-bindings: clock: qcom: document the Halliday Global
 Clock Controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-clk-v1-3-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=13174;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=BHByaAaj86t1mOaLVtUi8B0zg91bNerOl7pC61FUHT0=;
 b=iozuT3zFYDTzOwLnIznxfZgjpcSzcJ3wYiyMabuLgBpSysw7DGbiSwRmr+WKTZg58lGijO5PS
 ptX4zDgUKFeByU/YorkgZj35c2jQcUkPGS3wlGj5ykrEFt16ugjKm1t
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the bindings and the dt-bindings header for the Global Clock
Controller on the Qualcomm Halliday SoC (SXR2250P).

The clkref_en clocks gate the reference clock from the QREF block to
the PHYs. QREF is powered by two supplies, vdda-refgen-0p9 and
vdda-refgen-1p2. Downstream only lists the 0.9 V one, as the USB PHYs'
refgen-supply, and keeps the 1.2 V one on as the USB3 PHY's supply, but
the USB HS PHY stops working when either of them is off.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 .../bindings/clock/qcom,halliday-gcc.yaml          |  84 +++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      | 249 +++++++++++++++++++++
 2 files changed, 333 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,halliday-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,halliday-gcc.yaml
new file mode 100644
index 000000000000..2c57e217a392
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,halliday-gcc.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,halliday-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Halliday
+
+maintainers:
+  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on Halliday. Its clkref_en clocks gate the XO reference to the PHYs
+  through the QREF block, which needs the vdda-refgen supplies.
+
+  See also: include/dt-bindings/clock/qcom,halliday-gcc.h
+
+properties:
+  compatible:
+    const: qcom,halliday-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source
+      - description: PCIE 1 Pipe clock source
+      - description: PCIE 2 Phy Auxiliary clock source
+      - description: PCIE 2 Pipe clock source
+      - description: UFS Phy Rx symbol 0 clock source
+      - description: UFS Phy Rx symbol 1 clock source
+      - description: UFS Phy Tx symbol 0 clock source
+      - description: USB3 Phy wrapper pipe clock source
+
+  power-domains:
+    items:
+      - description: CX domain
+
+  vdda-refgen-0p9-supply:
+    description: QREF 0.9 V supply
+
+  vdda-refgen-1p2-supply:
+    description: QREF 1.2 V supply
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - '#power-domain-cells'
+  - vdda-refgen-0p9-supply
+  - vdda-refgen-1p2-supply
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
+    clock-controller@100000 {
+        compatible = "qcom,halliday-gcc";
+        reg = <0x00100000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&sleep_clk>,
+                 <&pcie0_phy>,
+                 <&pcie1_phy>,
+                 <&pcie2_phy 1>,
+                 <&pcie2_phy 0>,
+                 <&ufs_mem_phy 0>,
+                 <&ufs_mem_phy 1>,
+                 <&ufs_mem_phy 2>,
+                 <&usb_1_qmpphy>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
+        vdda-refgen-0p9-supply = <&vreg_l2f_0p88>;
+        vdda-refgen-1p2-supply = <&vreg_l2c_1p2>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,halliday-gcc.h b/include/dt-bindings/clock/qcom,halliday-gcc.h
new file mode 100644
index 000000000000..1341c4f02a88
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,halliday-gcc.h
@@ -0,0 +1,249 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026, Stanislav Aleksandrov <lightofmysoul@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_HALLIDAY_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_HALLIDAY_H
+
+/* GCC clocks */
+#define GCC_GPLL0					0
+#define GCC_GPLL0_OUT_EVEN				1
+#define GCC_GPLL4					2
+#define GCC_GPLL9					3
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK			4
+#define GCC_AGGRE_NOC_PCIE_SF_AXI_CLK			5
+#define GCC_AGGRE_UFS_PHY_AXI_CLK			6
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK			7
+#define GCC_BOOT_ROM_AHB_CLK				8
+#define GCC_CAMERA_AHB_CLK				9
+#define GCC_CAMERA_HF_AXI_CLK				10
+#define GCC_CAMERA_SF_AXI_CLK				11
+#define GCC_CAMERA_XO_CLK				12
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK			13
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK			14
+#define GCC_DDRSS_GPU_AXI_CLK				15
+#define GCC_DDRSS_PCIE_SF_TBU_CLK			16
+#define GCC_DISP1_AHB_CLK				17
+#define GCC_DISP1_HF_AXI_CLK				18
+#define GCC_DISP_AHB_CLK				19
+#define GCC_DISP_HF_AXI_CLK				20
+#define GCC_GP10_CLK					21
+#define GCC_GP10_CLK_SRC				22
+#define GCC_GP10_DIV_CLK_SRC				23
+#define GCC_GP11_CLK					24
+#define GCC_GP11_CLK_SRC				25
+#define GCC_GP11_DIV_CLK_SRC				26
+#define GCC_GP1_CLK					27
+#define GCC_GP1_CLK_SRC					28
+#define GCC_GP2_CLK					29
+#define GCC_GP2_CLK_SRC					30
+#define GCC_GP3_CLK					31
+#define GCC_GP3_CLK_SRC					32
+#define GCC_GP4_CLK					33
+#define GCC_GP4_CLK_SRC					34
+#define GCC_GP4_DIV_CLK_SRC				35
+#define GCC_GP5_CLK					36
+#define GCC_GP5_CLK_SRC					37
+#define GCC_GP5_DIV_CLK_SRC				38
+#define GCC_GP6_CLK					39
+#define GCC_GP6_CLK_SRC					40
+#define GCC_GP6_DIV_CLK_SRC				41
+#define GCC_GP7_CLK					42
+#define GCC_GP7_CLK_SRC					43
+#define GCC_GP7_DIV_CLK_SRC				44
+#define GCC_GP8_CLK					45
+#define GCC_GP8_CLK_SRC					46
+#define GCC_GP8_DIV_CLK_SRC				47
+#define GCC_GP9_CLK					48
+#define GCC_GP9_CLK_SRC					49
+#define GCC_GP9_DIV_CLK_SRC				50
+#define GCC_GPU_CFG_AHB_CLK				51
+#define GCC_GPU_GPLL0_CLK_SRC				52
+#define GCC_GPU_GPLL0_DIV_CLK_SRC			53
+#define GCC_GPU_MEMNOC_GFX_CLK				54
+#define GCC_GPU_SNOC_DVM_GFX_CLK			55
+#define GCC_PCIE_0_AUX_CLK				56
+#define GCC_PCIE_0_AUX_CLK_SRC				57
+#define GCC_PCIE_0_CFG_AHB_CLK				58
+#define GCC_PCIE_0_CLKREF_EN				59
+#define GCC_PCIE_0_MSTR_AXI_CLK				60
+#define GCC_PCIE_0_PHY_RCHNG_CLK			61
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC			62
+#define GCC_PCIE_0_PIPE_CLK				63
+#define GCC_PCIE_0_PIPE_CLK_SRC				64
+#define GCC_PCIE_0_PIPE_DIV2_CLK			65
+#define GCC_PCIE_0_PIPE_DIV_CLK_SRC			66
+#define GCC_PCIE_0_SLV_AXI_CLK				67
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK			68
+#define GCC_PCIE_1_AUX_CLK				69
+#define GCC_PCIE_1_AUX_CLK_SRC				70
+#define GCC_PCIE_1_CFG_AHB_CLK				71
+#define GCC_PCIE_1_CLKREF_EN				72
+#define GCC_PCIE_1_MSTR_AXI_CLK				73
+#define GCC_PCIE_1_PHY_RCHNG_CLK			74
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC			75
+#define GCC_PCIE_1_PIPE_CLK				76
+#define GCC_PCIE_1_PIPE_CLK_SRC				77
+#define GCC_PCIE_1_PIPE_DIV2_CLK			78
+#define GCC_PCIE_1_PIPE_DIV_CLK_SRC			79
+#define GCC_PCIE_1_SLV_AXI_CLK				80
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK			81
+#define GCC_PCIE_2_AUX_CLK				82
+#define GCC_PCIE_2_AUX_CLK_SRC				83
+#define GCC_PCIE_2_CFG_AHB_CLK				84
+#define GCC_PCIE_2_CLKREF_EN				85
+#define GCC_PCIE_2_MSTR_AXI_CLK				86
+#define GCC_PCIE_2_PHY_AUX_CLK				87
+#define GCC_PCIE_2_PHY_AUX_CLK_SRC			88
+#define GCC_PCIE_2_PHY_RCHNG_CLK			89
+#define GCC_PCIE_2_PHY_RCHNG_CLK_SRC			90
+#define GCC_PCIE_2_PIPE_CLK				91
+#define GCC_PCIE_2_PIPE_CLK_SRC				92
+#define GCC_PCIE_2_PIPE_DIV2_CLK			93
+#define GCC_PCIE_2_PIPE_DIV_CLK_SRC			94
+#define GCC_PCIE_2_SLV_AXI_CLK				95
+#define GCC_PCIE_2_SLV_Q2A_AXI_CLK			96
+#define GCC_PDM2_CLK					97
+#define GCC_PDM2_CLK_SRC				98
+#define GCC_PDM_AHB_CLK					99
+#define GCC_PDM_XO4_CLK					100
+#define GCC_PWM0_XO512_CLK				101
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK			102
+#define GCC_QMIP_CAMERA_RT_AHB_CLK			103
+#define GCC_QMIP_GPU_AHB_CLK				104
+#define GCC_QMIP_PCIE_AHB_CLK				105
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK			106
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK			107
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK			108
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK			109
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK			110
+#define GCC_QUPV3_WRAP0_CORE_CLK			111
+#define GCC_QUPV3_WRAP0_QSPI0_CLK			112
+#define GCC_QUPV3_WRAP0_S0_CLK				113
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC			114
+#define GCC_QUPV3_WRAP0_S1_CLK				115
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC			116
+#define GCC_QUPV3_WRAP0_S2_CLK				117
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC			118
+#define GCC_QUPV3_WRAP0_S3_CLK				119
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC			120
+#define GCC_QUPV3_WRAP0_S4_CLK				121
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC			122
+#define GCC_QUPV3_WRAP0_S4_DIV_CLK_SRC			123
+#define GCC_QUPV3_WRAP0_S5_CLK				124
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC			125
+#define GCC_QUPV3_WRAP0_S6_CLK				126
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC			127
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK			128
+#define GCC_QUPV3_WRAP1_CORE_CLK			129
+#define GCC_QUPV3_WRAP1_QSPI0_CLK			130
+#define GCC_QUPV3_WRAP1_S0_CLK				131
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC			132
+#define GCC_QUPV3_WRAP1_S1_CLK				133
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC			134
+#define GCC_QUPV3_WRAP1_S2_CLK				135
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC			136
+#define GCC_QUPV3_WRAP1_S3_CLK				137
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC			138
+#define GCC_QUPV3_WRAP1_S4_CLK				139
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC			140
+#define GCC_QUPV3_WRAP1_S4_DIV_CLK_SRC			141
+#define GCC_QUPV3_WRAP1_S5_CLK				142
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC			143
+#define GCC_QUPV3_WRAP1_S6_CLK				144
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC			145
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK			146
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK			147
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK			148
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK			149
+#define GCC_SDCC2_AHB_CLK				150
+#define GCC_SDCC2_APPS_CLK				151
+#define GCC_SDCC2_APPS_CLK_SRC				152
+#define GCC_UFS_0_CLKREF_EN				153
+#define GCC_UFS_PHY_AHB_CLK				154
+#define GCC_UFS_PHY_AXI_CLK				155
+#define GCC_UFS_PHY_AXI_CLK_SRC				156
+#define GCC_UFS_PHY_ICE_CORE_CLK			157
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC			158
+#define GCC_UFS_PHY_PHY_AUX_CLK				159
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC			160
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK			161
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC			162
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK			163
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC			164
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK			165
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC			166
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK			167
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC			168
+#define GCC_USB2_0_CLKREF_EN				169
+#define GCC_USB30_PRIM_MASTER_CLK			170
+#define GCC_USB30_PRIM_MASTER_CLK_SRC			171
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK			172
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC		173
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC	174
+#define GCC_USB30_PRIM_SLEEP_CLK			175
+#define GCC_USB3_0_CLKREF_EN				176
+#define GCC_USB3_PRIM_PHY_AUX_CLK			177
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC			178
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK			179
+#define GCC_USB3_PRIM_PHY_PIPE_CLK			180
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC			181
+#define GCC_VIDEO_AHB_CLK				182
+#define GCC_VIDEO_AXI0_CLK				183
+#define GCC_VIDEO_AXI1_CLK				184
+#define GCC_VIDEO_XO_CLK				185
+#define GCC_EDP_0_CLKREF_EN				186
+#define GCC_EDP_1_CLKREF_EN				187
+#define GCC_PWM0_XO512_DIV_CLK_SRC			188
+
+/* GCC power domains */
+#define PCIE_0_GDSC					0
+#define PCIE_1_GDSC					1
+#define PCIE_2_GDSC					2
+#define UFS_PHY_GDSC					3
+#define USB30_PRIM_GDSC					4
+
+/* GCC resets */
+#define GCC_CAMERA_BCR					0
+#define GCC_DISPLAY1_BCR				1
+#define GCC_DISPLAY_BCR					2
+#define GCC_GPU_BCR					3
+#define GCC_PCIE_0_BCR					4
+#define GCC_PCIE_0_LINK_DOWN_BCR			5
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR			6
+#define GCC_PCIE_0_PHY_BCR				7
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR		8
+#define GCC_PCIE_1_BCR					9
+#define GCC_PCIE_1_LINK_DOWN_BCR			10
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR			11
+#define GCC_PCIE_1_PHY_BCR				12
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR		13
+#define GCC_PCIE_2_BCR					14
+#define GCC_PCIE_2_LINK_DOWN_BCR			15
+#define GCC_PCIE_2_NOCSR_COM_PHY_BCR			16
+#define GCC_PCIE_2_PHY_BCR				17
+#define GCC_PCIE_2_PHY_NOCSR_COM_PHY_BCR		18
+#define GCC_PCIE_PHY_BCR				19
+#define GCC_PCIE_PHY_CFG_AHB_BCR			20
+#define GCC_PCIE_PHY_COM_BCR				21
+#define GCC_PDM_BCR					22
+#define GCC_QUPV3_WRAPPER_0_BCR				23
+#define GCC_QUPV3_WRAPPER_1_BCR				24
+#define GCC_QUSB2PHY_PRIM_BCR				25
+#define GCC_QUSB2PHY_SEC_BCR				26
+#define GCC_SDCC2_BCR					27
+#define GCC_UFS_PHY_BCR					28
+#define GCC_USB30_PRIM_BCR				29
+#define GCC_USB3_DP_PHY_PRIM_BCR			30
+#define GCC_USB3_DP_PHY_SEC_BCR				31
+#define GCC_USB3_PHY_PRIM_BCR				32
+#define GCC_USB3_PHY_SEC_BCR				33
+#define GCC_USB3PHY_PHY_PRIM_BCR			34
+#define GCC_USB3PHY_PHY_SEC_BCR				35
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR			36
+#define GCC_VIDEO_BCR					37
+#define GCC_VIDEO_AXI0_CLK_ARES				38
+#define GCC_VIDEO_AXI1_CLK_ARES				39
+
+#endif

-- 
2.55.0

