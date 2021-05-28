Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE24C2B9F7
	for <linux-clk@archiver.kernel.org>; Fri, 28 May 2021 13:43:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 698AE613B6
	for <linux-clk@archiver.kernel.org>; Fri, 28 May 2021 13:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbhE1No4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 May 2021 09:44:56 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:58746 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhE1No4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 May 2021 09:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1622209401; x=1653745401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yoXlOvMkTqO1ej/J2NnA8vgLJivzExQBcB80StTEEuo=;
  b=Q+Bna/XfYiXtPxawPzziG5CK8qUP6l/enXV+sGD5HhtX1oIf4/aWC7oz
   BQEAQtXtrcgemfFssuGhlpS6WCDf9a3uEj4pdo3Q2eD3x/kfkJoPtf8w7
   bV8R6hEdlZWJyVjiERoj64bE+/ZfU2O60OcLiMhXxncCtYpN91hfLA8Bw
   vblUz08jGCbp+b3ivtkUjRiXKV0e9LmeYDgdHvVBc+IyCSUVQwprr7ErR
   eRb4r3LtKANcI9i+nUL40UYigMmA7+SSkgwZ1IuFZpN57K/Ob6HnM85gX
   R1dL6+pJ92z0zjY2HJ6eEeYE9U3M/YoLzCNI65csnyV2DpgB/ggOs9hd7
   g==;
IronPort-SDR: d8rbrGOryF2h7MgbfjP2pK9hVUdGQ7CCxVe1ZJHbY5irwFlV34E8uFQY3vXHGg/XVGFuXkGis5
 0Mlh7SjJOuU6RqOKLsSbW9L0rM6c6n+2dZLaYojGmESSC4q0aehMN0E6Lf4yRHlKmPgNAHx4sQ
 uMX63b3wGQ5cp5Cu5F2wWEiJVxgMC5+OEC7f5s6bfT5aZzFVhiruz7H96rMq6dvOu7jfMD7Jzl
 9km2OqDiduQaJ3qpohJzCnhMs3zd0/v7RhmW1uBpTLtO6VlXHtLBNO++1IfT0JAaWanXGWw6xg
 vEU=
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="116945659"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 May 2021 06:43:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 28 May 2021 06:43:20 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 28 May 2021 06:43:17 -0700
From:   <daire.mcnamara@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: clk: microchip: Add Microchip PolarFire host binding
Date:   Fri, 28 May 2021 14:43:07 +0100
Message-ID: <20210528134308.649769-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528134308.649769-1-daire.mcnamara@microchip.com>
References: <20210528134308.649769-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

Add device tree bindings for the Microchip PolarFire system
clock controller

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/clock/microchip,mpfs.yaml        | 67 +++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  | 45 +++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
new file mode 100644
index 000000000000..1a38c9c66281
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -0,0 +1,67 @@
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
+  clock-output-names:
+    maxItems: 33
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - clock-output-names
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
+                clock-output-names = "cpu", "axi", "ahb", "envm", "mac0", "mac1", "mmc", "timer",
+                                     "mmuart0", "mmuart1", "mmuart2", "mmuart3", "mmuart4",
+                                     "spi0", "spi1", "i2c0", "i2c1", "can0", "can1", "usb", "rsvd",
+                                     "rtc", "qspi", "gpio0", "gpio1", "gpio2", "ddrc",
+                                     "fic0", "fic1", "fic2", "fic3", "athena", "cfm";
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
2.25.1

