Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550D45349A
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920293; cv=none; b=Y2CIWbOihidwsC4uXWUIlF/1W9va0ncOk7izQ8qU0fvL4FrgaZ4JdGdkApnSCTn/3nV6d/KmlCavbzqXD8V4zAkx5wQKqRcbPs2WYftQ+ZrDwX0AA8ut/JctL3TWIN5TzgZBJK5dSu+xcAPIuljaunhGFtJ6BNn7uCZnDrBphD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920293; c=relaxed/simple;
	bh=9wcSQLP1Lgsa2Ok7cZILM16CeFaex78t1ksoM+SoZuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g5n1hFndqQTWZKjrXTsCUeK3m3RSoyUKyETWhttjK4NvAt9/a2HsQLVYGgiQ7DFQpnylARodgC19b4kbQKF0coqKwK6FovqPvBVAPdJXEsWFfQQMv5iQA06IMWdEtmrtQ1XiffubRL7QU/OiWh93Gvd9D39eDM4rKIo1h2ZfjFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6pMA9Gy; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6pMA9Gy"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso3310623a12.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 06:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768920291; x=1769525091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSUa450SJClDaD7dYoemtKZeU6wVasqRnEK1ns43u3g=;
        b=W6pMA9Gypk9nIjB47DrGfr3BPTAMERmKD8efZmzMDEG53GEE97+G10MXGVg1LC/LBW
         QAIE6qHaO0lmURBlYN/ewr0Gs9WVEzlMMSf00fP1VEtGwpCH0uO7yKvh6T2U0XJsj+4b
         Z/Z7S8Oh/kXs50a1OC3WmoYa3zbDqhGAAB85SK7fh6TGnBXxi+3GWwPLOplWVF+5YCjO
         Muz1tjwAS8rrOQWalK1DDvUAJWcyAAv8xELC00dlCYVq6cwTsViefDopLhO7vb0mSezB
         h1GFeZnf+ozuqYRQE6UvIhzdhDaD55n4/rMwuxgYoF5fvw1BlR3JYDUXZcHY7tWwb7uX
         biuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920291; x=1769525091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSUa450SJClDaD7dYoemtKZeU6wVasqRnEK1ns43u3g=;
        b=duj/hng5Fa0CCsDesyAgv+G+z30y7+5OkYtfSieVJ2MtToZpLc2gzRNQXy1B0BfnQA
         zp7lrxJ2MtytCaIlj2SVbkmA8sijtY4x+rOHN+vWrye56+j6XWuYsDFW7NiRwL15I6bK
         cHKz0xum2Ch/VhTIDNuqOCXk650dvkgtk+Yd1QIvbhXHa31GDaW4Ayn8hjeYR1pOG5P8
         zKcZGIhmfJZdMq+jgBJO+8edL1o1c4lJw6cIWD1kv1y+C3mzdQ7fVdfWpSIhVnkShvgz
         fMhKPap2iMZwHQCWL4A7szzpiIzg8SVFDuNLxTcyK1Jfgu5I4ZPqb5UYqW6tC++kOREw
         BKQg==
X-Gm-Message-State: AOJu0Ywu/ejIbM7eR3hCK6SpgQjety3FuP9EXWdqYNVrziknR2Uuprw7
	CKDpxSt8VnUCUtd0mCLgjUDFQKohWJptZGXSidDgmBp1iz+UIr0VeGCW
X-Gm-Gg: AY/fxX5IY6j5gEoufxLrWHEx+uL8/BG0WoyqdmUmRsXEn2UVuezIpdDM4CNiXN+w/f9
	IQ5PVGICSxgA2FWwXwcNGwFHJXEBxgwBCgMHZGcVCGDKfUpF1AmrPSbxvcZlzKXZel+SbX+PE/h
	1H2aWlQjpV5HBHZrEzomsHKG43E/YrI+2rUU4q9qYxthg6txPwtl3ouJsU6ItXPOugsst6z9qrp
	8d7UHg/Ptn0LDrEijpUQTBCpljz5m7+ZZAl84dDPrrMBFnn6HP9acBt7rZQaXa64DYj6+/GLwpv
	QgnBXq63uo17yPxZrQ8JwgEex5LlW57ZQYy70c94dsh78BlHXRo3V4VYa3dRl5BOCWLQy5NOK9k
	K5nlpzkhGBOkWGkndjo+bbvop4FcJ6p3RZmE4BVBTRo4sqE4UDF7dEzKXAj1BQtZcUA==
