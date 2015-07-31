Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 01/26] clk: Add clk_hw_get_num_parents()
Date: Fri, 31 Jul 2015 10:03:41 -0700
Message-Id: <1438362246-6664-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Most provider drivers don't need to deal with struct clk, but
they may want to call __clk_get_num_parents() and so they have to
get the struct clk out of struct clk_hw so they can ask the
framework for the number of parents. Hide this all behind a
clk_hw specific API.
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 898052ee0efa..5a147c2b1e36 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -289,6 +289,12 @@ u8 __clk_get_num_parents(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_num_parents);
 
+unsigned int clk_hw_get_num_parents(struct clk_hw *hw)
+{
+	return hw->core->num_parents;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_num_parents);
+
 struct clk *__clk_get_parent(struct clk *clk)
 {
 	if (!clk)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 06a56e55cfaf..214634a88f38 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -609,6 +609,7 @@ void devm_clk_unregister(struct device *dev, struct clk *clk);
 const char *__clk_get_name(struct clk *clk);
 struct clk_hw *__clk_get_hw(struct clk *clk);
 u8 __clk_get_num_parents(struct clk *clk);
+unsigned int clk_hw_get_num_parents(struct clk_hw *hw);
 struct clk *__clk_get_parent(struct clk *clk);
 struct clk *clk_get_parent_by_index(struct clk *clk, u8 index);
 unsigned int __clk_get_enable_count(struct clk *clk);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
