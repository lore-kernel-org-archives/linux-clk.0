Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3434BC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 01:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbiBSBup (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 20:50:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiBSBuo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 20:50:44 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D337525B6D2;
        Fri, 18 Feb 2022 17:50:23 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B9F6783A2B;
        Sat, 19 Feb 2022 02:50:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645235422;
        bh=QFlK+zLJQrH3WUBZUSNmolLfD6HTSXiI6Zg/p/Y6UnQ=;
        h=From:To:Cc:Subject:Date:From;
        b=DP3F+xNqjqzXaOE32wzvFTPCPKXul8cExDu1e91Ln2gE1XfIA8ricTd7KnR8j4wRS
         S7ueNCi/SCcWe8FIPcmAkmRtCBAgV3x7HHwQaxTzEJauTlViHmLTJ8V1Qzhc/RqNsQ
         atVX6lEzATtIxGq6uRAyjgQA5vwB+6mzPkWV227KJqdCCK/STmBI6P46e91eJh8qaH
         b5mvOGNc+kkqSl4nQ5wkONO8KZvthyMk3cfxbhZhpsUw62pjdOjSUn5ADQRUwIm6Q9
         k1XanT6ch8e4jk4xIGhgeGp26a/H0N20M237wBgQxFRw+gjW3OzeXivTdiQ1O2+U7J
         XAZbZtpZa3v0w==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clk: rs9: Add Renesas 9-series I2C PCIe clock generator
Date:   Sat, 19 Feb 2022 02:50:01 +0100
Message-Id: <20220219015003.507601-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add binding for Renesas 9-series PCIe clock generators. This binding
is designed to support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ series I2C
PCIe clock generators, currently the only tested and supported chip
is 9FGV0241.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-clk@vger.kernel.org
---
V2: - Drop clock consumer from the binding example
    - Make clocks, i.e. xtal, mandatory
---
 .../bindings/clock/renesas,9series.yaml       | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,9series.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
new file mode 100644
index 0000000000000..8eb56f38d99e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,9series.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for Renesas 9-series I2C PCIe clock generators
+
+description: |
+  The Renesas 9-series are I2C PCIe clock generators providing
+  from 1 to 20 output clocks.
+
+  When referencing the provided clock in the DT using phandle
+  and clock specifier, the following mapping applies:
+
+  - 9FGV0241:
+    0 -- DIF0
+    1 -- DIF1
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+properties:
+  compatible:
+    enum:
+      - renesas,9fgv0241
+
+  reg:
+    description: I2C device address
+    enum: [ 0x68, 0x6a ]
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: XTal input clock
+
+  renesas,out-amplitude:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 600000, 700000, 800000, 900000 ]
+    description: Output clock signal amplitude in uV
+
+  renesas,out-spread-spectrum:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 100000, 99750, 99500 ]
+    description: Output clock down spread in pcm
+
+patternProperties:
+  "^DIF[0-19]$":
+    type: object
+    description:
+      Description of one of the outputs (DIF0..DIF19).
+    properties:
+      renesas,slew-rate:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 2000000, 3000000 ]
+        description: Output clock slew rate select in V/ns
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    /* 25MHz reference crystal */
+    ref25: ref25m {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <25000000>;
+    };
+
+    i2c@0 {
+        reg = <0x0 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rs9: clock-generator@6a {
+            compatible = "renesas,9fgv0241";
+            reg = <0x6a>;
+            #clock-cells = <1>;
+
+            clocks = <&ref25m>;
+
+            DIF0 {
+                renesas,slew-rate = <3000000>;
+            };
+        };
+    };
+
+...
-- 
2.34.1

