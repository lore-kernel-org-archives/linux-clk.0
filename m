Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0D8C3A589
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 07:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiJRHVR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 03:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiJRHVP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 03:21:15 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FE5A0258;
        Tue, 18 Oct 2022 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666077673; x=1697613673;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G/vj/lqmp9J6IKlQvrSZrkWaQzN/UAUrJThxXOZ9VOw=;
  b=iDvcJFjGIGc7FPEIziKmAqujRGkg/IFiYSjM4PXaX+k4bnJ8FoHeWKpM
   5fPjAknPCDofwS+X1gq0UcGUcaLNOrpxvSaCDdQOElFgZNLFX96DKSqYa
   aR3KDeA2bKV+uMz2ofWuRz/xR+LguOenKcZW1fXiyhT7x1l/tqzE+ijgi
   JXZhZjRmBU08UxAvsL+Ge2qyEBEQ3Q0dX6w/8xV2k6eHvlqvOyU7lSDfj
   BOTn7iaYUJwEWoNc33iLtm3lJUtFK8Yh7tD05XNUlPsZ1hWrrLNKVLJvy
   DBBBLR3M+QlBykCsZnGseegsZrlEWkdJxzhYlOKIO3Ix2Q9bMFEXEx1Xf
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="26807801"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Oct 2022 09:21:10 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Oct 2022 09:21:10 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Oct 2022 09:21:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666077670; x=1697613670;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G/vj/lqmp9J6IKlQvrSZrkWaQzN/UAUrJThxXOZ9VOw=;
  b=ITT2y0CSNFa43VdkQTEkkMxkpv8xCZm8vzhue/yR1S6TxaEzcwJaBcj/
   MyGbPSMqbswCOpNLhLTLhwSHi/Q6mVRhohh/ZHzzpLT8E6sH8yVQsXTNM
   8U0OfDPRWjWxZMXe30nYcq3tjrrni9zkGLjpngh2hXtpUuZSDtSecmCkL
   tpK19jjnIxq+nelCEkW7Jv1QXWKheENUVg0Pm5yNPVBM46QXgrVw97Ey8
   0nlhMAWW25I5N58hrQaENAbHGuJXykZ+Nz/6zcB5SUrmx/VuqIhL4G9Ku
   QBS5zqWfRsOSOerYkD1q8DdY3nfi6O5U9f1rKfIx1D7nMBOJn84HCxvmy
   w==;
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="26807800"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Oct 2022 09:21:10 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2C218280056;
        Tue, 18 Oct 2022 09:21:10 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: clock: ti,cdce925: Convert to DT schema
Date:   Tue, 18 Oct 2022 09:21:06 +0200
Message-Id: <20221018072106.2391771-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the TI CDCE925 clock binding to DT schema format.
Including a small fix: Add the missing 'ti' prefix in the example
compatible.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
I have to admit I only have one specific addon platform for this
hardware, which is actually a CECD813 tbh.

 .../devicetree/bindings/clock/ti,cdce925.txt  |  53 ---------
 .../devicetree/bindings/clock/ti,cdce925.yaml | 104 ++++++++++++++++++
 2 files changed, 104 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti,cdce925.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti,cdce925.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce925.txt b/Documentation/devicetree/bindings/clock/ti,cdce925.txt
