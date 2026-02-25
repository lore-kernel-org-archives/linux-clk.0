Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CF1247DE1
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 01:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771981775; cv=none; b=GpCxme92nSKjzudmTck+kCT9PQoM8UbDpQ8xHScwwF4+8j0rqL3DH/WJbkvbghKw2V4Q6zFkaSzaIDzxEbiFsnI4XcyXPNkPujfOHdfM8U3+TCq4WOJ5nFsWc0se+l7Z7TtbL1mvUz+IbRpAuPuXerMkzMiji6zgC1RZqmegcpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771981775; c=relaxed/simple;
	bh=g3SF18+pO6/yYs02dSCn0SkcpZdfPpGO96e06mX2z4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ibBpJKTBV7ThyoQh24a2jp12LTwpHtu3rWwnAbGv5KCeA90qauEe0/k3zYOEs3gRUMcD+Xg4i/kHvhxwiXa0kW9qdpsQr3CO32KQTpzvTcaGAr8oWIlGbJfXD76Eq6DoGOUt7FGVGa7j2OswSUjYxJT4TUv48ChOZsmH2M1nfuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzoFzLvc; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzoFzLvc"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a962230847so58747155ad.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 17:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771981773; x=1772586573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7/D+Ze7UXv2d7y8Hitf+M6kSx3SFdAfDUruGUFVxKI=;
        b=PzoFzLvcdW+E6SuMrxNAz3Zmk3XWHRSRsSGsf4RkDrUYhb6flRUqoiYFVUfbqzeXm/
         1+5rwChbLwPVK2V7ooI+gszGuhyHNERUkUQgGZtf+CZcAxSll/ktKjMrA8P5ZbHIefNB
         aAw1z6O6KbpJPA54wuVhF3by3yvF71JDiPo4pOGl44LJvPz4Ggic1z6/btxJ2OzS2b0+
         HLEIa1YIjbOQ0lcf6sRyKVQ+/L6qAaaGbSRzy4O965nqxdzh+AxxQpaTR7WrhbGik7iq
         uBA5DI13X7XxvwAGe4yMRh/1jmtrbAb0b0w0Jhc/yDbBeZnh6GPQ3swCNdDhRqjg9A9E
         xOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771981773; x=1772586573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7/D+Ze7UXv2d7y8Hitf+M6kSx3SFdAfDUruGUFVxKI=;
        b=QIE/eEYC2UPEipp029+OsgEarMUfNwdkvljO0s5ReiZxEXsb7ZmNSn293QcVPTWgGA
         D0+aMJv7D8F1+iX2MO2iU4XysRNJg/fz0Hll4vTGk0RbZpBJOMgOlJFaEfbRVZthqSXg
         iav2i9PWbn99PQ7B6VZb51PlO80cIN/WMYj1OvSxmY5xuNRaGjOrzHATYDTr4zv5zntB
         wPczuzIJ30KkxzcNESYo4eYIAReyB4/PfyZ1yvpdeHouA6tlKaYpt5u1R4QWfuhdKg7r
         oD293dU5509NTYSQ3wIVjBwu/ixvi3ZeMuSUSBsKRSAesIqtZ8J5ngq48/E73HV6RZtb
         tRqA==
X-Forwarded-Encrypted: i=1; AJvYcCWTKArRpzSZorPEqbQLAX26jW7f5Ls7hlI57nOJLGeAoenDyDUn2fRKfUZ+K885Ju+QN+JhyGXZXeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr/le7yA93QdyIKQmNCGKKLFrAYi5a0ZIWJv/y0DmBeW/2vCGN
	2QI4B5UhwJZ3EmfheBVAqggaMS8VW4IiWAlJa1mr2fqBtUu0OJ0qtm5c
X-Gm-Gg: ATEYQzxM9TaXA5+0iUdMXG2IosN54mqWSt6X3cpHbdHN8HQ6e5Csc6daE5PhxbdT+A3
	8RAn0mFGhKurliBZ6VqVhRK5fkJBbU2Pc6tU8+tMpBH1aQT4yy08gQsxlOeXIawvrG+864jdLzF
	zWnkc+vxKMERvUnQv79y3gYbjD+15/1zNfnrxxsj5WOW398ZfMRF2gAc37oHTZ9J6Q9yDw1WDUz
	lEYrT+gE4N2NKi+rf/F3ZZLHm0IHT+49viQfZ0COr4QyULAJvV4HIe2zIh1q0WrKPjnxAwGvXDh
	hqDxhKtbMOceCjowfZB6egkmc/WF0ttlIUZZlpSBsT1963TpTpdEgB/XXp9yIDksi2KJrIaX1NK
	ppTsDSVDlEK/1s6hChI00jxHzeCWaUhkpUH/Wxx6PTQkwwL1W6F5uvM69wwEop1HxJfjp1aGAyw
	vRfcaIE20/7psX4Tdf+L0/QmqLUI/lFPf11YqoJfE3+l40iDmvdRLSOAg=
