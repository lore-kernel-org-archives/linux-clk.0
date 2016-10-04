Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Fix inverted debug check
Date: Tue,  4 Oct 2016 15:10:58 +0200
Message-Id: <1475586658-13322-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The intention was to enable the checks if debugging is enabled, not
disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 6bc73d18517b2c82..937b09a70f2e0f43 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -33,9 +33,9 @@
 #include "clk-div6.h"
 
 #ifdef DEBUG
-#define WARN_DEBUG(x)	do { } while (0)
-#else
 #define WARN_DEBUG(x)	WARN_ON(x)
+#else
+#define WARN_DEBUG(x)	do { } while (0)
 #endif
 
 
-- 
1.9.1
