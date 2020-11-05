Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A21C388F7
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:32:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EA2020782
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:32:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgKECcM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 21:32:12 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:26469 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729068AbgKECcM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Nov 2020 21:32:12 -0500
X-IronPort-AV: E=Sophos;i="5.77,451,1596466800"; 
   d="scan'208";a="61708254"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Nov 2020 11:32:10 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7E591400D0D1;
        Thu,  5 Nov 2020 11:32:10 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert bindings to json-schema
Date:   Thu,  5 Nov 2020 11:32:04 +0900
Message-Id: <1604543524-31482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert Renesas R-Car USB 2.0 clock selector bindings documentation
to json-schema.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 - Fix dt-schema error.
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/1604475005-29495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/

 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  68 --------------
 .../clock/renesas,rcar-usb2-clock-sel.yaml         | 100 +++++++++++++++++++++
 2 files changed, 100 insertions(+), 68 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
deleted file mode 100644
index da92f57..0000000
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-* Renesas R-Car USB 2.0 clock selector
-
-This file provides information on what the device node for the R-Car USB 2.0
-clock selector.
-
-If you connect an external clock to the USB_EXTAL pin only, you should set
-the clock rate to "usb_extal" node only.
-If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
-is not needed because this is default setting. (Of course, you can set the
-clock rates to both "usb_extal" and "usb_xtal" nodes.
-
-Case 1: An external clock connects to R-Car SoC
-	+----------+   +--- R-Car ---------------------+
-	|External  |---|USB_EXTAL ---> all usb channels|
-	|clock     |   |USB_XTAL                       |
-	+----------+   +-------------------------------+
-In this case, we need this driver with "usb_extal" clock.
-
-Case 2: An oscillator connects to R-Car SoC
-	+----------+   +--- R-Car ---------------------+
-	|Oscillator|---|USB_EXTAL -+-> all usb channels|
-	|          |---|USB_XTAL --+                   |
-	+----------+   +-------------------------------+
-In this case, we don't need this selector.
-
-Required properties:
-- compatible: "renesas,r8a7795-rcar-usb2-clock-sel" if the device is a part of
-	      an R8A7795 SoC.
-	      "renesas,r8a7796-rcar-usb2-clock-sel" if the device if a part of
-	      an R8A77960 SoC.
-	      "renesas,r8a77961-rcar-usb2-clock-sel" if the device if a part of
-	      an R8A77961 SoC.
-	      "renesas,rcar-gen3-usb2-clock-sel" for a generic R-Car Gen3
-	      compatible device.
-
-	      When compatible with the generic version, nodes must list the
-	      SoC-specific version corresponding to the platform first
-	      followed by the generic version.
-
-- reg: offset and length of the USB 2.0 clock selector register block.
-- clocks: A list of phandles and specifier pairs.
-- clock-names: Name of the clocks.
- - The functional clock of USB 2.0 host side must be "ehci_ohci"
- - The functional clock of HS-USB side must be "hs-usb-if"
- - The USB_EXTAL clock pin must be "usb_extal"
- - The USB_XTAL clock pin must be "usb_xtal"
-- #clock-cells: Must be 0
-- power-domains: A phandle and symbolic PM domain specifier.
-                 See power/renesas,rcar-sysc.yaml.
-- resets: A list of phandles and specifier pairs.
-- reset-names: Name of the resets.
- - The reset of USB 2.0 host side must be "ehci_ohci"
- - The reset of HS-USB side must be "hs-usb-if"
-
-Example (R-Car H3):
-
-	usb2_clksel: clock-controller@e6590630 {
-		compatible = "renesas,r8a7795-rcar-usb2-clock-sel",
-			     "renesas,rcar-gen3-usb2-clock-sel";
-		reg = <0 0xe6590630 0 0x02>;
-		clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
-			 <&usb_extal>, <&usb_xtal>;
-		clock-names = "ehci_ohci", "hs-usb-if", "usb_extal", "usb_xtal";
-		#clock-cells = <0>;
-		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-		resets = <&cpg 703>, <&cpg 704>;
-		reset-names = "ehci_ohci", "hs-usb-if";
-	};
diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
new file mode 100644
index 0000000..5be1229
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/renesas,rcar-usb2-clock-sel.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas R-Car USB 2.0 clock selector
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+description: |
+  If you connect an external clock to the USB_EXTAL pin only, you should set
+  the clock rate to "usb_extal" node only.
+  If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
+  is not needed because this is default setting. (Of course, you can set the
+  clock rates to both "usb_extal" and "usb_xtal" nodes.
+
+  Case 1: An external clock connects to R-Car SoC
+    +----------+   +--- R-Car ---------------------+
+    |External  |---|USB_EXTAL ---> all usb channels|
+    |clock     |   |USB_XTAL                       |
+    +----------+   +-------------------------------+
+
+  In this case, we need this driver with "usb_extal" clock.
+
+  Case 2: An oscillator connects to R-Car SoC
+    +----------+   +--- R-Car ---------------------+
+    |Oscillator|---|USB_EXTAL -+-> all usb channels|
+    |          |---|USB_XTAL --+                   |
+    +----------+   +-------------------------------+
+  In this case, we don't need this selector.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a7795-rcar-usb2-clock-sel  # R-Car H3
+          - renesas,r8a7796-rcar-usb2-clock-sel  # R-Car M3-W
+          - renesas,r8a77961-rcar-usb2-clock-sel # R-Car M3-W+
+      - const: renesas,rcar-gen3-usb2-clock-sel
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: ehci_ohci
+      - const: hs-usb-if
+      - const: usb_extal
+      - const: usb_xtal
+
+  '#clock-cells':
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    minItems: 2
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: ehci_ohci
+      - const: hs-usb-if
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - power-domains
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    usb2_clksel: clock-controller@e6590630 {
+        compatible = "renesas,r8a7795-rcar-usb2-clock-sel",
+                     "renesas,rcar-gen3-usb2-clock-sel";
+        reg = <0xe6590630 0x02>;
+        clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
+                 <&usb_extal>, <&usb_xtal>;
+        clock-names = "ehci_ohci", "hs-usb-if", "usb_extal", "usb_xtal";
+        #clock-cells = <0>;
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 703>, <&cpg 704>;
+        reset-names = "ehci_ohci", "hs-usb-if";
+    };
-- 
2.7.4

