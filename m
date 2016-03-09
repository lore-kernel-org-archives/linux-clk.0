Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:35779 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751891AbcCIKZB (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 9 Mar 2016 05:25:01 -0500
Received: by mail-wm0-f51.google.com with SMTP id l68so170979093wml.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Mar 2016 02:25:01 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 10/18] dt-bindings: Add PLX Technology OXNAS Standard Clocks bindings
Date: Wed,  9 Mar 2016 11:24:12 +0100
Message-Id: <1457519060-6038-11-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1457519060-6038-1-git-send-email-narmstrong@baylibre.com>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
 <1457519060-6038-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/clock/plxtech,stdclk.txt   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/plxtech,stdclk.txt

diff --git a/Documentation/devicetree/bindings/clock/plxtech,stdclk.txt b/Documentation/devicetree/bindings/clock/plxtech,stdclk.txt
new file mode 100644
index 0000000..c60b459
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/plxtech,stdclk.txt
@@ -0,0 +1,35 @@
+PLX Technology OXNAS SoC Family Standard Clocks
+================================================
+
+Please also refer to clock-bindings.txt in this directory for common clock
+bindings usage.
+
+Required properties:
+- compatible: Should be "oxsemi,ox810se-stdclk"
+- #clock-cells: 1, see below
+
+Parent node should have the following properties :
+- compatible: Should be "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd"
+
+For OX810SE, the clock indices are :
+ - 0: LEON
+ - 1: DMA_SGDMA
+ - 2: CIPHER
+ - 3: SATA
+ - 4: AUDIO
+ - 5: USBMPH
+ - 6: ETHA
+ - 7: PCIA
+ - 8: NAND
+
+example:
+
+sys: sys-ctrl@000000 {
+	compatible = "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd";
+	reg = <0x000000 0x100000>;
+
+	stdclk: stdclk {
+		compatible = "oxsemi,ox810se-stdclk";
+		#clock-cells = <1>;
+	};
+};
-- 
1.9.1

