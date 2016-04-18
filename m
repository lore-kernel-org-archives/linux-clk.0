Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38483 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752116AbcDRKBr (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 18 Apr 2016 06:01:47 -0400
Received: by mail-wm0-f51.google.com with SMTP id u206so115806435wme.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2016 03:01:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/2] dt-bindings: Add Oxford Semiconductor OXNAS Standard Clocks bindings
Date: Mon, 18 Apr 2016 12:01:36 +0200
Message-Id: <1460973696-5977-3-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1460973696-5977-1-git-send-email-narmstrong@baylibre.com>
References: <1460973696-5977-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/clock/oxnas,stdclk.txt     | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/oxnas,stdclk.txt

diff --git a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt b/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
new file mode 100644
index 0000000..208cca6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
@@ -0,0 +1,35 @@
+Oxford Semiconductor OXNAS SoC Family Standard Clocks
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

