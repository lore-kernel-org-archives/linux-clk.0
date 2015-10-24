Return-Path: <manabian@gmail.com>
Return-Path: <manabian@gmail.com>
From: Joachim Eastwood <manabian@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/3] clk: Add clk_hw_is_enabled() for use by clk providers
Date: Sat, 24 Oct 2015 18:55:22 +0200
Message-Id: <1445705724-20805-2-git-send-email-manabian@gmail.com>
In-Reply-To: <1445705724-20805-1-git-send-email-manabian@gmail.com>
References: <1445705724-20805-1-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Add clk_hw_is_enabled() to the provider APIs so clk providers can
use a struct clk_hw instead of a struct clk to check if a clk is
enabled or not.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/clk/clk.c            | 5 +++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 43e2c3ad6c31..44601851e79c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -427,6 +427,11 @@ bool clk_hw_is_prepared(const struct clk_hw *hw)
 	return clk_core_is_prepared(hw->core);
 }
 
+bool clk_hw_is_enabled(const struct clk_hw *hw)
+{
+	return clk_core_is_enabled(hw->core);
+}
+
 bool __clk_is_enabled(struct clk *clk)
 {
 	if (!clk)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 3ecc07d0da77..1a71436e4c4b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -618,6 +618,7 @@ unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
 unsigned long clk_hw_get_flags(const struct clk_hw *hw);
 bool clk_hw_is_prepared(const struct clk_hw *hw);
+bool clk_hw_is_enabled(const struct clk_hw *hw);
 bool __clk_is_enabled(struct clk *clk);
 struct clk *__clk_lookup(const char *name);
 int __clk_mux_determine_rate(struct clk_hw *hw,
-- 
1.8.0
