Return-Path: <SRS0=8dxN=T3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6AAC04AB3
	for <linux-clk@archiver.kernel.org>; Mon, 27 May 2019 10:02:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71DCE208CA
	for <linux-clk@archiver.kernel.org>; Mon, 27 May 2019 10:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfE0KC0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 May 2019 06:02:26 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42895 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfE0KC0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 May 2019 06:02:26 -0400
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3D5B24000C;
        Mon, 27 May 2019 10:02:22 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH] dt-bindings: clk: Convert Allwinner CCU to a schema
Date:   Mon, 27 May 2019 12:02:19 +0200
Message-Id: <20190527100219.11264-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Allwinner SoCs have a clocks controller supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        | 141 ++++++++++++++++++
 .../devicetree/bindings/clock/sunxi-ccu.txt   |  62 --------
 2 files changed, 141 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/sunxi-ccu.txt

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
new file mode 100644
index 000000000000..c935405458fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/allwinner,sun4i-a10-ccu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner Clock Control Unit Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  compatible:
+    enum:
+      - allwinner,sun4i-a10-ccu
+      - allwinner,sun5i-a10s-ccu
+      - allwinner,sun5i-a13-ccu
+      - allwinner,sun6i-a31-ccu
+      - allwinner,sun7i-a20-ccu
+      - allwinner,sun8i-a23-ccu
+      - allwinner,sun8i-a33-ccu
+      - allwinner,sun8i-a83t-ccu
+      - allwinner,sun8i-a83t-r-ccu
+      - allwinner,sun8i-h3-ccu
+      - allwinner,sun8i-h3-r-ccu
+      - allwinner,sun8i-r40-ccu
+      - allwinner,sun8i-v3s-ccu
+      - allwinner,sun9i-a80-ccu
+      - allwinner,sun50i-a64-ccu
+      - allwinner,sun50i-a64-r-ccu
+      - allwinner,sun50i-h5-ccu
+      - allwinner,sun50i-h6-ccu
+      - allwinner,sun50i-h6-r-ccu
+      - allwinner,suniv-f1c100s-ccu
+      - nextthing,gr8-ccu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: High Frequency Oscillator (usually at 24MHz)
+      - description: Low Frequency Oscillator (usually at 32kHz)
+      - description: Internal Oscillator
+      - description: Peripherals PLL
+
+  clock-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      - const: hosc
+      - const: losc
+      - const: iosc
+      - const: pll-periph
+
+required:
+  - "#clock-cells"
+  - "#reset-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      enum:
+        - allwinner,sun8i-a83t-r-ccu
+        - allwinner,sun8i-h3-r-ccu
+        - allwinner,sun50i-a64-r-ccu
+        - allwinner,sun50i-h6-r-ccu
+
+then:
+  properties:
+    clocks:
+      minItems: 4
+      maxItems: 4
+
+    clock-names:
+      minItems: 4
+      maxItems: 4
+
+else:
+  if:
+    properties:
+      compatible:
+        const: allwinner,sun50i-h6-ccu
+
+  then:
+    properties:
+      clocks:
+        minItems: 3
+        maxItems: 3
+
+      clock-names:
+        minItems: 3
+        maxItems: 3
+
+  else:
+    properties:
+      clocks:
+        minItems: 2
+        maxItems: 2
+
+      clock-names:
+        minItems: 2
+        maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    ccu: clock@1c20000 {
+        compatible = "allwinner,sun8i-h3-ccu";
+        reg = <0x01c20000 0x400>;
+        clocks = <&osc24M>, <&osc32k>;
+        clock-names = "hosc", "losc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+  - |
+    r_ccu: clock@1f01400 {
+        compatible = "allwinner,sun50i-a64-r-ccu";
+        reg = <0x01f01400 0x100>;
+        clocks = <&osc24M>, <&osc32k>, <&iosc>, <&ccu 11>;
+        clock-names = "hosc", "losc", "iosc", "pll-periph";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
deleted file mode 100644
index e3bd88ae456b..000000000000
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-Allwinner Clock Control Unit Binding
-------------------------------------
-
-Required properties :
-- compatible: must contain one of the following compatibles:
-		- "allwinner,sun4i-a10-ccu"
-		- "allwinner,sun5i-a10s-ccu"
-		- "allwinner,sun5i-a13-ccu"
-		- "allwinner,sun6i-a31-ccu"
-		- "allwinner,sun7i-a20-ccu"
-		- "allwinner,sun8i-a23-ccu"
-		- "allwinner,sun8i-a33-ccu"
-		- "allwinner,sun8i-a83t-ccu"
-		- "allwinner,sun8i-a83t-r-ccu"
-		- "allwinner,sun8i-h3-ccu"
-		- "allwinner,sun8i-h3-r-ccu"
-+		- "allwinner,sun8i-r40-ccu"
-		- "allwinner,sun8i-v3s-ccu"
-		- "allwinner,sun9i-a80-ccu"
-		- "allwinner,sun50i-a64-ccu"
-		- "allwinner,sun50i-a64-r-ccu"
-		- "allwinner,sun50i-h5-ccu"
-		- "allwinner,sun50i-h6-ccu"
-		- "allwinner,sun50i-h6-r-ccu"
-		- "allwinner,suniv-f1c100s-ccu"
-		- "nextthing,gr8-ccu"
-
-- reg: Must contain the registers base address and length
-- clocks: phandle to the oscillators feeding the CCU. Two are needed:
-  - "hosc": the high frequency oscillator (usually at 24MHz)
-  - "losc": the low frequency oscillator (usually at 32kHz)
-	    On the A83T, this is the internal 16MHz oscillator divided by 512
-- clock-names: Must contain the clock names described just above
-- #clock-cells : must contain 1
-- #reset-cells : must contain 1
-
-For the main CCU on H6, one more clock is needed:
-- "iosc": the SoC's internal frequency oscillator
-
-For the PRCM CCUs on A83T/H3/A64/H6, two more clocks are needed:
-- "pll-periph": the SoC's peripheral PLL from the main CCU
-- "iosc": the SoC's internal frequency oscillator
-
-Example for generic CCU:
-ccu: clock@1c20000 {
-	compatible = "allwinner,sun8i-h3-ccu";
-	reg = <0x01c20000 0x400>;
-	clocks = <&osc24M>, <&osc32k>;
-	clock-names = "hosc", "losc";
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
-
-Example for PRCM CCU:
-r_ccu: clock@1f01400 {
-	compatible = "allwinner,sun50i-a64-r-ccu";
-	reg = <0x01f01400 0x100>;
-	clocks = <&osc24M>, <&osc32k>, <&iosc>, <&ccu CLK_PLL_PERIPH0>;
-	clock-names = "hosc", "losc", "iosc", "pll-periph";
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
-- 
2.21.0

