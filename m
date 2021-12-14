Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F553C41535
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 12:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhLNMTB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhLNMS7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 07:18:59 -0500
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 39317C06173F;
        Tue, 14 Dec 2021 04:18:58 -0800 (PST)
Received: from hq-00021.fritz.box (p57bc964a.dip0.t-ipconnect.de [87.188.150.74])
        by mail.bugwerft.de (Postfix) with ESMTPSA id E6D464EC9E9;
        Tue, 14 Dec 2021 12:09:35 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v4 1/9] dt-bindings: clock: convert cs2000-cp bindings to yaml
Date:   Tue, 14 Dec 2021 13:09:21 +0100
Message-Id: <20211214120929.2829705-2-daniel@zonque.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214120929.2829705-1-daniel@zonque.org>
References: <20211214120929.2829705-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The original author of the file was added as maintainer.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/cirrus,cs2000-cp.yaml      | 63 +++++++++++++++++++
 .../devicetree/bindings/clock/cs2000-cp.txt   | 22 -------
 2 files changed, 63 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
new file mode 100644
index 000000000000..379a8bab49ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multiplier
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+description: |
+  The CS2000-CP is an extremely versatile system clocking device that
+  utilizes a programmable phase lock loop.
+
+  Link: https://www.cirrus.com/products/cs2000/
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs2000-cp
+
+  clocks:
+    description:
+      Common clock binding for CLK_IN, XTI/REF_CLK
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: clk_in
+      - const: ref_clk
+
+  '#clock-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c@0 {
+      reg = <0x0 0x100>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock-controller@4f {
+        #clock-cells = <0>;
+        compatible = "cirrus,cs2000-cp";
+        reg = <0x4f>;
+        clocks = <&rcar_sound 0>, <&x12_clk>;
+        clock-names = "clk_in", "ref_clk";
+      };
+    };
diff --git a/Documentation/devicetree/bindings/clock/cs2000-cp.txt b/Documentation/devicetree/bindings/clock/cs2000-cp.txt
deleted file mode 100644
index 54e6df0bee8a..000000000000
--- a/Documentation/devicetree/bindings/clock/cs2000-cp.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multiplier
-
-Required properties:
-
-- compatible:		"cirrus,cs2000-cp"
-- reg:			The chip select number on the I2C bus
-- clocks:		common clock binding for CLK_IN, XTI/REF_CLK
-- clock-names:		CLK_IN : clk_in, XTI/REF_CLK : ref_clk
-- #clock-cells:		must be <0>
-
-Example:
-
-&i2c2 {
-	...
-	cs2000: clk_multiplier@4f {
-		#clock-cells = <0>;
-		compatible = "cirrus,cs2000-cp";
-		reg = <0x4f>;
-		clocks = <&rcar_sound 0>, <&x12_clk>;
-		clock-names = "clk_in", "ref_clk";
-	};
-};
-- 
2.31.1

