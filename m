Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: uclinux-h8-devel@lists.sourceforge.jp,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: h8300: Remove "sh73a0-" part from compatible value
Date: Mon, 29 Jun 2015 11:42:58 +0200
Message-Id: <1435570978-1734-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Drop the bogus "sh73a0-" part (accidentally copied from shmobile?) from
the compatible value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/clock/renesas,h8300-div-clock.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,h8300-div-clock.txt b/Documentation/devicetree/bindings/clock/renesas,h8300-div-clock.txt
index 36c2b528245cd48f..399e0da22348b19e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,h8300-div-clock.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,h8300-div-clock.txt
@@ -2,7 +2,7 @@
 
 Required Properties:
 
-  - compatible: Must be "renesas,sh73a0-h8300-div-clock"
+  - compatible: Must be "renesas,h8300-div-clock"
 
   - clocks: Reference to the parent clocks ("extal1" and "extal2")
 
-- 
1.9.1