deleted file mode 100644
index df42ab72718f..000000000000
--- a/Documentation/devicetree/bindings/clock/ti,cdce925.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Binding for TI CDCE913/925/937/949 programmable I2C clock synthesizers.
-
-Reference
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] https://www.ti.com/product/cdce913
-[3] https://www.ti.com/product/cdce925
-[4] https://www.ti.com/product/cdce937
-[5] https://www.ti.com/product/cdce949
-
-The driver provides clock sources for each output Y1 through Y5.
-
-Required properties:
- - compatible: Shall be one of the following:
-	- "ti,cdce913": 1-PLL, 3 Outputs
-	- "ti,cdce925": 2-PLL, 5 Outputs
-	- "ti,cdce937": 3-PLL, 7 Outputs
-	- "ti,cdce949": 4-PLL, 9 Outputs
- - reg: I2C device address.
- - clocks: Points to a fixed parent clock that provides the input frequency.
- - #clock-cells: From common clock bindings: Shall be 1.
-
-Optional properties:
- - xtal-load-pf: Crystal load-capacitor value to fine-tune performance on a
-                 board, or to compensate for external influences.
-- vdd-supply: A regulator node for Vdd
-- vddout-supply: A regulator node for Vddout
-
-For all PLL1, PLL2, ... an optional child node can be used to specify spread
-spectrum clocking parameters for a board.
-  - spread-spectrum: SSC mode as defined in the data sheet.
-  - spread-spectrum-center: Use "centered" mode instead of "max" mode. When
-    present, the clock runs at the requested frequency on average. Otherwise
-    the requested frequency is the maximum value of the SCC range.
-
-
-Example:
-
-	clockgen: cdce925pw@64 {
-		compatible = "cdce925";
-		reg = <0x64>;
-		clocks = <&xtal_27Mhz>;
-		#clock-cells = <1>;
-		xtal-load-pf = <5>;
-		vdd-supply = <&1v8-reg>;
-		vddout-supply = <&3v3-reg>;
-		/* PLL options to get SSC 1% centered */
-		PLL2 {
-			spread-spectrum = <4>;
-			spread-spectrum-center;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti,cdce925.yaml b/Documentation/devicetree/bindings/clock/ti,cdce925.yaml
new file mode 100644
index 000000000000..1e68ee68e458
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce925.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,cdce925.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CDCE913/925/937/949 programmable I2C clock synthesizers node bindings
+
+maintainers:
+  - Mike Looijmans <mike.looijmans@topic.nl>
+
+description: |
+  Flexible Low Power LVCMOS Clock Generator with SSC Support for EMI Reduction
+
+  - CDCE(L)913: 1-PLL, 3 Outputs https://www.ti.com/product/cdce913
+  - CDCE(L)925: 2-PLL, 5 Outputs https://www.ti.com/product/cdce925
+  - CDCE(L)937: 3-PLL, 7 Outputs https://www.ti.com/product/cdce937
+  - CDCE(L)949: 4-PLL, 9 Outputs https://www.ti.com/product/cdce949
+
+properties:
+  $nodename:
+    pattern: "^clock-controller$"
+
+  compatible:
+    enum:
+      - ti,cdce913
+      - ti,cdce925
+      - ti,cdce937
+      - ti,cdce949
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: fixed parent clock
+
+  "#clock-cells":
+    const: 1
+
+  vdd-supply:
+    description: Regulator that provides 1.8V Vdd power supply
+
+  vddout-supply:
+    description: |
+      Regulator that provides Vddout power supply.
+      non-L variant: 2.5V or 3.3V for
+      L variant: 1.8V for
+
+  xtal-load-pf:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Crystal load-capacitor value to fine-tune performance on a
+      board, or to compensate for external influences.
+
+patternProperties:
+  "^PLL[1-4]$":
+    type: object
+    description: |
+      optional child node can be used to specify spread
+      spectrum clocking parameters for a board
+
+    properties:
+      spread-spectrum:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: SSC mode as defined in the data sheet
+
+      spread-spectrum-center:
+        type: boolean
+        description: |
+          Use "centered" mode instead of "max" mode. When
+          present, the clock runs at the requested frequency on average.
+          Otherwise the requested frequency is the maximum value of the
+          SCC range.
+
+required:
+  - compatible
+  - ret
+  - clocks
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cdce925: clock-controller@64 {
+            compatible = "ti,cdce925";
+            reg = <0x64>;
+            clocks = <&xtal_27Mhz>;
+            #clock-cells = <1>;
+            xtal-load-pf = <5>;
+            vdd-supply = <&reg_1v8>;
+            vddout-supply = <&reg_3v3>;
+            /* PLL options to get SSC 1% centered */
+            PLL2 {
+                spread-spectrum = <4>;
+                spread-spectrum-center;
+            };
+        };
+    };
-- 
2.25.1

