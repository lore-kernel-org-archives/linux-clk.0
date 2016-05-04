Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] clk: renesas: cpg-mssr: Document r8a7796 support
Date: Wed,  4 May 2016 16:35:40 +0200
Message-Id: <1462372543-31835-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index fefb8023020f1a54..394d725ac7e0baa3 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -13,7 +13,8 @@ They provide the following functionalities:
 
 Required Properties:
   - compatible: Must be one of:
-      - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC
+      - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
+      - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
 
   - reg: Base address and length of the memory resource used by the CPG/MSSR
     block
@@ -21,8 +22,8 @@ Required Properties:
   - clocks: References to external parent clocks, one entry for each entry in
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
-      - "extal" (r8a7795)
-      - "extalr" (r8a7795)
+      - "extal" (r8a7795, r8a7796)
+      - "extalr" (r8a7795, r8a7796)
 
   - #clock-cells: Must be 2
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
-- 
1.9.1
