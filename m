Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF31DC433EF
	for <linux-clk@archiver.kernel.org>; Sun, 13 Feb 2022 17:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbiBMRdn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Feb 2022 12:33:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiBMRdn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Feb 2022 12:33:43 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD81359A43;
        Sun, 13 Feb 2022 09:33:36 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6216983BA7;
        Sun, 13 Feb 2022 18:33:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1644773614;
        bh=75DhUpB7jgOf9IW59uamRDTBiLhx1wBa7r1TX/Jvf8w=;
        h=From:To:Cc:Subject:Date:From;
        b=hNQKxsJki7wVVxK4udMLYH7aUYgH/8Sgt9NkP07+rYkKlDwCRJ5/DpZSGOvTyixqV
         IspzbdhR4Y2trs43G4qtTa+ea/njbH8M9QS4QIqiy5Vu/jfIP04R+Ip4s8mviBAl2H
         tOyFtrX8rkZryeraH0wKb85U3kWvQs5No2xRJwmnax9mKYawJWWtGH8j7YFEn7WU0b
         9qgBoyUz4iML4nylKhraeHGTfJXwwP/n8J4qla+eMK1rjG8UoQ3+Ds79h1IchNmek+
         JRKhrdBqUO6xUpDOuI/EU0xx+O4WztUnRLT8pvoVvxFCvXu1oeG2JWVw7bllr0dPCt
         AA1WPvEyJbYgw==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/2] dt-bindings: clk: rs9: Add Renesas 9-series I2C PCIe clock generator
Date:   Sun, 13 Feb 2022 18:33:09 +0100
Message-Id: <20220213173310.152230-1-marex@denx.de>
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
 .../bindings/clock/renesas,9series.yaml       | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,9series.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
new file mode 100644
index 0000000000000..774053748d9f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -0,0 +1,102 @@
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
+    /* Consumer referencing the 9FGV0241 pin DIF0 */
+    consumer {
+        /* ... */
+        clocks = <&rs9 0>;
+        /* ... */
+    };
+
+...
-- 
2.34.1

