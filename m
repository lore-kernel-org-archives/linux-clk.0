Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922AC3EA953
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465656; cv=none; b=Ng5ODRgoJ5zPqL7WWNmESx5eghNUxJV5FLKQJeWBxaEyd9VH8+WBse1Onog+nTZUqs9FNgdGGXAUAJlcxssHszKINz6hUgC4y9pqNe98jYkoHo1WNzjZ5yZG12NO2lBalYOP4F5up0kz51X8CKHkZlc8l7h4N6TRR9O3eWkWtfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465656; c=relaxed/simple;
	bh=NAFHKv8hCxv8sgwJUS9ZKI1V9akBr1LdLvBFEZ+oV/0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAHl9yFqgd9QPDJZTET71b99DHfRg/TiaczQPlch6lP36Or5W9WwlfmCV2+R3qJ9H+UX1SfpPJW3DZQ+2qHi4eZDkIKS+1ZOvsRvXDdM8TPpZPEc0iBlrqIKKF+senD3uz6FEo2tWrCWurejPoql7/PjLNb8gDNMUwlhDuWjJgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVO+0dtP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVO+0dtP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-46f27bd4c45so346506f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 02:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465648; x=1783070448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAIXjok/noDXT0EMJbelmqrpI+3GMWHmkOh7wf+FXrE=;
        b=VVO+0dtP/d8kmWvdgXyIXqWpwXNr8P5v6UZPN/mppMMOyO8gm/4+KLuD1MAXseol2u
         ok+YWfjqMgHb7h5zvnq5OWu3TeYL+OgSZk/ue2iOLC4d3PD3Uybzr/6Ng2a7S82r1jGL
         hhajqoEzUCpIwX664oG6aabwwlp+JrldozetSsNjXq0yssjxWpFr7Rm+NF5i5tDRwj7a
         M57zR/BlY6relb/Nr02kX6hVYTlRf3MjUrNare70/JTw30m9LgQHHMIIoWW1VHXc4wsT
         Lkm4jSiSpBfEjqrnsjWL+ExhmGOu7g47UgrYkF0rDGFqKRG4zT0uz4O/zebH2s3IRHDZ
         jx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465648; x=1783070448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BAIXjok/noDXT0EMJbelmqrpI+3GMWHmkOh7wf+FXrE=;
        b=Jcjfp6DOM1IMBK7BYOts8cnX2ySZR0O2z5eVA2Ro2rE+l68OQPjr8Q0EabcCcXvexf
         fG3VVv5Db8U1fI9jVvud+LCZeme4G7Q1uHaobpQYHKP9W5z3Yk9sZlzfsnRIAIL6GsUq
         5uBniPSJcjWdCgi/sXUNnR2HwGR99XOOQbpo+AxU+WmM+54mTcLJe2FGQQOV4bPJp5cN
         cUaMYuZYCp8pUacQwABOLHR8K+QAt2VcfFjR+g/EwhHG2O4ElkMrppUqMZyoc8C4pEXy
         h4ZZoBBXrcKhTAYtsA+HkqTumjRwYlzlhMum/3JeQncqxzhElciljU1xSUFAV75+dN64
         MHow==
X-Forwarded-Encrypted: i=1; AHgh+RpUUjxcWGU0fPB22g8j4ntfl3E2rTq/01ZUlPD+iocO46ymCeoPVGiL+ZjtLdRCrAGGfD44vTi5tiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPPZUYcUGsMG+rHDhguApy5HtsHHXvxlhBUxzmgF6hGu9jLVlk
	5+4GH1amFLwtQZZI6VgVaVhSr/0+kR41YidxH6eNbLLr7eaoTL+RzYQq
