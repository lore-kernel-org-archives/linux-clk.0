Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from bes.se.axis.com ([195.60.68.10]:44638 "EHLO bes.se.axis.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751293AbcBKOFD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 11 Feb 2016 09:05:03 -0500
From: Lars Persson <lars.persson@axis.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
Subject: [PATCH v2 3/8] arm: add device-tree SoC bindings for Axis Artpec-6
Date: Thu, 11 Feb 2016 15:04:37 +0100
Message-Id: <0f096d1ad277cf94032ca274ced0cb35cb5d967c.1455198819.git.larper@axis.com>
In-Reply-To: <cover.1455198819.git.larper@axis.com>
References: <cover.1455198819.git.larper@axis.com>
In-Reply-To: <cover.1455198819.git.larper@axis.com>
References: <cover.1455198819.git.larper@axis.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds device tree bindings for the Artpec-6 SoC.

Signed-off-by: Lars Persson <larper@axis.com>
---
 Documentation/devicetree/bindings/arm/axis.txt | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/axis.txt

diff --git a/Documentation/devicetree/bindings/arm/axis.txt b/Documentation/devicetree/bindings/arm/axis.txt
new file mode 100644
index 0000000..203a305
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axis.txt
@@ -0,0 +1,29 @@
+Axis Communications AB
+ARTPEC series SoC Device Tree Bindings
+
+ARTPEC-6 ARM SoC
+================
+
+Required root node properties:
+- compatible = "axis,artpec6";
+
+ARTPEC-6 DMA Configuration
+--------------------------
+
+The DMA configuration unit muxes dma request lines between single and burst
+alternatives.
+
+Required properties:
+- compatible: axis,artpec6-dmacfg
+- reg: Address and length of DMACFG register.
+
+Example:
+	dmacfg {
+		compatible = "axis,artpec6-dmacfg";
+		reg = <0xf8000010 4>;
+	};
+
+ARTPEC-6 Development board:
+---------------------------
+Required root node properties:
+- compatible = "axis,artpec6-dev-board", "axis,artpec6";
-- 
2.1.4

