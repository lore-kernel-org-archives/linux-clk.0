Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9673D374169
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824920; cv=none; b=jeCxlwiHZ9gBqbe+Fg6m6RhIhR9cDwFXA/mdAmi3iRNF6X4xzV0AaBcMUI542Q+NitzBBCcl/lRnaFUMNH5YkJRsBY1tqmm6AYIE3q/ggqh05t6iAAA9QR0XG2hybmRhPNz3lY8K/o7pgIxgskTmQ+l5kbJpWnEw8gIJRyzIW3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824920; c=relaxed/simple;
	bh=nKhLx1YswS+Vk/pEmQ4MSK/q7WPQldLd83B/GE4F460=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gokZf1ll71h0slrE3ZQueG9mabX0mfzMbt5y8zMuGejL1yCL2cmSefX5zARBTVwScaguNpp6o3xpoN6viEu6D0nd7+7SXQFtewVCarI/jVUamhEgNWjd9CijucBdjGI7SqsbndgZPS/MBnruygLfsx9tKOiFCDF1prdKRP2lGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGTECcE1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGTECcE1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf30af983aso2091825ad.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784824918; x=1785429718; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eUmkGTWDsRXiaqfk1EZPrHLsgRDIMS19FQSinDt4Wvg=;
        b=bGTECcE18lwEtNo8IAZ39QdqN5Go/iFHSLWZ24PTds3Ev5Ceh3m4ClECSOcDRWsOFh
         acFy68wmsq+NK0teAejoHSaFo0L8rkanRAmQI0WfHyowqM27+/9rgclMKD+6G4b1tQXM
         9I7k56NBHi8m1vxn90gPEBZhtqoElASWW36RSPfHj3K7E49j6GCWhf8ThCrekYPfGTAi
         Y0ljsWbZ6Q8qroOl6DF4X7B6EBx/aifPk+lSd9Nlz4OJX5By+BRb2R8F5F7eAeeOAomh
         7OdC9PJzhzxe4G+QBOTqf8wFlt1eS7IrpCRjABzSxuq6BC8IuhrYOePFPoOTV5/bcyMD
         SBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784824918; x=1785429718;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eUmkGTWDsRXiaqfk1EZPrHLsgRDIMS19FQSinDt4Wvg=;
        b=fIb3F/tjyd/DrbHYtEgj+85rDqmnmqbTKkxwqgN3nkULCce/cU+6dBfLKIdiZjqcFl
         DE+YbeIA/e9B2LdJF4Rr9rR99Ss1zGqhJVMncGx1vZVn6BJ1NuUOIS0YFU1Pbe24LMF/
         9Ftr3lgT3KVjyoNYaxTGkzUYC0eh0VNbpaADIBbSnOmX19Cin69MwHt/YrorawOKGTt5
         DRqLJ2sNVO6wqd4R3UB0ZVb7cBsovSweB+EqhM7BoPPqJtk92Yjjm4Ct1P784HdkD5b9
         uABQo+tbVcrtfvTJctK26T2MSoT+zBpBkQEiiazwwtAY5Uav/rC6ECIOqxRLDFFdNsM+
         2c0g==
X-Gm-Message-State: AOJu0YxydxQT7dy1rRChClAALdfqYIAX7oNXQbzeW6q+ZJ3k8/b1cL7V
	yUm8jVKQWvLH5l4OfVA+v+DtJwOv/QV9t/g2tdFrGuvuAViNf352xMHP
X-Gm-Gg: AR+sD13tNNZQd4lmHTiI93Pv5P55zxoI/69H95UlGiVRWQXqcGc/bqqBXBtEhkRIOgv
	sTQ3cx5oTwHm/uzhlvs0YJTCxStYB2oYwmqk4zFf3wcle97mbnvCXZOPdPQOS13Uz/zU+WiEMbN
	wzUIsDSrW2X4BLSCI4QogEn1+41Z/okYLudL96MDTmalrApxmVHG5xOzF3wK/tlIC+HTegiHMzJ
	TjIUhNlo2DkgQZ8r/apR9T6XgOOAXagegI1jU6nulsvfHeVexUr/m8iwgsUQKYG1ouVuzKLd4wU
	XMLLgsR3z/IQUCtpvKe/Gcq78Jk/R2o8r3BrhExslNoWW1d47pyTjRE1d5o6E59yXRzOY67SNoY
	mj4PYyg/x0SqDUFTb73CZX5GDcbdet1jaafxCXPlszjsoSxeVSrcnpNyRK3yWXTsVjYmx3Tpts3
	ZwnaVBMtp4rxOo4YI=