X-Gm-Gg: AfdE7cmuiBebag08EwXCcQklrSNrRdJB/NfnGcGWAOxMvkC1ZdH3+qrlACaRMn+JNDZ
	A3wdmQ3cynFj6doWMgskceXXDztqI4M8Fh9a7qNMRjaQQJoaMLCVxBdWZ8P/IITwNegxOzZNJ+4
	6Lh4JmqlVZHPlCMG3omY3Qa3N6MuUuY1g3um1H1zKR0pBpdjUBVwqJuFdsnaQW5rvEkuGk1g02R
	F5uS/nI0bQdz9VpUcmszlZb3bAlhtuPxCY9AMH6jTz7xyk/ayFtKRxdz3t6lTIH1BmYfAPrsIkV
	ka6jl0Iwa2xz8sAdwinCpPuXUNGVBdvRKFDtZx28ERY/GLI+HLl93zcc7rQ1AQGbapphN+zBMLg
	oz0pv5XwcxIyYVPo2IwiK4Gh3O57JHquTmhm5NRaToWNtuAb2lOtqiQIvUdCDW2Q8OkicgUNBWx
	6jt/l4/LtjDZ/WRs6jciz6qIa3RuzgVYKkZ13OT7HTsOVG5oK29MEL8foyq2ujP1kCjb3CKQeYz
	MlBypLbSX4m
X-Received: by 2002:a05:6000:5c6:b0:46e:765d:78aa with SMTP id ffacd0b85a97d-46e765d7e1dmr5860777f8f.2.1782465647617;
        Fri, 26 Jun 2026 02:20:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document 2-lanes
Date: Fri, 26 Jun 2026 11:20:27 +0200
Message-ID: <20260626092029.3525264-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To permit proper documentation of required property to support PCIe
configured for 2-lanes mode, split the Airoha schema part from the
mediatek-gen3 schema to a dedicated schema.

A PCIe configured for 2-lanes mode require an additional reg for the
secondary PCIe to be configured and the airoha,scu phandle to correctly
configure the PCIe MUX.

