Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EE037D13A
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784312509; cv=none; b=BPOHLR7ekFNwWFBys4svEXSkVflWh9jqDdUgKz+zvc7u9VrjsKzVwR3T5TE6QKuM/o1JTM75I8o2dqMvHps8j5QGiY+y9Pwl41bUJGzBRlbesh1pFh9n6aX+1IHcxluz8d8Tdicci0kD76sNbKnbyrXc7A4W/Z4m+JUijfU12Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784312509; c=relaxed/simple;
	bh=niiZc34oT/FCUZkmHwiDpo+KF9xrgecMmiVx6uBGJjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NtkfMi2I0Go1myLI0/F8w4wjXU+OffYvGybmrBliOV0qRhgqKNCGCgvdd+BjH3c8LiUrzmgP5rZOKsCzB95YDpR/vJ6zx/6ilpVyd0e7qU02ODH3ufSqUISzeqT70TJHDo7vXpGGEOrRcDRtsmXyXPRaS2sum+wXJrkw8dZqpWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqWQ1Y/X; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqWQ1Y/X"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab1f435afso15269015ad.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 11:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784312505; x=1784917305; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BzztNSmfjCuPS1+BUuTXaof0KOGOp3LQbgIIyx3awS0=;
        b=jqWQ1Y/XI85N72TKhvCYxCiDsTKtxl4YyXYiF+gH+EhfTXbD7LXAxidgLzvmEzPx/S
         LVTkDr8dn2hyCLOj0kCPuzfK4uo1Hzs0fJv4qNVb6SJiC/uy8MIRJg5T8waRR2//VlRR
         prX7SUnENZkfYl6bpdYznrbQTGh9iuqa4NsDHfT0Z4qHLLFOEcVFMl5vkkSpgYhdpAmP
         U/0z3beyJMOSQFRMXz1VpO4qtSprwQVIej8IRo+jJxdmviamHsDzlsPdlz1Fcs+q0yQ5
         VM2/nrgm2Mb8rKJqQ7OA+s2jCh5LV5kC2BuJiewFMcy0vz1EP+sagH+61fYc+1cXLS3P
         rlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784312505; x=1784917305;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BzztNSmfjCuPS1+BUuTXaof0KOGOp3LQbgIIyx3awS0=;
        b=jOeejle/GbcQ/tQxokE3mlC+yB9LyIVbU2d63vFzKTn975u5qEjKPukay1Lohri8BS
         HNFWUeIWX5EeFhMekgla9sq6NAMHVbIHm+rIiM/uPPbB2e3FmAKBUMbYDJY9SLnKw43V
         EWhcmhhWJWttyDytGd+yUlOL5/h1plnY5nPaF+s6ayvDnBtj4GBies7tkuvJqvEPY1gw
         HPmF6O0hXrC9aLHCZA/VwntCz4LMbDvJv9rWojIelE0YoRqRPTBvCZvDe9wWvDYrX0VH
         hyPH8LXsviUuw3j+CPQoxU7qH3DXBK7zNrIKj40I91lr6gbKrGphUGr5Rowuns+xJfl2
         ckOg==
X-Gm-Message-State: AOJu0Yya24Us1Y/82UEVDTF3uaJa9R761+hu4VzozPfvIZ2/Y2eZ3IwT
	Cs2EPB2apGpqFxl1ooCL2d3hMbfBhLAVmo8JT3J57eGXtos4gJ1grjtE1LyiYw==
X-Gm-Gg: AfdE7cnkHZB5rhMbwxxgbm8KOX9MCAcK9FnNujLIIVDrW7RKFyz6XvW9OxHZpRSFq2B
	M1nhMTMPIOiC+NERQIzGQlhdhj6uGHBgrxnRiarE80hgD9/BzBxET/jDkJof+npCzdKPyQKKtMD
	0AyO3Z3kUbvBmG2NeMlpiu0gQYWXJzPSMPUs4bR9x1TOjXRiyOMS/aC7oZ0SZy343lzUEEuhX3/
	lxPW3cwz4fwy16wn1T6vVU7sqCx2XAQwX2uWjBjTgs3Ass0pNKWw+qA1aGRVF5ZE26EjV7x+JjX
	T7dxyofFFxZcFnZs5HXPxjkuL9Oo5YjVYwRQ5D7K3FVRWkeIvge7dExA2FmZoAKhHyB4pYxdQe8
	PWPh+ij53NqshtdNYAmr3wVP/2GkY8JC4saNrgvFtfhHRNlH7LNtV6cOiFTbcWNjuZhWXgB/6re
	ShjbFYxHME48uqC+KizAfIYEV4
X-Received: by 2002:a17:902:da2d:b0:2ca:dc3:5aa with SMTP id d9443c01a7336-2cf3485958cmr31896785ad.2.1784312504803;
        Fri, 17 Jul 2026 11:21:44 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5425:b99:7cf7:c083:fd30:1cea])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm7730919c88.13.2026.07.17.11.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:21:44 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 17 Jul 2026 23:51:21 +0530
Subject: [PATCH] dt-bindings: clock: ti,da850-pll: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM2MD3ZJM3YKcHF1LkzSL1CRLS0OLZAsloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AmcDjFGoAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784312494; l=7508;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=niiZc34oT/FCUZkmHwiDpo+KF9xrgecMmiVx6uBGJjU=;
 b=N9PDVX9uM36t+0hWqxZMu+lQtc5T6Y8fayNpNVSvHSVb/mfzf5d+iwIwCoJQlHN89ukW1YadJ
 VjIPcLthjBxCM3YDHoiqM2+fFaRRp85r+g0mXtoVIMZ1k76n3K0johV
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI da850-pll binding from legacy text to dt schema.
No functional change is introduced during conversion.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/davinci/pll.txt   |  96 -----------
 .../bindings/clock/ti/davinci/ti,da850-pll.yaml    | 177 +++++++++++++++++++++
 2 files changed, 177 insertions(+), 96 deletions(-)

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
index 000000000000..5e4109567b75
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml
@@ -0,0 +1,177 @@
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
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
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
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
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
+          const: ti,da850-pll0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Primary reference clock input
+            - description: External clock source
+        clock-names:
+          items:
+            - const: clksrc
+            - const: extclksrc
+
+  - if:
+      properties:
+        compatible:
+          const: ti,da850-pll1
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: clksrc
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

