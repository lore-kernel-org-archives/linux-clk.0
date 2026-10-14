Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055AE48381D
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962580; cv=none; b=pc6JYZYlU/7+b9jreslaRrcA4Tusmy8hKapfgEd0wk7lBDfWE5ZYh/rI+ZRGmoRDMqyiBVCGNuiPhD/CZCPPSrvmVxInU7Nxygb4/ZpeWarRFs4qKXU19tbWu2BQnY4vBW5QX3KEOy0F+FG1mxewJF7yYkJkKiHgd61Z1LXea+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962580; c=relaxed/simple;
	bh=ngUqs70S0tVHIetFCPSkrEl3rti0eExLf5Xu+/mJAHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0PhjnRD10bZkBs1VKDZC9bXLdZnVChVpgQdLsNYlix1iXSlcspqNW/M9GLgCy+7+v+4ZbpAVTQq9O+0ctMl+3BeRxzobWeK71zU1rTmU6oBE+Zw+mBjvKdLizKuqpfPBhrfkz/lfvNaKmS+mZqilq3iqK1w3QZIHuc3Vu0ZVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyA2u3eV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyA2u3eV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2162005f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962574; x=1792567374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CnnJd+dlET+eoZtbsw+uqPIRNpAgMCODbb9/Gk0peE0=;
        b=WyA2u3eVbhBdmi00aGzwQP4DBaaiiHC1nNcCfDzH42XhfkIkeCLttyOb8ErVomTB12
         o9OFb4U/Cvf31vIARI62Gpn+mkmMsbVg7b6t7xSpFwvIUYBSwtQYsmP+seWzohWfZPi0
         /5BkVYXRdMnOALyFjoJt5jCU3WldIsxRafARq9UsCh/9zHdV6q6vyZ+zgIWwGLurNIi6
         UoVoHdPXj5i73mEoZFJ4wR5SSFPS+6rzzVao6ftZggq91hKvftPQgOvnh7JG/EpIRYkQ
         YV9EuRl1KRdp4LIUPXK/MVXRUZm4ZSeYn945x8tb/HqsGMjpgTk/RkwzOsbTGkVXzHCO
         yT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962574; x=1792567374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnnJd+dlET+eoZtbsw+uqPIRNpAgMCODbb9/Gk0peE0=;
        b=eQxWssozeLXiTuVxQvF6alkak0w0DGcAz1VabKsvTxeMZL0EK4qzJgBiV3M9xhBLO8
         CbvEAiZqKjoiSZKidT65nI0vTPbiO0QTiziz21bd++CXVYNzeI8S4v3ytueg9oS7Rto5
         e5K3VrPoanYghzIqpQpvPMoL7DoGXz1sIti/iEsMQNvPQ6h1ZVvNPAKhIrPv8OE2UdSX
         6IcMmmQyQkqdnhliii/ZHn4EH4e1Rmd/nc3B6dzOPSBXbmd0dOyzPCkx9bAyk0pOeN1B
         +Xqa0T0uWeQWmkDn2MfCROY8V5omybAGpRhOYmohSz5mwBcC8qJrZkvMVvYol8PApFm1
         sTYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyI4y0QatLpTMavC3fpGVY1cjS6O6Yb+RF/8B1XPBG9Eo61H612hPYUqqaZa4KzQgujn76ccmZ/8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZGKgIPR3D4sdKvp/xPLO5M3YgjQnH0Qc2JeU/3fLzEsRZMyYw
	SqXrVUZzL5te4MfhqQkg+izfDpPBFBq45AiFtlDnLYSE393X6WRP3Omr