X-Received: by 2002:a05:6a21:6088:b0:366:14b0:1a30 with SMTP id adf61e73a8af0-38e45e6ade8mr1763115637.62.1768920291468;
        Tue, 20 Jan 2026 06:44:51 -0800 (PST)
Received: from k.. ([223.74.152.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab96fsm128243035ad.13.2026.01.20.06.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:44:51 -0800 (PST)
From: Nadi Ke <kanadenady@gmail.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nadi Ke <kanadenady@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: clock: sprd: Add SC9832E clock controller
Date: Tue, 20 Jan 2026 22:44:35 +0800
Message-Id: <20260120144436.233998-2-kanadenady@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120144436.233998-1-kanadenady@gmail.com>
References: <20260120144436.233998-1-kanadenady@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the Unisoc SC9832E Clock Control Unit.

Signed-off-by: Nadi Ke <kanadenady@gmail.com>
---
 .../bindings/clock/sprd,sc9832e-clk.yaml      | 129 ++++++++++++
 include/dt-bindings/clock/sprd,sc9832e-clk.h  | 187 ++++++++++++++++++
 2 files changed, 316 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
 create mode 100644 include/dt-bindings/clock/sprd,sc9832e-clk.h

diff --git a/Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml b/Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
new file mode 100644
index 000000000..82efd2493
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2026 Nadi Ke <kanadenady@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sprd,sc9832e-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SC9832E Clock Control Unit
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+  - Nadi Ke <kanadenady@gmail.com>
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  compatible:
+    enum:
+      - sprd,sc9832e-ap-clk
+      - sprd,sc9832e-aon-clk
+      - sprd,sc9832e-apahb-gate
+      - sprd,sc9832e-pmu-gate
+      - sprd,sc9832e-aonapb-gate
+      - sprd,sc9832e-apapb-gate
+      - sprd,sc9832e-pll
+      - sprd,sc9832e-mpll
+      - sprd,sc9832e-dpll
+      - sprd,sc9832e-rpll
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+    description: |
+      The input parent clock(s) phandle for this clock, only list fixed
+      clocks which are declared in devicetree.
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sprd,sc9832e-ap-clk
+    then:
+      required:
+        - reg
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ext-26m
+            - const: ext-1m
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sprd,sc9832e-pmu-gate
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+        clock-names:
+          items:
+            - const: ext-26m
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sprd,sc9832e-aon-clk
+    then:
+      required:
+        - reg
+
+description: |
+  Unisoc SC9832E Clock Control Unit.
+  Other SC9832E clock nodes should be the child of a syscon node with
+  compatible: "sprd,sc9832e-glbregs", "syscon", "simple-mfd".
+  The 'reg' property is also required if there is a sub-range of registers.
+
+additionalProperties: false
+
+examples:
+  - |
+    /* AP Clock Controller */
+    ap_clk: clock-controller@21500000 {
+      compatible = "sprd,sc9832e-ap-clk";
+      reg = <0x21500000 0x1000>;
+      clocks = <&ext_26m>, <&ext_1m>;
+      clock-names = "ext-26m", "ext-1m";
+      #clock-cells = <1>;
+    };
+
+  - |
+    /* PMU Gate Controller inside Syscon */
+    syscon@402b0000 {
+      compatible = "sprd,sc9832e-glbregs", "syscon", "simple-mfd";
+      reg = <0x402b0000 0x4000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0 0x402b0000 0x4000>;
+
+      pmu_gate: pmu-gate@0 {
+        compatible = "sprd,sc9832e-pmu-gate";
+        reg = <0x0 0x1000>;
+        clocks = <&ext_26m>;
+        clock-names = "ext-26m";
+        #clock-cells = <1>;
+      };
+    };
+
+...
diff --git a/include/dt-bindings/clock/sprd,sc9832e-clk.h b/include/dt-bindings/clock/sprd,sc9832e-clk.h
new file mode 100644
index 000000000..6eff6a82b
--- /dev/null
+++ b/include/dt-bindings/clock/sprd,sc9832e-clk.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Unisoc SC9832E platform clocks
+ *
+ * Copyright (C) 2015 Spreadtrum, Inc.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SC9832E_H_
+#define _DT_BINDINGS_CLK_SC9832E_H_
+
+#define CLK_ISPPLL_GATE		0
+#define CLK_MPLL_GATE		1
+#define CLK_DPLL_GATE		2
+#define CLK_LPLL_GATE		3
+#define CLK_GPLL_GATE		4
+#define CLK_PMU_GATE_NUM	(CLK_GPLL_GATE + 1)
+
+#define CLK_TWPLL		0
+#define CLK_TWPLL_768M		1
+#define CLK_TWPLL_384M		2
+#define CLK_TWPLL_192M		3
+#define CLK_TWPLL_96M		4
+#define CLK_TWPLL_48M		5
+#define CLK_TWPLL_24M		6
+#define CLK_TWPLL_12M		7
+#define CLK_TWPLL_512M		8
+#define CLK_TWPLL_256M		9
+#define CLK_TWPLL_128M		10
+#define CLK_TWPLL_64M		11
+#define CLK_TWPLL_307M2		12
+#define CLK_TWPLL_219M4		13
+#define CLK_TWPLL_170M6		14
+#define CLK_TWPLL_153M6		15
+#define CLK_TWPLL_76M8		16
+#define CLK_TWPLL_51M2		17
+#define CLK_TWPLL_38M4		18
+#define CLK_TWPLL_19M2		19
+#define CLK_LPLL		20
+#define CLK_LPLL_409M6		21
+#define CLK_LPLL_245M76		22
+#define CLK_GPLL		23
+#define CLK_ISPPLL		24
+#define CLK_ISPPLL_468M		25
+#define CLK_PLL_NUM		(CLK_ISPPLL_468M + 1)
+
+#define CLK_MPLL		0
+#define CLK_MPLL_50M		1
+#define CLK_MPLL_NUM		(CLK_MPLL_50M + 1)
+
+#define CLK_DPLL		0
+#define CLK_DPLL_40M		1
+#define CLK_DPLL_NUM		(CLK_DPLL_40M + 1)
+
+#define CLK_AUDIO_GATE		0
+#define CLK_RPLL		1
+#define CLK_RPLL_390M		2
+#define CLK_RPLL_260M		3
+#define CLK_RPLL_195M		4
+#define CLK_RPLL_26M		5
+#define CLK_RPLL_NUM		(CLK_RPLL_26M + 1)
+
+#define CLK_DSI_EB		0
+#define CLK_DISPC_EB		1
+#define CLK_VSP_EB		2
+#define CLK_GSP_EB		3
+#define CLK_OTG_EB		4
+#define CLK_DMA_PUB_EB		5
+#define CLK_CE_PUB_EB		6
+#define CLK_AHB_CKG_EB		7
+#define CLK_SDIO0_EB		8
+#define CLK_SDIO1_EB		9
+#define CLK_NANDC_EB		10
+#define CLK_EMMC_EB		11
+#define CLK_SPINLOCK_EB		12
+#define CLK_CE_EFUSE_EB		13
+#define CLK_EMMC_32K_EB		14
+#define CLK_SDIO0_32K_EB	15
+#define CLK_SDIO1_32K_EB	16
+#define CLK_AP_AHB_GATE_NUM	(CLK_SDIO1_32K_EB + 1)
+
+#define CLK_ADC_EB		0
+#define CLK_FM_EB		1
+#define CLK_TPC_EB		2
+#define CLK_GPIO_EB		3
+#define CLK_PWM0_EB		4
+#define CLK_PWM1_EB		5
+#define CLK_PWM2_EB		6
+#define CLK_PWM3_EB		7
+#define CLK_KPD_EB		8
+#define CLK_AON_SYST_EB		9
+#define CLK_AP_SYST_EB		10
+#define CLK_AON_TMR_EB		11
+#define CLK_AP_TMR0_EB		12
+#define CLK_EFUSE_EB		13
+#define CLK_EIC_EB		14
+#define CLK_INTC_EB		15
+#define CLK_ADI_EB		16
+#define CLK_AUDIF_EB		17
+#define CLK_AUD_EB		18
+#define CLK_VBC_EB		19
+#define CLK_PIN_EB		20
+#define CLK_IPI_EB		21
+#define CLK_SPLK_EB		22
+#define CLK_AP_WDG_EB		23
+#define CLK_MM_EB		24
+#define CLK_AON_APB_CKG_EB	25
+#define CLK_GPU_EB		26
+#define CLK_CA7_TS0_EB		27
+#define CLK_CA7_DAP_EB		28
+#define CLK_AON_APB_GATE_NUM	(CLK_CA7_DAP_EB + 1)
+
+#define CLK_AP_APB		0
+#define CLK_NANDC_ECC		1
+#define CLK_OTG_REF		2
+#define CLK_OTG_UTMI		3
+#define CLK_UART1		4
+#define CLK_I2C0		5
+#define CLK_I2C1		6
+#define CLK_I2C2		7
+#define CLK_I2C3		8
+#define CLK_I2C4		9
+#define CLK_SPI0		10
+#define CLK_SPI2		11
+#define CLK_HS_SPI		12
+#define CLK_IIS0		13
+#define CLK_CE			14
+#define CLK_NANDC_2X		15
+#define CLK_SDIO0_2X		16
+#define CLK_SDIO1_2X		17
+#define CLK_EMMC_2X		18
+#define CLK_VSP			19
+#define CLK_GSP			20
+#define CLK_DISPC0		21
+#define CLK_DISPC0_DPI		22
+#define CLK_DSI_RXESC		23
+#define CLK_DSI_LANEBYTE	24
+#define CLK_AP_CLK_NUM		(CLK_DSI_LANEBYTE + 1)
+
+#define CLK_AON_APB		0
+#define CLK_ADI			1
+#define CLK_AUX0		2
+#define CLK_AUX1		3
+#define CLK_PWM0		4
+#define CLK_PWM1		5
+#define CLK_PWM2		6
+#define CLK_PWM3		7
+#define CLK_THM0		8
+#define CLK_THM1		9
+#define CLK_AUDIF		10
+#define CLK_AUD_IIS_DA0		11
+#define CLK_AUD_IIS_AD0		12
+#define CLK_CA53_DAP		13
+#define CLK_CA53_DMTCK		14
+#define CLK_CA53_TS		15
+#define CLK_DJTAG_TCK		16
+#define CLK_EMC_REF		17
+#define CLK_CSSYS		18
+#define CLK_TMR			19
+#define CLK_DSI_TEST		20
+#define CLK_SDPHY_APB		21
+#define CLK_AIO_APB		22
+#define CLK_DTCK_HW		23
+#define CLK_AP_MM		24
+#define CLK_AP_AXI		25
+#define CLK_NIC_GPU		26
+#define CLK_MM_ISP		27
+#define CLK_AON_CLK_NUM		(CLK_MM_ISP + 1)
+
+#define CLK_SIM0_EB		0
+#define CLK_IIS0_EB		1
+#define CLK_APB_REG_EB		2
+#define CLK_SPI0_EB		3
+#define CLK_SPI2_EB		4
+#define CLK_I2C0_EB		5
+#define CLK_I2C1_EB		6
+#define CLK_I2C2_EB		7
+#define CLK_I2C3_EB		8
+#define CLK_I2C4_EB		9
+#define CLK_UART1_EB		10
+#define CLK_SIM0_32K_EB		11
+#define CLK_INTC0_EB		12
+#define CLK_INTC1_EB		13
+#define CLK_INTC2_EB		14
+#define CLK_INTC3_EB		15
+#define CLK_AP_APB_GATE_NUM	(CLK_INTC3_EB + 1)
+
+#endif /* _DT_BINDINGS_CLK_SC9832E_H_ */
-- 
2.34.1

