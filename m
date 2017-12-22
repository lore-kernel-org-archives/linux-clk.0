Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:52399 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750995AbdLVMY2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Dec 2017 07:24:28 -0500
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 01/11] dt-bindings: fix the binding of Allwinner DE2 CCU of A83T and H3
Date: Fri, 22 Dec 2017 20:22:33 +0800
Message-Id: <20171222122243.25735-2-icenowy@aosc.io>
In-Reply-To: <20171222122243.25735-1-icenowy@aosc.io>
References: <20171222122243.25735-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The DE2 CCU is different on A83T and H3 -- the parent of the clocks on
A83T is PLL_DE but on H3 it's the DE module clock. This is not noticed
when I develop the DE2 CCU driver.

Fix the binding by using different compatibles for A83T and H3, adding
notes for the PLL_DE usage on A83T, and change the binding example's
compatible from A83T to H3 (as it specifies the DE module clock).

Fixes: ed74f8a8a679 ("dt-bindings: add binding for the Allwinner DE2 CCU")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 Documentation/devicetree/bindings/clock/sun8i-de2.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
index 631d27cd89d6..f2fa87c4765c 100644
--- a/Documentation/devicetree/bindings/clock/sun8i-de2.txt
+++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
@@ -4,13 +4,14 @@ Allwinner Display Engine 2.0 Clock Control Binding
 Required properties :
 - compatible: must contain one of the following compatibles:
 		- "allwinner,sun8i-a83t-de2-clk"
+		- "allwinner,sun8i-h3-de2-clk"
 		- "allwinner,sun8i-v3s-de2-clk"
 		- "allwinner,sun50i-h5-de2-clk"
 
 - reg: Must contain the registers base address and length
 - clocks: phandle to the clocks feeding the display engine subsystem.
 	  Three are needed:
-  - "mod": the display engine module clock
+  - "mod": the display engine module clock (on A83T it's the DE PLL)
   - "bus": the bus clock for the whole display engine subsystem
 - clock-names: Must contain the clock names described just above
 - resets: phandle to the reset control for the display engine subsystem.
@@ -19,7 +20,7 @@ Required properties :
 
 Example:
 de2_clocks: clock@1000000 {
-	compatible = "allwinner,sun8i-a83t-de2-clk";
+	compatible = "allwinner,sun8i-h3-de2-clk";
 	reg = <0x01000000 0x100000>;
 	clocks = <&ccu CLK_BUS_DE>,
 		 <&ccu CLK_DE>;
-- 
2.14.2

