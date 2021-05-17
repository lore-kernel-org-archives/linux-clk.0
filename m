Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147C7C43462
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 12:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBE6E61074
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 12:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235330AbhEQMiN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 May 2021 08:38:13 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:40684 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231732AbhEQMiN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 May 2021 08:38:13 -0400
Received: from hq-00021.Speedport_W_724V_01011603_07_002 (p200300d83f181dcec1913e3a7e010a83.dip0.t-ipconnect.de [IPv6:2003:d8:3f18:1dce:c191:3e3a:7e01:a83])
        by mail.bugwerft.de (Postfix) with ESMTPSA id A9BAB4E2F00;
        Mon, 17 May 2021 12:29:33 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH 1/3] dt-bindings: clock: convert cs2000-cp bindings to yaml
Date:   Mon, 17 May 2021 14:29:24 +0200
Message-Id: <20210517122926.3263455-1-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The original author of the file was added as maintainer.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/clock/cirrus,cs2000-cp.yaml      | 64 +++++++++++++++++++
 .../devicetree/bindings/clock/cs2000-cp.txt   | 22 -------
 2 files changed, 64 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
new file mode 100644
index 000000000000..3af81087e5f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -0,0 +1,64 @@
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
+    minItems: 2
+    maxItems: 2
+
+  '#clock-cells':
+    const: 0
+
+  reg:
+    description:
+      The chip select number on the I2C bus
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
+      cs2000: clk_multiplier@4f {
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