X-Gm-Gg: AYBFou08z/g7cAmoxOJ5bhWMfR+y0sqnst8fVvSmhu7DOigvWFtP1sYHX+MdzKWnXS3
	gbLoZxf44sK6g1YXE3KAAXTiAx7N+Bl/CFTsmWeA6IrcU5f/Kze2iV23N0jFr+G7N9KG3EXkTD2
	IAequGPqirLlg00KpGMzrVxEwTtcmwCsZzy8SOvvkcFIsG9v1cQTDZP5x2cvmEnX8LXIiGYNFTD
	H9TfdCEPkeUa8gTFblo8oocpVIUw6cEq4UqZvbX7TO/WdvQF+XphQOv0eMDTjWh4Ecvbf0fU5X1
	8BP6Q1VSrjvH5GAVsyvCZU2sv41jczlbhYhTZDmXQ23zpzEZTy2vNjw2DZ6Vq3Bu7lf0M1Kit8U
	PcVnjseu5LN7yxd87lFDt29z4MXyq0cDrTriQBn6KtAObW+vbGZnA6TEDEa2ZVjjQSh2GUXBDQM
	qg6+Kef2NHv1xOC4sXsVb1hmK5CivaZA0C743EaDkt45IZ5ONprpcaAFBP3zEygdUJ9Kqxl+OVV
	wWdH94ZokJYiYH7lUBbzrxdKFuJm+yAjKVwnKcy+6rS5f+S2PJ3Wh9bK6QOHEemOdDGuG7dKDuq
	mvKq8DM2u6RBejzvClXMESJ9Nqtb9OkrCLP3fEErtQboIOs5lcSkr5xzARKyRw==
X-Received: by 2002:adf:f184:0:b0:48a:f5de:2ad1 with SMTP id ffacd0b85a97d-48dbad2acb9mr21245583f8f.42.1791962573812;
        Wed, 14 Oct 2026 00:22:53 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:53 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Wed, 14 Oct 2026 08:20:44 +0100
Message-ID: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Device Tree binding schemas for the ZTE ZX279128S clock controllers:
topcrm, lspcrpm, and crm2. Define fixed clock lists and simple-mfd
for child nodes inside topcrm.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/clock/zte,zx279128s-crm2.yaml    |  48 +++++++++
 .../bindings/clock/zte,zx279128s-lspcrpm.yaml | 101 ++++++++++++++++++
 .../bindings/clock/zte,zx279128s-topcrm.yaml  |  86 +++++++++++++++
 include/dt-bindings/clock/zte,zx279128s-crm.h |  51 +++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
 create mode 100644 include/dt-bindings/clock/zte,zx279128s-crm.h

diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
new file mode 100644
index 0000000000..aa90ad15d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx279128s-crm2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S CRM2 clock and reset controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  Top CRM 2 (clock and reset module 2) provides clocks and resets for
+  PCIe controllers on the ZTE ZX279128S SoC.
+
+properties:
+  compatible:
+    oneOf:
+      - const: zte,zx279128s-crm2
+      - items:
+          - const: zte,zx279128s-crm2
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@94100000 {
+        compatible = "zte,zx279128s-crm2";
+        reg = <0x94100000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
new file mode 100644
index 0000000000..3448829a69
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx279128s-lspcrpm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S Low Speed Peripheral Clock Modules
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description: |
+  Each of the two groups of low speed peripherals (LSP) has a peripheral clock
+  module (LSP CRPM) of its own, fed by the top CRM.
+
+properties:
+  compatible:
+    enum:
+      - zte,zx279128s-lsp0crpm
+      - zte,zx279128s-lsp1crpm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 5
+
+  clock-names:
+    minItems: 4
+    maxItems: 5
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-lsp0crpm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: register (APB) clock of the group
+            - description: 25 MHz work clock
+            - description: 32.768 kHz work clock
+            - description: 100 MHz work clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: wclk25m
+            - const: wclk32k
+            - const: wclk100m
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-lsp1crpm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: register (APB) clock of the group
+            - description: AXI clock of the group
+            - description: 25 MHz work clock
+            - description: 49.152 MHz work clock
+            - description: 100 MHz work clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: aclk
+            - const: wclk25m
+            - const: wclk49m
+            - const: wclk100m
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    clock-controller@94400000 {
+        compatible = "zte,zx279128s-lsp0crpm";
+        reg = <0x94400000 0x1000>;
+        clocks = <&topcrm ZX279128S_TOP_LSP0_PCLK>,
+                 <&topcrm ZX279128S_TOP_LSP0_25M>,
+                 <&topcrm ZX279128S_TOP_LSP0_32K>,
+                 <&topcrm ZX279128S_TOP_LSP0_100M>;
+        clock-names = "pclk", "wclk25m", "wclk32k", "wclk100m";
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
new file mode 100644
index 0000000000..9466661929
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx279128s-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S Top Clock and Reset Module
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description: |
+  The top clock and reset module (CRM) of the ZTE ZX279128S holds the PLLs,
+  bus clocks, peripheral clocks and the reset controller.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx279128s-topcrm
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 25 MHz crystal oscillator
+
+  clock-names:
+    items:
+      - const: osc
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reboot:
+    type: object
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    description: System reboot controller child node
+
+patternProperties:
+  "^phy@[01]$":
+    type: object
+    description: PCIe PHY child nodes
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/reset/zte,zx279128s-reset.h>
+
+    topcrm: clock-controller@94000000 {
+        compatible = "zte,zx279128s-topcrm", "syscon", "simple-mfd";
+        reg = <0x94000000 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        reboot {
+            compatible = "syscon-reboot";
+            offset = <0x44>;
+            mask = <0x1>;
+            value = <0x1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/zte,zx279128s-crm.h b/include/dt-bindings/clock/zte,zx279128s-crm.h
new file mode 100644
index 0000000000..dadb2cd007
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx279128s-crm.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
+#define _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
+
+/* Top CRM */
+#define ZX279128S_TOP_PLL_A9		0
+#define ZX279128S_TOP_PLL_LSP		1
+#define ZX279128S_TOP_CPU		2
+#define ZX279128S_TOP_A9_PERIPH		3
+#define ZX279128S_TOP_MATRIX_ACLK	4
+#define ZX279128S_TOP_MATRIX_HCLK	5
+#define ZX279128S_TOP_MATRIX_PCLK	6
+#define ZX279128S_TOP_LSP0_PCLK		7
+#define ZX279128S_TOP_LSP0_25M		8
+#define ZX279128S_TOP_LSP0_32K		9
+#define ZX279128S_TOP_LSP0_100M		10
+#define ZX279128S_TOP_LSP1_PCLK		11
+#define ZX279128S_TOP_LSP1_ACLK		12
+#define ZX279128S_TOP_LSP1_25M		13
+#define ZX279128S_TOP_LSP1_49M		14
+#define ZX279128S_TOP_LSP1_100M		15
+#define ZX279128S_TOP_IRAM_ACLK		16
+#define ZX279128S_TOP_IROM_ACLK		17
+#define ZX279128S_TOP_SYS_CTRL_PCLK	18
+#define ZX279128S_TOP_USB_ACLK		19
+#define ZX279128S_TOP_USB_SUSPEND	20
+#define ZX279128S_TOP_USB_REF		21
+
+
+/* Low speed peripherals 0 */
+#define ZX279128S_LSP0_UART0_WCLK	0
+#define ZX279128S_LSP0_UART0_PCLK	1
+#define ZX279128S_LSP0_UART1_WCLK	2
+#define ZX279128S_LSP0_UART1_PCLK	3
+#define ZX279128S_LSP0_SPI_WCLK		4
+#define ZX279128S_LSP0_SPI_PCLK		5
+#define ZX279128S_LSP0_GPIO_PCLK	6
+
+/* Low speed peripherals 1 */
+#define ZX279128S_LSP1_MDIO_WCLK	0
+#define ZX279128S_LSP1_MDIO_PCLK	1
+
+/* Top CRM 2 */
+#define ZX279128S_CRM2_PCIE0_CLK	0
+#define ZX279128S_CRM2_PCIE1_CLK	1
+
+#endif
-- 
2.55.0

