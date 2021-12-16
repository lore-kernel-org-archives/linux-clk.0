Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AE2C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 13:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhLPN6n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 08:58:43 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:19505 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbhLPN6n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 08:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639663123; x=1671199123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XhDcF1Id8h6F1BOEC1xvEl/4LLBgq03yPjoVYIJTT2A=;
  b=D6YI5GgEP4q+XskBY/AL4CZ630wJR6vU9ng7M6YwlszoKm2H5mBctBmQ
   +iODOTwyr3x+fYgyca7RXr34ll9eX+1U/i1274nDUKr5OYpfLaYv0T3Ae
   eY3iEjTWtkl4Pi+B5otoIT6MxezeZuUEZc8YUdMtB1zRUgdLGJGF1uPm1
   eZNoxsdOjUqloSoM4XxfBpb9hafIQBtdMs2d+FOLYHCooQo+dVrC1f4xc
   Nuf32qlH1v/FuelHNq1Fo73i/KbIiZotPUAraPG/98KR7weqhExfInOrR
   F9HXHlL65p4sUNuJY5I398l0poRiiqmBlyVlWDaqKQlEnNCE7hkyujgkb
   g==;
IronPort-SDR: PekSwL5cW0nGx1US9ldp0fPHpv8vS5w1RMK2Mdco+RusYZYUyKvelwnpT9j4U3j0RT+TLfrWqx
 QmfJDTUP25Ju6xpYj3wtFtwE9dHhTWBbVMWKDDuETV/jz1epyQFX/6Y0r8hs6KXbdLd96KUN65
 06+XFmKGfr+DSN2REik2XCxDcbW3r+dzYPUwAvnc+rRanNLbgzHgbGiVgLEwEt7R0D4XhPPcRo
 Hku+ngisSwfBi+icIDhtmXXSmbTkQadw7G4XQTaeWCI8ao1TB2DHs9UOCv3Ni0kfXdVQYuccZM
 GAS7CO4J2t09+LERhX6gxSkW
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="146891421"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Dec 2021 06:58:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Dec 2021 06:58:42 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 16 Dec 2021 06:58:39 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/2] dt-bindings: clk: microchip: Add Microchip PolarFire host binding
Date:   Thu, 16 Dec 2021 14:00:21 +0000
Message-ID: <20211216140022.16146-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216140022.16146-1-conor.dooley@microchip.com>
References: <20211216140022.16146-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

Add device tree bindings for the Microchip PolarFire system
clock controller

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Rob Herring <robh@kernel.org>

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs.yaml        | 58 +++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  | 45 ++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
new file mode 100644
index 000000000000..0c15afa2214c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/microchip,mpfs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire Clock Control Module Binding
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+
+description: |
+  Microchip PolarFire clock control (CLKCFG) is an integrated clock controller,
+  which gates and enables all peripheral clocks.
+
+  This device tree binding describes 33 gate clocks.  Clocks are referenced by
+  user nodes by the CLKCFG node phandle and the clock index in the group, from
+  0 to 32.
+
+properties:
+  compatible:
+    const: microchip,mpfs-clkcfg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description: |
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell. See include/dt-bindings/clock/microchip,mpfs-clock.h
+      for the full list of PolarFire clock IDs.
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
+  # Clock Config node:
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            clkcfg: clock-controller@20002000 {
+                compatible = "microchip,mpfs-clkcfg";
+                reg = <0x0 0x20002000 0x0 0x1000>;
+                clocks = <&ref>;
+                #clock-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
new file mode 100644
index 000000000000..73f2a9324857
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Daire McNamara,<daire.mcnamara@microchip.com>
+ * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
+#define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
+
+#define CLK_CPU		0
+#define CLK_AXI		1
+#define CLK_AHB		2
+
+#define CLK_ENVM	3
+#define CLK_MAC0	4
+#define CLK_MAC1	5
+#define CLK_MMC		6
+#define CLK_TIMER	7
+#define CLK_MMUART0	8
+#define CLK_MMUART1	9
+#define CLK_MMUART2	10
+#define CLK_MMUART3	11
+#define CLK_MMUART4	12
+#define CLK_SPI0	13
+#define CLK_SPI1	14
+#define CLK_I2C0	15
+#define CLK_I2C1	16
+#define CLK_CAN0	17
+#define CLK_CAN1	18
+#define CLK_USB		19
+#define CLK_RESERVED	20
+#define CLK_RTC		21
+#define CLK_QSPI	22
+#define CLK_GPIO0	23
+#define CLK_GPIO1	24
+#define CLK_GPIO2	25
+#define CLK_DDRC	26
+#define CLK_FIC0	27
+#define CLK_FIC1	28
+#define CLK_FIC2	29
+#define CLK_FIC3	30
+#define CLK_ATHENA	31
+#define CLK_CFM		32
+
+#endif	/* _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_ */
-- 
2.33.1

