Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Make clk input parameter of __clk_get_name() const
Date: Fri, 16 Oct 2015 14:35:21 +0200
Message-Id: <1444998921-15549-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

When calling __clk_get_name() on a const clock:

    warning: passing argument 1 of '__clk_get_name' discards 'const' qualifier from pointer target type
    include/linux/clk-provider.h:613:13: note: expected 'struct clk *' but argument is of type 'const struct clk *'

__clk_get_name() does not modify the passed clock, hence make it const.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c            | 2 +-
 include/linux/clk-provider.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b005f666e3a1a716..a8c59aee9eedf7e1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -272,7 +272,7 @@ late_initcall_sync(clk_disable_unused);
 
 /***    helper functions   ***/
 
-const char *__clk_get_name(struct clk *clk)
+const char *__clk_get_name(const struct clk *clk)
 {
 	return !clk ? NULL : clk->core->name;
 }
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 8ff43eb4b3113a12..bbb8fed11e4479b2 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -607,7 +607,7 @@ void clk_unregister(struct clk *clk);
 void devm_clk_unregister(struct device *dev, struct clk *clk);
 
 /* helper functions */
-const char *__clk_get_name(struct clk *clk);
+const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
 struct clk_hw *__clk_get_hw(struct clk *clk);
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
-- 
1.9.1
