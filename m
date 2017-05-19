Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 01/10] clk: renesas: cpg-mssr: Document R-Car Gen2 support
Date: Fri, 19 May 2017 10:45:56 +0200
Message-Id: <1495183565-21679-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
References: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Document use of the Renesas Clock Pulse Generator / Module Standby and
Software Reset DT Bindings for various member of the R-Car Gen2 family
(H2, M2-W, V2H, M2-N, and E2).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Acked-by.
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index f4f944d813081857..0cd894f987a38e81 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -15,6 +15,11 @@ Required Properties:
   - compatible: Must be one of:
       - "renesas,r8a7743-cpg-mssr" for the r8a7743 SoC (RZ/G1M)
       - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
+      - "renesas,r8a7790-cpg-mssr" for the r8a7790 SoC (R-Car H2)
+      - "renesas,r8a7791-cpg-mssr" for the r8a7791 SoC (R-Car M2-W)
+      - "renesas,r8a7792-cpg-mssr" for the r8a7792 SoC (R-Car V2H)
+      - "renesas,r8a7793-cpg-mssr" for the r8a7793 SoC (R-Car M2-N)
+      - "renesas,r8a7794-cpg-mssr" for the r8a7794 SoC (R-Car E2)
       - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
       - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
 
@@ -24,9 +29,10 @@ Required Properties:
   - clocks: References to external parent clocks, one entry for each entry in
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
-      - "extal" (r8a7743, r8a7745, r8a7795, r8a7796)
+      - "extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7792, r8a7793, r8a7794,
+		 r8a7795, r8a7796)
       - "extalr" (r8a7795, r8a7796)
-      - "usb_extal" (r8a7743, r8a7745)
+      - "usb_extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7793, r8a7794)
 
   - #clock-cells: Must be 2
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
-- 
2.7.4
