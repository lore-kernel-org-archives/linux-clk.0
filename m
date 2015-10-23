Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] clk: versatile-icst: fix memory leak
Date: Fri, 23 Oct 2015 11:36:01 +0200
Message-Id: <1445592961-30135-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

A static code checker found a memory leak in the Versatile
ICST code. Fix it.

Fixes: a183da637c52 "clk: versatile: respect parent rate in ICST clock"
Reported-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/versatile/clk-icst.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index a3893ea2199d..08c5ee976879 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -157,8 +157,10 @@ struct clk *icst_clk_register(struct device *dev,
 	icst->lockreg = base + desc->lock_offset;
 
 	clk = clk_register(dev, &icst->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		kfree(pclone);
 		kfree(icst);
+	}
 
 	return clk;
 }
-- 
2.4.3
