Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C463DC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 16 Dec 2022 21:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbiLPVWI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 16:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLPVWH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 16:22:07 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54CE61D50;
        Fri, 16 Dec 2022 13:22:06 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3E7D98526E;
        Fri, 16 Dec 2022 22:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1671225725;
        bh=hIqrafag9JLlA12UXTKg+IZjKM2tAfnf2LQ8+PhvRnU=;
        h=From:To:Cc:Subject:Date:From;
        b=XcrOximCo7rIyiuepBW5h3M96h1jdo/kA/n/AJwX6BtqlcADuOyDAJmLIkp6YJF74
         kT0aPZ0/NaY1fXqvD+HS27n9iQmQ3KsNBuHF3JsHrtCdPy8MwB2kqt6ugdDQnI/EWP
         xaep1HCL7JkBa1qIe4fnhVzh7e4PHT7IcpO3BN+JLnXIiYuu3dasoOwXupVNmK5bD/
         9DJrS2f/Gc9b/6QXzr9uN57YW4NWmQ5cis6j024PCOsfWG/u9UHoFHrIs2w6vC06Uj
         85Psg3fecF2nZ66Xcvch3yohW7c1ZZ5eD3kdzTUqh7ZuJO7t1IQBr4MegIBRVbkAvs
         TNah2GUxccV8A==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: si521xx: Add Skyworks Si521xx I2C PCIe clock generators
Date:   Fri, 16 Dec 2022 22:21:57 +0100
Message-Id: <20221216212158.600220-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add binding for Skyworks Si521xx PCIe clock generators. This binding
is designed to support Si52144/Si52146/Si52147 series I2C PCIe clock
generators, tested model is Si52144. It should be possible to add
Si5213x series as well.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/clock/skyworks,si521xx.yaml      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml

diff --git a/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml b/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
new file mode 100644
index 0000000000000..c30114e3a7631
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/skyworks,si521xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for Skyworks Si521xx I2C PCIe clock generators
+
+description: |
+  The Skyworks Si521xx are I2C PCIe clock generators providing
+  from 4 to 9 output clocks.
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+properties:
+  compatible:
+    enum:
+      - skyworks,si52144
+      - skyworks,si52146
+      - skyworks,si52147
+
+  reg:
+    description: I2C device address
+    const: 0x6b
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: XTal input clock
+
+  skyworks,out-amplitude-microvolt:
+    enum: [ 300000, 400000, 500000, 600000, 700000, 800000, 900000, 1000000 ]
+    description: Output clock signal amplitude
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
+        clock-generator@6b {
+            compatible = "skyworks,si52144";
+            reg = <0x6b>;
+            #clock-cells = <1>;
+
+            clocks = <&ref25m>;
+        };
+    };
+
+...
-- 
2.35.1

