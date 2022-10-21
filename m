Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147F6C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 21 Oct 2022 06:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbiJUGsg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Oct 2022 02:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbiJUGsR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Oct 2022 02:48:17 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674F2245EA8;
        Thu, 20 Oct 2022 23:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666334890; x=1697870890;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7NHLIHYEH91h9b/qKvocjJYdpKbOw1GLI0C4WgI2NME=;
  b=kujZHNVPDKCYepQoEuMbQnZ1SGget8ixboPrzHgkSBYrD7neUVdnb5fX
   Fzu0ZaDcawgVpV/z23aOuW8D3+xhlTjqH5ddvzVkZlkF+Vqi+XnoAhPKa
   siUl6fZilILH7fsf5l4fPC0FWmqsm5A1b6378riKPFTdzMHB+oEqtcC4R
   E94dOCVc5VHd+2Lr0hjH03BYmYuS8h1xHufi+FjXbXg0QpLijeunvP6ys
   j6pSMw+dFzBYaJlYFQ0iWn2bveTasAvC0QSHl76Z9lne3p/pNj96Xrf0F
   nabnHHPl+zVihOu/tffgN+BZ5OOqfrmm1YVtFLZVGAPuj4azUo+f/m8pR
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,200,1661810400"; 
   d="scan'208";a="26887648"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Oct 2022 08:48:07 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 21 Oct 2022 08:48:07 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 21 Oct 2022 08:48:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666334887; x=1697870887;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7NHLIHYEH91h9b/qKvocjJYdpKbOw1GLI0C4WgI2NME=;
  b=C4RivNkS94Mq9s9vZdxsFUkgUMWsb6tJIu6F+oaCvHP4P14LAh3qU4tw
   4X1OcvOBszEO5OnvS6t38FpbctZUwwEi7Tl6FowT4G9EUOjrUSQgmdNZb
   dTlcCJip+6n5K/fj4unxKQo+dIgox1n8GhrccEbLoUOMQp7ojHCllb2im
   616s3NVAiYv1tCYy+60x1s+VYK6Q0n1tUWtgOXQpFXenzHLDEyUW1qGfV
   b5lRvLyuuPHp/m23gJLdvKWmWipCGyJpM5kT4wfzHoqbnIXM7nAY3BUSC
   5FHn6iem/XKvHXW3vCxDKybj68SSxVuRUR4gspBAI4wP8G7ogvfiDbJXR
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,200,1661810400"; 
   d="scan'208";a="26887647"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Oct 2022 08:48:07 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2798A280056;
        Fri, 21 Oct 2022 08:48:07 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: clock: ti,cdce925: Convert to DT schema
Date:   Fri, 21 Oct 2022 08:47:57 +0200
Message-Id: <20221021064757.379558-1-alexander.stein@ew.tq-group.com>
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

Changes in v2:
* Fix bindings title
* Removed nodename pattern
* Add 'additionalProperties: false' for PLL subnodes
* Fix typo in required list
* I added myself as maintainer

 .../devicetree/bindings/clock/ti,cdce925.txt  |  53 ---------
 .../devicetree/bindings/clock/ti,cdce925.yaml | 103 ++++++++++++++++++
 2 files changed, 103 insertions(+), 53 deletions(-)
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
index 000000000000..a4ec8dd5ddf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce925.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,cdce925.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CDCE913/925/937/949 programmable I2C clock synthesizers
+
+maintainers:
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
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
+    additionalProperties: false
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
+  - reg
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