X-Received: by 2002:a17:903:2c0c:b0:2c0:db23:4a6 with SMTP id d9443c01a7336-2cfa6a5bf60mr36710165ad.1.1784824917577;
        Thu, 23 Jul 2026 09:41:57 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5013:6395:c953:26aa:50f8:a5e3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df09ac0sm19023944eec.16.2026.07.23.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:41:57 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 23 Jul 2026 22:11:38 +0530
Subject: [PATCH v2] dt-bindings: clock: ti,da850-pll: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-ti-pll-v2-1-cdc5e559a77d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNyw6CMBBFf4XM2poWFVpW/odh0dYpjOGVFomG9
 N8tEJcnOffcFQJ6wgBVtoLHhQKNQ4L8lIFt9dAgo2diyHle8OLC2Uxs6jqmrk6iUUpIKyHJk0d
 Hnz30qA8Ob/NCO2/rzWgpzKP/7k+L2LwjWoryH10EE8wVThktrTI3vDe9pu5sxx7qGOMPTRBdZ
 a4AAAA=
X-Change-ID: 20260630-ti-pll-94f8eb9918c8
To: David Lechner <david@lechnology.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784824909; l=7557;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=nKhLx1YswS+Vk/pEmQ4MSK/q7WPQldLd83B/GE4F460=;
 b=KWx9pQGvV5phDXmQ6V3Kv3S0WQOwTUb67fuVjUM72yEWEQXp78OnT6FaZSLsDW8toIuW8h00B
 7N5W0MQDeaXABbUl1eOYYnth9y0WrxLAI+QbpoA2fWIkIrGhaWdA0Ub
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI da850-pll binding from legacy text to dt schema.
No functional change is introduced during conversion.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Moved 'items' list for clocks and clock-names to the top-level
  properties block.
- Dropped redundant maxItems: 2 to fix dt_binding_check warnings.
- Simplified allOf block to only restrict maxItems for pll1.
- updated maintainers list
- Link to v1: https://lore.kernel.org/r/20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com
---
 .../devicetree/bindings/clock/ti/davinci/pll.txt   |  96 ------------
 .../bindings/clock/ti/davinci/ti,da850-pll.yaml    | 164 +++++++++++++++++++++
 2 files changed, 164 insertions(+), 96 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt b/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
