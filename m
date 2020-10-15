Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50D1C433DF
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 11:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42D0F2145D
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 11:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CQhS2sDj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgJOLtg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Oct 2020 07:49:36 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:18623 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbgJOLrf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2020 07:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602762454; x=1634298454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=XdDYKiVtS2/MF8bTkT6DeNUOJrLL++tKx8/25JbaFmo=;
  b=CQhS2sDjHo1s0XStkCI9jT4n1l/icMbajNvAEcwb1G7T9jQWMVcmPDaK
   /g0S76gxWUCYoAYx4GKt4pw0vKYc/fYz6IN679YIib6c8Xg1vSMLqSOJK
   y/YC5sUFA2U30rx/AG1V5l14HvER+T7D3WpHqZfsTRZTrBeSp4dt1IVuG
   45+HtBaz4jHUuh1uF6dXErYXtt6j2LOe2HlJdO8gJYRYgg74FJF4quqAD
   J2JHQwp3g/VaBpdD3ck4mNAf+5ldSyGp7GWK0uUQiaqNKsyHV8JJiPXtk
   cuiJTVR0vRw+IgihpU76zZ82ky05wPcKBBAXFemi4kC3KrMeXdSOJnDnM
   Q==;
IronPort-SDR: jZYXsXoY7Co+bwHIyfsNwInTW02CO/AAmshaZuU6X/VKH+IDuRpd4WWsTCXtDXACGcEMvU/h4k
 pWBxCGRZwcSSlH3+b5GNHnbJSLpzxC/B451E1pXxyt6GX30MfdXrZNqK+xLRjhxvBrzlEIFB1t
 QpUGPsX9V56vufDUgcCG/a/ItR0oZR9VOAtyRLPNS48WNCyLhG4InahSMDPvbrGQfEShTm/eQ4
 iCqrWtlmDva5ZrINXs/SjrKAOGDQvdwRkJvR+8jb6ESpt26H5hKduC0s7aSzhoxiiz/wDpQgA+
 jyg=
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; 
   d="scan'208";a="99626784"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2020 04:47:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 15 Oct 2020 04:47:34 -0700
Received: from ryzen.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 15 Oct 2020 04:47:32 -0700
From:   <daire.mcnamara@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <padmarao.begari@microchip.com>,
        <david.abdurachmanov@gmail.com>
CC:     Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 1/2]     dt-bindings: CLK: microchip: Add Microchip PolarFire host binding
Date:   Thu, 15 Oct 2020 12:47:24 +0100
Message-ID: <20201015114725.23137-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015114725.23137-1-daire.mcnamara@microchip.com>
References: <20201015114725.23137-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

    Add device tree bindings for the Microchip PolarFire system
    clock controller

    Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/clock/microchip,pfsoc.yaml       | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml

diff --git a/Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml b/Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml
new file mode 100644
index 000000000000..c833e7b6a7cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/microchip,pfsoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire Clock Control Module Binding
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+
+description: |
+  Microchip PolarFire clock control is an integrated clock controller, which
+  generates clocks and supplies to all peripherals.
+
+properties:
+  compatible:
+    const: microchip,pfsoc-clkcfg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: reference clock input
+
+  clock-names:
+    items:
+      - const: ref_clk
+
+  '#clock-cells':
+    const: 1
+    description: |
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell. See include/dt-bindings/clock/microchip,pfsoc-clock.h
+      for the full list of PolarFire clock IDs.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+examples:
+  # Clock Config node:
+  - |
+    soc {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            clkcfg: clock-controller@20002000 {
+                compatible = "microchip,pfsoc-clkcfg";
+                reg = <0x0 0x20002000 0x0 0x1000>;
+                reg-names = "mss_sysreg";
+                clocks = <&ref_clk 0>;
+                clock-names = "ref_clk";
+                #clock-cells = <1>;
+                clock-output-names = "cpu", "axi", "ahb", "envm", "mac0", "mac1", "mmc", "timer", "mmuart0", "mmuart1", "mmuart2", "mmuart3", "mmuart4", "spi0", "spi1", "i2c0", "i2c1", "can0", "can1", "usb", "rtc", "qspi", "gpio0", "gpio1", "gpio2", "ddrc", "fic0", "fic1", "fic2", "fic3", "athena", "cfm";
+        };
+    };
+
+  # Required external clocks for Clock Control Module node:
+  - |
+    refclk: refclk {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <600000000>;
+        clock-output-names = "msspllclk";
+    };
+...
-- 
2.25.1

