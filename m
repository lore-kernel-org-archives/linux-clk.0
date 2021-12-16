Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679A5C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 09:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhLPJlr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 04:41:47 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:50659 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235482AbhLPJlr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 04:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639647706; x=1671183706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E7niwiXMS3AgNmq+h4+pKEL0NCKH0itt697yHztFcXI=;
  b=T1hNbxUmOMPmYOq1eAr5dUZs4fdyTK6oJQDJnBPYDiD81pZtP9+Bq6/q
   5mEJ+wWjxaeDxqftFnV3GzqZ9kh3ThxGJMFn9Ej/WkUrLvAtJFqsTpFGY
   NgfJeUs2pFWCHrufCb7NduJPyRydJq1SGyI9gFHsUqmldWLbr2n6s910O
   fkWjbg9v2iTHSCIoNT8dNHMV8a3AkTb+1NVCgOKzhqVvUciLov4ZvvGPM
   CT4TaKPK978MR6u5yZha8YhU3YoaidIPeaaM5sdoY5gXoSOUr3e+wKabj
   LBaH0JZlGDPKPMEfsY4C632t2O4g55e2ieuxOP3m98jEdB4s8O07JnTjF
   Q==;
IronPort-SDR: /GkHhSVtYrVUmVVK9gJ5meuIwCpZc1pLwTYUTiAC6BDiFs+UdKk3GDhOq2VWg6MAZD8C3YelP4
 TO+bq4q0rHXztB8/Hzvz9wj44mtxVgp7NujxO14lOnjQUfr2HjhJqPApfvG5wM94HiuG6pJIT0
 6mwM3LDPIR9nhEYDCOztvJsf9YGNhZkeccfwHqeo6YAs0LhWTZ/bO3aCe73Sip3YnPzpadCayC
 gpJWcNHxmTdlnNk38hUIvFOmAOQ775Kio2d82gHZoTZoMHU2iRpXKI38+zGZtwHQO5WLPIibI2
 Vw0Yi5Z+Dq1rRvDr5AY2TeTJ
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="139968045"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Dec 2021 02:41:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Dec 2021 02:41:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 16 Dec 2021 02:41:43 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/2] dt-bindings: clk: microchip: Add Microchip PolarFire host binding
Date:   Thu, 16 Dec 2021 09:43:03 +0000
Message-ID: <20211216094304.24461-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216094304.24461-1-conor.dooley@microchip.com>
References: <20211216094304.24461-1-conor.dooley@microchip.com>
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