X-Received: by 2002:a17:902:ccc4:b0:2a9:5e25:4708 with SMTP id d9443c01a7336-2ad743fbdfcmr137100535ad.3.1771981773321;
        Tue, 24 Feb 2026 17:09:33 -0800 (PST)
Received: from k.localdomain ([120.229.13.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5e0f2sm119350245ad.31.2026.02.24.17.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 17:09:32 -0800 (PST)
From: kanadenadi <kenadicanady@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kanadenadi <kenadicanady@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: clock: sprd: Add Unisoc SC9832E clock controller
Date: Wed, 25 Feb 2026 09:09:19 +0800
Message-Id: <20260225010920.757793-2-kenadicanady@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225010920.757793-1-kenadicanady@gmail.com>
References: <20260225010920.757793-1-kenadicanady@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Unisoc SC9832E clock controller. The controller supports multiple clock gates and PLLs.

Signed-off-by: kanadenadi <kenadicanady@gmail.com>
---
Changes in v3:
 - Dropped redundant 'description' from 'clocks' property.
 - Moved globally required properties (reg, clocks, clock-names) to the top-level 'required' block.
 - Unified quote styles for "#clock-cells".
 - Consolidated identical if-then validation rules for single-clock variants into a single block to avoid code duplication.
 - Dropped extra redundant examples, keeping only one representative example.

 .../bindings/clock/sprd,sc9832e-clk.yaml      | 120 ++++++++++++
 include/dt-bindings/clock/sprd,sc9832e-clk.h  | 177 ++++++++++++++++++
 2 files changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
 create mode 100644 include/dt-bindings/clock/sprd,sc9832e-clk.h

diff --git a/Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml b/Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
new file mode 100644
index 000000000..36d6ddc73
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2026 Unisoc Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sprd,sc9832e-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SC9832E Clock Controllers
+
+maintainers:
+  - Nadi Ke <kenadicanady@gmail.com>
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - sprd,sc9832e-glbregs
+      - sprd,sc9832e-pll
+      - sprd,sc9832e-mpll
+      - sprd,sc9832e-dpll
+      - sprd,sc9832e-rpll
+      - sprd,sc9832e-apahb-gate
+      - sprd,sc9832e-aonapb-gate
+      - sprd,sc9832e-ap-clk
+      - sprd,sc9832e-aon-clk
+      - sprd,sc9832e-apapb-gate
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+
+  clock-names:
+    minItems: 1
+    maxItems: 6
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - sprd,sc9832e-glbregs
+              - sprd,sc9832e-pll
+              - sprd,sc9832e-mpll
+              - sprd,sc9832e-dpll
+              - sprd,sc9832e-rpll
+              - sprd,sc9832e-apahb-gate
+              - sprd,sc9832e-aonapb-gate
+              - sprd,sc9832e-apapb-gate
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: ext-26m
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sprd,sc9832e-ap-clk
+    then:
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
+            const: sprd,sc9832e-aon-clk
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: ext-4m3
+            - const: ext-26m
+            - const: ext-32k
+            - const: ext-6m5
+            - const: ext-13m
+            - const: ext-250k
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sprd,sc9832e-clk.h>
+
+    clock-controller@21500000 {
+        compatible = "sprd,sc9832e-ap-clk";
+        reg = <0x21500000 0x1000>;
+        clocks = <&ext_26m>, <&ext_1m>;
+        clock-names = "ext-26m", "ext-1m";
+        #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/sprd,sc9832e-clk.h b/include/dt-bindings/clock/sprd,sc9832e-clk.h
new file mode 100644
index 000000000..cd0b9952b
--- /dev/null
+++ b/include/dt-bindings/clock/sprd,sc9832e-clk.h
@@ -0,0 +1,177 @@
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
+
+#define CLK_MPLL		0
+#define CLK_MPLL_50M		1
+
+#define CLK_DPLL		0
+#define CLK_DPLL_40M		1
+
+#define CLK_AUDIO_GATE		0
+#define CLK_RPLL		1
+#define CLK_RPLL_390M		2
+#define CLK_RPLL_260M		3
+#define CLK_RPLL_195M		4
+#define CLK_RPLL_26M		5
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
+
+#endif /* _DT_BINDINGS_CLK_SC9832E_H_ */
-- 
2.34.1