Rework the mediatek-gen3 schema to drop any redundant constraint previsouly
introduced for Airoha PCIe properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 2 files changed, 256 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
new file mode 100644
index 000000000000..c690ba7f207c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
@@ -0,0 +1,251 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Gen3 PCIe controller on Airoha SoCs
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: |+
+  PCIe Gen3 MAC controller for Airoha SoCs, it supports Gen3 speed
+  and compatible with Gen2, Gen1 speed.
+
+  This PCIe controller supports up to 256 MSI vectors, the MSI hardware
+  block diagram is as follows:
+
+                    +-----+
+                    | GIC |
+                    +-----+
+                       ^
+                       |
+                   port->irq
+                       |
+               +-+-+-+-+-+-+-+-+
+               |0|1|2|3|4|5|6|7| (PCIe intc)
+               +-+-+-+-+-+-+-+-+
+                ^ ^           ^
+                | |    ...    |
+        +-------+ +------+    +-----------+
+        |                |                |
+  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
+  |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
+  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
+   ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
+   | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
+   | |      |  |    | |      |  |    | |      |  |
+
+    (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
+
+  With 256 MSI vectors supported, the MSI vectors are composed of 8 sets,
+  each set has its own address for MSI message, and supports 32 MSI vectors
+  to generate interrupt.
+
+properties:
+  compatible:
+    const: airoha,en7581-pcie
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  ranges:
+    minItems: 1
+    maxItems: 8
+
+  iommu-map:
+    maxItems: 1
+
+  iommu-map-mask:
+    const: 0
+
+  resets:
+    minItems: 1
+    maxItems: 4
+
+  reset-names:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: sys-ck
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: pcie-phy
+
+  num-lanes:
+    enum: [1, 2]
+
+  mediatek,pbus-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to pbus-csr syscon
+          - description: offset of pbus-csr base address register
+          - description: offset of pbus-csr base address mask register
+    description:
+      Phandle with two arguments to the syscon node used to detect if
+      a given address is accessible on PCIe controller.
+
+  airoha,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to airoha SCU syscon
+    description:
+      Phandle to SCU syscon to configure PCIe MUX for 2 lines support.
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+      '#interrupt-cells':
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ranges
+  - clocks
+  - clock-names
+  - '#interrupt-cells'
+  - interrupt-controller
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - if:
+      properties:
+        num-lanes:
+          const: 2
+    then:
+      properties:
+        reg:
+          minItems: 2
+
+        reg-names:
+          items:
+            - const: pcie-mac
+            - const: sec-pcie-mac
+
+        resets:
+          minItems: 4
+
+        reset-names:
+          items:
+            - const: phy-lane0
+            - const: phy-lane1
+            - const: perstout
+            - const: sec-perstout
+
+      required:
+        - airoha,scu
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: pcie-mac
+
+        resets:
+          minItems: 2
+          maxItems: 3
+
+        reset-names:
+          minItems: 2
+          items:
+            - enum: [ phy-lane0, phy-lane1, phy-lane2 ]
+            - enum: [ phy-lane1, perstout ]
+            - const: phy-lane2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1fc00000 {
+            compatible = "airoha,en7581-pcie";
+            device_type = "pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            reg = <0x0 0x1fc00000 0x0 0x1670>,
+                  <0x0 0x1fc20000 0x0 0x1670>;
+            reg-names = "pcie-mac", "sec-pcie-mac";
+
+            clocks = <&scuclk 7>;
+            clock-names = "sys-ck";
+
+            phys = <&pciephy>;
+            phy-names = "pcie-phy";
+
+            ranges = <0x02000000 0 0x20000000 0x0 0x20000000 0 0x4000000>;
+
+            resets = <&scuclk 48>,
+                     <&scuclk 49>,
+                     <&scuclk 53>,
+                     <&scuclk 54>;
+            reset-names = "phy-lane0", "phy-lane1",
+                          "perstout", "sec-perstout";
+
+            num-lanes = <2>;
+
+            mediatek,pbus-csr = <&pbus_csr 0x0 0x4>;
+
+            airoha,scu = <&scuclk>;
+
+            interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+            bus-range = <0x00 0xff>;
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &pcie_intc 0>,
+                            <0 0 0 2 &pcie_intc 1>,
+                            <0 0 0 3 &pcie_intc 2>,
+                            <0 0 0 4 &pcie_intc 3>;
+            pcie_intc: interrupt-controller {
+                      #address-cells = <0>;
+                      #interrupt-cells = <1>;
+                      interrupt-controller;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 4db700fc36ba..510f1f2b1c5a 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -59,7 +59,6 @@ properties:
           - const: mediatek,mt8196-pcie
       - const: mediatek,mt8192-pcie
       - const: mediatek,mt8196-pcie
-      - const: airoha,en7581-pcie
 
   reg:
     maxItems: 1
@@ -83,20 +82,20 @@ properties:
 
   resets:
     minItems: 1
-    maxItems: 3
+    maxItems: 2
 
   reset-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 2
     items:
-      enum: [ phy, mac, phy-lane0, phy-lane1, phy-lane2 ]
+      enum: [ phy, mac ]
 
   clocks:
-    minItems: 1
+    minItems: 4
     maxItems: 6
 
   clock-names:
-    minItems: 1
+    minItems: 4
     maxItems: 6
 
   assigned-clocks:
@@ -115,17 +114,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,pbus-csr:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to pbus-csr syscon
-          - description: offset of pbus-csr base address register
-          - description: offset of pbus-csr base address mask register
-    description:
-      Phandle with two arguments to the syscon node used to detect if
-      a given address is accessible on PCIe controller.
-
   '#interrupt-cells':
     const: 1
 
@@ -177,16 +165,6 @@ allOf:
             - const: peri_26m
             - const: top_133m
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -208,16 +186,6 @@ allOf:
             - const: peri_26m
             - const: peri_mem
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -246,8 +214,6 @@ allOf:
             - const: phy
             - const: mac
 
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -257,7 +223,6 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
           maxItems: 4
 
         clock-names:
@@ -267,38 +232,6 @@ allOf:
             - const: peri_26m
             - const: top_133m
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
-  - if:
-      properties:
-        compatible:
-          const: airoha,en7581-pcie
-    then:
-      properties:
-        clocks:
-          maxItems: 1
-
-        clock-names:
-          items:
-            - const: sys-ck
-
-        resets:
-          minItems: 3
-
-        reset-names:
-          items:
-            - const: phy-lane0
-            - const: phy-lane1
-            - const: phy-lane2
-
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

