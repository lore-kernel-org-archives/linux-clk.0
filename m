Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jiri Kosina <trivial@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [trivial] clk: Spelling s/derefing/dereferencing/
Date: Thu, 29 Oct 2015 20:55:00 +0100
Message-Id: <1446148500-20480-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a5202df30bb27598..77835e408fe67049 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1981,7 +1981,7 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
 	if (p == q)
 		return true;
 
-	/* true if clk->core pointers match. Avoid derefing garbage */
+	/* true if clk->core pointers match. Avoid dereferencing garbage */
 	if (!IS_ERR_OR_NULL(p) && !IS_ERR_OR_NULL(q))
 		if (p->core == q->core)
 			return true;
-- 
1.9.1
