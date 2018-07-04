Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Really show symbolic clock flags in debugfs
Date: Wed,  4 Jul 2018 15:01:03 +0200
Message-Id: <20180704130103.31790-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The last-minute fold-in of the ENTRY() macro did change behavior:
instead of printing the symbolic name (e.g. "CLK_IS_BASIC"), it prints
the expansion of it (e.g. "(1UL << (5))").

Use "#" instead of  __stringify() to fix this.

Fixes: a6059ab98130fb56 ("clk: Show symbolic clock flags in debugfs")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e108f591d84a9539..f4856d49bd3a698c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2739,7 +2739,7 @@ static const struct {
 	unsigned long flag;
 	const char *name;
 } clk_flags[] = {
-#define ENTRY(f) { f, __stringify(f) }
+#define ENTRY(f) { f, #f }
 	ENTRY(CLK_SET_RATE_GATE),
 	ENTRY(CLK_SET_PARENT_GATE),
 	ENTRY(CLK_SET_RATE_PARENT),
-- 
2.17.1
