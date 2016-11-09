Return-Path: <ukl@pengutronix.de>
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	trivial@kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] clk: gate: fix coding style
Date: Wed,  9 Nov 2016 12:00:46 +0100
Message-Id: <20161109110046.9594-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The : of the ?: operator should have a leading space.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I always wonder if I should send such patches or if they hurt more than
they are worth. *shrug* ignore at will.

Best regards
Uwe

 drivers/clk/clk-gate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 4e691e35483a..59e302538d23 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -145,7 +145,7 @@ struct clk_hw *clk_hw_register_gate(struct device *dev, const char *name,
 	init.name = name;
 	init.ops = &clk_gate_ops;
 	init.flags = flags | CLK_IS_BASIC;
-	init.parent_names = (parent_name ? &parent_name: NULL);
+	init.parent_names = (parent_name ? &parent_name : NULL);
 	init.num_parents = (parent_name ? 1 : 0);
 
 	/* struct clk_gate assignments */
-- 
2.10.1
