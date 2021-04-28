Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF84DC433B4
	for <linux-clk@archiver.kernel.org>; Wed, 28 Apr 2021 12:27:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7855B61429
	for <linux-clk@archiver.kernel.org>; Wed, 28 Apr 2021 12:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbhD1M2F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Apr 2021 08:28:05 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:30626 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhD1M2E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Apr 2021 08:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1619612839; x=1651148839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lxh75Vzlvviry1/1fq8jRByw0SZTAJsjSfLu+2GTHG4=;
  b=qx4+2X+g+OFJaAYYtHsgklwyCZnZ/1OPlPC/tE+PAC2u9CVw/eSPeI3G
   oR+24UKl2sDxnmDD5uuGqhDXpMq1RdxyNokCPr++J614ueEWwNJExVANr
   Qm0cE6TDgupzRLiXnBQ/eA4nivjAHQDPAxvzMZEhbMeorPB/kUaycCKt4
   BYG909jSPoB/0kqIoOCLLA2QUCGVgeSZgJFdgkNzBf5BdrbdqJaubks3O
   ahC1kcaLlSogZDs38F75E4SxKL4uq2nVaSWkSHVNJsr6ZYeO7TmlH4nXI
   yWds7SluzcAEiWwWp5OthuRlxZSXZXWLljpZzFJU58cC7vxou4f8yP/f7
   Q==;
IronPort-SDR: yeYKDe4ByarxwXzIiwdXcmiccvzfL5s11mDXm2lupW4b9Bmlm7XuMjwjP6Qn77/ZkQo3HXH5Q4
 LgLIGGV20o4sss8ETS4/OH0OMZHSJYcnTWhLmkztQEVC7LZ6imr7ugiwAb8ULLEUaAAyDoGGRl
 q5sz1teVbgPZiPcRESh9ICiohdoPBY9ItXpTHfNGilZYkcQKrzcS1jkdXS2ajHvUBZy5Gp8rfO
 m4ab1Y4X0FF6/siAqJ9k4xjQHT+sP2AY7aGQn7t2O49NFx+27zW22f8A8Eghrm5SxRcS8D1YtF
 yk8=
X-IronPort-AV: E=Sophos;i="5.82,258,1613458800"; 
   d="scan'208";a="112515406"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Apr 2021 05:27:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 05:27:18 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 28 Apr 2021 05:27:15 -0700
From:   <daire.mcnamara@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: clk: microchip: Add Microchip PolarFire host binding
Date:   Wed, 28 Apr 2021 13:27:10 +0100
Message-ID: <20210428122711.2136467-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428122711.2136467-1-daire.mcnamara@microchip.com>
References: <20210428122711.2136467-1-daire.mcnamara@microchip.com>
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
 .../bindings/clock/microchip,mpfs.yaml        | 73 +++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  | 45 ++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
new file mode 100644
index 000000000000..a4756480a8ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -0,0 +1,73 @@
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
+  This device tree binding describes 32 gate clocks.  Clocks are referenced by
+  user nodes by the CLKCFG node phandle and the clock index in the group, from
+  0 to 31.
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
+    maxItems: 32
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
+            ref: refclk {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <600000000>;
+                clock-output-names = "msspllclk";
+            };
+            clkcfg: clock-controller@20002000 {
+                compatible = "microchip,mpfs-clkcfg";
+                reg = <0x0 0x20002000 0x0 0x1000>;
+                clocks = <&ref>;
+                #clock-cells = <1>;
+                clock-output-names = "cpu", "axi", "ahb", "envm", "mac0", "mac1", "mmc", "timer",
+                                     "mmuart0", "mmuart1", "mmuart2", "mmuart3", "mmuart4",
+                                     "spi0", "spi1", "i2c0", "i2c1", "can0", "can1", "usb", "rtc",
+                                     "qspi", "gpio0", "gpio1", "gpio2", "ddrc",
+                                     "fic0", "fic1", "fic2", "fic3", "athena", "cfm";
+        };
+    };
diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
new file mode 100644
index 000000000000..d217b039a873
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Daire McNamara,<daire.mcnamara@microchip.com>
+ * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
+#define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
+
+#define CLK_CPU	0
+#define CLK_AXI	1
+#define CLK_AHB	2
+
+#define CLK_ENVM	3
+#define CLK_MAC0	4
+#define CLK_MAC1	5
+#define CLK_MMC	6
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
+#define CLK_USB	19
+#define CLK_RESERVED	20
+#define CLK_RTC	21
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
+#define CLK_CFM	32
+
+#endif	/* _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_ */
-- 
2.25.1

