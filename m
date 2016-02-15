Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: shmobile: cpg-mssr: Update serial port clock in example
Date: Mon, 15 Feb 2016 13:39:37 +0100
Message-Id: <1455539977-23308-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Cfr. commit a9ec81f4ed5c05db ("serial: sh-sci: Drop the interface
clock").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I plan to queue this up with the other clk-shmobile patches in
clk-shmobile-for-v4.6 and send a pull request later.

 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 59297d34b2084429..fefb8023020f1a54 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -61,7 +61,7 @@ Examples
 		reg = <0 0xe6e88000 0 64>;
 		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 310>;
-		clock-names = "sci_ick";
+		clock-names = "fck";
 		dmas = <&dmac1 0x13>, <&dmac1 0x12>;
 		dma-names = "tx", "rx";
 		power-domains = <&cpg>;
-- 
1.9.1