deleted file mode 100644
index c9894538315b..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-Binding for TI DaVinci PLL Controllers
-
-The PLL provides clocks to most of the components on the SoC. In addition
-to the PLL itself, this controller also contains bypasses, gates, dividers,
-an multiplexers for various clock signals.
-
-Required properties:
-- compatible: shall be one of:
-	- "ti,da850-pll0" for PLL0 on DA850/OMAP-L138/AM18XX
-	- "ti,da850-pll1" for PLL1 on DA850/OMAP-L138/AM18XX
-- reg: physical base address and size of the controller's register area.
-- clocks: phandles corresponding to the clock names
-- clock-names: names of the clock sources - depends on compatible string
-	- for "ti,da850-pll0", shall be "clksrc", "extclksrc"
-	- for "ti,da850-pll1", shall be "clksrc"
-
-Optional properties:
-- ti,clkmode-square-wave: Indicates that the board is supplying a square
-	wave input on the OSCIN pin instead of using a crystal oscillator.
-	This property is only valid when compatible = "ti,da850-pll0".
-
-
-Optional child nodes:
-
-pllout
-	Describes the main PLL clock output (before POSTDIV). The node name must
-	be "pllout".
-
-	Required properties:
-	- #clock-cells: shall be 0
-
-sysclk
-	Describes the PLLDIVn divider clocks that provide the SYSCLKn clock
-	domains. The node name must be "sysclk". Consumers of this node should
-	use "n" in "SYSCLKn" as the index parameter for the clock cell.
-
-	Required properties:
-	- #clock-cells: shall be 1
-
-auxclk
-	Describes the AUXCLK output of the PLL. The node name must be "auxclk".
-	This child node is only valid when compatible = "ti,da850-pll0".
-
-	Required properties:
-	- #clock-cells: shall be 0
-
-obsclk
-	Describes the OBSCLK output of the PLL. The node name must be "obsclk".
-
-	Required properties:
-	- #clock-cells: shall be 0
-
-
-Examples:
-
-	pll0: clock-controller@11000 {
-		compatible = "ti,da850-pll0";
-		reg = <0x11000 0x1000>;
-		clocks = <&ref_clk>, <&pll1_sysclk 3>;
-		clock-names = "clksrc", "extclksrc";
-		ti,clkmode-square-wave;
-
-		pll0_pllout: pllout {
-			#clock-cells = <0>;
-		};
-
-		pll0_sysclk: sysclk {
-			#clock-cells = <1>;
-		};
-
-		pll0_auxclk: auxclk {
-			#clock-cells = <0>;
-		};
-
-		pll0_obsclk: obsclk {
-			#clock-cells = <0>;
-		};
-	};
-
-	pll1: clock-controller@21a000 {
-		compatible = "ti,da850-pll1";
-		reg = <0x21a000 0x1000>;
-		clocks = <&ref_clk>;
-		clock-names = "clksrc";
-
-		pll0_sysclk: sysclk {
-			#clock-cells = <1>;
-		};
-
-		pll0_obsclk: obsclk {
-			#clock-cells = <0>;
-		};
-	};
-
-Also see:
-- Documentation/devicetree/bindings/clock/clock-bindings.txt
diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml
new file mode 100644
index 000000000000..c6563290a702
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/davinci/ti,da850-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci PLL Controllers
+
+maintainers:
+  - David Lechner <david@lechnology.com>
+
+description:
+  The PLL provides clocks to most of the components on the SoC. In addition to
+  the PLL itself, this controller also contains bypasses, gates, dividers, an
+  multiplexers for various clock signals.
+
+properties:
+  compatible:
+    enum:
+      - ti,da850-pll0
+      - ti,da850-pll1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Primary reference clock input
+      - description: External clock source
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: clksrc
+      - const: extclksrc
+
+  ti,clkmode-square-wave:
+    type: boolean
+    description:
+      Indicates that the board is supplying a square wave input on the OSCIN
+      pin instead of using a crystal oscillator.
+
+  pllout:
+    type: object
+    description:
+      Main PLL clock output before POSTDIV.
+
+    properties:
+      '#clock-cells':
+        const: 0
+
+    required:
+      - '#clock-cells'
+
+    additionalProperties: false
+
+  sysclk:
+    type: object
+    description:
+      PLLDIVn divider clocks that provide the SYSCLKn clock domains. Consumers
+      of this node should use "n" in "SYSCLKn" as the index parameter for the
+      clock cell.
+
+    properties:
+      '#clock-cells':
+        const: 1
+
+    required:
+      - '#clock-cells'
+
+    additionalProperties: false
+
+  auxclk:
+    type: object
+    description:
+      AUXCLK output of the PLL
+
+    properties:
+      '#clock-cells':
+        const: 0
+
+    required:
+      - '#clock-cells'
+
+    additionalProperties: false
+
+  obsclk:
+    type: object
+    description:
+      the OBSCLK output of the PLL.
+
+    properties:
+      '#clock-cells':
+        const: 0
+
+    required:
+      - '#clock-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: ti,da850-pll1
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+        ti,clkmode-square-wave: false
+        auxclk: false
+
+examples:
+  - |
+    clock-controller@11000 {
+        compatible = "ti,da850-pll0";
+        reg = <0x11000 0x1000>;
+        clocks = <&ref_clk>, <&pll1_sysclk 3>;
+        clock-names = "clksrc", "extclksrc";
+        ti,clkmode-square-wave;
+
+        pllout {
+            #clock-cells = <0>;
+        };
+
+        sysclk {
+            #clock-cells = <1>;
+        };
+
+        auxclk {
+            #clock-cells = <0>;
+        };
+
+        obsclk {
+            #clock-cells = <0>;
+        };
+    };
+
+  - |
+    clock-controller@21a000 {
+        compatible = "ti,da850-pll1";
+        reg = <0x21a000 0x1000>;
+        clocks = <&ref_clk>;
+        clock-names = "clksrc";
+
+        sysclk {
+            #clock-cells = <1>;
+        };
+
+        obsclk {
+            #clock-cells = <0>;
+        };
+    };

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260630-ti-pll-94f8eb9918c8

Best regards,
-- 
Bhargav

