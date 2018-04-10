Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Remove clk_init_cb typedef
Date: Tue, 10 Apr 2018 15:06:05 +0200
Message-Id: <1523365565-17124-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Since commit c08ee14cc6634457 ("clk: ti: change clock init to use
generic of_clk_init"), there is only a single (private) user left of the
(public) clk_init_cb typedef.

Hence expand its single user in the core clock code, and remove the
typedef.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c            | 2 +-
 include/linux/clk-provider.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ea67ac81c6f97db1..972f1ea4b63f0abf 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3906,7 +3906,7 @@ int of_clk_parent_fill(struct device_node *np, const char **parents,
 EXPORT_SYMBOL_GPL(of_clk_parent_fill);
 
 struct clock_provider {
-	of_clk_init_cb_t clk_init_cb;
+	void (*clk_init_cb)(struct device_node *);
 	struct device_node *np;
 	struct list_head node;
 };
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 61cb4729f22acd6b..f2c8fb81e9b01c94 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -803,8 +803,6 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
 
 struct of_device_id;
 
-typedef void (*of_clk_init_cb_t)(struct device_node *);
-
 struct clk_onecell_data {
 	struct clk **clks;
 	unsigned int clk_num;
-- 
2.7.4
